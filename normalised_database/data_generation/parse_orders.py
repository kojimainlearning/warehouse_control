import csv
import re

# File paths - update these filenames if necessary
input_sql_file = "ZhenHao/order_inserts.sql"
output_csv_file = "orders_output.csv"

# Regular expression to extract the target fields from the Oracle SQL INSERT statement
pattern = re.compile(
    r"VALUES\s*\(\s*"
    r"'([^']*)',\s*"  # 1: OrderID
    r"(?:'(?:''|[^'])*'|NULL),\s*"  # ContactName (Ignored)
    r"(?:'(?:''|[^'])*'|NULL),\s*"  # ContactPhone (Ignored)
    r"(?:'(?:''|[^'])*'|NULL),\s*"  # ContactEmail (Ignored)
    r"'([^']*)',\s*"  # 2: FulfillmentType
    r"TO_TIMESTAMP\('([^']*)',\s*'[^']*'\),\s*"  # 3: OrderDateTime
    r"'([^']*)',\s*"  # 4: OrderStatus
    r"([\d\.]+),\s*"  # 5: SubtotalAmount
    r"([\d\.]+),\s*"  # 6: VoucherDiscountAmount
    r"([\d\.]+),\s*"  # 7: MyKasihSubsidyTotal
    r"([\d\.]+),\s*"  # 8: GrandTotal
    r"(?:'(?:''|[^'])*'|NULL),\s*"  # PaymentMethod (Ignored)
    r"(?:'(?:''|[^'])*'|NULL),\s*"  # PaymentStatus (Ignored)
    r"(?:TO_TIMESTAMP\('[^']*',\s*'[^']*'\)|NULL),\s*"  # PaymentDateTime (Ignored)
    r"(?:'(?:''|[^'])*'|NULL),\s*"  # CustomerID (Ignored)
    r"'([^']*)',\s*"  # 9: BranchID
    r"(?:'([^']*)'|(NULL)),\s*"  # 10: VoucherID (Value or literal NULL)
    r"(?:'(?:''|[^'])*'|NULL)\s*\);"  # StaffID (Ignored)
)

# Header matching your requested CSV schema
headers = [
    "OrderID",
    "FullfillmentType",
    "OrderDateTime",
    "OrderStatus",
    "SubtotalAmount",
    "VoucherDiscountAmount",
    "MyKasihSubsidyTotal",
    "GrandTotal",
    "BranchID",
    "VoucherID",
]


def convert_sql_to_csv(sql_file_path, csv_file_path):
    processed_count = 0

    with open(sql_file_path, "r", encoding="utf-8") as infile, open(
        csv_file_path, "w", newline="", encoding="utf-8"
    ) as outfile:

        writer = csv.writer(outfile)
        writer.writerow(headers)

        for line in infile:
            line = line.strip()
            if not line or not line.startswith("INSERT"):
                continue

            match = pattern.search(line)
            if match:
                order_id = match.group(1)
                fulfillment_type = match.group(2)
                order_datetime = match.group(3)
                order_status = match.group(4)
                subtotal = match.group(5)
                voucher_discount = match.group(6)
                mykasih_subsidy = match.group(7)
                grand_total = match.group(8)
                branch_id = match.group(9)
                # Group 10 contains the quoted string value, Group 11 catches literal NULL
                voucher_id = (
                    match.group(10)
                    if match.group(10) is not None
                    else match.group(11)
                )

                row = [
                    order_id,
                    fulfillment_type,
                    order_datetime,
                    order_status,
                    subtotal,
                    voucher_discount,
                    mykasih_subsidy,
                    grand_total,
                    branch_id,
                    voucher_id,
                ]

                writer.writerow(row)
                processed_count += 1

    print(
        f"Conversion complete! Successfully exported {processed_count} rows to '{csv_file_path}'."
    )


if __name__ == "__main__":
    convert_sql_to_csv(input_sql_file, output_csv_file)