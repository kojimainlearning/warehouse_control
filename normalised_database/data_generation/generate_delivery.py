#!/usr/bin/env python3
"""
Generate synthetic Deliveries data based on orders.csv and delivery_company_profile.csv.
Period: 1 Jan 2024 – 30 Jun 2026
Snapshot: 30 Jun 2026
Seed: 3183
"""

import csv
import os
import sys
import random
from datetime import datetime, timedelta
from collections import defaultdict

# ──────────────────────────────────────────────────────────────
# 0. SEED & CONSTANTS
# ──────────────────────────────────────────────────────────────
random.seed(3183)

REQUIRED_FILES = ['metadata/orders.csv', 'metadata/delivery_company_profile.csv']
for f in REQUIRED_FILES:
    if not os.path.isfile(f):
        print(f"FATAL: Missing dependency file: {f}")
        print("Script stopped – will not invent unrelated information.")
        sys.exit(1)

# Regions mapping (Excluded Perlis & Kedah as their postcodes start with 0, 
# which fails the REGEXP_LIKE(PostCode, '^[0-9]{5}$') constraint on NUMBER(5) column)
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
# 1. HELPERS
# ──────────────────────────────────────────────────────────────
def parse_datetime(s):
    if not s or not s.strip(): return None
    for fmt in ('%Y-%m-%d %H:%M:%S', '%Y-%m-%d'):
        try: return datetime.strptime(s.strip(), fmt)
        except ValueError: continue
    return None

def escape_sql(val):
    if val is None: return "NULL"
    if isinstance(val, datetime): return f"TO_TIMESTAMP('{val.strftime('%Y-%m-%d %H:%M:%S')}', 'YYYY-MM-DD HH24:MI:SS')"
    if isinstance(val, (int, float)): return str(val)
    # For datetime.date objects
    if hasattr(val, 'strftime'): return f"TO_DATE('{val.strftime('%Y-%m-%d')}', 'YYYY-MM-DD')"
    return "'" + str(val).replace("'", "''") + "'"

# ──────────────────────────────────────────────────────────────
# 2. LOAD DATA
# ──────────────────────────────────────────────────────────────
print("Loading dependency files...")
companies = []
with open('metadata/delivery_company_profile.csv', 'r', encoding='utf-8') as f:
    for row in csv.DictReader(f):
        companies.append(row)

orders = []
with open('metadata/orders.csv', 'r', encoding='utf-8') as f:
    for row in csv.DictReader(f):
        if row['FulfillmentType'] == 'DELIVERY':
            orders.append(row)

# Sort orders chronologically to ensure sequential ID generation
orders.sort(key=lambda x: x['OrderDateTime'])
print(f"Found {len(orders)} DELIVERY orders.")

# ──────────────────────────────────────────────────────────────
# 3. GENERATE DELIVERIES
# ──────────────────────────────────────────────────────────────
print("Generating deliveries...")
deliveries = []
delivery_num = 0
company_stats = defaultdict(lambda: {"total": 0, "delivered": 0, "failed": 0, "durations": [], "feedback": []})

