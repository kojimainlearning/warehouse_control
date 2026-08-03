#!/usr/bin/env python3
"""
Generate synthetic Purchase_Orders and Purchase_Order_Items based on actual sales depletion.
Period : 1 Jan 2020 – 30 Jun 2026
Snapshot: 30 Jun 2026
Seed   : 3183

Dependencies:
  - suppliers_inserts.sql
  - product_category_inserts.sql
  - item_inserts.sql
  - product_related_data.sql (for Stocks)
  - branchs_and_staffs.sql (for Staffs & Branches)
  - orders_output.csv
  - ordered_items_output.csv
"""

import re
import csv
import os
import sys
import random
from datetime import datetime, timedelta
from collections import defaultdict, Counter

# ──────────────────────────────────────────────────────────────
# 0. SEED & CONSTANTS
# ──────────────────────────────────────────────────────────────
random.seed(3183)

SNAPSHOT = datetime(2026, 6, 30)
PERIOD_START = datetime(2020, 1, 1)

REQUIRED_FILES = [
    'ShengJie/suppliers_inserts.sql',
    'WanJin/product_category_inserts.sql',
    'WanJin/item_inserts.sql',
    'WanJin/product_related_data.sql',
    'WanJin/branchs_and_staffs.sql',
    'metadata/orders_output.csv',
    'metadata/ordered_items_output.csv'
]

# Category cost-margin ratios (cost = UnitPrice * ratio)
# Necessities: high ratio (low margin), Premium/Imported: low ratio (high margin)
CATEGORY_COST_RATIO = {
    'PC001': (0.85, 0.92),  # Rice & Grains – necessity
    'PC002': (0.82, 0.90),  # Cooking Essentials – necessity
    'PC003': (0.83, 0.91),  # Canned & Packaged Food
    'PC004': (0.72, 0.82),  # Beverages
    'PC005': (0.70, 0.80),  # Snacks & Confectionery
    'PC006': (0.84, 0.92),  # Household & Cleaning – necessity
    'PC007': (0.72, 0.83),  # Frozen Foods
    'PC008': (0.85, 0.93),  # Personal Care
    'PC009': (0.70, 0.82),  # Baby & Infant – necessity
    'PC010': (0.84, 0.92),  # Pet Supplies
    'PC011': (0.82, 0.90),  # Health & Wellness
    'PC012': (0.80, 0.88),  # Stationery & Office
    'PC013': (0.55, 0.68),  # Imported / Premium
    'PC014': (0.55, 0.68),  # Organic / Specialty
    'PC015': (0.58, 0.70),  # Electronics / Gadgets
    'PC016': (0.60, 0.72),  # Seasonal / Festive
}

# ──────────────────────────────────────────────────────────────
# 1. DEPENDENCY CHECK
# ──────────────────────────────────────────────────────────────
def check_dependencies():
    missing = [f for f in REQUIRED_FILES if not os.path.isfile(f)]
    if missing:
        print(f"FATAL: Missing dependency files: {', '.join(missing)}")
        print("Script stopped – will not invent unrelated information.")
        sys.exit(1)
    print("✓ All required dependency files found.")

# ──────────────────────────────────────────────────────────────
# 2. ROBUST SQL PARSER
# ──────────────────────────────────────────────────────────────
def parse_sql_inserts(filepath, table_name):
    records = []
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    pattern = re.compile(
        r"INSERT\s+INTO\s+" + re.escape(table_name) +
        r"\s*\(([^)]+)\)\s*VALUES\s*\((.+?)\)\s*;",
        re.IGNORECASE | re.DOTALL
    )

    for match in pattern.finditer(content):
        cols_str = match.group(1)
        vals_str = match.group(2)

        cols = [c.strip().strip('"').strip("'").strip() for c in cols_str.split(',')]
        vals = _split_sql_values(vals_str)

        if len(cols) != len(vals):
            continue

        row = {}
        for c, v in zip(cols, vals):
            row[c] = _clean_sql_value(v)
        records.append(row)

    return records

