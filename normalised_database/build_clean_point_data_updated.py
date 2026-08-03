#!/usr/bin/env python3
"""
Build one internally consistent Oracle dataset for:
- Member_Profiles with a cached PointsBalance
- MyKasih_Beneficiaries with June-2026 AmountUsed already synchronized
- Vouchers with names aligned to DiscountAmount
- Orders with valid voucher usage and clean customer/guest contact storage
- Point_Transactions matched to members, orders and vouchers

This script NEVER overwrites the original SQL files. It creates corrected copies
inside clean_output/.

Expected input files in the same folder:
    ddl_script.sql
    insert_script_1.sql
    insert_orders.sql
    insert_vouchers_analytical.sql

Optional input:
    insert_ordered_items.sql

When Ordered_Items SQL is present, the script validates and uses item-level
MyKasihSubsidyAmount for AmountUsed. Otherwise it uses the already stored
Orders.MyKasihSubsidyTotal.

The script also accepts files whose names contain suffixes such as "(2)" or "(4)".
You can override any path with command-line options.

Run:
    py build_clean_point_data.py

Outputs:
    clean_output/ddl_script_clean.sql
    clean_output/insert_script_1_clean.sql
    clean_output/insert_orders_clean.sql
    clean_output/insert_vouchers_clean.sql
    clean_output/insert_point_transactions.sql
    clean_output/point_data_report.txt
    clean_output/order_corrections.csv
    clean_output/member_point_balances.csv
    clean_output/mykasih_amount_used.csv
    clean_output/order_identity_corrections.csv

Important design decision:
- Point_Transactions is the audit/source-of-truth ledger.
- Member_Profiles.PointsBalance is a cached current balance generated from that
  ledger for this static assignment dataset.
- Existing primary-key values are NOT renumbered because other tables may refer
  to them. INSERT statements are sorted by primary key. New point transaction
  IDs are assigned chronologically and therefore are also sorted.
- SubtotalAmount and MyKasihSubsidyTotal are not recalculated or changed.
  GrandTotal changes only when an invalid voucher is removed.
- Point transactions remain a separate SQL file because Orders and Vouchers must
  exist first; merging them into the early Member 1 insert file would violate
  foreign-key order.
"""

from __future__ import annotations

import argparse
import csv
import re
import sys
from dataclasses import dataclass
from datetime import datetime, timedelta
from decimal import Decimal, InvalidOperation, ROUND_FLOOR
from pathlib import Path
from typing import Iterable, Sequence


OUTPUT_FOLDER_NAME = "clean_output"
SNAPSHOT_DATE = datetime(2026, 6, 30, 23, 59, 59)

# Business rule used for EARN:
# Eligible paid item amount = Subtotal - MyKasih - VoucherDiscount.
# Delivery fee is intentionally excluded from point earning.
EXCLUDE_DELIVERY_FEE_FROM_EARN = True


@dataclass
class SqlInsert:
    table: str
    columns: list[str]
    values: list[str]
    start: int
    end: int

    def as_dict(self) -> dict[str, str]:
        return dict(zip(self.columns, self.values))


@dataclass
class Member:
    member_id: str
    customer_id: str
    tier_id: str
    join_date: datetime
    expiry_date: datetime
    status: str
    points_balance: int = 0


@dataclass
class MyKasihBeneficiary:
    mykasih_id: str
    monthly_limit: Decimal
    amount_used: Decimal
    valid_from: datetime
    valid_until: datetime
    status: str
    customer_id: str
    insert: SqlInsert


@dataclass
class Voucher:
    voucher_id: str
    voucher_name: str
    voucher_type: str
    points_required: int
    discount_amount: Decimal
    min_spend_amount: Decimal
    start_date: datetime
    end_date: datetime
    status: str
    insert: SqlInsert


@dataclass
class Order:
    order_id: str
    customer_id: str | None
    contact_name: str | None
    contact_phone: str | None
    contact_email: str | None
    voucher_id: str | None
    fulfillment_type: str
    order_datetime: datetime
    order_status: str
    subtotal: Decimal
    voucher_discount: Decimal
    mykasih_subsidy: Decimal
    grand_total: Decimal
    payment_status: str
    payment_datetime: datetime | None
    insert: SqlInsert
    inferred_delivery_fee: Decimal


@dataclass
class PointTransaction:
    transaction_id: str
    transaction_type: str
    points: int
    transaction_datetime: datetime
    remarks: str
    member_id: str
    order_id: str
    voucher_id: str | None
    running_balance: int


@dataclass
class Correction:
    order_id: str
    old_voucher_id: str
    reason: str
    old_discount: Decimal
    new_discount: Decimal
    old_grand_total: Decimal
    new_grand_total: Decimal


def clean(value: object) -> str:
    return "" if value is None else str(value).strip()


def split_sql_values(value_text: str) -> list[str]:
    """Split a VALUES list while respecting quotes and nested functions."""
    values: list[str] = []
    current: list[str] = []
    depth = 0
    in_quote = False
    index = 0

    while index < len(value_text):
        char = value_text[index]

        if char == "'":
            current.append(char)
            if in_quote and index + 1 < len(value_text) and value_text[index + 1] == "'":
                current.append("'")
                index += 2
                continue
            in_quote = not in_quote

        elif not in_quote and char == "(":
            depth += 1
            current.append(char)

        elif not in_quote and char == ")":
            depth -= 1
            current.append(char)

        elif not in_quote and depth == 0 and char == ",":
            values.append("".join(current).strip())
            current = []

        else:
            current.append(char)

        index += 1

    values.append("".join(current).strip())
    return values


def parse_inserts(sql_text: str, table: str) -> list[SqlInsert]:
    pattern = re.compile(
        rf"INSERT\s+INTO\s+{re.escape(table)}\s*"
        r"\((?P<columns>.*?)\)\s*VALUES\s*"
        r"\((?P<values>.*?)\)\s*;",
        re.IGNORECASE | re.DOTALL,
    )

    inserts: list[SqlInsert] = []
    for match in pattern.finditer(sql_text):
        columns = [item.strip() for item in match.group("columns").split(",")]
        values = split_sql_values(match.group("values"))
        if len(columns) != len(values):
            raise ValueError(
                f"{table} INSERT has {len(columns)} columns but "
                f"{len(values)} values near character {match.start()}."
            )
        inserts.append(
            SqlInsert(
                table=table,
                columns=columns,
                values=values,
                start=match.start(),
                end=match.end(),
            )
        )
    if not inserts:
        raise ValueError(f"No INSERT INTO {table} statements were found.")
    return inserts


def sql_unquote(value: str) -> str | None:
    value = value.strip()
    if value.upper() == "NULL":
        return None
    if value.startswith("'") and value.endswith("'"):
        return value[1:-1].replace("''", "'")
    return value


def sql_string(value: str | None) -> str:
    if value is None:
        return "NULL"
    return "'" + value.replace("'", "''") + "'"


def sql_number(value: Decimal | int) -> str:
    decimal_value = Decimal(value)
    return f"{decimal_value.quantize(Decimal('0.01')):.2f}"


def parse_decimal(value: str, label: str) -> Decimal:
    try:
        return Decimal(value.strip())
    except InvalidOperation as exc:
        raise ValueError(f"Invalid number for {label}: {value!r}") from exc


