#!/usr/bin/env python3
"""
Generate synthetic Purchase_Orders and Purchase_Order_Items data.
Period : 1 Jan 2024 – 30 Jun 2026
Snapshot: 30 Jun 2026
Seed   : 3183

PO IDs are assigned chronologically:
  PO0001, PO0002 … = earliest dates (Jan 2024)
  … PO0320         = latest dates  (Jun 2026)

Dependency files (must exist in working directory):
  - supplier_profile.csv
  - price_history_control.csv
  - staffs.csv
  - branches.csv
Optional:
  - items.csv  (ItemID, CategoryID) – overrides deterministic category mapping
"""

import random
import csv
import os
import sys
from datetime import datetime, timedelta
from collections import Counter, defaultdict

# ──────────────────────────────────────────────────────────────
# 0.  SEED & CONSTANTS
# ──────────────────────────────────────────────────────────────
random.seed(3183)

SNAPSHOT     = datetime(2026, 6, 30)
PERIOD_START = datetime(2024, 1, 1)
PERIOD_END   = SNAPSHOT

REQUIRED_FILES = [
    'metadata/supplier_profile.csv',
    'metadata/price_history_control.csv',
    'metadata/staffs.csv',
    'metadata/branches_copy.csv',
]

MONTH_WEIGHTS = {
    1: 1.30, 2: 1.30,
    3: 1.20, 4: 1.20,
    5: 1.00, 6: 1.00,
    7: 0.90, 8: 0.90,
    9: 1.00, 10: 1.10,
    11: 1.20, 12: 1.30,
}

CATEGORY_MARGINS = {
    'CAT01': (0.55, 0.68),
    'CAT02': (0.65, 0.82),
    'CAT03': (0.60, 0.75),
    'CAT04': (0.55, 0.70),
    'CAT05': (0.65, 0.85),
}

CATEGORY_QTY = {
    'CAT01': (20, 200),
    'CAT02': (5,  40),
    'CAT03': (10, 80),
    'CAT04': (20, 200),
    'CAT05': (5,  40),
}

# ──────────────────────────────────────────────────────────────
# 1.  HELPERS
# ──────────────────────────────────────────────────────────────
def days_in_month(y, m):
    if m == 12:
        return (datetime(y + 1, 1, 1) - datetime(y, 12, 1)).days
    return (datetime(y, m + 1, 1) - datetime(y, m, 1)).days


def parse_date(s):
    if not s or not s.strip():
        return None
    s = s.strip()
    for fmt in ('%Y-%m-%d %H:%M:%S', '%Y-%m-%d', '%d/%m/%Y', '%m-%d-%y'):
        try:
            return datetime.strptime(s, fmt)
        except ValueError:
            continue
    return None


def escape_sql(val):
    if val is None:
        return "NULL"
    if isinstance(val, datetime):
        return f"TO_DATE('{val.strftime('%Y-%m-%d')}', 'YYYY-MM-DD')"
    if isinstance(val, (int, float)):
        return str(val)
    return "'" + str(val).replace("'", "''") + "'"


# ──────────────────────────────────────────────────────────────
# 2.  DEPENDENCY CHECK
# ──────────────────────────────────────────────────────────────
def check_dependencies():
    missing = [f for f in REQUIRED_FILES if not os.path.isfile(f)]
    if missing:
        print(f"FATAL: Missing dependency files: {', '.join(missing)}")
        print("Script stopped – will not invent unrelated IDs.")
        sys.exit(1)
    print("✓ All required dependency files found.")


# ──────────────────────────────────────────────────────────────
# 3.  CSV LOADERS
# ──────────────────────────────────────────────────────────────
def _read_csv(path):
    with open(path, 'r', encoding='utf-8-sig') as fh:
        rdr = csv.DictReader(fh)
        return list(rdr), rdr.fieldnames


