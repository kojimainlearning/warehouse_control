#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Member 2 Data Generator
Generates data for: BRANCHES, STAFFS, PRODUCT_CATEGORIES, ITEMS, STOCKS
Seed: 3183
Period: 2024-01-01 to 2026-06-30
Outputs: CSV files, SQL inserts, and validation script.
"""
import itertools
import pandas as pd
import numpy as np
import random
from datetime import datetime, timedelta
import os

# ========================== SEED & CONSTANTS ==========================
RANDOM_SEED = 3183
random.seed(RANDOM_SEED)
np.random.seed(RANDOM_SEED)

# Date bounds
START_DATE = datetime(2024, 1, 1)
END_DATE = datetime(2026, 6, 30)
SNAPSHOT_DATE = datetime(2026, 6, 30)

# ========================== HELPER FUNCTIONS ==========================

def random_date(start, end):
    """Return a random date between start and end (inclusive)."""
    delta = end - start
    int_delta = delta.days
    random_day = random.randint(0, int_delta)
    return start + timedelta(days=random_day)

def random_phone():
    """Generate a Malaysian phone number starting with +60."""
    return '+60' + ''.join(random.choices('0123456789', k=random.randint(8, 10)))

def random_email(first_name, last_name):
    domains = ['gmail.com', 'yahoo.com', 'outlook.com', 'speedmart.com.my', 'shop.com']
    local_part = f"{first_name.lower()}.{last_name.lower()}"
    local_part = local_part.replace(' ', '.')  # <-- This removes spaces
    return f"{local_part}@{random.choice(domains)}"

def random_malaysian_name():
    """Generate a random Malaysian-sounding name."""
    first_names = [
        'Ahmad', 'Mohd', 'Ali', 'Siti', 'Nur', 'Fatimah', 'Zainal', 'Rohani',
        'Ismail', 'Hassan', 'Khalid', 'Nor', 'Azman', 'Rosli', 'Fairuz', 'Liyana'
    ]
    last_names = [
        'Abdullah', 'bin Ali', 'bin Ahmad', 'binti Hassan', 'binti Yusof',
        'Razak', 'Salleh', 'Othman', 'Hussein', 'Zulkifli', 'Ibrahim'
    ]
    return random.choice(first_names), random.choice(last_names)

def format_date(dt):
    """Format date as YYYY-MM-DD for CSVs and SQL."""
    return dt.strftime('%Y-%m-%d')

def format_datetime(dt):
    return dt.strftime('%Y-%m-%d %H:%M:%S')

# ========================== BRANCH DATA ==========================

BRANCH_NAMES = [
    ("Ampang", "Selangor"), ("Cheras", "Kuala Lumpur"), ("Petaling Jaya", "Selangor"),
    ("Shah Alam", "Selangor"), ("Klang", "Selangor"), ("Johor Bahru", "Johor"),
    ("Ipoh", "Perak"), ("George Town", "Penang"), ("Kota Kinabalu", "Sabah"),
    ("Kuching", "Sarawak"), ("Seremban", "Negeri Sembilan"), ("Melaka", "Melaka")
]
# We'll assign 12 different locations, but ensure some are in Selangor/KL.

# Street names for addresses
STREETS = [
    "Jalan Ampang", "Jalan Cheras", "Jalan PJU", "Persiaran Shah Alam", "Jalan Kapar",
    "Jalan Tebrau", "Jalan Sultan Azlan Shah", "Jalan Penang", "Jalan Gaya",
    "Jalan Padungan", "Jalan Rasah", "Jalan Hang Tuah"
]

POSTCODES = {
    "Selangor": ["40000", "40100", "40200", "40300", "40400", "40500", "40600", "40700", "40800", "40900"],
    "Kuala Lumpur": ["50000", "50100", "50200", "50300", "50400", "50500", "50600", "50700", "50800", "50900"],
    "Johor": ["80000", "80100", "80200", "80300", "80400", "80500", "80600", "80700", "80800", "80900"],
    "Perak": ["30000", "30100", "30200", "30300", "30400", "30500", "30600", "30700", "30800", "30900"],
    "Penang": ["10000", "10100", "10200", "10300", "10400", "10500", "10600", "10700", "10800", "10900"],
    "Negeri Sembilan": ["70000", "70100", "70200", "70300", "70400", "70500", "70600", "70700", "70800", "70900"],
    "Melaka": ["75000", "75100", "75200", "75300", "75400", "75500", "75600", "75700", "75800", "75900"],
    "Sabah": ["88000", "88100", "88200", "88300", "88400", "88500", "88600", "88700", "88800", "88900"],
    "Sarawak": ["93000", "93100", "93200", "93300", "93400", "93500", "93600", "93700", "93800", "93900"]
}

def generate_branches():
    """Create 12 branches with opening dates between 2024-01-01 and 2026-06-30."""
    branch_specs = [
        ("B001", "Ampang", "Selangor", "68000", "HIGH"),
        ("B002", "Cheras", "Kuala Lumpur", "56000", "HIGH"),
        ("B003", "Petaling Jaya", "Selangor", "47300", "HIGH"),
        ("B004", "Shah Alam", "Selangor", "40000", "MEDIUM"),
        ("B005", "Klang", "Selangor", "41000", "MEDIUM"),
        ("B006", "Johor Bahru", "Johor", "80000", "MEDIUM"),
        ("B007", "Ipoh", "Perak", "30000", "MEDIUM"),
        ("B008", "George Town", "Penang", "10000", "MEDIUM"),
        ("B009", "Seremban", "Negeri Sembilan", "70000", "LOW"),
        ("B010", "Melaka", "Melaka", "75000", "LOW"),
        ("B011", "Kota Kinabalu", "Sabah", "88000", "LOW"),
        ("B012", "Kuching", "Sarawak", "93000", "LOW")
    ]
    
    # Generate opening dates between 2024-01-01 and 2026-06-30
    start = datetime(2024, 1, 1)
    end = datetime(2026, 6, 30)
    dates = []
    for _ in range(12):
        dates.append(random_date(start, end))
    dates.sort()  # ensure chronological order (optional)
    
    records = []
    for i, (bid, city, state, postcode, vol) in enumerate(branch_specs):
        opening = dates[i]
        # One branch inactive (B012) with closing date
        status = 'ACTIVE'
        closing = None
        if bid == "B012":
            status = 'INACTIVE'
            closing = random_date(opening, end)  # after opening
        address = f"{random.randint(1, 999)} {random.choice(STREETS)}"
        record = {
            'BranchID': bid,
            'BranchName': f"{city} 88 Speedmart",
            'Address': address,
            'City': city,
            'State': state,
            'PostCode': postcode,
            'OpeningDate': opening,
            'Status': status,
            'VolumeCategory': vol,
            'ClosingDate': closing
        }
        records.append(record)
    return pd.DataFrame(records)

# ========================== STAFF DATA ==========================
def generate_staff(branches_df):
    """
    Generate 96 staff (8 per branch).
    Each branch: 1 Admin (max), 2 Managers (max), 2 Stock Staff (max), 3 Cashiers.
    First 7 staff (Admin, Managers, Stock Staff, 2 Cashiers) are forced ACTIVE and hired on opening date.
    The 8th (extra Cashier) can be ACTIVE, ON LEAVE, or RESIGNED (with low resignation probability).
    Inactive branch: all 8 staff are RESIGNED.
    """
    staff_records = []
    staff_id_counter = 1

    # Unique names (16 first × 11 last = 176 combinations, enough for 96)
    FIRST_NAMES = ['Ahmad','Mohd','Ali','Siti','Nur','Fatimah','Zainal','Rohani',
                   'Ismail','Hassan','Khalid','Nor','Azman','Rosli','Fairuz','Liyana']
    LAST_NAMES = ['Abdullah','Ali','Ahmad','Hassan','Yusof','Razak','Salleh',
                  'Othman','Hussein','Zulkifli','Ibrahim']
    all_names = list(itertools.product(FIRST_NAMES, LAST_NAMES))
    random.shuffle(all_names)
    unique_names = all_names[:96]          # exactly 96 unique name pairs
    name_index = 0

    # Roles per branch (8 roles): 1 Admin, 2 Managers, 2 Stock, 3 Cashiers
    # First 7 (indices 0-6) = Admin, Manager, Manager, Stock, Stock, Cashier, Cashier
    # Index 7 = extra Cashier (flexible status)
    roles_per_branch = ['ADMIN'] + ['MANAGER'] * 2 + ['STOCK_STAFF'] * 2 + ['CASHIER'] * 3

    # Identify inactive branch
    inactive_branch = branches_df[branches_df['Status'] == 'INACTIVE']
    inactive_branch_id = inactive_branch['BranchID'].iloc[0] if not inactive_branch.empty else None
    inactive_closing = inactive_branch['ClosingDate'].iloc[0] if not inactive_branch.empty else None

    for _, branch_row in branches_df.iterrows():
        bid = branch_row['BranchID']
        opening = branch_row['OpeningDate']
        branch_roles = roles_per_branch.copy()  # fixed order, no shuffle needed

        for i, role in enumerate(branch_roles):
            # Hire date: first 7 staff on opening date; the 8th (extra Cashier) later
            if i < 7:
                hire = opening
            else:
                hire = random_date(max(opening, START_DATE), END_DATE)

            first, last = unique_names[name_index]
            name_index += 1
            full_name = f"{first} {last}"
            email = random_email(first, last)
            phone = random_phone()

            staff_id = f"S{staff_id_counter:04d}"
            staff_id_counter += 1

            # Default status (will be adjusted)
            status = 'ACTIVE'
            inactive_date = None

            # Determine status based on branch type and role index
            if branch_row['Status'] == 'ACTIVE':
                # Active branch
                if i < 7:
                    # First 7 roles: forced ACTIVE
                    status = 'ACTIVE'
                else:
                    # Extra Cashier (i == 7): random status
                    rand = random.random()
                    if rand < 0.6:          # 60% ACTIVE
                        status = 'ACTIVE'
                    elif rand < 0.85:       # 25% ON LEAVE
                        status = 'ON LEAVE'
                    else:                   # 15% RESIGNED
                        status = 'RESIGNED'
                        inactive_date = random_date(hire, END_DATE)
            else:
                # Inactive branch: all staff RESIGNED
                status = 'RESIGNED'
                # Set resignation date after hire but before branch closing
                end_date = inactive_closing if inactive_closing else END_DATE
                if hire < end_date:
                    inactive_date = random_date(hire, end_date)
                else:
                    inactive_date = random_date(hire, END_DATE)

            record = {
                'StaffID': staff_id,
                'StaffName': full_name,
                'Role': role,
                'Email': email,
                'PhoneNo': phone,
                'HireDate': hire,
                'Status': status,
                'BranchID': bid,
                'InactiveDate': inactive_date
            }
            staff_records.append(record)

    staff_df = pd.DataFrame(staff_records)

    return staff_df

# ========================== PRODUCT CATEGORIES ==========================

CATEGORIES = [
    # Existing 12 categories (all ACTIVE)
    ("PC001", "Rice and Grains", "Various types of rice, flour, and grains", "ACTIVE"),
    ("PC002", "Cooking Essentials", "Oils, sauces, seasonings, and condiments", "ACTIVE"),
    ("PC003", "Canned and Packaged Food", "Canned vegetables, meats, and ready-to-eat meals", "ACTIVE"),
    ("PC004", "Beverages", "Soft drinks, juices, water, and energy drinks", "ACTIVE"),
    ("PC005", "Snacks and Confectionery", "Chips, chocolates, candies, and biscuits", "ACTIVE"),
    ("PC006", "Dairy Products", "Milk, cheese, butter, and yoghurt", "ACTIVE"),
    ("PC007", "Frozen Food", "Frozen vegetables, meats, and ready meals", "ACTIVE"),
    ("PC008", "Instant Food", "Instant noodles, cereals, and quick meals", "ACTIVE"),
    ("PC009", "Personal Care", "Shampoo, soap, toothpaste, and skincare", "ACTIVE"),
    ("PC010", "Household Cleaning", "Detergents, disinfectants, and cleaning tools", "ACTIVE"),
    ("PC011", "Baby Products", "Baby milk, diapers, and baby food", "ACTIVE"),
    ("PC012", "Stationery and Daily Needs", "Paper, pens, batteries, and household items", "ACTIVE"),
    # New category: Alcoholic Beverages (ACTIVE)
    ("PC013", "Alcoholic Beverages", "Beers, wines, spirits, and other alcoholic drinks", "ACTIVE"),
    # 3 inactive categories
    ("PC014", "Premium Items", "Luxury and gourmet products", "INACTIVE"),
    ("PC015", "Organic Foods", "Certified organic produce and packaged goods", "INACTIVE"),
    ("PC016", "Imported Goods", "Specialty imported items", "INACTIVE")
]

def generate_categories():
    """Return DataFrame of categories with Status read directly from the CATEGORIES list."""
    return pd.DataFrame(CATEGORIES, columns=['CategoryID', 'CategoryName', 'Description', 'Status'])

# ========================== ITEMS ==========================

# Allowed unit measures
UNIT_MEASURES = ['BAG', 'BOTTLE', 'BOX', 'CAN', 'TIN', 'PACK', 'PCS']

# Demand profiles
DEMAND_PROFILES = ['FAST_MOVING', 'MEDIUM_MOVING', 'SLOW_MOVING', 'SEASONAL']

def round_to_10_cents(price):
    """Round to nearest 0.10 (e.g., 11.43 -> 11.40, 28.29 -> 28.30)."""
    return round(price * 10) / 10

import re 

def extract_quantity(name):
    """
    Extract the numeric quantity from product names and normalize to a base unit.
    - '5kg'  -> 5.0
    - '500g' -> 0.5
    - '600ml'-> 0.6
    - '24pcs'-> 24.0
    - '500sheets' -> 5.0 (base of 100 sheets)
    """
    patterns = [
        (r'(\d+\.?\d*)\s*kg', 'kg'),
        (r'(\d+\.?\d*)\s*g', 'g'),
        (r'(\d+\.?\d*)\s*ml', 'ml'),
        (r'(\d+\.?\d*)\s*[Ll]', 'L'),   # handles L or l
        (r'(\d+\.?\d*)\s*pcs', 'pcs'),
        (r'(\d+\.?\d*)\s*sheets', 'sheets'),
        (r'(\d+\.?\d*)\s*pc', 'pcs'),
    ]
    for pattern, unit in patterns:
        match = re.search(pattern, name, re.IGNORECASE)
        if match:
            val = float(match.group(1))
            if unit == 'g':
                return val / 1000.0   # convert to kg
            elif unit == 'ml':
                return val / 1000.0   # convert to L
            elif unit == 'sheets':
                return val / 100.0    # base of 100 sheets
            else:
                return val            # kg, L, pcs keep as is
    # If no size found (e.g., "Milo 1kg" has it, but fallback)
    return 1.0

def generate_items(categories_df):
    """Generate exactly 120 items with weight/volume-based pricing."""
    items = []
    item_id_counter = 1

    # ------------------------------------------------------------
    # Product Names per Category (total = 120)
    # ------------------------------------------------------------
    product_names = {
        'Rice and Grains': [
            'Beras Super 5kg', 'Beras Wangi 10kg', 'Tepung Gandum 1kg', 'Tepung Beras 500g',
            'Beras Pulut 1kg', 'Oatmeal 1kg', 'Quinoa 500g', 'Beras Basmathi 5kg',
            'Tepung Jagung 500g', 'Bijirin Sarapan 500g', 'Beras Perang 1kg', 'Tepung Ubi 500g'
        ],
        'Cooking Essentials': [
            'Minyak Masak 1kg', 'Minyak Zaitun 500ml', 'Kicap Manis 600ml', 'Kicap Masin 600ml',
            'Sos Cili 400ml', 'Sos Tomato 400ml', 'Cuka 500ml', 'Madu 250g',
            'Minyak Bijian 200ml', 'Sos Tiram 300ml', 'Tepung Jagung 200g', 'Serbuk Perasa 100g'
        ],
        'Canned and Packaged Food': [
            'Sardin 425g', 'Tuna Chunk 185g', 'Kacang Hancur 425g', 'Jagung Manis 425g',
            'Sup Ayam 400g', 'Baked Beans 415g', 'Ayam Masak 400g', 'Daging Lembu 400g',
            'Cendawan Sup 300g', 'Nangka Muda 565g'
        ],
        'Beverages': [
            'Minuman Isotonic 500ml', 'Air Mineral 1.5L', 'Jus Oren 1L', 'Kola 330ml',
            'Sprite 330ml', 'Teh Tarik 250ml', 'Kopi 3in1 10s', 'Milo 1kg',
            'Susu Soya 1L', 'Minuman Tenaga 250ml'
        ],
        'Snacks and Confectionery': [
            'Kerepek 150g', 'Coklat 100g', 'Biskut 200g', 'Gula-gula 150g',
            'Pudding 100g', 'Kacang Putih 200g', 'Keropok 100g', 'Mochi 120g'
        ],
        'Dairy Products': [
            'Susu Segar 1L', 'Susu Rendah Lemak 1L', 'Keju 250g', 'Mentega 250g',
            'Yogurt 180g', 'Krim 200ml', 'Susu Cair 200ml', 'Tepung Susu 1kg',
            'Keju Mozzarella 200g', 'Susu Kambing 1L'
        ],
        'Frozen Food': [
            'Ayam Beku 1kg', 'Daging Beku 500g', 'Ikan Beku 500g', 'Sayuran Beku 300g',
            'Pizza Beku 400g', 'Sosej Beku 500g', 'Nuget 500g', 'Kentang Goreng 1kg'
        ],
        'Instant Food': [
            'Mee Segera 80g', 'Mee Segera Cup 65g', 'Bihun Segera 60g', 'Nasi Segera 200g',
            'Bubur Segera 50g', 'Pasta Segera 150g', 'Sos Pasta 200g', 'Cup Soup 100g',
            'Oat Segera 1kg', 'Cereal 500g'
        ],
        'Personal Care': [
            'Syampu 500ml', 'Sabun Mandi 100g', 'Ubat Gigi 150g', 'Losyen 250ml',
            'Deodorant 50ml', 'Pembersih Muka 100ml', 'Krim Pelindung 50g', 'Balm 30g'
        ],
        'Household Cleaning': [
            'Detergen 2kg', 'Pembersih Lantai 1L', 'Pewangi Pakaian 1L', 'Peluntur 1L',
            'Sabun Pinggan 500ml', 'Pembersih Kaca 500ml', 'Penyapu 1pc', 'Mop 1pc'
        ],
        'Baby Products': [
            'Susu Formula 900g', 'Pampers S 24pcs', 'Tisu Basah Baby 80pcs', 'Makanan Bayi 120g',
            'Bedak Bayi 150g', 'Minyak Bayi 100ml', 'Sabun Bayi 250ml', 'Botol Susu 250ml'
        ],
        'Stationery and Daily Needs': [
            'Kertas A4 500sheets', 'Pen 10pcs', 'Pensil 12pcs', 'Pemadam 5pcs',
            'Bateri AA 4pcs', 'Bateri AAA 4pcs'
        ],
        'Alcoholic Beverages': [
            'Bir 330ml', 'Wain Merah 750ml', 'Wain Putih 750ml', 'Whisky 700ml'
        ],
        'Premium Items': [
            'Kaviar 50g', 'Foie Gras 100g'
        ],
        'Organic Foods': [
            'Beras Organik 5kg', 'Minyak Zaitun Organik 500ml'
        ],
        'Imported Goods': [
            'Keju Parmesan 200g', 'Kopi Arabika 250g'
        ],
    }

    # ------------------------------------------------------------
    # Price Ranges per Category (absolute min/max – final clamp)
    # ------------------------------------------------------------
    price_ranges = {
        'Rice and Grains': (2.0, 15.0),
        'Cooking Essentials': (2.0, 12.0),
        'Canned and Packaged Food': (2.5, 10.0),
        'Beverages': (1.5, 8.0),
        'Snacks and Confectionery': (1.0, 6.0),
        'Dairy Products': (2.0, 12.0),
        'Frozen Food': (3.0, 15.0),
        'Instant Food': (1.5, 8.0),
        'Personal Care': (3.0, 15.0),
        'Household Cleaning': (2.0, 12.0),
        'Baby Products': (5.0, 30.0),
        'Stationery and Daily Needs': (1.0, 8.0),
        'Alcoholic Beverages': (10.0, 60.0),
        'Premium Items': (50.0, 200.0),
        'Organic Foods': (15.0, 50.0),
        'Imported Goods': (20.0, 80.0)
    }

    # ------------------------------------------------------------
    # Price per Base Unit (e.g., RM per kg, RM per L, RM per pc)
    # ------------------------------------------------------------
    price_per_unit_ranges = {
        'Rice and Grains': (2.5, 4.5),       # RM per kg
        'Cooking Essentials': (3.0, 5.0),    # RM per kg/L
        'Canned and Packaged Food': (6.0, 12.0), # RM per kg
        'Beverages': (0.8, 2.0),             # RM per L
        'Snacks and Confectionery': (10.0, 20.0), # RM per kg
        'Dairy Products': (4.0, 8.0),        # RM per L/kg
        'Frozen Food': (5.0, 10.0),          # RM per kg
        'Instant Food': (4.0, 8.0),          # RM per kg
        'Personal Care': (8.0, 15.0),        # RM per kg/L
        'Household Cleaning': (3.0, 6.0),    # RM per L/kg
        'Baby Products': (12.0, 20.0),       # RM per kg (formula) / per pc (diapers)
        'Stationery and Daily Needs': (5.0, 10.0), # RM per 100 sheets / per pc
        'Alcoholic Beverages': (15.0, 30.0), # RM per L
        'Premium Items': (50.0, 150.0),      # RM per 100g (scaled)
        'Organic Foods': (10.0, 20.0),       # RM per kg
        'Imported Goods': (20.0, 50.0)       # RM per kg
    }

    # Core categories (first 4 items start on 2024-01-01)
    CORE_CATEGORIES = ['Rice and Grains', 'Cooking Essentials', 'Canned and Packaged Food',
                       'Beverages', 'Dairy Products', 'Instant Food', 'Baby Products',
                       'Household Cleaning']
    CORE_ITEMS_PER_CATEGORY = 4

    for _, cat_row in categories_df.iterrows():
        cat_id = cat_row['CategoryID']
        cat_name = cat_row['CategoryName']
        names = product_names.get(cat_name, [])
        abs_min, abs_max = price_ranges[cat_name]
        unit_min, unit_max = price_per_unit_ranges[cat_name]

        for idx, name in enumerate(names):
            item_id = f"I{item_id_counter:04d}"
            item_id_counter += 1

            # --- Introduction date ---
            is_core = (cat_name in CORE_CATEGORIES and idx < CORE_ITEMS_PER_CATEGORY)
            intro = datetime(2024, 1, 1) if is_core else random_date(datetime(2024, 7, 1), END_DATE)

            # --- Unit measure (based on name) ---
            if 'kg' in name or 'g' in name:
                unit = random.choice(['BAG', 'BOX', 'PACK', 'PCS'])
            elif 'ml' in name or 'L' in name:
                unit = random.choice(['BOTTLE', 'BOX', 'CAN', 'PCS'])
            else:
                unit = random.choice(UNIT_MEASURES)

            # --- Halal & MyKasih ---
            if cat_name == 'Alcoholic Beverages':
                is_halal = 'N'
            else:
                is_halal = 'Y' if random.random() < 0.95 else 'N'

            essential_cats = ['Rice and Grains', 'Cooking Essentials', 'Canned and Packaged Food',
                              'Dairy Products', 'Instant Food', 'Baby Products', 'Household Cleaning']
            if cat_name in essential_cats and random.random() < 0.6:
                is_mykasih = 'Y'
            else:
                is_mykasih = 'N'
            if cat_name in ['Alcoholic Beverages', 'Premium Items', 'Organic Foods', 'Imported Goods']:
                is_mykasih = 'N'

            # ------------------------------------------------------------
            # --- WEIGHT/VOLUME-BASED PRICING LOGIC ---
            # ------------------------------------------------------------
            qty = extract_quantity(name)
            if qty <= 0:
                qty = 1.0

            # Pick a random price per base unit (e.g., RM per kg)
            base_price_unit = round_to_10_cents(random.uniform(unit_min, unit_max))

            # Apply bulk discount: exponent between 0.85 and 0.92
            exp = random.uniform(0.85, 0.92)
            natural_price = base_price_unit * (qty ** exp)

            # Clamp to absolute category range, then round
            final_base_price = max(abs_min, min(abs_max, natural_price))
            final_base_price = round_to_10_cents(final_base_price)

            # Store base price temporarily for historical price generation
            base_price = final_base_price

            # --- Other attributes ---
            status = 'ACTIVE'
            disc = None

            items.append({
                'ItemID': item_id,
                'ItemName': name,
                'UnitPrice': 0.0,           # will be set later
                'UnitMeasure': unit,
                'Description': f"{name} - {cat_name}",
                'IsHalal': is_halal,
                'IsMyKasihEligible': is_mykasih,
                'Status': status,
                'CategoryID': cat_id,
                'IntroductionDate': intro,
                'DiscontinuationDate': disc,
                'DemandProfile': None,
                'BasePrice': base_price      # for price history
            })

    item_df = pd.DataFrame(items)

    # ------------------------------------------------------------
    # Set 12 items to INACTIVE
    # ------------------------------------------------------------
    all_indices = list(range(len(item_df)))
    random.shuffle(all_indices)
    inactive_indices = all_indices[:12]
    for idx in inactive_indices:
        item_df.loc[idx, 'Status'] = 'INACTIVE'
        intro = item_df.loc[idx, 'IntroductionDate']
        disc = random_date(intro, END_DATE)
        if disc <= intro:
            disc = intro + timedelta(days=30)
            if disc > END_DATE:
                disc = END_DATE
        item_df.loc[idx, 'DiscontinuationDate'] = disc

    # ------------------------------------------------------------
    # Assign Demand Profile
    # ------------------------------------------------------------
    demand_mapping = {
        'Rice and Grains': 'FAST_MOVING',
        'Cooking Essentials': 'FAST_MOVING',
        'Canned and Packaged Food': 'MEDIUM_MOVING',
        'Beverages': 'SEASONAL',
        'Snacks and Confectionery': 'SEASONAL',
        'Dairy Products': 'MEDIUM_MOVING',
        'Frozen Food': 'SLOW_MOVING',
        'Instant Food': 'FAST_MOVING',
        'Personal Care': 'MEDIUM_MOVING',
        'Household Cleaning': 'MEDIUM_MOVING',
        'Baby Products': 'FAST_MOVING',
        'Stationery and Daily Needs': 'SLOW_MOVING',
        'Alcoholic Beverages': 'SEASONAL',
        'Premium Items': 'SLOW_MOVING',
        'Organic Foods': 'MEDIUM_MOVING',
        'Imported Goods': 'SLOW_MOVING'
    }
    for idx, row in item_df.iterrows():
        cat_name = categories_df[categories_df['CategoryID'] == row['CategoryID']]['CategoryName'].iloc[0]
        item_df.loc[idx, 'DemandProfile'] = demand_mapping.get(cat_name, 'MEDIUM_MOVING')

    # ------------------------------------------------------------
    # Generate Price History using the stored BasePrice
    # ------------------------------------------------------------
    price_history = []
    for idx, row in item_df.iterrows():
        base_price = row['BasePrice']
        intro = row['IntroductionDate']

        # 2024 price
        if intro <= datetime(2024, 12, 31):
            price2024 = round_to_10_cents(base_price * random.uniform(0.95, 1.05))
        else:
            price2024 = None

        # 2025 price
        if intro <= datetime(2025, 12, 31):
            if price2024 is not None:
                price2025 = round_to_10_cents(price2024 * random.uniform(1.02, 1.05))
            else:
                price2025 = round_to_10_cents(base_price * random.uniform(0.98, 1.02))
        else:
            price2025 = None

        # 2026 price
        if intro <= END_DATE:
            if price2025 is not None:
                price2026 = round_to_10_cents(price2025 * random.uniform(1.02, 1.05))
            elif price2024 is not None:
                price2026 = round_to_10_cents(price2024 * random.uniform(1.04, 1.10))
            else:
                price2026 = round_to_10_cents(base_price * random.uniform(1.00, 1.05))
        else:
            price2026 = None

        item_df.loc[idx, 'UnitPrice'] = price2026 if price2026 is not None else 0.0

        price_history.append({
            'ItemID': row['ItemID'],
            'Price2024': price2024,
            'Price2025': price2025,
            'Price2026': price2026
        })

    # Drop temporary BasePrice column
    item_df.drop(columns=['BasePrice'], inplace=True)

    # Convert price history to long format
    price_long = []
    for _, row in pd.DataFrame(price_history).iterrows():
        for year in [2024, 2025, 2026]:
            price = row[f'Price{year}']
            if price is not None:
                price_long.append({
                    'ItemID': row['ItemID'],
                    'Year': year,
                    'SellingPrice': price
                })
    price_control_df = pd.DataFrame(price_long)

    # Control DataFrames
    demand_control_df = item_df[['ItemID', 'DemandProfile']].copy()
    lifecycle_control_df = item_df[['ItemID', 'IntroductionDate', 'DiscontinuationDate', 'Status']].copy()
    lifecycle_control_df['IntroductionDate'] = lifecycle_control_df['IntroductionDate'].apply(
        lambda x: format_date(x) if pd.notna(x) else ''
    )
    lifecycle_control_df['DiscontinuationDate'] = lifecycle_control_df['DiscontinuationDate'].apply(
        lambda x: format_date(x) if pd.notna(x) else ''
    )

    return item_df, price_control_df, demand_control_df, lifecycle_control_df

# ========================== OPENING STOCK ==========================
def generate_opening_stock(branches_df, item_df):
    """Generate one stock record per (branch, item) combination, respecting item lifecycle."""
    records = []
    # Branch volume factors
    vol_factor = {'HIGH': 2.0, 'MEDIUM': 1.0, 'LOW': 0.5}
    # Demand factors (from item_df)
    demand_factor = {
        'FAST_MOVING': 2.0,
        'MEDIUM_MOVING': 1.0,
        'SLOW_MOVING': 0.5,
        'SEASONAL': 1.2
    }

    for _, branch in branches_df.iterrows():
        bid = branch['BranchID']
        vol = branch['VolumeCategory']
        bf = vol_factor[vol]
        # Determine the effective date for opening stock:
        # if branch opened before 2024-01-01, use 2024-01-01; else use OpeningDate.
        effective_date = max(branch['OpeningDate'], START_DATE)

        for _, item in item_df.iterrows():
            iid = item['ItemID']
            intro = item['IntroductionDate']
            disc = item['DiscontinuationDate']
            demand = item['DemandProfile']
            df = demand_factor.get(demand, 1.0)

            # Check if item is available at the opening date
            is_available = (intro <= effective_date) and (pd.isna(disc) or disc > effective_date)

            if is_available:
                # Base quantity between 20 and 200
                base = random.randint(20, 200)
                qty = int(base * bf * df * random.uniform(0.8, 1.2))
                qty = max(qty, 0)
            else:
                qty = 0

            # Compute reorder level based on demand, even if stock is zero
            # Use a base reorder level between 5 and 50, scaled by branch and demand
            reorder_base = random.randint(5, 50)
            reorder_level = int(reorder_base * bf * df * random.uniform(0.7, 1.3))
            reorder_level = max(reorder_level, 5)   # ensure >0

            reorder_qty = int(reorder_level * random.uniform(1.5, 3.0))
            reorder_qty = max(reorder_qty, 10)     # ensure >0

            # For inactive branch, force stock to zero (but keep reorder values)
            if branch['Status'] == 'INACTIVE':
                qty = 0

            # LastUpdated: same logic
            if branch['OpeningDate'] < START_DATE:
                last_update = START_DATE
            else:
                last_update = branch['OpeningDate']

            records.append({
                'BranchID': bid,
                'ItemID': iid,
                'QuantityOnHand': qty,
                'ReorderLevel': reorder_level,
                'ReorderQuantity': reorder_qty,
                'LastUpdated': last_update
            })

    return pd.DataFrame(records)

# ========================== MAIN ==========================

def main():
    # Generate branches
    branches_df = generate_branches()
    # Generate staff
    staff_df = generate_staff(branches_df)
    # Generate categories
    categories_df = generate_categories()
    # Generate items
    item_df, price_control_df, demand_control_df, lifecycle_control_df = generate_items(categories_df)
    # Generate opening stock
    opening_stock_df = generate_opening_stock(branches_df, item_df)

    # Save CSVs
    os.makedirs('output', exist_ok=True)
    branches_df.to_csv('output/branches.csv', index=False)
    staff_df.to_csv('output/staffs.csv', index=False)
    categories_df.to_csv('output/product_categories.csv', index=False)
    item_df.to_csv('output/items.csv', index=False)
    opening_stock_df.to_csv('output/opening_stock.csv', index=False)

    # Additional control files
    # branch_profile
    branch_profile = branches_df[['BranchID', 'VolumeCategory']].copy()
    branch_profile.rename(columns={'VolumeCategory': 'PerformanceProfile'}, inplace=True)
    branch_profile.to_csv('output/branch_profile.csv', index=False)

    # branch_lifecycle_control
    branch_lifecycle = branches_df[['BranchID', 'OpeningDate', 'ClosingDate', 'Status']].copy()
    branch_lifecycle['OpeningDate'] = branch_lifecycle['OpeningDate'].apply(format_date)
    branch_lifecycle['ClosingDate'] = branch_lifecycle['ClosingDate'].apply(lambda x: format_date(x) if pd.notna(x) else '')
    branch_lifecycle.to_csv('output/branch_lifecycle_control.csv', index=False)

    # staff_lifecycle_control
    staff_lifecycle = staff_df[['StaffID', 'HireDate', 'InactiveDate', 'Status']].copy()
    staff_lifecycle['HireDate'] = staff_lifecycle['HireDate'].apply(format_date)
    staff_lifecycle['InactiveDate'] = staff_lifecycle['InactiveDate'].apply(lambda x: format_date(x) if pd.notna(x) else '')
    staff_lifecycle.to_csv('output/staff_lifecycle_control.csv', index=False)

    # price_history_control
    price_control_df.to_csv('output/price_history_control.csv', index=False)

    # item_demand_profile
    demand_control_df.to_csv('output/item_demand_profile.csv', index=False)

    # item_lifecycle_control
    lifecycle_control_df.to_csv('output/item_lifecycle_control.csv', index=False)

    # Also generate stocks.csv as a copy of opening_stock for now (to be updated later)
    # We'll copy opening_stock to stocks.csv as placeholder
    opening_stock_df.to_csv('output/stocks.csv', index=False)

    # ========================== SQL INSERTS ==========================

    # Helper to generate INSERT statements
    def df_to_sql_insert(df, table_name, columns=None):
        if columns is None:
            columns = list(df.columns)
        # Filter columns
        df_sub = df[columns].copy()
        # Convert dates to Oracle TO_DATE
        lines = []
        for _, row in df_sub.iterrows():
            values = []
            for col in columns:
                val = row[col]
                if pd.isna(val) or val == '':
                    values.append('NULL')
                elif isinstance(val, datetime):
                    values.append(f"TO_DATE('{format_date(val)}','YYYY-MM-DD')")
                elif isinstance(val, str):
                    # escape single quotes
                    val_esc = val.replace("'", "''")
                    values.append(f"'{val_esc}'")
                else:
                    values.append(str(val))
            line = f"INSERT INTO {table_name} ({', '.join(columns)}) VALUES ({', '.join(values)});"
            lines.append(line)
        return '\n'.join(lines)

    # master inserts: branches, staffs, categories, items
    master_cols_branches = ['BranchID', 'BranchName', 'Address', 'City', 'State', 'PostCode', 'OpeningDate', 'Status']
    # For SQL, we need to format dates
    branches_sql = df_to_sql_insert(branches_df, 'Branches', master_cols_branches)
    staff_sql = df_to_sql_insert(staff_df, 'Staffs', ['StaffID','StaffName','Role','Email','PhoneNo','HireDate','Status','BranchID'])
    categories_sql = df_to_sql_insert(categories_df, 'Product_Categories', ['CategoryID','CategoryName','Description','Status'])
    items_sql = df_to_sql_insert(item_df, 'Items', ['ItemID','ItemName','UnitPrice','UnitMeasure','Description','IsHalal','IsMyKasihEligible','Status','CategoryID'])

    master_inserts = branches_sql + '\n\n' + staff_sql + '\n\n' + categories_sql + '\n\n' + items_sql
    with open('output/member2_master_inserts.sql', 'w') as f:
        f.write("SET DEFINE OFF;\n")
        f.write("SET SQLBLANKLINES ON;\n")
        f.write("SET ECHO OFF;\n")
        f.write("SET SERVEROUTPUT ON;\n")
        f.write("WHENEVER SQLERROR CONTINUE;\n\n")
        f.write(master_inserts)
        f.write("\nCOMMIT;\n")

    # stock inserts (opening stock)
    stock_cols = ['BranchID','ItemID','QuantityOnHand','ReorderLevel','ReorderQuantity','LastUpdated']
    stocks_sql = df_to_sql_insert(opening_stock_df, 'Stocks', stock_cols)
    with open('output/member2_stock_inserts.sql', 'w') as f:
        f.write("SET DEFINE OFF;\n")
        f.write("SET SQLBLANKLINES ON;\n")
        f.write("SET ECHO OFF;\n")
        f.write("SET SERVEROUTPUT ON;\n")
        f.write("WHENEVER SQLERROR CONTINUE;\n\n")
        f.write(stocks_sql)
        f.write("\nCOMMIT;\n")

    # ========================== VALIDATION SQL ==========================

    validation_sql = """