def parse_integer(value: str, label: str) -> int:
    number = parse_decimal(value, label)
    if number != number.to_integral_value():
        raise ValueError(f"{label} must be an integer: {value!r}")
    return int(number)


def parse_oracle_datetime(value: str, label: str) -> datetime | None:
    if value.strip().upper() == "NULL":
        return None
    match = re.search(
        r"'(\d{4}-\d{2}-\d{2}(?:\s+\d{2}:\d{2}:\d{2})?)'",
        value,
    )
    if not match:
        raise ValueError(f"Cannot parse {label}: {value!r}")
    text = match.group(1)
    fmt = "%Y-%m-%d %H:%M:%S" if " " in text else "%Y-%m-%d"
    return datetime.strptime(text, fmt)


def oracle_date(value: datetime) -> str:
    return f"TO_DATE('{value:%Y-%m-%d}', 'YYYY-MM-DD')"


def oracle_datetime(value: datetime) -> str:
    return (
        f"TO_DATE('{value:%Y-%m-%d %H:%M:%S}', "
        "'YYYY-MM-DD HH24:MI:SS')"
    )


def oracle_timestamp(value: datetime) -> str:
    return (
        f"TO_TIMESTAMP('{value:%Y-%m-%d %H:%M:%S}', "
        "'YYYY-MM-DD HH24:MI:SS')"
    )


def natural_id_key(value: str) -> tuple[str, int, str]:
    match = re.fullmatch(r"([A-Za-z_]+)(\d+)", value)
    if not match:
        return (value, -1, value)
    return (match.group(1).upper(), int(match.group(2)), value)


def format_insert(insert: SqlInsert) -> str:
    columns = ", ".join(insert.columns)
    values = ", ".join(insert.values)
    return f"INSERT INTO {insert.table} ({columns}) VALUES ({values});"


def replace_inserts(
    source_text: str,
    original_inserts: Sequence[SqlInsert],
    replacement_inserts: Sequence[SqlInsert],
) -> str:
    if len(original_inserts) != len(replacement_inserts):
        raise ValueError("Replacement INSERT count does not match source count.")

    output: list[str] = []
    cursor = 0
    for original, replacement in zip(original_inserts, replacement_inserts):
        output.append(source_text[cursor:original.start])
        output.append(format_insert(replacement))
        cursor = original.end
    output.append(source_text[cursor:])
    return "".join(output)


def locate_input(
    base_dir: Path,
    explicit: Path | None,
    exact_name: str,
    glob_patterns: Sequence[str],
) -> Path:
    if explicit is not None:
        path = explicit.resolve()
        if not path.exists():
            raise FileNotFoundError(path)
        return path

    exact = base_dir / exact_name
    if exact.exists():
        return exact

    candidates: list[Path] = []
    for pattern in glob_patterns:
        candidates.extend(base_dir.glob(pattern))
    candidates = sorted({path.resolve() for path in candidates if path.is_file()})

    if len(candidates) == 1:
        return candidates[0]
    if not candidates:
        raise FileNotFoundError(
            f"Could not find {exact_name} in {base_dir}. "
            f"Use the related command-line option to specify it."
        )
    raise RuntimeError(
        f"More than one possible file was found for {exact_name}: "
        + ", ".join(path.name for path in candidates)
    )


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8-sig", errors="strict")


def locate_optional_input(
    base_dir: Path,
    explicit: Path | None,
    exact_name: str,
    glob_patterns: Sequence[str],
) -> Path | None:
    if explicit is not None:
        path = explicit.resolve()
        if not path.exists():
            raise FileNotFoundError(path)
        return path

    exact = base_dir / exact_name
    if exact.exists():
        return exact

    candidates: list[Path] = []
    for pattern in glob_patterns:
        candidates.extend(base_dir.glob(pattern))
    candidates = sorted({path.resolve() for path in candidates if path.is_file()})
    if not candidates:
        return None
    if len(candidates) == 1:
        return candidates[0]
    raise RuntimeError(
        f"More than one possible optional file was found for {exact_name}: "
        + ", ".join(path.name for path in candidates)
    )


def load_members(
    member_sql: str,
) -> tuple[
    dict[str, Member],
    dict[str, Member],
    dict[str, Decimal],
    list[SqlInsert],
]:
    tier_inserts = parse_inserts(member_sql, "Member_Tiers")
    member_inserts = parse_inserts(member_sql, "Member_Profiles")

    point_rates: dict[str, Decimal] = {}
    for insert in tier_inserts:
        row = insert.as_dict()
        tier_id = sql_unquote(row["TierID"])
        if tier_id is None:
            raise ValueError("TierID cannot be NULL.")
        rate = parse_decimal(row["PointRate"], f"{tier_id}.PointRate")
        if rate <= 0:
            raise ValueError(f"{tier_id} has a non-positive PointRate.")
        point_rates[tier_id] = rate

    by_customer: dict[str, Member] = {}
    by_id: dict[str, Member] = {}

    for insert in member_inserts:
        row = insert.as_dict()
        member_id = sql_unquote(row["MemberID"])
        customer_id = sql_unquote(row["CustomerID"])
        tier_id = sql_unquote(row["TierID"])
        status = sql_unquote(row["Status"])
        join_date = parse_oracle_datetime(row["JoinDate"], "JoinDate")
        expiry_date = parse_oracle_datetime(row["ExpiryDate"], "ExpiryDate")

        if None in (member_id, customer_id, tier_id, status, join_date, expiry_date):
            raise ValueError("Required Member_Profiles value is NULL.")
        assert isinstance(join_date, datetime)
        assert isinstance(expiry_date, datetime)

        if member_id in by_id:
            raise ValueError(f"Duplicate MemberID: {member_id}")
        if customer_id in by_customer:
            raise ValueError(f"Customer {customer_id} has multiple member profiles.")
        if tier_id not in point_rates:
            raise ValueError(f"No PointRate found for tier {tier_id}.")

        member = Member(
            member_id=member_id,
            customer_id=customer_id,
            tier_id=tier_id,
            join_date=join_date,
            expiry_date=expiry_date,
            status=status,
        )
        by_id[member_id] = member
        by_customer[customer_id] = member

    return by_customer, by_id, point_rates, member_inserts


def load_mykasih(
    member_sql: str,
) -> tuple[dict[str, MyKasihBeneficiary], list[SqlInsert]]:
    inserts = parse_inserts(member_sql, "Mykasih_Beneficiaries")
    by_customer: dict[str, MyKasihBeneficiary] = {}

    for insert in inserts:
        row = insert.as_dict()
        mykasih_id = sql_unquote(row["MyKasihID"])
        customer_id = sql_unquote(row["CustomerID"])
        status = sql_unquote(row["Status"])
        valid_from = parse_oracle_datetime(row["ValidFrom"], "ValidFrom")
        valid_until = parse_oracle_datetime(row["ValidUntil"], "ValidUntil")

        if None in (mykasih_id, customer_id, status, valid_from, valid_until):
            raise ValueError("Required Mykasih_Beneficiaries value is NULL.")
        assert isinstance(valid_from, datetime)
        assert isinstance(valid_until, datetime)

        beneficiary = MyKasihBeneficiary(
            mykasih_id=mykasih_id,
            monthly_limit=parse_decimal(
                row["MonthlyLimitAmount"],
                f"{mykasih_id}.MonthlyLimitAmount",
            ),
            amount_used=parse_decimal(
                row["AmountUsed"],
                f"{mykasih_id}.AmountUsed",
            ),
            valid_from=valid_from,
            valid_until=valid_until,
            status=status,
            customer_id=customer_id,
            insert=insert,
        )
        if customer_id in by_customer:
            raise ValueError(
                f"Customer {customer_id} has multiple MyKasih records."
            )
        by_customer[customer_id] = beneficiary

    return by_customer, inserts


