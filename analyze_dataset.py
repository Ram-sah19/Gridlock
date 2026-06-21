import os
import json
import pandas as pd
from collections import Counter
import datetime

# Output report path
report_path = "dataset_analysis_report.md"
dataset_path = "jan to may police violation_anonymized791b166.csv"

print("Starting analysis of the dataset...")

if not os.path.exists(dataset_path):
    print(f"Error: Dataset not found at {dataset_path}")
    exit(1)

# Read the CSV (using low_memory=False because it's a large file)
print("Loading CSV into Pandas (this may take a few seconds)...")
df = pd.read_csv(dataset_path, low_memory=False)

print(f"Dataset loaded successfully! Rows: {df.shape[0]}, Columns: {df.shape[1]}")

# Try to import visualization libraries
viz_available = False
try:
    import matplotlib.pyplot as plt
    import seaborn as sns
    viz_available = True
    print("Visualization libraries (matplotlib/seaborn) are available. Will generate plots.")
except ImportError:
    print("matplotlib or seaborn not installed. Skipping plot generation, generating text report only.")

# Helper to parse JSON-like columns safely
def parse_json_list(val):
    if pd.isna(val) or val == 'NULL' or val is None:
        return []
    try:
        # Sometimes it is a string representation of a list: '["WRONG PARKING"]'
        if isinstance(val, str):
            # Clean up double quotes and brackets if standard json load fails
            val_clean = val.strip()
            return json.loads(val_clean)
        return list(val)
    except Exception:
        # Fallback manual parsing if json loads fails
        if isinstance(val, str):
            val = val.replace('[', '').replace(']', '').replace('"', '').replace("'", '')
            return [x.strip() for x in val.split(',') if x.strip()]
        return []

# Process violations
print("Analyzing violations...")
all_violations = []
for val in df['violation_type']:
    all_violations.extend(parse_json_list(val))
violation_counts = Counter(all_violations)

# Process vehicles
print("Analyzing vehicle types...")
vehicle_counts = df['vehicle_type'].value_counts(dropna=False)

# Date/Time analysis
print("Parsing timestamps and analyzing temporal trends...")
df['created_datetime'] = pd.to_datetime(df['created_datetime'], errors='coerce')
df['hour'] = df['created_datetime'].dt.hour
df['day_of_week'] = df['created_datetime'].dt.day_name()
df['month'] = df['created_datetime'].dt.to_period('M').astype(str)

hourly_counts = df['hour'].value_counts().sort_index()
daily_counts = df['day_of_week'].value_counts().reindex(
    ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
)
monthly_counts = df['month'].value_counts().sort_index()

# Spatial hotspots
print("Analyzing spatial hotspots...")
top_locations = df['location'].value_counts().head(10)
top_stations = df['police_station'].value_counts().head(10)
top_junctions = df['junction_name'].value_counts().head(10)

# Validation status
print("Analyzing validation status...")
validation_status = df['validation_status'].value_counts(dropna=False)

# Generate plots if available
if viz_available:
    os.makedirs("plots", exist_ok=True)
    sns.set_theme(style="darkgrid")
    
    # 1. Violation Types
    plt.figure(figsize=(10, 6))
    violation_df = pd.DataFrame(violation_counts.most_common(15), columns=['Violation', 'Count'])
    sns.barplot(x='Count', y='Violation', data=violation_df, palette='viridis')
    plt.title('Top 15 Traffic Violation Types')
    plt.tight_layout()
    plt.savefig('plots/violation_distribution.png')
    plt.close()

    # 2. Vehicle Types
    plt.figure(figsize=(10, 6))
    vehicle_df = vehicle_counts.head(15).reset_index()
    vehicle_df.columns = ['Vehicle Type', 'Count']
    sns.barplot(x='Count', y='Vehicle Type', data=vehicle_df, palette='magma')
    plt.title('Top 15 Vehicle Types Involved')
    plt.tight_layout()
    plt.savefig('plots/vehicle_distribution.png')
    plt.close()

    # 3. Hourly trends
    plt.figure(figsize=(10, 5))
    sns.lineplot(x=hourly_counts.index, y=hourly_counts.values, marker='o', color='b', linewidth=2.5)
    plt.title('Hourly Violation Trends (Time of Day)')
    plt.xlabel('Hour of Day (24h)')
    plt.ylabel('Number of Violations')
    plt.xticks(range(0, 24))
    plt.tight_layout()
    plt.savefig('plots/hourly_trend.png')
    plt.close()

    # 4. Weekly trends
    plt.figure(figsize=(10, 5))
    sns.barplot(x=daily_counts.index, y=daily_counts.values, palette='coolwarm')
    plt.title('Violations by Day of the Week')
    plt.xlabel('Day of Week')
    plt.ylabel('Number of Violations')
    plt.tight_layout()
    plt.savefig('plots/weekly_trend.png')
    plt.close()

