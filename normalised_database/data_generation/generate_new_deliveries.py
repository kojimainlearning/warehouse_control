#!/usr/bin/env python3
"""
Generate synthetic Deliveries data based on order_inserts.sql and delivery_companies_inserts.sql.
Period: 1 Jan 2020 – 30 Jun 2026
Snapshot: 30 Jun 2026
Seed: 3183
"""

import re
import os
import sys
import random
from datetime import datetime, timedelta

# ──────────────────────────────────────────────────────────────
# 0. SEED & CONSTANTS
# ──────────────────────────────────────────────────────────────
random.seed(3183)

REQUIRED_FILES = ['ZhenHao/order_inserts.sql', 'ShengJie/delivery_companies_inserts.sql']
for f in REQUIRED_FILES:
    if not os.path.isfile(f):
        print(f"FATAL: Missing dependency file: {f}")
        print("Script stopped – will not invent unrelated information.")
        sys.exit(1)

# Regions mapping (PostCode ranges based on Malaysian regions)
REGIONS = {
    "Kuala Lumpur": {"cities": ["Kuala Lumpur", "KLCC", "Cheras", "Kepong"], "pc_range": (50000, 59999)},
    "Selangor": {"cities": ["Shah Alam", "Petaling Jaya", "Subang Jaya", "Klang", "Ampang"], "pc_range": (40000, 49999)},
    "Penang": {"cities": ["George Town", "Bayan Lepas", "Butterworth"], "pc_range": (10000, 14999)},
    "Perak": {"cities": ["Ipoh", "Taiping", "Manjung"], "pc_range": (30000, 39999)},
    "Negeri Sembilan": {"cities": ["Seremban", "Port Dickson", "Nilai"], "pc_range": (70000, 73999)},
    "Melaka": {"cities": ["Melaka City", "Ayer Keroh", "Alor Gajah"], "pc_range": (75000, 78999)},
    "Johor": {"cities": ["Johor Bahru", "Iskandar Puteri", "Kluang"], "pc_range": (79000, 86999)},
    "Pahang": {"cities": ["Kuantan", "Temerloh", "Bentong"], "pc_range": (25000, 28999)},
    "Terengganu": {"cities": ["Kuala Terengganu", "Chukai", "Dungun"], "pc_range": (20000, 24999)},
    "Kelantan": {"cities": ["Kota Bharu", "Pasir Mas", "Tanah Merah"], "pc_range": (15000, 18999)},
    "Sabah": {"cities": ["Kota Kinabalu", "Sandakan", "Tawau"], "pc_range": (88000, 91999)},
    "Sarawak": {"cities": ["Kuching", "Miri", "Sibu"], "pc_range": (93000, 98999)},
}

# ──────────────────────────────────────────────────────────────
# 1. HELPERS & SQL PARSERS
# ──────────────────────────────────────────────────────────────
def split_sql_values(vals_str):
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

def clean_sql_value(v):
    if v is None: return None
    v = v.strip()
    if v.upper() == 'NULL': return None
    if v.startswith("'") and v.endswith("'"):
        return v[1:-1].replace("''", "'")
    m = re.match(r"TO_TIMESTAMP\(\s*'([^']+)'\s*,\s*'([^']+)'\s*\)", v, re.IGNORECASE)
    if m: return m.group(1)
    m = re.match(r"TO_DATE\(\s*'([^']+)'\s*,\s*'([^']+)'\s*\)", v, re.IGNORECASE)
    if m: return m.group(1)
    try:
        if '.' in v: return float(v)
        return int(v)
    except ValueError:
        pass
    return v

def parse_dt(s):
    if not s: return None
    for fmt in ('%Y-%m-%d %H:%M:%S', '%Y-%m-%d'):
        try: return datetime.strptime(s, fmt)
        except ValueError: continue
    return None

def escape_sql(val):
    if val is None: return "NULL"
    if isinstance(val, datetime):
        return f"TO_TIMESTAMP('{val.strftime('%Y-%m-%d %H:%M:%S')}', 'YYYY-MM-DD HH24:MI:SS')"
    if hasattr(val, 'strftime'): 
        return f"TO_DATE('{val.strftime('%Y-%m-%d')}', 'YYYY-MM-DD')"
    if isinstance(val, (int, float)): return str(val)
    return "'" + str(val).replace("'", "''") + "'"

# ──────────────────────────────────────────────────────────────
# 2. DATA LOADERS
# ──────────────────────────────────────────────────────────────
print("Loading dependency files...")