def normalize_voucher_name(voucher: Voucher) -> str:
    """
    Align visible RM values with DiscountAmount without changing the monetary
    value used by existing orders.
    """
    name = voucher.voucher_name.strip()
    amount = voucher.discount_amount
    amount_text = (
        str(int(amount))
        if amount == amount.to_integral_value()
        else f"{amount:.2f}".rstrip("0").rstrip(".")
    )

    # Replace the displayed RM benefit amount with the actual discount.
    # Do not alter wording such as "Min Spend RM50", because that amount refers
    # to eligibility rather than DiscountAmount.
    if (
        "min spend" not in name.lower()
        and re.search(r"\bRM\s*\d+(?:\.\d+)?\b", name, flags=re.IGNORECASE)
    ):
        name = re.sub(
            r"\bRM\s*\d+(?:\.\d+)?\b",
            f"RM{amount_text}",
            name,
            count=1,
            flags=re.IGNORECASE,
        )

    # A zero-point voucher must not claim that points are being redeemed.
    if voucher.points_required == 0:
        name = re.sub(
            r"\bPoint\s+Redemption\b",
            "Member Discount",
            name,
            flags=re.IGNORECASE,
        )
        name = re.sub(
            r"\bPoints\s+Reward\s+Free\s+Shipping\b",
            "Free Shipping Reward",
            name,
            flags=re.IGNORECASE,
        )

    return re.sub(r"\s+", " ", name).strip()


def load_vouchers(
    voucher_sql: str,
) -> tuple[dict[str, Voucher], list[SqlInsert]]:
    inserts = parse_inserts(voucher_sql, "Vouchers")
    vouchers: dict[str, Voucher] = {}

    for insert in inserts:
        row = insert.as_dict()
        voucher_id = sql_unquote(row["VoucherID"])
        voucher_name = sql_unquote(row["VoucherName"])
        voucher_type = sql_unquote(row["VoucherType"])
        start_date = parse_oracle_datetime(row["StartDate"], "StartDate")
        end_date = parse_oracle_datetime(row["EndDate"], "EndDate")
        status = sql_unquote(row["Status"])

        if None in (
            voucher_id,
            voucher_name,
            voucher_type,
            start_date,
            end_date,
            status,
        ):
            raise ValueError("Required Vouchers value is NULL.")
        assert isinstance(start_date, datetime)
        assert isinstance(end_date, datetime)

        voucher = Voucher(
            voucher_id=voucher_id,
            voucher_name=voucher_name,
            voucher_type=voucher_type,
            points_required=parse_integer(
                row["PointsRequired"], f"{voucher_id}.PointsRequired"
            ),
            discount_amount=parse_decimal(
                row["DiscountAmount"], f"{voucher_id}.DiscountAmount"
            ),
            min_spend_amount=parse_decimal(
                row["MinSpendAmount"], f"{voucher_id}.MinSpendAmount"
            ),
            start_date=start_date,
            end_date=end_date,
            status=status,
            insert=insert,
        )

        if voucher_id in vouchers:
            raise ValueError(f"Duplicate VoucherID: {voucher_id}")
        if voucher.points_required < 0:
            raise ValueError(f"{voucher_id} has negative PointsRequired.")
        if voucher.discount_amount < 0 or voucher.min_spend_amount < 0:
            raise ValueError(f"{voucher_id} has a negative monetary value.")
        if voucher.end_date < voucher.start_date:
            raise ValueError(f"{voucher_id} has EndDate before StartDate.")

        voucher.voucher_name = normalize_voucher_name(voucher)
        vouchers[voucher_id] = voucher

    return vouchers, inserts


def load_orders(
    orders_sql: str,
) -> tuple[list[Order], list[SqlInsert]]:
    inserts = parse_inserts(orders_sql, "Orders")
    orders: list[Order] = []
    seen: set[str] = set()

    for insert in inserts:
        row = insert.as_dict()
        order_id = sql_unquote(row["OrderID"])
        fulfillment = sql_unquote(row["FulfillmentType"])
        order_status = sql_unquote(row["OrderStatus"])
        payment_status = sql_unquote(row["PaymentStatus"])
        order_datetime = parse_oracle_datetime(row["OrderDateTime"], "OrderDateTime")
        payment_datetime = parse_oracle_datetime(
            row["PaymentDateTime"], "PaymentDateTime"
        )

        if None in (
            order_id,
            fulfillment,
            order_status,
            payment_status,
            order_datetime,
        ):
            raise ValueError("Required Orders value is NULL.")
        assert isinstance(order_datetime, datetime)

        if order_id in seen:
            raise ValueError(f"Duplicate OrderID: {order_id}")
        seen.add(order_id)

        subtotal = parse_decimal(row["SubtotalAmount"], f"{order_id}.SubtotalAmount")
        discount = parse_decimal(
            row["VoucherDiscountAmount"],
            f"{order_id}.VoucherDiscountAmount",
        )
        subsidy = parse_decimal(
            row["MyKasihSubsidyTotal"],
            f"{order_id}.MyKasihSubsidyTotal",
        )
        grand_total = parse_decimal(row["GrandTotal"], f"{order_id}.GrandTotal")

        # GrandTotal = Subtotal - subsidy - voucher discount + delivery fee.
        inferred_fee = (
            grand_total - (subtotal - subsidy - discount)
        ).quantize(Decimal("0.01"))

        if inferred_fee < 0:
            raise ValueError(
                f"{order_id} produces a negative inferred delivery fee "
                f"({inferred_fee})."
            )

        orders.append(
            Order(
                order_id=order_id,
                customer_id=sql_unquote(row["CustomerID"]),
                contact_name=sql_unquote(row["ContactName"]),
                contact_phone=sql_unquote(row["ContactPhone"]),
                contact_email=sql_unquote(row["ContactEmail"]),
                voucher_id=sql_unquote(row["VoucherID"]),
                fulfillment_type=fulfillment,
                order_datetime=order_datetime,
                order_status=order_status,
                subtotal=subtotal,
                voucher_discount=discount,
                mykasih_subsidy=subsidy,
                grand_total=grand_total,
                payment_status=payment_status,
                payment_datetime=payment_datetime,
                insert=insert,
                inferred_delivery_fee=inferred_fee,
            )
        )

    return orders, inserts


def deterministic_guest_phone(order_id: str) -> str:
    match = re.search(r"(\d+)", order_id)
    number = int(match.group(1)) if match else 0
    return f"+6011{number % 100_000_000:08d}"