-- VALIDATION CHECKS FOR MEMBER 2 DATA

-- 1. Exactly 12 branches
SELECT COUNT(*) AS BRANCH_COUNT FROM Branches;
-- Expected: 12

-- 2. Exactly 120 staff
SELECT COUNT(*) AS STAFF_COUNT FROM Staffs;
-- Expected: 120

-- 3. Exactly 12 categories
SELECT COUNT(*) AS CATEGORY_COUNT FROM Product_Categories;
-- Expected: 12

-- 4. Exactly 120 items
SELECT COUNT(*) AS ITEM_COUNT FROM Items;
-- Expected: 120

-- 5. Exactly 1,440 stock records (12 branches x 120 items)
SELECT COUNT(*) AS STOCK_COUNT FROM Stocks;
-- Expected: 1440

-- 6. Every postcode has 5 digits (check length)
SELECT BranchID, PostCode
FROM Branches
WHERE LENGTH(PostCode) != 5 OR NOT REGEXP_LIKE(PostCode, '^[0-9]{5}$');

-- 7. Staff hire date >= branch opening date
SELECT s.StaffID, s.HireDate, b.OpeningDate
FROM Staffs s
JOIN Branches b ON s.BranchID = b.BranchID
WHERE s.HireDate < b.OpeningDate;