# Parse Orders
orders = []
with open('ZhenHao/order_inserts.sql', 'r', encoding='utf-8') as f:
    for line in f:
        if not line.strip().upper().startswith('INSERT'):
            continue
        match = re.search(r"VALUES\s*\((.+?)\)\s*;", line, re.IGNORECASE)
        if match:
            vals = [clean_sql_value(v) for v in split_sql_values(match.group(1))]
            if len(vals) >= 18:
                orders.append({
                    'OrderID': vals[0],
                    'FulfillmentType': vals[4],
                    'OrderDateTime': parse_dt(vals[5]),
                    'OrderStatus': vals[6],
                    'SubtotalAmount': float(vals[7]) if vals[7] is not None else 0.0,
                    'VoucherDiscountAmount': float(vals[8]) if vals[8] is not None else 0.0,
                    'MyKasihSubsidyTotal': float(vals[9]) if vals[9] is not None else 0.0,
                    'GrandTotal': float(vals[10]) if vals[10] is not None else 0.0,
                    'PaymentStatus': vals[12],
                    'CustomerID': vals[14],
                    'VoucherID': vals[16]
                })
print(f"Loaded {len(orders)} orders.")

# Parse Delivery Companies
all_companies = []
with open('ShengJie/delivery_companies_inserts.sql', 'r', encoding='utf-8') as f:
    content = f.read()
pattern = re.compile(r"INSERT\s+INTO\s+Delivery_Companies\s*\([^)]+\)\s*VALUES\s*\((.+?)\);", re.IGNORECASE | re.DOTALL)
for match in pattern.finditer(content):
    vals = [clean_sql_value(v) for v in split_sql_values(match.group(1))]
    if len(vals) >= 5:
        all_companies.append({
            'DeliveryCompanyID': vals[0],
            'CompanyName': vals[1],
            'Status': vals[4],
            'InactiveDate': None,
            'Profile': None
        })

# Assign Profiles and Inactive Dates
active_companies = [c for c in all_companies if c['Status'] == 'ACTIVE']
inactive_companies = [c for c in all_companies if c['Status'] == 'INACTIVE']

if len(inactive_companies) >= 2:
    inactive_companies[0]['InactiveDate'] = datetime(2024, 6, 1)
    inactive_companies[1]['InactiveDate'] = datetime(2025, 6, 1)
elif len(inactive_companies) == 1:
    inactive_companies[0]['InactiveDate'] = datetime(2024, 6, 1)

random.shuffle(active_companies)
for i, c in enumerate(active_companies):
    c['Profile'] = 'Premium' if i < 4 else 'Common'

print(f"Loaded {len(all_companies)} delivery companies ({len(active_companies)} active, {len(inactive_companies)} inactive).")

# ──────────────────────────────────────────────────────────────
# 3. GENERATION LOGIC
# ──────────────────────────────────────────────────────────────
print("Generating deliveries...")
deliveries = []
delivery_num = 0
customer_addresses = {}
used_addresses = set()

def get_company_weight(company, order_dt):
    if company['InactiveDate'] and order_dt >= company['InactiveDate']:
        return 0.0
    if company['Status'] == 'INACTIVE' and company['InactiveDate']:
        days_before = (company['InactiveDate'] - order_dt).days
        if days_before > 365: return 3.0
        elif days_before > 180: return 1.0
        elif days_before > 30: return 0.2
        else: return 0.0
    return 5.0 if company['Profile'] == 'Premium' else 3.0

def get_address(customer_id, order_id):
    key = customer_id if customer_id else order_id
    if key not in customer_addresses:
        while True:
            state = random.choice(list(REGIONS.keys()))
            city = random.choice(REGIONS[state]['cities'])
            pc_min, pc_max = REGIONS[state]['pc_range']
            postcode = random.randint(pc_min, pc_max)
            address = f"No. {random.randint(1, 99)}, Jalan {city.split()[0]} {random.randint(1, 50)}"
            full_addr = (address, city, state, postcode)
            if full_addr not in used_addresses:
                used_addresses.add(full_addr)
                break
        customer_addresses[key] = full_addr
    return customer_addresses[key]