def load_supplier_profiles():
    rows, cols = _read_csv('metadata/supplier_profile.csv')
    need = {'SupplierID', 'ReliabilityProfile', 'NormalLeadTimeDays',
            'LateDeliveryProbability', 'CancellationProbability', 'SupportedCategoryIDs'}
    missing = need - set(cols or [])
    if missing:
        print(f"FATAL: supplier_profile.csv missing columns: {missing}"); sys.exit(1)
    out = {}
    for r in rows:
        sid = r['SupplierID'].strip()
        cats = [c.strip() for c in r['SupportedCategoryIDs'].split(',') if c.strip()]
        out[sid] = {
            'SupplierID': sid,
            'Profile': r['ReliabilityProfile'].strip(),
            'LeadDays': int(r['NormalLeadTimeDays']),
            'LateProb': float(r['LateDeliveryProbability']),
            'CancelProb': float(r['CancellationProbability']),
            'Categories': cats,
            'InactiveDate': parse_date(r.get('InactiveDate', '')),
        }
    if not out:
        print("FATAL: supplier_profile.csv has no data rows."); sys.exit(1)
    return out


def load_price_history():
    rows, cols = _read_csv('metadata/price_history_control.csv')
    need = {'ItemID', 'Year', 'SellingPrice'}
    missing = need - set(cols or [])
    if missing:
        print(f"FATAL: price_history_control.csv missing columns: {missing}"); sys.exit(1)
    prices = {}
    for r in rows:
        iid = r['ItemID'].strip()
        try:
            yr = int(r['Year'].strip())
        except ValueError:
            continue
        p_str = r.get('SellingPrice', '').strip()
        prices.setdefault(iid, {})[yr] = float(p_str) if p_str else None
    if not prices:
        print("FATAL: price_history_control.csv has no usable rows."); sys.exit(1)
    return prices


def load_staffs():
    rows, cols = _read_csv('metadata/staffs.csv')
    need = {'StaffID', 'Role', 'HireDate', 'Status', 'BranchID'}
    missing = need - set(cols or [])
    if missing:
        print(f"FATAL: staffs.csv missing columns: {missing}"); sys.exit(1)
    out = []
    for r in rows:
        out.append({
            'StaffID': r['StaffID'].strip(),
            'Role': r['Role'].strip(),
            'HireDate': parse_date(r['HireDate']),
            'Status': r['Status'].strip(),
            'BranchID': r['BranchID'].strip(),
            'InactiveDate': parse_date(r.get('InactiveDate', '')),
        })
    return out


def load_branches():
    rows, cols = _read_csv('metadata/branches_copy.csv')
    if not rows or not cols:
        return None
    bid_col   = next((c for c in cols if 'branch' in c.lower() and 'id' in c.lower()), None)
    open_col  = next((c for c in cols if 'open' in c.lower() and 'date' in c.lower()), None)
    close_col = next((c for c in cols if 'clos' in c.lower() and 'date' in c.lower()), None)
    stat_col  = next((c for c in cols if 'status' in c.lower()), None)
    if not bid_col:
        return None
    out = {}
    for r in rows:
        bid = r.get(bid_col, '').strip()
        if not bid:
            continue
        out[bid] = {
            'OpeningDate': parse_date(r.get(open_col, '')) if open_col else None,
            'ClosingDate': parse_date(r.get(close_col, '')) if close_col else None,
            'Status': (r.get(stat_col, 'ACTIVE').strip() if stat_col else 'ACTIVE'),
        }
    return out or None


# ──────────────────────────────────────────────────────────────
# 4.  DERIVED LOOK-UPS
# ──────────────────────────────────────────────────────────────
def build_item_categories(price_history):
    if os.path.isfile('items.csv'):
        try:
            rows, cols = _read_csv('items.csv')
            if 'ItemID' in cols and 'CategoryID' in cols:
                m = {r['ItemID'].strip(): r['CategoryID'].strip() for r in rows
                     if r.get('ItemID', '').strip() and r.get('CategoryID', '').strip()}
                if m:
                    print(f"  Item categories loaded from items.csv ({len(m)} items)")
                    return m
        except Exception:
            pass
    cats = ['CAT01', 'CAT02', 'CAT03', 'CAT04', 'CAT05']
    ids  = sorted(price_history.keys())
    m = {iid: cats[i % len(cats)] for i, iid in enumerate(ids)}
    print(f"  Deterministic item→category mapping: {len(m)} items across {len(cats)} categories")
    return m


def derive_branches(staffs):
    earliest = {}
    for s in staffs:
        hd = s['HireDate']
        bid = s['BranchID']
        if hd and (bid not in earliest or hd < earliest[bid]):
            earliest[bid] = hd
    return {bid: {'OpeningDate': d, 'ClosingDate': None, 'Status': 'ACTIVE'}
            for bid, d in earliest.items()}