def _split_sql_values(vals_str):
    values = []
    current = ""
    depth = 0
    in_quote = False
    i = 0
    while i < len(vals_str):
        ch = vals_str[i]

        if ch == "'" and not in_quote:
            in_quote = True
            current += ch
        elif ch == "'" and in_quote:
            if i + 1 < len(vals_str) and vals_str[i + 1] == "'":
                current += "''"
                i += 2
                continue
            else:
                in_quote = False
                current += ch
        elif not in_quote:
            if ch == '(':
                depth += 1
                current += ch
            elif ch == ')':
                depth -= 1
                current += ch
            elif ch == ',' and depth == 0:
                values.append(current.strip())
                current = ""
            else:
                current += ch
        else:
            current += ch
        i += 1

    if current.strip():
        values.append(current.strip())
    return values

def _clean_sql_value(v):
    if v is None: return None
    v = v.strip()
    if v.upper() == 'NULL': return None
    if v.startswith("'") and v.endswith("'"):
        return v[1:-1].replace("''", "'")
    m = re.match(r"TO_DATE\(\s*'([^']+)'\s*,\s*'([^']+)'\s*\)", v, re.IGNORECASE)
    if m: return m.group(1)
    m = re.match(r"TO_TIMESTAMP\(\s*'([^']+)'\s*,\s*'([^']+)'\s*\)", v, re.IGNORECASE)
    if m: return m.group(1)
    try:
        if '.' in v: return float(v)
        return int(v)
    except ValueError:
        pass
    return v

# ──────────────────────────────────────────────────────────────
# 3. HELPERS
# ──────────────────────────────────────────────────────────────
def parse_date_safe(s):
    if s is None: return None
    s = str(s).strip()
    if not s or s.upper() == 'NULL': return None
    for fmt in ('%Y-%m-%d %H:%M:%S', '%Y-%m-%d', '%d/%m/%Y'):
        try: return datetime.strptime(s, fmt)
        except ValueError: continue
    return None

def escape_sql(val):
    if val is None: return "NULL"
    if isinstance(val, datetime): return f"TO_DATE('{val.strftime('%Y-%m-%d')}', 'YYYY-MM-DD')"
    if isinstance(val, (int, float)): return str(val)
    return "'" + str(val).replace("'", "''") + "'"

