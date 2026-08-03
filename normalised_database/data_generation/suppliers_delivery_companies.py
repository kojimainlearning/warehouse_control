import random
import csv
import os
from datetime import datetime, timedelta

def escape_sql(val):
    """Helper to escape values for Oracle SQL INSERT statements."""
    if val is None:
        return "NULL"
    if isinstance(val, (int, float)):
        return str(val)
    if isinstance(val, datetime):
        return f"TO_DATE('{val.strftime('%Y-%m-%d')}', 'YYYY-MM-DD')"
    return "'" + str(val).replace("'", "''") + "'"

# Comprehensive mapping for Malaysian States, Cities, Area Codes, and Postcode Ranges
# Based on the provided Postcodes.pdf and regional telecommunications data
states_info = {
    "Kuala Lumpur": {"cities": ["Kuala Lumpur", "KLCC", "Bukit Bintang", "Cheras", "Kepong"], "area_code": "3", "pc_range": (50000, 59999)},
    "Selangor": {"cities": ["Shah Alam", "Petaling Jaya", "Subang Jaya", "Klang", "Kajang"], "area_code": "3", "pc_range": (40000, 49999)},
    "Putrajaya": {"cities": ["Putrajaya"], "area_code": "3", "pc_range": (62000, 62999)},
    "Penang": {"cities": ["Georgetown", "Bayan Lepas", "Butterworth", "Bukit Mertajam"], "area_code": "4", "pc_range": (10000, 14999)},
    "Kedah": {"cities": ["Alor Setar", "Sungai Petani", "Kulim", "Langkawi"], "area_code": "4", "pc_range": (5000, 9999)},
    "Perlis": {"cities": ["Kangar", "Arau"], "area_code": "4", "pc_range": (1000, 2999)},
    "Perak": {"cities": ["Ipoh", "Taiping", "Manjung", "Kampar"], "area_code": "5", "pc_range": (30000, 39999)},
    "Negeri Sembilan": {"cities": ["Seremban", "Port Dickson", "Nilai", "Bahau"], "area_code": "6", "pc_range": (70000, 73999)},
    "Melaka": {"cities": ["Melaka City", "Ayer Keroh", "Alor Gajah", "Jasin"], "area_code": "6", "pc_range": (75000, 78999)},
    "Johor": {"cities": ["Johor Bahru", "Iskandar Puteri", "Kluang", "Batu Pahat", "Muar"], "area_code": "7", "pc_range": (79000, 86999)},
    "Pahang": {"cities": ["Kuantan", "Temerloh", "Bentong", "Cameron Highlands"], "area_code": "9", "pc_range": (25000, 28999)},
    "Terengganu": {"cities": ["Kuala Terengganu", "Chukai", "Dungun", "Marang"], "area_code": "9", "pc_range": (20000, 24999)},
    "Kelantan": {"cities": ["Kota Bharu", "Pasir Mas", "Tanah Merah", "Machang"], "area_code": "9", "pc_range": (15000, 18999)},
    "Sabah": {"cities": ["Kota Kinabalu", "Sandakan", "Tawau", "Lahad Datu"], "area_code": "88", "pc_range": (88000, 91999)},
    "Sarawak": {"cities": ["Kuching", "Miri", "Sibu", "Bintulu"], "area_code": "88", "pc_range": (93000, 98999)},
    "Labuan": {"cities": ["Victoria"], "area_code": "88", "pc_range": (87000, 87999)}
}

def generate_phone(state):
    """Generates a Malaysian phone number matching region-specific area codes and DDL regex."""
    area_code = states_info[state]["area_code"]
    # Sabah, Sarawak, Labuan use '88' (2 digits), others use 1 digit. 
    # Total digits after +60 must be 10 to satisfy ^[+]60[0-9]{8,10}$
    if area_code == '88':
        remaining_digits = ''.join([str(random.randint(0, 9)) for _ in range(8)])
    else:
        remaining_digits = ''.join([str(random.randint(0, 9)) for _ in range(9)])
    return f"+60{area_code}{remaining_digits}"

def generate_postcode(state):
    """Generates a 5-digit postcode matching the specific state's range from the PDF."""
    min_pc, max_pc = states_info[state]["pc_range"]
    return str(random.randint(min_pc, max_pc)).zfill(5)

def generate_email(name):
    """Generates a valid email address matching the DDL regex."""
    clean_name = "".join(c for c in name if c.isalnum() or c in [' ', '-']).replace(' ', '').lower()
    if not clean_name:
        clean_name = "company"
    return f"{clean_name}@com.my"