def item_intro_date(price_history, iid):
    yrs = [y for y, p in price_history.get(iid, {}).items() if p is not None]
    return datetime(min(yrs), 1, 1) if yrs else None


def selling_price_for(price_history, iid, year):
    hp = price_history.get(iid, {})
    if hp.get(year) is not None:
        return hp[year]
    avail = {y: p for y, p in hp.items() if p is not None}
    if not avail:
        return None
    return avail[min(avail, key=lambda y: abs(y - year))]


# ──────────────────────────────────────────────────────────────
# 5.  ELIGIBILITY FILTERS
# ──────────────────────────────────────────────────────────────
def eligible_staff(staffs, branches, dt):
    pool = []
    for s in staffs:
        if s['Role'] not in ('MANAGER', 'STOCK_STAFF'):
            continue
        if s['HireDate'] is None or s['HireDate'] > dt:
            continue
        if s['Status'] == 'INACTIVE' and s['InactiveDate'] and s['InactiveDate'] <= dt:
            continue
        br = branches.get(s['BranchID'])
        if br:
            if br['OpeningDate'] and br['OpeningDate'] > dt:
                continue
            if br['ClosingDate'] and br['ClosingDate'] <= dt:
                continue
            if br['Status'] in ('CLOSED', 'INACTIVE'):
                continue
        pool.append(s)
    return pool


def active_suppliers(profiles, dt):
    return [p for p in profiles.values()
            if not (p['InactiveDate'] and p['InactiveDate'] <= dt)]


# ──────────────────────────────────────────────────────────────
# 6.  DATE DISTRIBUTION
# ──────────────────────────────────────────────────────────────
def spread_dates(year, count, months=None):
    if months is None:
        months = list(range(1, 13))
    w = [MONTH_WEIGHTS.get(m, 1.0) for m in months]
    tw = sum(w)
    alloc = {}
    rem = count
    for i, m in enumerate(months):
        if i == len(months) - 1:
            alloc[m] = max(0, rem)
        else:
            c = max(1, round(count * w[i] / tw))
            c = min(c, rem - (len(months) - i - 1))
            alloc[m] = c
            rem -= c
    dates = []
    for m, c in alloc.items():
        nd = days_in_month(year, m)
        for _ in range(max(0, c)):
            dates.append(datetime(year, m, random.randint(1, nd)))
    return dates