# ──────────────────────────────────────────────────────────────
# 4. DATA LOADERS
# ──────────────────────────────────────────────────────────────
def load_all_data():
    print("\n[1/4] Loading dependency files...")

    suppliers_raw = parse_sql_inserts('ShengJie/suppliers_inserts.sql', 'Suppliers')
    if not suppliers_raw: suppliers_raw = parse_sql_inserts('suppliers_inserts.sql', 'SUPPLIERS')
    print(f"  Suppliers loaded: {len(suppliers_raw)}")
    if not suppliers_raw: print("FATAL: Could not parse any Suppliers"); sys.exit(1)

    profile_assign = (['Excellent'] * 3 + ['Good'] * 4 + ['Mediocre'] * 4 + ['Inactive'] * 1)
    lead_days_map = {'Excellent': 3, 'Good': 5, 'Mediocre': 8, 'Inactive': 12}

    suppliers = []
    for i, s in enumerate(suppliers_raw):
        prof = profile_assign[i] if i < len(profile_assign) else 'Mediocre'
        sup = {
            'SupplierID': str(s.get('SupplierID', s.get('SUPPLIERID', ''))).strip(),
            'SupplierName': str(s.get('SupplierName', s.get('SUPPLIERNAME', ''))).strip(),
            'Status': str(s.get('Status', s.get('STATUS', 'ACTIVE'))).strip(),
            'Profile': prof,
            'LeadDays': lead_days_map[prof],
            'Categories': [],
            'InactiveDate': datetime(2022, 6, 30) if prof == 'Inactive' else None,
        }
        suppliers.append(sup)

    cats_raw = parse_sql_inserts('WanJin/product_category_inserts.sql', 'Product_Categories')
    if not cats_raw: cats_raw = parse_sql_inserts('product_category_inserts.sql', 'PRODUCT_CATEGORIES')
    print(f"  Categories loaded: {len(cats_raw)}")
    if not cats_raw: print("FATAL: Could not parse Product_Categories"); sys.exit(1)

    all_cat_ids = [str(c.get('CategoryID', c.get('CATEGORYID', ''))).strip() for c in cats_raw if str(c.get('CategoryID', c.get('CATEGORYID', ''))).strip()]
    
    random.shuffle(all_cat_ids)
    cat_idx = 0
    for sup in suppliers:
        n = 2 if sup['Profile'] == 'Inactive' else random.randint(3, 5)
        for _ in range(n):
            sup['Categories'].append(all_cat_ids[cat_idx % len(all_cat_ids)])
            cat_idx += 1

    items_raw = parse_sql_inserts('WanJin/item_inserts.sql', 'Items')
    if not items_raw: items_raw = parse_sql_inserts('item_inserts.sql', 'ITEMS')
    print(f"  Items loaded: {len(items_raw)}")
    if not items_raw: print("FATAL: Could not parse Items"); sys.exit(1)

    items = {}
    for it in items_raw:
        iid = str(it.get('ItemID', it.get('ITEMID', ''))).strip()
        cid = str(it.get('CategoryID', it.get('CATEGORYID', ''))).strip()
        price = it.get('UnitPrice', it.get('UNITPRICE', 10.0))
        try: price = float(price)
        except (ValueError, TypeError): price = 10.0
        if iid: items[iid] = {'CategoryID': cid, 'UnitPrice': price}

    stocks_raw = parse_sql_inserts('WanJin/product_related_data.sql', 'Stocks')
    if not stocks_raw: stocks_raw = parse_sql_inserts('product_related_data.sql', 'STOCKS')
    print(f"  Stocks loaded: {len(stocks_raw)}")
    if not stocks_raw: print("FATAL: Could not parse Stocks"); sys.exit(1)

    stocks = {}
    for st in stocks_raw:
        bid = str(st.get('BranchID', st.get('BRANCHID', ''))).strip()
        iid = str(st.get('ItemID', st.get('ITEMID', ''))).strip()
        qoh = int(st.get('QuantityOnHand', st.get('QUANTITYONHAND', 0)))
        rol = int(st.get('ReorderLevel', st.get('REORDERLEVEL', 10)))
        roq = int(st.get('ReorderQuantity', st.get('REORDERQUANTITY', 50)))
        if bid and iid:
            stocks[(bid, iid)] = {
                'QuantityOnHand': qoh, 'ReorderLevel': rol, 'ReorderQuantity': roq,
                'AvgDailySales': 0.0, 'LastSaleDate': None,
            }

    branches_raw = parse_sql_inserts('WanJin/branchs_and_staffs.sql', 'Branches')
    if not branches_raw: branches_raw = parse_sql_inserts('branchs_and_staffs.sql', 'BRANCHES')
    print(f"  Branches loaded: {len(branches_raw)}")

    branches = {}
    for b in branches_raw:
        bid = str(b.get('BranchID', b.get('BRANCHID', ''))).strip()
        if bid:
            branches[bid] = {
                'OpeningDate': parse_date_safe(b.get('OpeningDate', b.get('OPENINGDATE'))),
                'ClosingDate': parse_date_safe(b.get('ClosingDate', b.get('CLOSINGDATE'))),
                'Status': str(b.get('Status', b.get('STATUS', 'ACTIVE'))).strip(),
            }

    if 'B012' in branches:
        branches['B012']['ClosingDate'] = datetime(2025, 9, 1)
        branches['B012']['Status'] = 'CLOSED'
    else:
        branches['B012'] = {'OpeningDate': datetime(2020, 1, 1), 'ClosingDate': datetime(2025, 9, 1), 'Status': 'CLOSED'}

    staffs_raw = parse_sql_inserts('WanJin/branchs_and_staffs.sql', 'Staffs')
    if not staffs_raw: staffs_raw = parse_sql_inserts('branchs_and_staffs.sql', 'STAFFS')
    print(f"  Staffs loaded: {len(staffs_raw)}")
    if not staffs_raw: print("FATAL: Could not parse Staffs"); sys.exit(1)

    staffs = []
    for s in staffs_raw:
        sid = str(s.get('StaffID', s.get('STAFFID', ''))).strip()
        role = str(s.get('Role', s.get('ROLE', ''))).strip().upper()
        bid = str(s.get('BranchID', s.get('BRANCHID', ''))).strip()
        hire = parse_date_safe(s.get('HireDate', s.get('HIREDATE')))
        resign = parse_date_safe(s.get('ResignedDate', s.get('RESIGNEDDATE')))
        status = str(s.get('Status', s.get('STATUS', 'ACTIVE'))).strip().upper()
        if sid:
            staffs.append({'StaffID': sid, 'Role': role, 'BranchID': bid, 'HireDate': hire, 'ResignedDate': resign, 'Status': status})

    for s in staffs:
        if s['BranchID'] == 'B012' and s['Role'] in ('MANAGER', 'STOCK_STAFF'):
            s['ResignedDate'] = datetime(2025, 8, 15)
            s['Status'] = 'INACTIVE'

    if not branches:
        for s in staffs:
            bid = s['BranchID']
            if bid not in branches:
                branches[bid] = {'OpeningDate': s['HireDate'], 'ClosingDate': None, 'Status': 'ACTIVE'}

    print("  Loading orders_output.csv...")
    orders_map = {}
    with open('metadata/orders_output.csv', 'r', encoding='utf-8-sig') as f:
        first_line = f.readline().strip()
        f.seek(0)
        if first_line.startswith('O') and ',' in first_line and 'OrderID' not in first_line:
            reader = csv.reader(f)
            for row in reader:
                if len(row) >= 9:
                    oid = row[0].strip()
                    orders_map[oid] = {'OrderDateTime': parse_date_safe(row[2]), 'BranchID': row[8].strip()}
        else:
            reader = csv.DictReader(f)
            for row in reader:
                oid = row.get('OrderID', '').strip()
                if oid: orders_map[oid] = {'OrderDateTime': parse_date_safe(row.get('OrderDateTime', '')), 'BranchID': row.get('BranchID', '').strip()}
    print(f"  Orders loaded: {len(orders_map)}")

    print("  Loading ordered_items_output.csv...")
    sales = []
    with open('metadata/ordered_items_output.csv', 'r', encoding='utf-8-sig') as f:
        first_line = f.readline().strip()
        f.seek(0)
        if first_line.startswith('O') and ',' in first_line and 'OrderID' not in first_line:
            reader = csv.reader(f)
            for row in reader:
                if len(row) >= 3:
                    oid = row[0].strip()
                    if oid in orders_map and orders_map[oid]['OrderDateTime']:
                        sales.append({'OrderID': oid, 'ItemID': row[1].strip(), 'Quantity': int(row[2]), 'DateTime': orders_map[oid]['OrderDateTime'], 'BranchID': orders_map[oid]['BranchID']})
        else:
            reader = csv.DictReader(f)
            for row in reader:
                oid = row.get('OrderID', '').strip()
                if oid in orders_map and orders_map[oid]['OrderDateTime']:
                    sales.append({'OrderID': oid, 'ItemID': row.get('ItemID', '').strip(), 'Quantity': int(row.get('Quantity', 1)), 'DateTime': orders_map[oid]['OrderDateTime'], 'BranchID': orders_map[oid]['BranchID']})

    sales.sort(key=lambda x: x['DateTime'])
    print(f"  Sales events loaded: {len(sales)}")

    return suppliers, items, stocks, staffs, branches, sales, all_cat_ids