def normalize_order_identity(orders: Sequence[Order]) -> dict[str, int]:
    counts = {
        "known_contact_fields_cleared": 0,
        "guest_contact_rows_completed": 0,
    }

    for order in orders:
        row = order.insert.as_dict()
        if order.customer_id is not None:
            if any(
                value is not None
                for value in (
                    order.contact_name,
                    order.contact_phone,
                    order.contact_email,
                )
            ):
                counts["known_contact_fields_cleared"] += 1
            order.contact_name = None
            order.contact_phone = None
            order.contact_email = None
        else:
            changed = False
            if order.contact_name is None:
                order.contact_name = f"Guest {order.order_id}"
                changed = True
            if order.contact_phone is None:
                order.contact_phone = deterministic_guest_phone(order.order_id)
                changed = True
            if order.contact_email is None:
                order.contact_email = (
                    f"guest.{order.order_id.lower()}@example.test"
                )
                changed = True
            if changed:
                counts["guest_contact_rows_completed"] += 1

        row["ContactName"] = sql_string(order.contact_name)
        row["ContactPhone"] = sql_string(order.contact_phone)
        row["ContactEmail"] = sql_string(order.contact_email)
        order.insert.values = [row[column] for column in order.insert.columns]

    return counts


def load_ordered_item_subsidies(
    ordered_items_sql: str | None,
) -> dict[str, Decimal] | None:
    if ordered_items_sql is None:
        return None

    inserts = parse_inserts(ordered_items_sql, "Ordered_Items")
    totals: dict[str, Decimal] = {}
    for insert in inserts:
        row = insert.as_dict()
        order_id = sql_unquote(row["OrderID"])
        if order_id is None:
            raise ValueError("Ordered_Items.OrderID cannot be NULL.")
        subsidy = parse_decimal(
            row["MyKasihSubsidyAmount"],
            f"{order_id}.MyKasihSubsidyAmount",
        )
        totals[order_id] = totals.get(order_id, Decimal("0.00")) + subsidy
    return {key: value.quantize(Decimal("0.01")) for key, value in totals.items()}


def synchronize_mykasih_amount_used(
    beneficiaries_by_customer: dict[str, MyKasihBeneficiary],
    orders: Sequence[Order],
    ordered_item_subsidies: dict[str, Decimal] | None,
) -> str:
    month_year = SNAPSHOT_DATE.year
    month_number = SNAPSHOT_DATE.month
    usage = {customer_id: Decimal("0.00") for customer_id in beneficiaries_by_customer}

    for order in orders:
        if ordered_item_subsidies is not None:
            item_total = ordered_item_subsidies.get(order.order_id, Decimal("0.00"))
            if item_total != order.mykasih_subsidy.quantize(Decimal("0.01")):
                raise ValueError(
                    f"{order.order_id}: Ordered_Items MyKasih total {item_total:.2f} "
                    f"does not match Orders.MyKasihSubsidyTotal "
                    f"{order.mykasih_subsidy:.2f}."
                )
            subsidy = item_total
        else:
            subsidy = order.mykasih_subsidy.quantize(Decimal("0.01"))

        if subsidy <= 0:
            continue
        if order.customer_id is None:
            raise ValueError(
                f"{order.order_id}: a guest order cannot use MyKasih subsidy."
            )
        beneficiary = beneficiaries_by_customer.get(order.customer_id)
        if beneficiary is None:
            raise ValueError(
                f"{order.order_id}: MyKasih subsidy is used by customer "
                f"{order.customer_id} without a beneficiary record."
            )
        if not successful_order(order):
            continue
        if not (
            beneficiary.valid_from.date()
            <= order.order_datetime.date()
            <= beneficiary.valid_until.date()
        ):
            raise ValueError(
                f"{order.order_id}: MyKasih subsidy is outside the beneficiary "
                "validity period."
            )
        if (
            order.order_datetime.year == month_year
            and order.order_datetime.month == month_number
        ):
            usage[order.customer_id] += subsidy

    for customer_id, beneficiary in beneficiaries_by_customer.items():
        beneficiary.amount_used = min(
            beneficiary.monthly_limit,
            usage[customer_id].quantize(Decimal("0.01")),
        )

    return (
        "Ordered_Items.MyKasihSubsidyAmount"
        if ordered_item_subsidies is not None
        else "Orders.MyKasihSubsidyTotal"
    )


def membership_valid_on(member: Member, moment: datetime) -> bool:
    return member.join_date.date() <= moment.date() <= member.expiry_date.date()


def successful_order(order: Order) -> bool:
    return order.order_status == "COMPLETED" and order.payment_status == "PAID"


def voucher_invalid_reason(
    order: Order,
    voucher: Voucher,
    member: Member | None,
    available_points: int,
) -> str | None:
    if order.customer_id is None:
        return "guest orders cannot use vouchers"

    if not (
        voucher.start_date.date()
        <= order.order_datetime.date()
        <= voucher.end_date.date()
    ):
        return "order date is outside voucher validity period"

    eligible_for_min_spend = order.subtotal - order.mykasih_subsidy
    if eligible_for_min_spend < voucher.min_spend_amount:
        return (
            "voucher eligible amount after MyKasih subsidy "
            f"({eligible_for_min_spend:.2f}) is below minimum spend "
            f"({voucher.min_spend_amount:.2f})"
        )

    if voucher.discount_amount > eligible_for_min_spend:
        return "voucher discount exceeds remaining payable item amount"

    if order.voucher_discount != voucher.discount_amount:
        return (
            f"order discount {order.voucher_discount:.2f} does not match "
            f"voucher master discount {voucher.discount_amount:.2f}"
        )

    if voucher.voucher_type == "FREE_DELIVERY" and order.fulfillment_type != "DELIVERY":
        return "free-delivery voucher is used on a non-delivery order"

    if voucher.points_required > 0:
        if member is None:
            return "points voucher is used by a non-member"
        if not membership_valid_on(member, order.order_datetime):
            return "points voucher is used outside the membership period"
        if not successful_order(order):
            return "points voucher is used on an order that is not completed and paid"
        if available_points < voucher.points_required:
            return (
                f"insufficient points: available {available_points}, "
                f"required {voucher.points_required}"
            )

    return None


def remove_order_voucher(order: Order, reason: str) -> Correction:
    old_voucher_id = order.voucher_id or ""
    old_discount = order.voucher_discount
    old_grand_total = order.grand_total

    order.voucher_id = None
    order.voucher_discount = Decimal("0.00")
    order.grand_total = (
        order.subtotal
        - order.mykasih_subsidy
        + order.inferred_delivery_fee
    ).quantize(Decimal("0.01"))

    row = order.insert.as_dict()
    row["VoucherID"] = "NULL"
    row["VoucherDiscountAmount"] = sql_number(order.voucher_discount)
    row["GrandTotal"] = sql_number(order.grand_total)
    order.insert.values = [row[column] for column in order.insert.columns]

    return Correction(
        order_id=order.order_id,
        old_voucher_id=old_voucher_id,
        reason=reason,
        old_discount=old_discount,
        new_discount=order.voucher_discount,
        old_grand_total=old_grand_total,
        new_grand_total=order.grand_total,
    )