for order in orders:
    order_dt = parse_datetime(order['OrderDateTime'])
    if not order_dt: continue
    
    # Rule: A failed payment or cancelled before-processing delivery order should have no delivery record
    if order['PaymentStatus'] == 'FAILED':
        continue
    if order['OrderStatus'] == 'CANCELLED' and order['PaymentStatus'] == 'PENDING':
        continue
        
    # Calculate Delivery Fee (GrandTotal = Subtotal - Voucher - MyKasih + DeliveryFee)
    subtotal = float(order['SubtotalAmount'])
    voucher = float(order['VoucherDiscountAmount'])
    mykasih = float(order['MyKasihSubsidyTotal'])
    grand = float(order['GrandTotal'])
    delivery_fee = grand - subtotal + voucher + mykasih
    if delivery_fee < 0: delivery_fee = 0.0
    
    # Select active delivery company
    active_companies = [
        c for c in companies 
        if parse_datetime(c['ActiveFrom']) <= order_dt and 
           (c['InactiveDate'] == '' or parse_datetime(c['InactiveDate']) > order_dt)
    ]
    if not active_companies: continue
    
    # Weighted selection based on profile
    weights = []
    for c in active_companies:
        if c['PerformanceProfile'] == 'Premium & Reliable': weights.append(3)
        elif c['PerformanceProfile'] == 'Average': weights.append(2)
        elif c['PerformanceProfile'] == 'Lower-cost & Slower': weights.append(1)
        else: weights.append(1)
        
    company = random.choices(active_companies, weights=weights, k=1)[0]
    company_id = company['DeliveryCompanyID']
    profile = company['PerformanceProfile']
    
    # Determine Delivery Status based on Order Status
    # Note: DDL uses 'OUT_FOR_DELIVERY', prompt mentioned 'OUT_OF_DELIVERY'. Using DDL constraint.
    order_status = order['OrderStatus']
    payment_status = order['PaymentStatus']
    
    if order_status == 'COMPLETED' and payment_status == 'PAID':
        del_status = 'DELIVERED'
    elif order_status == 'OUT_FOR_DELIVERY':
        del_status = 'PICKED_UP'
    elif order_status in ['UNPAID', 'CANCELLED'] or payment_status == 'REFUNDED':
        del_status = 'FAILED'
    elif order_dt.year == 2026 and order_dt.month == 6:
        del_status = 'PENDING' # PENDING only around June 2026
    else:
        del_status = 'DELIVERED' # Fallback for past orders
        
    # Generate Address matching region
    state = random.choice(list(REGIONS.keys()))
    city = random.choice(REGIONS[state]['cities'])
    pc_min, pc_max = REGIONS[state]['pc_range']
    postcode = random.randint(pc_min, pc_max)
    address = f"No. {random.randint(1, 99)}, Jalan {city.split()[0]} {random.randint(1, 50)}"
    
    # Generate Dates & Durations based on Year Trends & Company Profile
    year = order_dt.year
    if year == 2024: dur_mult = 1.5
    elif year == 2025: dur_mult = 1.2
    else: dur_mult = 1.0 # 2026
    
    if profile == 'Premium & Reliable': dur_mult *= 0.8
    elif profile == 'Lower-cost & Slower': dur_mult *= 1.5
    
    base_days = max(1, int(float(company['ExpectedDuration']) * dur_mult))
    sched_date = order_dt.date() + timedelta(days=random.randint(1, base_days))
    
    delivered_dt = None
    if del_status == 'DELIVERED':
        offset = random.randint(-1, max(1, base_days // 2))
        delivered_dt = datetime.combine(sched_date + timedelta(days=offset), order_dt.time())
        if delivered_dt <= order_dt:
            delivered_dt = order_dt + timedelta(hours=random.randint(1, 24))
            
    # Tracking No
    delivery_num += 1
    tracking_no = f"TRK{delivery_num:08d}"
    
    deliveries.append({
        'DeliveryID': f"D{delivery_num:04d}",
        'DeliveryAddress': address,
        'City': city,
        'State': state,
        'PostCode': postcode,
        'TrackingNo': tracking_no,
        'DeliveryFee': round(delivery_fee, 2),
        'ScheduledDeliveryDate': sched_date,
        'DeliveredDateTime': delivered_dt,
        'Status': del_status,
        'OrderID': order['OrderID'],
        'DeliveryCompanyID': company_id,
        '_order_dt': order_dt, # Keep for stats calculation
        '_profile': profile
    })
    
    # Update Stats
    stats = company_stats[company_id]
    stats['total'] += 1
    stats['profile'] = profile
    if del_status == 'DELIVERED':
        stats['delivered'] += 1
        duration = (delivered_dt - order_dt).total_seconds() / 86400
        stats['durations'].append(duration)
        # Feedback score based on profile
        if profile == 'Premium & Reliable': stats['feedback'].append(round(random.uniform(4.2, 5.0), 1))
        elif profile == 'Average': stats['feedback'].append(round(random.uniform(3.5, 4.5), 1))
        else: stats['feedback'].append(round(random.uniform(2.5, 4.0), 1))
    elif del_status == 'FAILED':
        stats['failed'] += 1

print(f"Generated {len(deliveries)} valid delivery records.")

# ──────────────────────────────────────────────────────────────
# 4. VALIDATION
# ──────────────────────────────────────────────────────────────
print("Running validations...")
order_ids = set()
tracking_nos = set()
for d in deliveries:
    if d['OrderID'] in order_ids:
        print(f"FATAL: Duplicate delivery for order {d['OrderID']}"); sys.exit(1)
    order_ids.add(d['OrderID'])
    
    if d['TrackingNo'] in tracking_nos:
        print(f"FATAL: Duplicate TrackingNo {d['TrackingNo']}"); sys.exit(1)
    tracking_nos.add(d['TrackingNo'])
    
    if d['Status'] == 'DELIVERED' and d['DeliveredDateTime'] is None:
        print(f"FATAL: DELIVERED without DeliveredDateTime {d['DeliveryID']}"); sys.exit(1)
    if d['Status'] != 'DELIVERED' and d['DeliveredDateTime'] is not None:
        print(f"FATAL: Non-DELIVERED with DeliveredDateTime {d['DeliveryID']}"); sys.exit(1)
print("✓ All validations passed.")

# ──────────────────────────────────────────────────────────────
# 5. EXPORT CSV & SQL
# ──────────────────────────────────────────────────────────────
print("Exporting files...")

# Export delivery_outcome_control.csv
with open('delivery_outcome_control.csv', 'w', newline='', encoding='utf-8') as f:
    writer = csv.writer(f)
    writer.writerow(['DeliveryCompanyID', 'PerformanceProfile', 'TotalDeliveries', 'AvgDurationDays', 'OnTimeRate', 'FailureRate', 'AvgFeedbackScore'])
    for cid, stats in company_stats.items():
        total = stats['total']
        avg_dur = round(sum(stats['durations']) / len(stats['durations']), 2) if stats['durations'] else 0.0
        on_time_rate = round(stats['delivered'] / total, 3) if total > 0 else 0.0
        fail_rate = round(stats['failed'] / total, 3) if total > 0 else 0.0
        avg_fb = round(sum(stats['feedback']) / len(stats['feedback']), 2) if stats['feedback'] else 0.0
        writer.writerow([cid, stats['profile'], total, avg_dur, on_time_rate, fail_rate, avg_fb])

# Export SQL
DEL_COLS = ['DeliveryID', 'DeliveryAddress', 'City', 'State', 'PostCode', 'TrackingNo', 
            'DeliveryFee', 'ScheduledDeliveryDate', 'DeliveredDateTime', 'Status', 
            'OrderID', 'DeliveryCompanyID']

with open('insert_deliveries.sql', 'w', encoding='utf-8') as f:
    f.write("-- Generated SQL for Deliveries\n")
    f.write("-- Snapshot Date: 30 June 2026\n\n")
    for d in deliveries:
        cols = ", ".join(DEL_COLS)
        vals = ", ".join([escape_sql(d[c]) for c in DEL_COLS])
        f.write(f"INSERT INTO Deliveries ({cols})\nVALUES ({vals});\n")
    f.write("\nCOMMIT;\n")

print("Done. Files created: delivery_outcome_control.csv, insert_deliveries.sql")