# ──────────────────────────────────────────────────────────────
# 5. SIMULATION ENGINE
# ──────────────────────────────────────────────────────────────
def run_simulation(suppliers, items, stocks, staffs, branches, sales):
    print("\n[2/4] Running inventory depletion simulation...")

    purchase_orders = []
    po_items_all = []
    pending_keys = set()
    daily_triggers = defaultdict(set)
    stats = {'standard': 0, 'early': 0, 'b012_final': 0, 'skipped': 0}

    def get_eligible_staff(branch_id, dt):
        return [s for s in staffs if s['BranchID'] == branch_id and s['Role'] in ('MANAGER', 'STOCK_STAFF')
                and s['HireDate'] and s['HireDate'] <= dt 
                and (s['ResignedDate'] is None or s['ResignedDate'] > dt)]

    def get_supplier_for_category(cat_id, dt):
        eligible = [s for s in suppliers if cat_id in s['Categories'] and (s['InactiveDate'] is None or s['InactiveDate'] > dt) and s['Status'] != 'INACTIVE']
        if not eligible: eligible = [s for s in suppliers if (s['InactiveDate'] is None or s['InactiveDate'] > dt) and s['Status'] != 'INACTIVE']
        if not eligible: return None
        weights = {'Excellent': 5, 'Good': 3, 'Mediocre': 1.5, 'Inactive': 0.1}
        return random.choices(eligible, weights=[weights.get(s['Profile'], 1) for s in eligible], k=1)[0]

    def should_reorder(branch_id, item_id, dt):
        key = (branch_id, item_id)
        if key not in stocks or key in pending_keys: return False
        st = stocks[key]
        cat = items.get(item_id, {}).get('CategoryID', '')
        sup = get_supplier_for_category(cat, dt)
        if not sup: return False
        lead = sup['LeadDays']

        if st['QuantityOnHand'] <= st['ReorderLevel']:
            stats['standard'] += 1
            return True
        if st['AvgDailySales'] > 0 and (st['QuantityOnHand'] / st['AvgDailySales']) < (lead + 3):
            stats['early'] += 1
            return True
        if branch_id == 'B012' and dt >= datetime(2025, 7, 15):
            resign_dt = datetime(2025, 8, 15)
            if dt < resign_dt:
                days_left = (resign_dt - dt).days
                if st['AvgDailySales'] > 0 and (st['QuantityOnHand'] / st['AvgDailySales']) < days_left:
                    stats['b012_final'] += 1
                    return True
        return False

    def process_daily_triggers(date):
        if date not in daily_triggers: return
        
        branch_triggers = defaultdict(list)
        for (b, i) in daily_triggers[date]:
            branch_triggers[b].append(i)
            
        for branch_id, triggered_items in branch_triggers.items():
            br = branches.get(branch_id)
            if br:
                if br['OpeningDate'] and date < br['OpeningDate'].date(): continue
                if br['ClosingDate'] and date >= br['ClosingDate'].date(): continue
                if br['Status'] in ('CLOSED', 'INACTIVE'): continue
                
            dt = datetime.combine(date, datetime.min.time())
            staff_pool = get_eligible_staff(branch_id, dt)
            if not staff_pool:
                stats['skipped'] += len(triggered_items)
                continue
                
            bundled = set()
            
            for trigger_item in triggered_items:
                if (branch_id, trigger_item) in pending_keys or trigger_item in bundled:
                    continue
                    
                cat = items.get(trigger_item, {}).get('CategoryID', '')
                sup = get_supplier_for_category(cat, dt)
                if not sup: continue
                
                # Start bundle with the triggered item
                bundle = [trigger_item]
                bundled.add(trigger_item)
                pending_keys.add((branch_id, trigger_item))
                
                # Find other items from this supplier in this branch to reach 2-6 items
                candidates = []
                for (b, i), st in stocks.items():
                    if b != branch_id or i == trigger_item: continue
                    if (b, i) in pending_keys: continue
                    item_cat = items.get(i, {}).get('CategoryID', '')
                    if item_cat in sup['Categories']:
                        rol = st['ReorderLevel'] if st['ReorderLevel'] > 0 else 1
                        ratio = st['QuantityOnHand'] / rol
                        candidates.append((i, ratio))
                        
                candidates.sort(key=lambda x: x[1]) # Lowest ratio = closest to needing reorder
                target_size = random.randint(2, 6)
                needed = target_size - 1
                
                for i, ratio in candidates[:needed]:
                    bundle.append(i)
                    bundled.add(i)
                    pending_keys.add((branch_id, i))
                    
                staff = random.choice(staff_pool)
                create_purchase_order(date, branch_id, staff, sup, bundle)

    def create_purchase_order(date, branch_id, staff, sup, item_ids):
        lead = sup['LeadDays']
        order_dt = datetime.combine(date, datetime.min.time())
        exp_del = order_dt + timedelta(days=lead)

        if date.year == 2026 and date.month == 6:
            status = random.choices(['RECEIVED', 'CANCELLED', 'APPROVED', 'PENDING'], weights=[94, 2, 2, 2], k=1)[0]
        else:
            status = random.choices(['RECEIVED', 'CANCELLED'], weights=[98, 2], k=1)[0]

        recv_dt = None
        if status == 'RECEIVED':
            profile = sup['Profile']
            if profile == 'Excellent': delta = random.randint(-2, 1)
            elif profile == 'Good': delta = random.randint(-1, 3)
            elif profile == 'Mediocre': delta = random.randint(1, 6)
            else: delta = random.randint(2, 8)
            recv_dt = order_dt + timedelta(days=max(1, lead + delta))
            if recv_dt > SNAPSHOT: recv_dt = SNAPSHOT

        total_amt = 0.0
        lines = []
        for item_id in item_ids:
            item_info = items.get(item_id)
            if not item_info: continue
            cat = item_info['CategoryID']
            base_price = item_info['UnitPrice']

            lo, hi = CATEGORY_COST_RATIO.get(cat, (0.75, 0.88))
            ratio = random.uniform(lo, hi)
            years_elapsed = (order_dt - datetime(2020, 1, 1)).days / 365.0
            inflation = 1.0 + (0.02 * years_elapsed)
            if sup['Profile'] == 'Excellent': ratio += 0.02
            elif sup['Profile'] == 'Mediocre': ratio -= 0.02
            ratio = max(0.50, min(0.95, ratio))
            unit_cost = round(base_price * ratio * inflation, 2)

            key = (branch_id, item_id)
            qty_ordered = stocks[key]['ReorderQuantity'] if key in stocks else 50
            qty_received = qty_ordered if status == 'RECEIVED' else 0
            line_total = round(qty_ordered * unit_cost, 2)

            lines.append({'ItemID': item_id, 'QuantityOrdered': qty_ordered, 'QuantityReceived': qty_received, 'UnitCost': unit_cost, 'LineTotal': line_total})
            total_amt += line_total

        if not lines: return
        total_amt = round(total_amt, 2)
        temp_id = f"TMP_{date.strftime('%Y%m%d')}_{len(purchase_orders):06d}"

        # Update simulation memory to prevent immediate re-triggering
        for item_id in item_ids:
            key = (branch_id, item_id)
            if key in stocks:
                stocks[key]['QuantityOnHand'] += stocks[key]['ReorderQuantity']
            pending_keys.discard(key)

        purchase_orders.append({
            'PurchaseOrderID': temp_id, 'OrderDate': order_dt,
            'ExpectedDeliveryDate': exp_del if status != 'PENDING' else None,
            'ReceivedDate': recv_dt, 'TotalAmount': total_amt,
            'Status': status, 'SupplierID': sup['SupplierID'], 'StaffID': staff['StaffID'],
        })
        for ln in lines:
            po_items_all.append({'PurchaseOrderID': temp_id, **ln})

    current_date = None
    processed = 0
    for sale in sales:
        dt = sale['DateTime']
        if not dt: continue
        branch = sale['BranchID']
        item = sale['ItemID']
        qty = sale['Quantity']
        sale_date = dt.date()

        if current_date is not None and sale_date != current_date:
            process_daily_triggers(current_date)
        current_date = sale_date

        key = (branch, item)
        if key in stocks:
            stocks[key]['QuantityOnHand'] = max(0, stocks[key]['QuantityOnHand'] - qty)
            if stocks[key]['LastSaleDate']:
                days_elapsed = max(1, (sale_date - stocks[key]['LastSaleDate']).days)
                stocks[key]['AvgDailySales'] = (stocks[key]['AvgDailySales'] * 0.85) + ((qty / max(1, days_elapsed)) * 0.15)
            else:
                stocks[key]['AvgDailySales'] = float(qty)
            stocks[key]['LastSaleDate'] = sale_date

        if should_reorder(branch, item, dt):
            daily_triggers[sale_date].add((branch, item))

        processed += 1
        if processed % 50000 == 0:
            print(f"    ... processed {processed} sales events, {len(purchase_orders)} POs generated so far")

    if current_date: process_daily_triggers(current_date)

    print(f"  Simulation complete: {len(purchase_orders)} POs, {len(po_items_all)} line items generated.")
    return purchase_orders, po_items_all, stats