# Generate the Markdown Report
print("Generating Markdown report...")
report_content = f"""# Traffic Violations Dataset Analysis Report

This report presents an automated analysis of the Bengaluru traffic violations dataset: `jan to may police violation_anonymized791b166.csv`.

---

## 1. Dataset Overview

*   **Total Records**: {df.shape[0]:,}
*   **Total Features**: {df.shape[1]}
*   **Columns**: {', '.join(df.columns.tolist())}
*   **Time Period Detected**: {df['created_datetime'].min()} to {df['created_datetime'].max()}

---

## 2. Key Statistical Insights

### Top 15 Traffic Violations
| Rank | Violation Type | Count | Percentage |
| :--- | :--- | :--- | :--- |
"""

total_violations_sum = sum(violation_counts.values())
for i, (viol, count) in enumerate(violation_counts.most_common(15), 1):
    pct = (count / total_violations_sum) * 100 if total_violations_sum > 0 else 0
    report_content += f"| {i} | {viol} | {count:,} | {pct:.2f}% |\n"

report_content += """
### Top 15 Vehicle Types Involved
| Rank | Vehicle Type | Count | Percentage |
| :--- | :--- | :--- | :--- |
"""

total_vehicles_sum = df['vehicle_type'].count()
for i, (veh, count) in enumerate(vehicle_counts.head(15).items(), 1):
    pct = (count / total_vehicles_sum) * 100 if total_vehicles_sum > 0 else 0
    # Handle NaN values safely
    veh_name = str(veh) if not pd.isna(veh) else "UNKNOWN/NULL"
    report_content += f"| {i} | {veh_name} | {count:,} | {pct:.2f}% |\n"

report_content += """
---

## 3. Spatial Analysis (Hotspots)

### Top 10 Police Station Jurisdictions
| Jurisdiction | Violation Count | Percentage |
| :--- | :--- | :--- |
"""
for station, count in top_stations.items():
    pct = (count / len(df)) * 100
    report_content += f"| {station} | {count:,} | {pct:.2f}% |\n"

report_content += """
### Top 10 Hotspot Locations
| Location Address | Violation Count |
| :--- | :--- |
"""
for loc, count in top_locations.items():
    report_content += f"| {loc} | {count:,} |\n"

report_content += """
### Top 10 Active Junctions
| Junction Name | Violation Count |
| :--- | :--- |
"""
for junc, count in top_junctions.items():
    junc_name = str(junc) if not pd.isna(junc) else "No Junction Specified"
    report_content += f"| {junc_name} | {count:,} |\n"

report_content += """
---

## 4. Temporal Analysis (When do violations happen?)

### Violations by Day of Week
| Day of Week | Count | Percentage |
| :--- | :--- | :--- |
"""
for day, count in daily_counts.items():
    pct = (count / len(df)) * 100 if len(df) > 0 else 0
    report_content += f"| {day} | {count:,} | {pct:.2f}% |\n"

report_content += """
### Violations by Month (Trend)
| Month | Count |
| :--- | :--- |
"""
for month, count in monthly_counts.items():
    report_content += f"| {month} | {count:,} |\n"

report_content += """
---

## 5. Validation Status (Police Verification)
| Validation Status | Count | Percentage |
| :--- | :--- | :--- |
"""
for status, count in validation_status.items():
    pct = (count / len(df)) * 100
    status_name = str(status) if not pd.isna(status) else "PENDING/NULL"
    report_content += f"| {status_name} | {count:,} | {pct:.2f}% |\n"

if viz_available:
    report_content += """
---

## 6. Visualizations

The following plots have been generated and saved in the `plots/` directory:
*   **Violation Distribution**: `plots/violation_distribution.png`
*   **Vehicle Distribution**: `plots/vehicle_distribution.png`
*   **Hourly Trend**: `plots/hourly_trend.png`
*   **Weekly Trend**: `plots/weekly_trend.png`
"""

with open(report_path, "w", encoding="utf-8") as f:
    f.write(report_content)

print(f"Analysis complete! Report written to {report_path}")