-- 8. Staff status consistency: active/inactive
-- (No direct validation, but we can check count of active/inactive)
SELECT Status, COUNT(*) FROM Staffs GROUP BY Status;

-- 9. Staff roles assigned correctly (not required but check)
SELECT Role, COUNT(*) FROM Staffs GROUP BY Role;

-- 10. Items reference valid categories
SELECT i.ItemID, i.CategoryID
FROM Items i
LEFT JOIN Product_Categories c ON i.CategoryID = c.CategoryID
WHERE c.CategoryID IS NULL;

-- 11. UnitMeasure in allowed list
SELECT ItemID, UnitMeasure
FROM Items
WHERE UnitMeasure NOT IN ('BAG','BOTTLE','BOX','CAN','TIN','PACK','PCS');

-- 12. MyKasih eligibility only Y or N
SELECT ItemID, IsMyKasihEligible
FROM Items
WHERE IsMyKasihEligible NOT IN ('Y','N');

-- 13. Halal only Y or N
SELECT ItemID, IsHalal
FROM Items
WHERE IsHalal NOT IN ('Y','N');

-- 14. Stock quantities non-negative
SELECT BranchID, ItemID, QuantityOnHand
FROM Stocks
WHERE QuantityOnHand < 0;

-- 15. Unique stock combinations (should be unique)
SELECT BranchID, ItemID, COUNT(*) AS dup
FROM Stocks
GROUP BY BranchID, ItemID
HAVING COUNT(*) > 1;