def process_orders(
    orders: list[Order],
    vouchers: dict[str, Voucher],
    members_by_customer: dict[str, Member],
    point_rates: dict[str, Decimal],
) -> tuple[list[PointTransaction], list[Correction]]:
    """
    Process in chronological order because a redemption may only use points
    accumulated before that order.
    """
    transactions: list[PointTransaction] = []
    corrections: list[Correction] = []
    balances: dict[str, int] = {
        member.member_id: 0 for member in members_by_customer.values()
    }

    chronological_orders = sorted(
        orders,
        key=lambda order: (order.order_datetime, natural_id_key(order.order_id)),
    )

    for order in chronological_orders:
        member = (
            members_by_customer.get(order.customer_id)
            if order.customer_id is not None
            else None
        )
        current_balance = balances.get(member.member_id, 0) if member else 0

        voucher = None
        if order.voucher_id is not None:
            voucher = vouchers.get(order.voucher_id)
            if voucher is None:
                corrections.append(
                    remove_order_voucher(order, "order references an unknown voucher")
                )
            else:
                reason = voucher_invalid_reason(
                    order=order,
                    voucher=voucher,
                    member=member,
                    available_points=current_balance,
                )
                if reason is not None:
                    corrections.append(remove_order_voucher(order, reason))
                    voucher = None

        # A valid point voucher is redeemed before points from this order are earned.
        if (
            voucher is not None
            and voucher.points_required > 0
            and member is not None
        ):
            current_balance -= voucher.points_required
            transactions.append(
                PointTransaction(
                    transaction_id="",
                    transaction_type="REDEEM",
                    points=voucher.points_required,
                    transaction_datetime=order.order_datetime,
                    remarks=(
                        f"Redeemed {voucher.points_required} points for "
                        f"{voucher.voucher_id} on order {order.order_id}"
                    ),
                    member_id=member.member_id,
                    order_id=order.order_id,
                    voucher_id=voucher.voucher_id,
                    running_balance=current_balance,
                )
            )

        if (
            member is not None
            and membership_valid_on(member, order.order_datetime)
            and successful_order(order)
        ):
            if EXCLUDE_DELIVERY_FEE_FROM_EARN:
                eligible_paid_amount = (
                    order.subtotal
                    - order.mykasih_subsidy
                    - order.voucher_discount
                )
            else:
                eligible_paid_amount = order.grand_total

            if eligible_paid_amount < 0:
                raise ValueError(
                    f"{order.order_id} has negative point-eligible paid amount."
                )

            rate = point_rates[member.tier_id]
            earned_points = int(
                (eligible_paid_amount * rate).to_integral_value(
                    rounding=ROUND_FLOOR
                )
            )

            if earned_points > 0:
                transaction_time = order.payment_datetime
                if (
                    transaction_time is None
                    or transaction_time <= order.order_datetime
                ):
                    transaction_time = order.order_datetime + timedelta(seconds=1)

                current_balance += earned_points
                transactions.append(
                    PointTransaction(
                        transaction_id="",
                        transaction_type="EARN",
                        points=earned_points,
                        transaction_datetime=transaction_time,
                        remarks=(
                            f"Earned {earned_points} points from order "
                            f"{order.order_id}; eligible paid amount RM"
                            f"{eligible_paid_amount.quantize(Decimal('0.01'))}; "
                            f"tier rate {rate}"
                        ),
                        member_id=member.member_id,
                        order_id=order.order_id,
                        voucher_id=None,
                        running_balance=current_balance,
                    )
                )

        if member is not None:
            balances[member.member_id] = current_balance

    # IDs follow transaction chronology. REDEEM sorts before EARN when timestamps tie.
    transactions.sort(
        key=lambda transaction: (
            transaction.transaction_datetime,
            0 if transaction.transaction_type == "REDEEM" else 1,
            natural_id_key(transaction.order_id),
        )
    )
    for number, transaction in enumerate(transactions, start=1):
        transaction.transaction_id = f"PT{number:07d}"

    for member in members_by_customer.values():
        member.points_balance = balances[member.member_id]

    return transactions, corrections


def update_ddl_member_balance(ddl_text: str) -> str:
    table_pattern = re.compile(
        r"(CREATE\s+TABLE\s+Member_Profiles\s*\()(.*?)(\)\s*;)",
        re.IGNORECASE | re.DOTALL,
    )
    match = table_pattern.search(ddl_text)
    if not match:
        raise ValueError("CREATE TABLE Member_Profiles was not found in DDL.")

    body = match.group(2)
    if re.search(r"\bPointsBalance\b", body, flags=re.IGNORECASE):
        return ddl_text

    status_line = re.compile(
        r"(?P<indent>[ \t]*)Status\s+VARCHAR2\(15\)"
        r"(?P<rest>[^\n]*\n)",
        re.IGNORECASE,
    )
    status_match = status_line.search(body)
    if not status_match:
        raise ValueError("Could not locate Member_Profiles.Status column.")

    indent = status_match.group("indent")
    balance_line = (
        f"{indent}PointsBalance NUMBER(10)      DEFAULT 0            NOT NULL,\n"
    )
    insert_at = status_match.end()
    body = body[:insert_at] + balance_line + body[insert_at:]

    status_constraint = re.compile(
        r"(\s*CONSTRAINT\s+CK_Member_Profile_Status.*?"
        r"CHECK\s*\(Status\s+IN\s*\(.*?\)\)\s*,)",
        re.IGNORECASE | re.DOTALL,
    )
    constraint_match = status_constraint.search(body)
    balance_constraint = (
        "\n    CONSTRAINT CK_Member_Profile_Points\n"
        "        CHECK (PointsBalance >= 0),"
    )
    if constraint_match:
        body = (
            body[:constraint_match.end()]
            + balance_constraint
            + body[constraint_match.end():]
        )
    else:
        foreign_key_marker = re.search(
            r"\s*CONSTRAINT\s+FK_Member_Profile_Cust",
            body,
            flags=re.IGNORECASE,
        )
        if not foreign_key_marker:
            raise ValueError("Could not place PointsBalance CHECK constraint.")
        body = (
            body[:foreign_key_marker.start()]
            + balance_constraint
            + "\n"
            + body[foreign_key_marker.start():]
        )

    return (
        ddl_text[:match.start()]
        + match.group(1)
        + body
        + match.group(3)
        + ddl_text[match.end():]
    )


def update_ddl_order_contact_rule(ddl_text: str) -> str:
    table_pattern = re.compile(
        r"(CREATE\s+TABLE\s+Orders\s*\()(.*?)(\)\s*;)",
        re.IGNORECASE | re.DOTALL,
    )
    match = table_pattern.search(ddl_text)
    if not match:
        raise ValueError("CREATE TABLE Orders was not found in DDL.")

    body = match.group(2)
    if re.search(r"\bCK_Orders_Customer_Contact\b", body, re.IGNORECASE):
        return ddl_text

    marker = re.search(
        r"\s*CONSTRAINT\s+FK_Orders_Customer",
        body,
        flags=re.IGNORECASE,
    )
    if not marker:
        raise ValueError("Could not place Orders customer/contact constraint.")

    constraint = (
        "\n    CONSTRAINT CK_Orders_Customer_Contact\n"
        "        CHECK (\n"
        "            (\n"
        "                CustomerID IS NOT NULL\n"
        "                AND ContactName IS NULL\n"
        "                AND ContactPhone IS NULL\n"
        "                AND ContactEmail IS NULL\n"
        "            )\n"
        "            OR\n"
        "            (\n"
        "                CustomerID IS NULL\n"
        "                AND ContactName IS NOT NULL\n"
        "                AND ContactPhone IS NOT NULL\n"
        "                AND ContactEmail IS NOT NULL\n"
        "            )\n"
        "        ),\n"
    )
    body = body[:marker.start()] + constraint + body[marker.start():]
    return (
        ddl_text[:match.start()]
        + match.group(1)
        + body
        + match.group(3)
        + ddl_text[match.end():]
    )


