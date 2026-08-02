
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