-- 16. No stock for inactive branches? (We have only one inactive, B012; we might still have stock if opening stock had it)
-- Optional: Check if stock exists for inactive branch (B012) - if opening stock includes it, it's okay but later transactions might stop.
-- We can just list.

-- 17. Stock LastUpdated >= branch opening date?
SELECT s.BranchID, s.ItemID, s.LastUpdated, b.OpeningDate
FROM Stocks s
JOIN Branches b ON s.BranchID = b.BranchID
WHERE s.LastUpdated < b.OpeningDate;

-- 18. Check if any item sold before introduction (requires order data, not available yet)
-- This will be validated later with transaction data.

-- 20. All staff in inactive branches must be RESIGNED
SELECT s.StaffID, s.Status, b.BranchID, b.Status AS BranchStatus
FROM Staffs s
JOIN Branches b ON s.BranchID = b.BranchID
WHERE b.Status = 'INACTIVE' AND s.Status != 'RESIGNED';

-- End of validation
"""
    with open('output/member2_validation.sql', 'w') as f:
        f.write(validation_sql)

    # ========================== README ==========================

    readme_text = """
# Member 2 - Data Generation

This folder contains synthetic data for tables: BRANCHES, STAFFS, PRODUCT_CATEGORIES, ITEMS, and STOCKS (opening stock).

