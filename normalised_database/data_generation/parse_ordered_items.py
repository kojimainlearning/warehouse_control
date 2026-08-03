import csv
import re

# Update file names as needed
input_sql_file = "ZhenHao/order_item_inserts.sql"
output_csv_file = "ordered_items_output.csv"

# Regex pattern to capture all 6 columns, handling strings, numbers, and NULL values
pattern = re.compile(
    r"VALUES\s*\(\s*"
    r"(?:'((?:''|[^'])*)'|(NULL)),\s*"  # 1 (value) or 2 (NULL): OrderID
    r"(?:'((?:''|[^'])*)'|(NULL)),\s*"  # 3 (value) or 4 (NULL): ItemID
    r"([\d\.\-]+|NULL),\s*"  # 5: Quantity
    r"([\d\.\-]+|NULL),\s*"  # 6: UnitPrice
    r"([\d\.\-]+|NULL),\s*"  # 7: MyKasihSubsidyAmount
    r"([\d\.\-]+|NULL)\s*\);"  # 8: LineTotal
)

# Header matching all table columns
headers = [
    "OrderID",
    "ItemID",
    "Quantity",
    "UnitPrice",
    "MyKasihSubsidyAmount",
    "LineTotal",
]


def parse_ordered_items(sql_file_path, csv_file_path):
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
                order_id = (
                    match.group(1).replace("''", "'")
                    if match.group(1) is not None
                    else match.group(2)
                )
                item_id = (
                    match.group(3).replace("''", "'")
                    if match.group(3) is not None
                    else match.group(4)
                )
                quantity = match.group(5)
                unit_price = match.group(6)
                subsidy_amount = match.group(7)
                line_total = match.group(8)

                row = [
                    order_id,
                    item_id,
                    quantity,
                    unit_price,
                    subsidy_amount,
                    line_total,
                ]

                writer.writerow(row)
                processed_count += 1

    print(
        f"Conversion complete! Successfully exported {processed_count:,} rows to '{csv_file_path}'."
    )


if __name__ == "__main__":
    parse_ordered_items(input_sql_file, output_csv_file)