# ──────────────────────────────────────────────────────────────
# 7.  MAIN GENERATOR
# ──────────────────────────────────────────────────────────────
def generate(suppliers, price_hist, staffs, branches, item_cats):
    # ---- 7a. build date pools -------------------------------------------------
    d24 = spread_dates(2024, 100)
    d25 = spread_dates(2025, 136)
    d26 = spread_dates(2026, 84, months=list(range(1, 7)))
    all_dates = d24 + d25 + d26

    # ---- 7b. pre-assign statuses ----------------------------------------------
    mj26 = [d for d in all_dates if d.year == 2026 and d.month >= 5]
    other = [d for d in all_dates if not (d.year == 2026 and d.month >= 5)]

    while len(mj26) < 6:
        m = random.choice([5, 6])
        mj26.append(datetime(2026, m, random.randint(1, days_in_month(2026, m))))

    pa_dates = random.sample(mj26, 6)
    used = set(id(d) for d in pa_dates)
    remaining_pool = other + [d for d in mj26 if id(d) not in used]

    status_pairs = []
    for i in range(4):
        status_pairs.append(('APPROVED', pa_dates[i]))
    for i in range(4, 6):
        status_pairs.append(('PENDING', pa_dates[i]))

    need = 314
    while len(remaining_pool) < need:
        yr = random.choice([2024, 2025])
        m  = random.randint(1, 12)
        remaining_pool.append(datetime(yr, m, random.randint(1, days_in_month(yr, m))))
    remaining_pool = remaining_pool[:need]

    cancel_idx = set(random.sample(range(need), 14))
    for i, dt in enumerate(remaining_pool):
        status_pairs.append(('CANCELLED' if i in cancel_idx else 'RECEIVED', dt))

    # ================================================================
    # ★ KEY CHANGE: sort chronologically so PO IDs follow date order
    #   PO0001 = earliest order, PO0320 = latest order
    # ================================================================
    status_pairs.sort(key=lambda pair: pair[1])

    status_pairs = status_pairs[:320]

    # ---- 7c. generate each PO -------------------------------------------------
    purchase_orders = []
    po_items_all    = []
    po_num = 0

    for status, order_dt in status_pairs:
        # --- staff ---
        pool = eligible_staff(staffs, branches, order_dt)
        if not pool:
            pool = [s for s in staffs
                    if s['Role'] in ('MANAGER', 'STOCK_STAFF')
                    and s['HireDate'] and s['HireDate'] <= order_dt]
        if not pool:
            print(f"  ⚠ skip – no eligible staff on {order_dt.date()}"); continue

        staff = random.choice(pool)

        # --- supplier ---
        asup = active_suppliers(suppliers, order_dt)
        if not asup:
            print(f"  ⚠ skip – no active supplier on {order_dt.date()}"); continue
        wts = []
        for sp in asup:
            wts.append({'Highly Reliable': 3.0, 'Average': 2.0,
                        'Frequent Delays': 1.0, 'High Cancellation': 0.8,
                        'Historical': 1.0}.get(sp['Profile'], 1.0))
        sup = random.choices(asup, weights=wts, k=1)[0]

        # --- items from supported categories ---
        sup_cats = set(sup['Categories'])
        yr = order_dt.year
        candidates = []
        for iid, cat in item_cats.items():
            if cat not in sup_cats:
                continue
            sp = selling_price_for(price_hist, iid, yr)
            if sp is None:
                continue
            intro = item_intro_date(price_hist, iid)
            if intro and intro > order_dt:
                continue
            candidates.append((iid, cat, sp))
        if not candidates:
            print(f"  ⚠ skip – no items for {sup['SupplierID']} on {order_dt.date()}"); continue

        n_items = random.choices([2, 3, 4, 5, 6], weights=[10, 20, 40, 20, 10], k=1)[0]
        n_items = min(n_items, len(candidates))
        chosen = random.sample(candidates, n_items)

        # --- cost / qty per line -----------------------------------------------
        reliability = sup['Profile']
        lines = []
        total = 0.0
        for iid, cat, sp in chosen:
            lo, hi = CATEGORY_MARGINS.get(cat, (0.55, 0.75))
            margin = random.uniform(lo, hi)
            margin += (yr - 2024) * 0.008
            if reliability == 'Highly Reliable':    margin += 0.02
            elif reliability == 'Frequent Delays':  margin -= 0.02
            elif reliability == 'High Cancellation': margin -= 0.01
            margin = max(0.50, min(0.90, margin))
            unit_cost = round(sp * margin, 2)

            qlo, qhi = CATEGORY_QTY.get(cat, (10, 100))
            qty = random.randint(qlo, qhi)
            line_total = round(qty * unit_cost, 2)

            if status == 'RECEIVED':
                if reliability == 'Highly Reliable':
                    qr = qty
                elif reliability == 'Average':
                    qr = random.randint(max(1, int(qty * 0.90)), qty)
                elif reliability == 'Frequent Delays':
                    qr = random.randint(max(1, int(qty * 0.70)), qty)
                else:
                    qr = random.randint(max(1, int(qty * 0.80)), qty)
            else:
                qr = 0

            lines.append({
                'PurchaseOrderID': None,
                'ItemID': iid,
                'QuantityOrdered': qty,
                'QuantityReceived': qr,
                'UnitCost': unit_cost,
                'LineTotal': line_total,
            })
            total += line_total
        total = round(total, 2)

        # --- dates --------------------------------------------------------------
        lead = sup['LeadDays']
        exp_del = order_dt + timedelta(days=lead)

        recv_dt = None
        if status == 'RECEIVED':
            delta = {'Highly Reliable': random.randint(-2, 1),
                     'Average':         random.randint(-1, 3),
                     'Frequent Delays': random.randint(1, 7),
                     'High Cancellation': random.randint(-1, 4),
                     }.get(reliability, random.randint(0, 5))
            recv_dt = order_dt + timedelta(days=max(1, lead + delta))
            if recv_dt < order_dt:
                recv_dt = order_dt + timedelta(days=1)
            if recv_dt > SNAPSHOT:
                recv_dt = SNAPSHOT

        if status == 'PENDING':
            exp_del = None
        if exp_del and exp_del > SNAPSHOT:
            exp_del = SNAPSHOT

        # --- commit -------------------------------------------------------------
        po_num += 1
        po_id = f"PO{po_num:04d}"
        for ln in lines:
            ln['PurchaseOrderID'] = po_id

        purchase_orders.append({
            'PurchaseOrderID': po_id,
            'OrderDate': order_dt,
            'ExpectedDeliveryDate': exp_del,
            'ReceivedDate': recv_dt,
            'TotalAmount': total,
            'Status': status,
            'SupplierID': sup['SupplierID'],
            'StaffID': staff['StaffID'],
        })
        po_items_all.extend(lines)

    return purchase_orders, po_items_all