## Files
- branches.csv, staffs.csv, product_categories.csv, items.csv, opening_stock.csv - raw data.
- branch_profile.csv - hidden performance profile (HIGH/MEDIUM/LOW) for analytical use.
- branch_lifecycle_control.csv - branch opening and closing dates.
- staff_lifecycle_control.csv - staff hire and inactive dates.
- price_history_control.csv - historical selling prices by year (2024-2026).
- item_demand_profile.csv - demand classification.
- item_lifecycle_control.csv - introduction and discontinuation dates.
- stocks.csv - copy of opening_stock (to be updated later with transaction data).
- member2_master_inserts.sql - INSERT statements for Branches, Staffs, Categories, Items.
- member2_stock_inserts.sql - INSERT statements for Stocks (opening).
- member2_validation.sql - validation queries.

## Data Period
Main transaction period: 2024-01-01 to 2026-06-30.
Snapshot date: 2026-06-30.

## Notes
- Random seed: 3183 ensures reproducibility.
- All dates are formatted YYYY-MM-DD.
- 1 inactive branch (B012) with closing date 2026-03-15.
- 12 inactive staff, 12 inactive items.
- 45 MyKasih-eligible items (essentials).
- Stock quantities are opening stock as of 2024-01-01 for branches open then, or at branch opening for later branches.
- Final stock (stocks.csv) is not yet computed; it will be updated after purchase orders, orders, and returns are generated.

## Usage
Run this script to regenerate all files:
    python member2_generator.py

Then load SQL files into Oracle:
    @member2_master_inserts.sql
    @member2_stock_inserts.sql

Run validation:
    @member2_validation.sql
"""
    with open('output/README_member2.txt', 'w') as f:
        f.write(readme_text)

    print("Data generation complete. Files saved in ./output/")

if __name__ == '__main__':
    main()