def main():
    # Set the random seed for reproducibility
    random.seed(3183)
    
    # --- Configuration & Constants ---
    supplier_names = [
        "Dairy Fresh Sdn Bhd", "Sinar Padi Enterprise", "Green Harvest Trading",
        "Frozen Foods Malaysia", "Clean & Clear Resources", "Global Grocery Supply",
        "Nusa Kitchen Supplies", "Dry Goods Trading Co", "Arctic Chill Logistics",
        "Farm to Table Sdn Bhd", "Home Essentials Enterprise", "Legacy Foods Sdn Bhd"
    ]

    # Profiles: (ReliabilityProfile, NormalLeadTimeDays, LateDeliveryProbability, CancellationProbability)
    supplier_profiles_data = [
        ("Highly Reliable", 3, 0.02, 0.01),
        ("Highly Reliable", 3, 0.02, 0.01),
        ("Highly Reliable", 3, 0.02, 0.01),
        ("Average", 5, 0.15, 0.05),
        ("Average", 5, 0.15, 0.05),
        ("Average", 5, 0.15, 0.05),
        ("Average", 5, 0.15, 0.05),
        ("Average", 5, 0.15, 0.05),
        ("Frequent Delays", 7, 0.40, 0.05),
        ("Frequent Delays", 7, 0.40, 0.05),
        ("High Cancellation", 5, 0.20, 0.25),
        ("Historical", 6, 0.30, 0.10)
    ]

    # Sensible category mappings
    categories_mapping = [
        ["CAT01"], ["CAT04"], ["CAT05"], ["CAT02"], ["CAT03"],
        ["CAT01", "CAT04", "CAT05"], ["CAT02", "CAT03"], ["CAT04"],
        ["CAT02"], ["CAT05"], ["CAT03"], ["CAT01"]
    ]
    
    inactive_date_sup = datetime(2024, 8, 15)

    dc_names = [
        "SwiftSend Logistics", "NusaExpress", "FastTrack Delivery", "UrbanParcel",
        "EcoShip Sdn Bhd", "MegaCourier", "BudgetFreight", "SlowButSure Logistics",
        "RiskyRoutes Delivery", "Heritage Transport"
    ]

    # Profiles: (PerformanceProfile, BaseFee, DistanceFeeRule, ExpectedDuration, FailureProbability)
    dc_profiles_data = [
        ("Premium & Reliable", 10.00, "RM 1.00 per km", 1, 0.01),
        ("Premium & Reliable", 10.00, "RM 1.00 per km", 1, 0.01),
        ("Average", 6.00, "RM 0.80 per km", 2, 0.05),
        ("Average", 6.00, "RM 0.80 per km", 2, 0.05),
        ("Average", 6.00, "RM 0.80 per km", 2, 0.05),
        ("Average", 6.00, "RM 0.80 per km", 2, 0.05),
        ("Lower-cost & Slower", 4.00, "RM 0.50 per km", 4, 0.08),
        ("Lower-cost & Slower", 4.00, "RM 0.50 per km", 4, 0.08),
        ("High Failure Rate", 5.00, "RM 0.70 per km", 3, 0.25),
        ("Historical", 5.00, "RM 0.60 per km", 3, 0.10)
    ]
    
    inactive_date_dc1 = datetime(2024, 11, 10)
    inactive_date_dc2 = datetime(2025, 2, 20)

    # --- Data Generation ---
    suppliers = []
    supplier_profiles = []
    supplier_categories = []
    
    states_list = list(states_info.keys())

    for i in range(12):
        sup_id = f"SUP{str(i+1).zfill(3)}"
        name = supplier_names[i]
        state = random.choice(states_list)
        city = random.choice(states_info[state]["cities"])
        
        status = "INACTIVE" if i == 11 else "ACTIVE"
        inactive_date = inactive_date_sup if i == 11 else None
        
        # Generate Supplier Record (Strictly DDL Columns)
        suppliers.append({
            "SupplierID": sup_id,
            "SupplierName": name,
            "PhoneNo": generate_phone(state),
            "Email": generate_email(name),
            "Address": f"No. {random.randint(1, 99)}, Jalan {name.split()[0]} {random.randint(1, 20)}",
            "City": city,
            "State": state,
            "PostCode": generate_postcode(state),
            "Status": status
        })
        
        # Generate Profile Record (Analytical Control Values)
        prof = supplier_profiles_data[i]
        supplier_profiles.append({
            "SupplierID": sup_id,
            "ReliabilityProfile": prof[0],
            "NormalLeadTimeDays": prof[1],
            "LateDeliveryProbability": prof[2],
            "CancellationProbability": prof[3],
            "SupportedCategoryIDs": ",".join(categories_mapping[i]),
            "InactiveDate": inactive_date.strftime('%Y-%m-%d') if inactive_date else ""
        })
        
        # Generate Category Mapping Records
        for cat in categories_mapping[i]:
            supplier_categories.append([sup_id, cat])

    delivery_companies = []
    dc_profiles = []
    
    for i in range(10):
        dc_id = f"DC{str(i+1).zfill(3)}"
        name = dc_names[i]
        
        # 8 Active, 2 Inactive (DC009 and DC010)
        status = "INACTIVE" if i >= 8 else "ACTIVE"
        inactive_date = None
        if i == 8:
            inactive_date = inactive_date_dc1
        elif i == 9:
            inactive_date = inactive_date_dc2
            
        active_from = datetime(2022, 1, 1) if i == 9 else datetime(2023, random.randint(1, 12), random.randint(1, 28))
        
        # Generate Delivery Company Record (Strictly DDL Columns)
        delivery_companies.append({
            "DeliveryCompanyID": dc_id,
            "CompanyName": name,
            "PhoneNo": generate_phone(random.choice(states_list)),
            "Email": generate_email(name),
            "Status": status
        })
        
        # Generate Profile Record (Analytical Control Values)
        prof = dc_profiles_data[i]
        dc_profiles.append({
            "DeliveryCompanyID": dc_id,
            "PerformanceProfile": prof[0],
            "BaseFee": prof[1],
            "DistanceFeeRule": prof[2],
            "ExpectedDuration": prof[3],
            "FailureProbability": prof[4],
            "ActiveFrom": active_from.strftime('%Y-%m-%d'),
            "InactiveDate": inactive_date.strftime('%Y-%m-%d') if inactive_date else ""
        })

    # --- Validation ---
    if len(suppliers) != 12:
        raise ValueError(f"Dependency Error: Expected exactly 12 suppliers, but generated {len(suppliers)}.")
    if len(delivery_companies) != 10:
        raise ValueError(f"Dependency Error: Expected exactly 10 delivery companies, but generated {len(delivery_companies)}.")

    # --- Export CSVs ---
    with open("supplier_profile.csv", "w", newline='') as f:
        writer = csv.DictWriter(f, fieldnames=["SupplierID", "ReliabilityProfile", "NormalLeadTimeDays", "LateDeliveryProbability", "CancellationProbability", "SupportedCategoryIDs", "InactiveDate"])
        writer.writeheader()
        writer.writerows(supplier_profiles)

    with open("supplier_category_mapping.csv", "w", newline='') as f:
        writer = csv.writer(f)
        writer.writerow(["SupplierID", "CategoryID"])
        writer.writerows(supplier_categories)

    with open("delivery_company_profile.csv", "w", newline='') as f:
        writer = csv.DictWriter(f, fieldnames=["DeliveryCompanyID", "PerformanceProfile", "BaseFee", "DistanceFeeRule", "ExpectedDuration", "FailureProbability", "ActiveFrom", "InactiveDate"])
        writer.writeheader()
        writer.writerows(dc_profiles)

    # --- Generate Oracle SQL ---
    with open("insert_suppliers_delivery_companies.sql", "w") as f:
        f.write("-- Generated SQL for Suppliers and Delivery_Companies\n")
        f.write("-- Snapshot Date: 30 June 2026\n\n")
        
        for s in suppliers:
            cols = ", ".join(s.keys())
            vals = ", ".join([escape_sql(v) for v in s.values()])
            f.write(f"INSERT INTO Suppliers ({cols})\nVALUES ({vals});\n")
            
        f.write("\n")
        
        for dc in delivery_companies:
            cols = ", ".join(dc.keys())
            vals = ", ".join([escape_sql(v) for v in dc.values()])
            f.write(f"INSERT INTO Delivery_Companies ({cols})\nVALUES ({vals});\n")
            
        f.write("\nCOMMIT;\n")

    print("Successfully generated synthetic data and SQL scripts.")
    print("Files created:")
    print(" - supplier_profile.csv")
    print(" - supplier_category_mapping.csv")
    print(" - delivery_company_profile.csv")
    print(" - insert_suppliers_delivery_companies.sql")

if __name__ == "__main__":
    main()