# ──────────────────────────────────────────────────────────────
# 8.  EXPORT
# ──────────────────────────────────────────────────────────────
PO_COLS = ['PurchaseOrderID', 'OrderDate', 'ExpectedDeliveryDate',
           'ReceivedDate', 'TotalAmount', 'Status', 'SupplierID', 'StaffID']
PI_COLS = ['PurchaseOrderID', 'ItemID', 'QuantityOrdered',
           'QuantityReceived', 'UnitCost', 'LineTotal']


def _fmt_csv_date(d):
    return d.strftime('%Y-%m-%d') if isinstance(d, datetime) else (d or '')


def write_csv(path, rows, cols):
    with open(path, 'w', newline='', encoding='utf-8') as fh:
        w = csv.DictWriter(fh, fieldnames=cols, extrasaction='ignore')
        w.writeheader()
        for r in rows:
            out = {}
            for c in cols:
                v = r.get(c)
                out[c] = _fmt_csv_date(v) if isinstance(v, datetime) else (v if v is not None else '')
            w.writerow(out)
    print(f"  → {path}  ({len(rows)} rows)")


def write_sql(path, purchase_orders, po_items):
    with open(path, 'w', encoding='utf-8') as fh:
        fh.write("-- ==========================================================\n")
        fh.write("-- Synthetic Purchase_Orders & Purchase_Order_Items\n")
        fh.write(f"-- Snapshot: {SNAPSHOT.date()}   Seed: 3183\n")
        fh.write("-- PO IDs are chronological: PO0001 = earliest order\n")
        fh.write("-- ==========================================================\n\n")

        fh.write("-- ── Purchase_Orders ──\n")
        for r in purchase_orders:
            cols = ', '.join(PO_COLS)
            vals = ', '.join(escape_sql(r[c]) for c in PO_COLS)
            fh.write(f"INSERT INTO Purchase_Orders ({cols})\nVALUES ({vals});\n")

        fh.write("\n-- ── Purchase_Order_Items ──\n")
        for r in po_items:
            cols = ', '.join(PI_COLS)
            vals = ', '.join(escape_sql(r[c]) for c in PI_COLS)
            fh.write(f"INSERT INTO Purchase_Order_Items ({cols})\nVALUES ({vals});\n")

        fh.write("\nCOMMIT;\n")
    print(f"  → {path}")