def make_member_insert(insert: SqlInsert, balance: int) -> SqlInsert:
    row = insert.as_dict()
    columns = list(insert.columns)
    if "PointsBalance" not in columns:
        status_index = columns.index("Status")
        columns.insert(status_index + 1, "PointsBalance")
    row["PointsBalance"] = str(balance)
    values = [row[column] for column in columns]
    return SqlInsert(
        table=insert.table,
        columns=columns,
        values=values,
        start=insert.start,
        end=insert.end,
    )


def make_mykasih_insert(beneficiary: MyKasihBeneficiary) -> SqlInsert:
    row = beneficiary.insert.as_dict()
    row["AmountUsed"] = sql_number(beneficiary.amount_used)
    return SqlInsert(
        table=beneficiary.insert.table,
        columns=list(beneficiary.insert.columns),
        values=[row[column] for column in beneficiary.insert.columns],
        start=beneficiary.insert.start,
        end=beneficiary.insert.end,
    )


def make_voucher_insert(voucher: Voucher) -> SqlInsert:
    row = voucher.insert.as_dict()
    row["VoucherName"] = sql_string(voucher.voucher_name)
    return SqlInsert(
        table=voucher.insert.table,
        columns=list(voucher.insert.columns),
        values=[row[column] for column in voucher.insert.columns],
        start=voucher.insert.start,
        end=voucher.insert.end,
    )


def point_transaction_insert(transaction: PointTransaction) -> str:
    values = [
        sql_string(transaction.transaction_id),
        sql_string(transaction.transaction_type),
        str(transaction.points),
        oracle_datetime(transaction.transaction_datetime),
        sql_string(transaction.remarks),
        sql_string(transaction.member_id),
        sql_string(transaction.order_id),
        sql_string(transaction.voucher_id),
    ]
    columns = [
        "PointTransactionID",
        "TransactionType",
        "Points",
        "TransactionDate",
        "Remarks",
        "MemberID",
        "OrderID",
        "VoucherID",
    ]
    return (
        "INSERT INTO Point_Transactions "
        f"({', '.join(columns)}) VALUES ({', '.join(values)});"
    )


def validate_final_data(
    orders: Sequence[Order],
    vouchers: dict[str, Voucher],
    members_by_customer: dict[str, Member],
    beneficiaries_by_customer: dict[str, MyKasihBeneficiary],
    point_rates: dict[str, Decimal],
    transactions: Sequence[PointTransaction],
) -> list[str]:
    checks: list[str] = []

    # Known customers store only CustomerID; guests store contact fields only.
    for order in orders:
        if order.customer_id is not None:
            if any(
                value is not None
                for value in (
                    order.contact_name,
                    order.contact_phone,
                    order.contact_email,
                )
            ):
                raise AssertionError(
                    f"{order.order_id}: known customer still has contact fields."
                )
        else:
            if any(
                value is None
                for value in (
                    order.contact_name,
                    order.contact_phone,
                    order.contact_email,
                )
            ):
                raise AssertionError(
                    f"{order.order_id}: guest contact fields are incomplete."
                )
    checks.append("Order customer/guest contact storage rule: PASS")

    for beneficiary in beneficiaries_by_customer.values():
        if not (Decimal("0.00") <= beneficiary.amount_used <= beneficiary.monthly_limit):
            raise AssertionError(
                f"{beneficiary.mykasih_id}: AmountUsed is outside its limit."
            )
    checks.append("MyKasih AmountUsed is within MonthlyLimitAmount: PASS")

    # Voucher names with RM values must match DiscountAmount.
    for voucher in vouchers.values():
        amount_match = re.search(
            r"\bRM\s*(\d+(?:\.\d+)?)\b",
            voucher.voucher_name,
            flags=re.IGNORECASE,
        )
        if amount_match and "min spend" not in voucher.voucher_name.lower():
            name_amount = Decimal(amount_match.group(1))
            if name_amount != voucher.discount_amount:
                raise AssertionError(
                    f"{voucher.voucher_id} name amount does not match discount."
                )
    checks.append("Voucher RM names match DiscountAmount: PASS")

    # Every retained voucher must satisfy all non-balance conditions.
    for order in orders:
        if order.voucher_id is None:
            continue
        voucher = vouchers[order.voucher_id]
        if order.customer_id is None:
            raise AssertionError(f"{order.order_id}: guest voucher usage remains.")
        eligible = order.subtotal - order.mykasih_subsidy
        if eligible < voucher.min_spend_amount:
            raise AssertionError(f"{order.order_id}: minimum spend failure remains.")
        if not (
            voucher.start_date.date()
            <= order.order_datetime.date()
            <= voucher.end_date.date()
        ):
            raise AssertionError(f"{order.order_id}: date-invalid voucher remains.")
        if order.voucher_discount != voucher.discount_amount:
            raise AssertionError(f"{order.order_id}: discount mismatch remains.")
        if (
            voucher.voucher_type == "FREE_DELIVERY"
            and order.fulfillment_type != "DELIVERY"
        ):
            raise AssertionError(
                f"{order.order_id}: free-delivery voucher on non-delivery remains."
            )
    checks.append("All retained voucher orders satisfy date/min-spend/amount: PASS")

    # Recompute ledger balances and verify no negative running balance.
    balances = {
        member.member_id: 0 for member in members_by_customer.values()
    }
    for transaction in sorted(
        transactions,
        key=lambda item: natural_id_key(item.transaction_id),
    ):
        balance = balances[transaction.member_id]
        if transaction.transaction_type == "EARN":
            balance += transaction.points
        elif transaction.transaction_type in ("REDEEM", "REFUND"):
            balance -= transaction.points
        elif transaction.transaction_type == "ADJUST":
            raise AssertionError(
                "ADJUST direction is undefined by the current positive-only schema."
            )
        else:
            raise AssertionError(
                f"Unknown transaction type: {transaction.transaction_type}"
            )
        if balance < 0:
            raise AssertionError(
                f"{transaction.transaction_id} creates a negative balance."
            )
        balances[transaction.member_id] = balance

    for member in members_by_customer.values():
        if balances[member.member_id] != member.points_balance:
            raise AssertionError(
                f"{member.member_id}: cached balance does not equal ledger."
            )
    checks.append("Member PointsBalance equals reconstructed ledger balance: PASS")

    # Primary key order checks for the newly generated records.
    point_ids = [item.transaction_id for item in transactions]
    if point_ids != sorted(point_ids, key=natural_id_key):
        raise AssertionError("Point transaction IDs are not sorted.")
    checks.append("New PointTransactionID values are sorted: PASS")

    return checks


def write_csv(
    path: Path,
    headers: Sequence[str],
    rows: Iterable[Sequence[object]],
) -> None:
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.writer(handle)
        writer.writerow(headers)
        writer.writerows(rows)