# ──────────────────────────────────────────────────────────────
# 6. POST-PROCESSING & EXPORT
# ──────────────────────────────────────────────────────────────
def finalize_and_export(purchase_orders, po_items_all, stats):
    print("\n[3/4] Finalizing and exporting...")
    if not purchase_orders:
        print("WARNING: No purchase orders generated."); return

    purchase_orders.sort(key=lambda x: x['OrderDate'])
    id_map = {}
    for i, po in enumerate(purchase_orders, 1):
        old_id = po['PurchaseOrderID']
        new_id = f"PO{i:04d}"
        id_map[old_id] = new_id
        po['PurchaseOrderID'] = new_id

    for poi in po_items_all:
        poi['PurchaseOrderID'] = id_map[poi['PurchaseOrderID']]

    po_cols = ['PurchaseOrderID', 'OrderDate', 'ExpectedDeliveryDate', 'ReceivedDate', 'TotalAmount', 'Status', 'SupplierID', 'StaffID']
    pi_cols = ['PurchaseOrderID', 'ItemID', 'QuantityOrdered', 'QuantityReceived', 'UnitCost', 'LineTotal']

    sql_po_path = 'insert_purchase_orders.sql'
    with open(sql_po_path, 'w', encoding='utf-8') as f:
        f.write("-- ==========================================================\n")
        f.write("-- Synthetic Purchase_Orders\n")
        f.write(f"-- Period: {PERIOD_START.date()} to {SNAPSHOT.date()}\n")
        f.write("-- ==========================================================\n\n")
        for r in purchase_orders:
            cols = ', '.join(po_cols)
            vals = ', '.join(escape_sql(r[c]) for c in po_cols)
            f.write(f"INSERT INTO Purchase_Orders ({cols})\nVALUES ({vals});\n")
        f.write("\nCOMMIT;\n")
    print(f"  → {sql_po_path} ({len(purchase_orders)} POs)")

    sql_pi_path = 'insert_purchase_order_items.sql'
    with open(sql_pi_path, 'w', encoding='utf-8') as f:
        f.write("-- ==========================================================\n")
        f.write("-- Synthetic Purchase_Order_Items\n")
        f.write(f"-- Period: {PERIOD_START.date()} to {SNAPSHOT.date()}\n")
        f.write("-- ==========================================================\n\n")
        for r in po_items_all:
            cols = ', '.join(pi_cols)
            vals = ', '.join(escape_sql(r[c]) for c in pi_cols)
            f.write(f"INSERT INTO Purchase_Order_Items ({cols})\nVALUES ({vals});\n")
        f.write("\nCOMMIT;\n")
    print(f"  → {sql_pi_path} ({len(po_items_all)} items)")

    status_cnt = Counter(p['Status'] for p in purchase_orders)
    avg_items = len(po_items_all) / len(purchase_orders) if purchase_orders else 0
    year_cnt = Counter(p['OrderDate'].year for p in purchase_orders)

    summary_path = 'po_generation_summary.txt'
    with open(summary_path, 'w', encoding='utf-8') as f:
        f.write("=" * 60 + "\n  PURCHASE ORDER GENERATION SUMMARY\n" + "=" * 60 + "\n\n")
        f.write(f"Operating Period     : {PERIOD_START.date()} to {SNAPSHOT.date()}\n")
        f.write(f"Total Purchase Orders: {len(purchase_orders)}\n")
        f.write(f"Total Line Items     : {len(po_items_all)}\n")
        f.write(f"Avg Items per PO     : {avg_items:.2f}\n\n")
        f.write("── Status Distribution ──\n")
        for s in ['RECEIVED', 'CANCELLED', 'APPROVED', 'PENDING']:
            cnt = status_cnt.get(s, 0)
            pct = (cnt / len(purchase_orders) * 100) if purchase_orders else 0
            f.write(f"  {s:10s}: {cnt:5d}  ({pct:.1f}%)\n")
        f.write("\n── Yearly Distribution ──\n")
        for yr in sorted(year_cnt.keys()): f.write(f"  {yr}: {year_cnt[yr]} POs\n")
        f.write("\n── Reorder Triggers ──\n")
        f.write(f"  Standard (QtyOnHand <= ReorderLevel) : {stats['standard']}\n")
        f.write(f"  Early (projected stockout before PO) : {stats['early']}\n")
        f.write(f"  B012 final pre-closure reorders      : {stats['b012_final']}\n")
        f.write("\n── Trend Patterns & Design Decisions ──\n")
        f.write("  • Every PO contains 2 to 6 items from a SINGLE supplier.\n")
        f.write("  • Items are bundled by pulling in other products from the same\n")
        f.write("    supplier with the lowest stock-to-reorder ratios to optimize shipping.\n")
        f.write("  • PO IDs are strictly chronological (PO0001 = earliest).\n")
        f.write("  • PENDING / APPROVED statuses appear ONLY in June 2026.\n")
        f.write("  • B012 branch closes 2025-09-01; staff resign 2025-08-15.\n")
        f.write("  • Unit costs include 2% annual inflation.\n")
        f.write("  • Necessities carry LOW margins; Premium items carry HIGH margins.\n")
    print(f"  → {summary_path}")

# ──────────────────────────────────────────────────────────────
# 7. MAIN
# ──────────────────────────────────────────────────────────────
def main():
    print("═" * 60)
    print(" Sales-Driven Purchase Order Generator")
    print("═" * 60)
    check_dependencies()
    suppliers, items, stocks, staffs, branches, sales, all_cat_ids = load_all_data()
    if not sales or not stocks:
        print("\nFATAL: Missing sales or stock data."); sys.exit(1)
        
    purchase_orders, po_items_all, stats = run_simulation(suppliers, items, stocks, staffs, branches, sales)
    if not purchase_orders:
        print("\nWARNING: 0 purchase orders generated."); sys.exit(1)
        
    finalize_and_export(purchase_orders, po_items_all, stats)
    print("\n" + "═" * 60 + "\n DONE.\n" + "═" * 60)

if __name__ == '__main__':
    main()