# ──────────────────────────────────────────────────────────────
# 9.  MAIN
# ──────────────────────────────────────────────────────────────
def main():
    print("═" * 60)
    print(" Purchase Orders Synthetic Data Generator")
    print("═" * 60)

    check_dependencies()

    print("\n[1/5] Loading dependency files …")
    suppliers   = load_supplier_profiles()
    price_hist  = load_price_history()
    staffs      = load_staffs()
    branches    = load_branches()
    if branches is None:
        branches = derive_branches(staffs)
        print("  Branches derived from staffs.csv (branches.csv empty / missing columns)")
    else:
        print(f"  Branches loaded: {len(branches)}")
    print(f"  Suppliers : {len(suppliers)}")
    print(f"  Items     : {len(price_hist)}")
    print(f"  Staff     : {len(staffs)}")

    print("\n[2/5] Building look-ups …")
    item_cats = build_item_categories(price_hist)

    print("\n[3/5] Generating Purchase Orders …")
    pos, pois = generate(suppliers, price_hist, staffs, branches, item_cats)

    print("\n[4/5] Validating …")
    status_cnt = Counter(p['Status'] for p in pos)
    print(f"  Purchase Orders     : {len(pos)}")
    print(f"  Purchase Order Items: {len(pois)}")
    print(f"  Status distribution : {dict(status_cnt)}")

    if len(pos) < 300:
        print(f"  ⚠ Generated {len(pos)} POs – below target 320 (some dates skipped)")

    # --- chronological order check ---
    dates = [p['OrderDate'] for p in pos]
    if dates != sorted(dates):
        print("  ✗ PO IDs are NOT in chronological order!"); sys.exit(1)
    print(f"  ✓ Chronological order confirmed: "
          f"{pos[0]['PurchaseOrderID']}={pos[0]['OrderDate'].date()} → "
          f"{pos[-1]['PurchaseOrderID']}={pos[-1]['OrderDate'].date()}")

    # --- FK integrity ---
    sup_ids = set(suppliers.keys())
    staff_ids = {s['StaffID'] for s in staffs}
    bad_sup = [p['PurchaseOrderID'] for p in pos if p['SupplierID'] not in sup_ids]
    bad_stf = [p['PurchaseOrderID'] for p in pos if p['StaffID'] not in staff_ids]
    if bad_sup:
        print(f"  ✗ FK violation – unknown SupplierID in POs: {bad_sup[:5]}…"); sys.exit(1)
    if bad_stf:
        print(f"  ✗ FK violation – unknown StaffID in POs: {bad_stf[:5]}…"); sys.exit(1)

    # --- DDL constraint spot-checks ---
    for p in pos:
        if p['ExpectedDeliveryDate'] and p['ExpectedDeliveryDate'] < p['OrderDate']:
            print(f"  ✗ CK_PO_Expected_Date violated: {p['PurchaseOrderID']}"); sys.exit(1)
        if p['ReceivedDate'] and p['ReceivedDate'] < p['OrderDate']:
            print(f"  ✗ CK_PO_Received_Date violated: {p['PurchaseOrderID']}"); sys.exit(1)
        if p['TotalAmount'] < 0:
            print(f"  ✗ CK_Purchase_Order_Total violated: {p['PurchaseOrderID']}"); sys.exit(1)

    for it in pois:
        if it['QuantityOrdered'] <= 0:
            print(f"  ✗ CK_PO_Items_QtyOrdered violated: {it['PurchaseOrderID']}"); sys.exit(1)
        if it['QuantityReceived'] < 0 or it['QuantityReceived'] > it['QuantityOrdered']:
            print(f"  ✗ CK_PO_Items_QtyReceived violated: {it['PurchaseOrderID']}"); sys.exit(1)
        expected_lt = round(it['QuantityOrdered'] * it['UnitCost'], 2)
        if abs(it['LineTotal'] - expected_lt) > 0.01:
            print(f"  ✗ CK_PO_Items_LineTotal violated: {it['PurchaseOrderID']} "
                  f"({it['LineTotal']} ≠ {expected_lt})"); sys.exit(1)

    for p in pos:
        if p['Status'] in ('PENDING', 'APPROVED'):
            if not (p['OrderDate'].year == 2026 and p['OrderDate'].month >= 5):
                print(f"  ✗ PENDING/APPROVED outside May-Jun 2026: {p['PurchaseOrderID']}"); sys.exit(1)
        if p['Status'] in ('PENDING', 'APPROVED', 'CANCELLED'):
            if p['ReceivedDate'] is not None:
                print(f"  ✗ Non-RECEIVED PO has ReceivedDate: {p['PurchaseOrderID']}"); sys.exit(1)
        if p['Status'] == 'RECEIVED' and p['ReceivedDate'] is None:
            print(f"  ✗ RECEIVED PO missing ReceivedDate: {p['PurchaseOrderID']}"); sys.exit(1)

    lt_sum = defaultdict(float)
    for it in pois:
        lt_sum[it['PurchaseOrderID']] += it['LineTotal']
    for p in pos:
        if abs(p['TotalAmount'] - round(lt_sum[p['PurchaseOrderID']], 2)) > 0.02:
            print(f"  ✗ TotalAmount mismatch: {p['PurchaseOrderID']}"); sys.exit(1)

    po_item_check = defaultdict(list)
    for it in pois:
        po_item_check[it['PurchaseOrderID']].append(it['ItemID'])
    for pid, iids in po_item_check.items():
        if len(iids) != len(set(iids)):
            print(f"  ✗ Duplicate item in PO: {pid}"); sys.exit(1)

    print("  ✓ All validations passed")

    print("\n[5/5] Exporting files …")
    write_csv('purchase_orders.csv', pos, PO_COLS)
    write_csv('purchase_order_items.csv', pois, PI_COLS)
    write_sql('insert_purchase_orders.sql', pos, pois)

    print("\n" + "═" * 60)
    print(" Done.")
    print("═" * 60)


if __name__ == '__main__':
    main()