def write_outputs(
    output_dir: Path,
    ddl_text: str,
    member_sql_text: str,
    member_inserts: list[SqlInsert],
    members_by_id: dict[str, Member],
    mykasih_inserts: list[SqlInsert],
    beneficiaries_by_customer: dict[str, MyKasihBeneficiary],
    voucher_sql_text: str,
    voucher_inserts: list[SqlInsert],
    vouchers: dict[str, Voucher],
    orders_sql_text: str,
    order_inserts: list[SqlInsert],
    orders: list[Order],
    transactions: list[PointTransaction],
    corrections: list[Correction],
    validation_checks: list[str],
    source_paths: dict[str, Path],
    identity_counts: dict[str, int],
    mykasih_source: str,
) -> None:
    output_dir.mkdir(parents=True, exist_ok=True)

    # DDL
    clean_ddl = update_ddl_member_balance(ddl_text)
    clean_ddl = update_ddl_order_contact_rule(clean_ddl)
    (output_dir / "ddl_script_clean.sql").write_text(
        clean_ddl, encoding="utf-8", newline="\r\n"
    )

    # Member 1 script, with cached final point balances.
    original_by_member_id: dict[str, SqlInsert] = {}
    for insert in member_inserts:
        member_id = sql_unquote(insert.as_dict()["MemberID"])
        assert member_id is not None
        original_by_member_id[member_id] = insert

    sorted_member_ids = sorted(members_by_id, key=natural_id_key)
    corrected_member_inserts = [
        make_member_insert(
            original_by_member_id[member_id],
            members_by_id[member_id].points_balance,
        )
        for member_id in sorted_member_ids
    ]
    original_by_mykasih_id: dict[str, SqlInsert] = {}
    for insert in mykasih_inserts:
        mykasih_id = sql_unquote(insert.as_dict()["MyKasihID"])
        assert mykasih_id is not None
        original_by_mykasih_id[mykasih_id] = insert

    sorted_beneficiaries = sorted(
        beneficiaries_by_customer.values(),
        key=lambda item: natural_id_key(item.mykasih_id),
    )
    corrected_mykasih_inserts = [
        make_mykasih_insert(beneficiary)
        for beneficiary in sorted_beneficiaries
    ]

    replacement_pairs = list(zip(member_inserts, corrected_member_inserts))
    replacement_pairs.extend(zip(mykasih_inserts, corrected_mykasih_inserts))
    replacement_pairs.sort(key=lambda pair: pair[0].start)
    clean_member_sql = replace_inserts(
        member_sql_text,
        [pair[0] for pair in replacement_pairs],
        [pair[1] for pair in replacement_pairs],
    )
    (output_dir / "insert_script_1_clean.sql").write_text(
        clean_member_sql, encoding="utf-8", newline="\r\n"
    )

    # Voucher script sorted by VoucherID.
    sorted_vouchers = sorted(
        vouchers.values(),
        key=lambda item: natural_id_key(item.voucher_id),
    )
    corrected_voucher_inserts = [
        make_voucher_insert(voucher) for voucher in sorted_vouchers
    ]
    clean_voucher_sql = replace_inserts(
        voucher_sql_text,
        voucher_inserts,
        corrected_voucher_inserts,
    )
    (output_dir / "insert_vouchers_clean.sql").write_text(
        clean_voucher_sql, encoding="utf-8", newline="\r\n"
    )

    # Order script sorted by OrderID. Existing IDs are preserved.
    order_by_id = {order.order_id: order for order in orders}
    corrected_order_inserts = [
        order_by_id[order_id].insert
        for order_id in sorted(order_by_id, key=natural_id_key)
    ]
    clean_orders_sql = replace_inserts(
        orders_sql_text,
        order_inserts,
        corrected_order_inserts,
    )
    (output_dir / "insert_orders_clean.sql").write_text(
        clean_orders_sql, encoding="utf-8", newline="\r\n"
    )

    # Point transactions.
    point_sql_lines = [
        "SET DEFINE OFF;",
        "SET SQLBLANKLINES ON;",
        "SET ECHO OFF;",
        "WHENEVER SQLERROR CONTINUE;",
        "",
        "-- Generated from corrected Orders, Vouchers and Member_Profiles.",
        "-- REDEEM uses positive Points; TransactionType determines subtraction.",
        "-- Run after Member_Profiles, Vouchers and Orders have been inserted.",
        "",
    ]
    point_sql_lines.extend(
        point_transaction_insert(transaction)
        for transaction in transactions
    )
    point_sql_lines.extend(["", "COMMIT;", ""])
    (output_dir / "insert_point_transactions.sql").write_text(
        "\n".join(point_sql_lines),
        encoding="utf-8",
        newline="\r\n",
    )

    write_csv(
        output_dir / "order_corrections.csv",
        [
            "OrderID",
            "OldVoucherID",
            "Reason",
            "OldVoucherDiscount",
            "NewVoucherDiscount",
            "OldGrandTotal",
            "NewGrandTotal",
        ],
        [
            [
                correction.order_id,
                correction.old_voucher_id,
                correction.reason,
                f"{correction.old_discount:.2f}",
                f"{correction.new_discount:.2f}",
                f"{correction.old_grand_total:.2f}",
                f"{correction.new_grand_total:.2f}",
            ]
            for correction in sorted(
                corrections,
                key=lambda item: natural_id_key(item.order_id),
            )
        ],
    )

    write_csv(
        output_dir / "member_point_balances.csv",
        ["MemberID", "CustomerID", "TierID", "PointsBalance"],
        [
            [
                member.member_id,
                member.customer_id,
                member.tier_id,
                member.points_balance,
            ]
            for member in sorted(
                members_by_id.values(),
                key=lambda item: natural_id_key(item.member_id),
            )
        ],
    )

    write_csv(
        output_dir / "mykasih_amount_used.csv",
        [
            "MyKasihID",
            "CustomerID",
            "MonthlyLimitAmount",
            "AmountUsedAt2026-06-30",
        ],
        [
            [
                beneficiary.mykasih_id,
                beneficiary.customer_id,
                f"{beneficiary.monthly_limit:.2f}",
                f"{beneficiary.amount_used:.2f}",
            ]
            for beneficiary in sorted_beneficiaries
        ],
    )

    write_csv(
        output_dir / "order_identity_corrections.csv",
        ["Rule", "RowsChanged"],
        [
            [
                "Known customer: clear ContactName/Phone/Email",
                identity_counts["known_contact_fields_cleared"],
            ],
            [
                "Guest: complete ContactName/Phone/Email",
                identity_counts["guest_contact_rows_completed"],
            ],
        ],
    )

    earn_count = sum(
        item.transaction_type == "EARN" for item in transactions
    )
    redeem_count = sum(
        item.transaction_type == "REDEEM" for item in transactions
    )
    original_voucher_names = {
        sql_unquote(insert.as_dict()["VoucherID"]):
        sql_unquote(insert.as_dict()["VoucherName"])
        for insert in voucher_inserts
    }
    changed_names = [
        (
            voucher.voucher_id,
            original_voucher_names[voucher.voucher_id],
            voucher.voucher_name,
        )
        for voucher in sorted_vouchers
        if original_voucher_names[voucher.voucher_id] != voucher.voucher_name
    ]

    report_lines = [
        "CLEAN POINT DATA BUILD REPORT",
        "=" * 64,
        "",
        "Source files:",
        *[
            f"- {label}: {path.name}"
            for label, path in source_paths.items()
        ],
        "",
        "Outputs were written without overwriting the originals.",
        "",
        f"Members: {len(members_by_id)}",
        f"Orders: {len(orders)}",
        f"Vouchers: {len(vouchers)}",
        f"Point transactions: {len(transactions)}",
        f"  EARN: {earn_count}",
        f"  REDEEM: {redeem_count}",
        f"Orders corrected by removing an invalid voucher: {len(corrections)}",
        f"Known-customer orders with contact fields cleared: "
        f"{identity_counts['known_contact_fields_cleared']}",
        f"Guest orders with missing contact fields completed: "
        f"{identity_counts['guest_contact_rows_completed']}",
        f"MyKasih AmountUsed source: {mykasih_source}",
        f"Voucher names corrected: {len(changed_names)}",
        "",
        "Voucher name changes:",
    ]
    report_lines.extend(
        f"- {voucher_id}: {old_name} -> {new_name}"
        for voucher_id, old_name, new_name in changed_names
    )
    if not changed_names:
        report_lines.append("- None")

    report_lines.extend(
        [
            "",
            "Validation:",
            *[f"- {check}" for check in validation_checks],
            "",
            "Rules used:",
            "- Guest orders cannot use a voucher or membership points.",
            "- Voucher minimum spend uses SubtotalAmount - MyKasihSubsidyTotal.",
            "- Voucher discount cannot exceed the remaining payable item amount.",
            "- Point redemptions require a valid member and enough prior balance.",
            "- REDEEM is processed before EARN on the same order.",
            "- EARN uses FLOOR((Subtotal - MyKasih - VoucherDiscount) * PointRate).",
            "- Delivery fee is excluded from EARN points.",
            "- MyKasih subsidy does not create a point transaction.",
            "- June-2026 MyKasih AmountUsed includes only COMPLETED and PAID orders.",
            "- Known customers store CustomerID only; guests store contact details only.",
            "- SubtotalAmount and MyKasihSubsidyTotal are not changed.",
            "- GrandTotal changes only when an invalid voucher is removed.",
            "",
            "Return note:",
            "- REFUND point transactions were not invented because no approved",
            "  return-request data was supplied. Add them only after the final",
            "  return data is available.",
            "",
            "PointsBalance note:",
            "- Point_Transactions remains the audit/source-of-truth ledger.",
            "- Member_Profiles.PointsBalance is a cached snapshot calculated from",
            "  the generated ledger. In a real application, update it in the same",
            "  database transaction whenever the ledger changes.",
            "",
            "SQL dependency note:",
            "- Point_Transactions cannot be safely appended to the early Member 1",
            "  insert script because Orders and Vouchers must exist first. Run the",
            "  generated insert_point_transactions.sql after those parent tables.",
        ]
    )
    (output_dir / "point_data_report.txt").write_text(
        "\n".join(report_lines) + "\n",
        encoding="utf-8",
    )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Create one clean and matched member/order/voucher/point dataset."
    )
    parser.add_argument("--ddl", type=Path)
    parser.add_argument("--member-sql", type=Path)
    parser.add_argument("--orders-sql", type=Path)
    parser.add_argument("--vouchers-sql", type=Path)
    parser.add_argument("--ordered-items-sql", type=Path)
    parser.add_argument(
        "--output-dir",
        type=Path,
        help="Default: clean_output beside this script.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    base_dir = Path(__file__).resolve().parent

    ddl_path = locate_input(
        base_dir,
        args.ddl,
        "ddl_script.sql",
        ("ddl_script*.sql",),
    )
    member_path = locate_input(
        base_dir,
        args.member_sql,
        "insert_script_1.sql",
        ("insert_script_1*.sql",),
    )
    orders_path = locate_input(
        base_dir,
        args.orders_sql,
        "insert_orders.sql",
        ("insert_orders*.sql", "insert_order*.sql"),
    )
    vouchers_path = locate_input(
        base_dir,
        args.vouchers_sql,
        "insert_vouchers_analytical.sql",
        ("insert_vouchers_analytical*.sql", "insert_voucher*.sql"),
    )
    ordered_items_path = locate_optional_input(
        base_dir,
        args.ordered_items_sql,
        "insert_ordered_items.sql",
        ("insert_ordered_items*.sql", "insert_order_items*.sql"),
    )
    output_dir = (
        args.output_dir.resolve()
        if args.output_dir is not None
        else base_dir / OUTPUT_FOLDER_NAME
    )

    ddl_text = read_text(ddl_path)
    member_sql_text = read_text(member_path)
    orders_sql_text = read_text(orders_path)
    vouchers_sql_text = read_text(vouchers_path)
    ordered_items_sql_text = (
        read_text(ordered_items_path) if ordered_items_path is not None else None
    )

    (
        members_by_customer,
        members_by_id,
        point_rates,
        member_inserts,
    ) = load_members(member_sql_text)
    beneficiaries_by_customer, mykasih_inserts = load_mykasih(member_sql_text)
    vouchers, voucher_inserts = load_vouchers(vouchers_sql_text)
    orders, order_inserts = load_orders(orders_sql_text)
    identity_counts = normalize_order_identity(orders)

    transactions, corrections = process_orders(
        orders=orders,
        vouchers=vouchers,
        members_by_customer=members_by_customer,
        point_rates=point_rates,
    )

    ordered_item_subsidies = load_ordered_item_subsidies(
        ordered_items_sql_text
    )
    mykasih_source = synchronize_mykasih_amount_used(
        beneficiaries_by_customer=beneficiaries_by_customer,
        orders=orders,
        ordered_item_subsidies=ordered_item_subsidies,
    )

    validation_checks = validate_final_data(
        orders=orders,
        vouchers=vouchers,
        members_by_customer=members_by_customer,
        beneficiaries_by_customer=beneficiaries_by_customer,
        point_rates=point_rates,
        transactions=transactions,
    )

    write_outputs(
        output_dir=output_dir,
        ddl_text=ddl_text,
        member_sql_text=member_sql_text,
        member_inserts=member_inserts,
        members_by_id=members_by_id,
        mykasih_inserts=mykasih_inserts,
        beneficiaries_by_customer=beneficiaries_by_customer,
        voucher_sql_text=vouchers_sql_text,
        voucher_inserts=voucher_inserts,
        vouchers=vouchers,
        orders_sql_text=orders_sql_text,
        order_inserts=order_inserts,
        orders=orders,
        transactions=transactions,
        corrections=corrections,
        validation_checks=validation_checks,
        source_paths={
            "DDL": ddl_path,
            "Member 1 insert": member_path,
            "Orders insert": orders_path,
            "Vouchers insert": vouchers_path,
            **(
                {"Ordered items insert": ordered_items_path}
                if ordered_items_path is not None
                else {}
            ),
        },
        identity_counts=identity_counts,
        mykasih_source=mykasih_source,
    )

    earn_count = sum(
        transaction.transaction_type == "EARN"
        for transaction in transactions
    )
    redeem_count = sum(
        transaction.transaction_type == "REDEEM"
        for transaction in transactions
    )

    print("Clean matched dataset generated successfully.")
    print(f"Output folder: {output_dir}")
    print(f"Members: {len(members_by_id)}")
    print(f"Orders: {len(orders)}")
    print(f"Vouchers: {len(vouchers)}")
    print(f"EARN transactions: {earn_count}")
    print(f"REDEEM transactions: {redeem_count}")
    print(f"Corrected voucher orders: {len(corrections)}")
    print(
        "Known-customer contact rows cleared: "
        f"{identity_counts['known_contact_fields_cleared']}"
    )
    print(
        "Guest contact rows completed: "
        f"{identity_counts['guest_contact_rows_completed']}"
    )
    print(f"MyKasih AmountUsed source: {mykasih_source}")
    print("Read point_data_report.txt before replacing any team file.")
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except Exception as error:
        print(f"ERROR: {error}", file=sys.stderr)
        sys.exit(1)