for order in orders:
    if order['FulfillmentType'] != 'DELIVERY':
        continue
        
    order_dt = order['OrderDateTime']
    if not order_dt:
        continue
        
    # Filter out failed payments or cancelled before-processing
    if order['PaymentStatus'] == 'FAILED':
        continue
    if order['OrderStatus'] == 'CANCELLED' and order['PaymentStatus'] != 'REFUNDED':
        continue
        
    # Calculate Delivery Fee
    subtotal = order['SubtotalAmount']
    voucher = order['VoucherDiscountAmount']
    mykasih = order['MyKasihSubsidyTotal']
    grand = order['GrandTotal']
    
    if subtotal == grand:
        delivery_fee = voucher
    else:
        delivery_fee = grand - (subtotal - voucher - mykasih)
        if delivery_fee < 0:
            delivery_fee = abs(delivery_fee)
    delivery_fee = round(delivery_fee, 2)
    
    # Select Delivery Company
    weights = [get_company_weight(c, order_dt) for c in all_companies]
    if sum(weights) == 0:
        continue
    company = random.choices(all_companies, weights=weights, k=1)[0]
    
    # Determine Delivery Status
    order_status = order['OrderStatus']
    payment_status = order['PaymentStatus']
    
    if order_status == 'COMPLETED' and payment_status == 'PAID':
        del_status = 'DELIVERED'
    elif order_status == 'OUT_FOR_DELIVERY':
        del_status = 'PICKED_UP'
    elif order_status in ('CANCELLED', 'UNPAID') or payment_status == 'REFUNDED':
        del_status = 'FAILED'
    elif order_dt.year == 2026 and order_dt.month == 6:
        del_status = 'PENDING'
    else:
        del_status = 'DELIVERED'
        
    # Generate Address
    address, city, state, postcode = get_address(order['CustomerID'], order['OrderID'])
    
    # Generate Dates
    sched_date = order_dt.date() + timedelta(days=random.randint(1, 3))
    delivered_dt = None
    
    if del_status == 'DELIVERED':
        year = order_dt.year
        year_mult = {2020: 1.5, 2021: 1.3, 2022: 1.15, 2023: 1.0, 2024: 0.9, 2025: 0.8, 2026: 0.7}.get(year, 1.0)
        
        base_days = 2 if company['Profile'] == 'Premium' else 4
        duration_days = max(1, int(base_days * year_mult))
        
        delta = random.randint(0, duration_days)
        if company['Profile'] == 'Premium':
            delta = random.randint(0, max(1, duration_days - 1))
            
        delivered_dt = order_dt + timedelta(days=delta, hours=random.randint(1, 12))
        if delivered_dt <= order_dt:
            delivered_dt = order_dt + timedelta(hours=1)
            
    # Tracking No & ID
    delivery_num += 1
    tracking_no = f"TRK{delivery_num:08d}"
    delivery_id = f"D{delivery_num:04d}"
    
    deliveries.append({
        'DeliveryID': delivery_id,
        'DeliveryAddress': address,
        'City': city,
        'State': state,
        'PostCode': postcode,
        'TrackingNo': tracking_no,
        'DeliveryFee': delivery_fee,
        'ScheduledDeliveryDate': sched_date,
        'DeliveredDateTime': delivered_dt,
        'Status': del_status,
        'OrderID': order['OrderID'],
        'DeliveryCompanyID': company['DeliveryCompanyID']
    })

print(f"Generated {len(deliveries)} delivery records.")

# ──────────────────────────────────────────────────────────────
# 4. VALIDATION
# ──────────────────────────────────────────────────────────────
print("Running validations...")
order_ids_seen = set()
tracking_nos_seen = set()

for d in deliveries:
    if d['OrderID'] in order_ids_seen:
        print(f"FATAL: Duplicate delivery for order {d['OrderID']}")
        sys.exit(1)
    order_ids_seen.add(d['OrderID'])
    
    if d['TrackingNo'] in tracking_nos_seen:
        print(f"FATAL: Duplicate TrackingNo {d['TrackingNo']}")
        sys.exit(1)
    tracking_nos_seen.add(d['TrackingNo'])
    
    if d['Status'] == 'DELIVERED' and d['DeliveredDateTime'] is None:
        print(f"FATAL: DELIVERED without DeliveredDateTime {d['DeliveryID']}")
        sys.exit(1)
    if d['Status'] != 'DELIVERED' and d['DeliveredDateTime'] is not None:
        print(f"FATAL: Non-DELIVERED with DeliveredDateTime {d['DeliveryID']}")
        sys.exit(1)
        
    state = d['State']
    pc = d['PostCode']
    if state in REGIONS:
        pc_min, pc_max = REGIONS[state]['pc_range']
        if not (pc_min <= pc <= pc_max):
            print(f"FATAL: PostCode {pc} out of range for {state}")
            sys.exit(1)

print("✓ All validations passed.")

# ──────────────────────────────────────────────────────────────
# 5. EXPORT SQL
# ──────────────────────────────────────────────────────────────
print("Exporting SQL...")
DEL_COLS = ['DeliveryID', 'DeliveryAddress', 'City', 'State', 'PostCode', 'TrackingNo', 
            'DeliveryFee', 'ScheduledDeliveryDate', 'DeliveredDateTime', 'Status', 
            'OrderID', 'DeliveryCompanyID']

with open('insert_deliveries.sql', 'w', encoding='utf-8') as f:
    f.write("-- ==========================================================\n")
    f.write("-- Synthetic Deliveries\n")
    f.write("-- Period: 2020-01-01 to 2026-06-30\n")
    f.write("-- Seed: 3183\n")
    f.write("-- ==========================================================\n\n")
    
    for d in deliveries:
        cols = ", ".join(DEL_COLS)
        vals = ", ".join([escape_sql(d[c]) for c in DEL_COLS])
        f.write(f"INSERT INTO Deliveries ({cols})\nVALUES ({vals});\n")
        
    f.write("\nCOMMIT;\n")

print("Done. Files created: insert_deliveries.sql")