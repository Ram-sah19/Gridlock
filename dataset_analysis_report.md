# Traffic Violations Dataset Analysis Report

This report presents an automated analysis of the Bengaluru traffic violations dataset: `jan to may police violation_anonymized791b166.csv`.

---

## 1. Dataset Overview

*   **Total Records**: 298,450
*   **Total Features**: 27
*   **Columns**: id, latitude, longitude, location, vehicle_number, vehicle_type, description, violation_type, offence_code, created_datetime, closed_datetime, modified_datetime, device_id, created_by_id, center_code, police_station, data_sent_to_scita, junction_name, action_taken_timestamp, data_sent_to_scita_timestamp, updated_vehicle_number, updated_vehicle_type, validation_status, validation_timestamp, hour, day_of_week, month
*   **Time Period Detected**: 2023-11-09 19:11:46+00:00 to 2024-04-08 17:30:46+00:00

---

## 2. Key Statistical Insights

### Top 15 Traffic Violations
| Rank | Violation Type | Count | Percentage |
| :--- | :--- | :--- | :--- |
| 1 | WRONG PARKING | 164,977 | 47.35% |
| 2 | NO PARKING | 139,050 | 39.90% |
| 3 | PARKING IN A MAIN ROAD | 23,943 | 6.87% |
| 4 | DEFECTIVE NUMBER PLATE | 7,848 | 2.25% |
| 5 | PARKING ON FOOTPATH | 3,757 | 1.08% |
| 6 | PARKING NEAR BUSTOP/SCHOOL/HOSPITAL ETC | 2,403 | 0.69% |
| 7 | DOUBLE PARKING | 2,037 | 0.58% |
| 8 | PARKING NEAR ROAD CROSSING | 1,687 | 0.48% |
| 9 | REFUSE TO GO FOR HIRE | 887 | 0.25% |
| 10 | PARKING NEAR TRAFFIC LIGHT OR ZEBRA CROSS | 525 | 0.15% |
| 11 | PARKING OPPOSITE TO ANOTHER PARKED VEHICLE | 486 | 0.14% |
| 12 | USING BLACK FILM/OTHER MATERIALS | 248 | 0.07% |
| 13 | PARKING OTHER THAN BUS STOP | 242 | 0.07% |
| 14 | DEMANDING EXCESS FARE | 240 | 0.07% |
| 15 | WITHOUT SIDE MIRROR | 47 | 0.01% |

### Top 15 Vehicle Types Involved
| Rank | Vehicle Type | Count | Percentage |
| :--- | :--- | :--- | :--- |
| 1 | SCOOTER | 94,856 | 31.78% |
| 2 | CAR | 88,870 | 29.78% |
| 3 | MOTOR CYCLE | 40,811 | 13.67% |
| 4 | PASSENGER AUTO | 37,813 | 12.67% |
| 5 | MAXI-CAB | 11,372 | 3.81% |
| 6 | LGV | 8,255 | 2.77% |
| 7 | GOODS AUTO | 2,934 | 0.98% |
| 8 | MOPED | 2,199 | 0.74% |
| 9 | PRIVATE BUS | 1,633 | 0.55% |
| 10 | VAN | 1,466 | 0.49% |
| 11 | TEMPO | 1,368 | 0.46% |
| 12 | BUS (BMTC/KSRTC) | 1,281 | 0.43% |
| 13 | HGV | 1,144 | 0.38% |
| 14 | LORRY/GOODS VEHICLE | 1,122 | 0.38% |
| 15 | JEEP | 913 | 0.31% |

---

## 3. Spatial Analysis (Hotspots)

### Top 10 Police Station Jurisdictions
| Jurisdiction | Violation Count | Percentage |
| :--- | :--- | :--- |
| Upparpet | 34,468 | 11.55% |
| Shivajinagar | 28,044 | 9.40% |
| Malleshwaram | 22,200 | 7.44% |
| HAL Old Airport | 20,819 | 6.98% |
| City Market | 17,646 | 5.91% |
| Vijayanagara | 14,652 | 4.91% |
| Rajajinagar | 10,998 | 3.69% |
| Kodigehalli | 10,916 | 3.66% |
| Magadi Road | 8,558 | 2.87% |
| Jeevanbheemanagar | 6,736 | 2.26% |

### Top 10 Hotspot Locations
| Location Address | Violation Count |
| :--- | :--- |
| Unnamed Road, Begur Chikkanahalli, Bengaluru, Karnataka. Pin-562149 (India) | 4,090 |
| Kamaraj Road, Sri Nagamma Devi Circle, Sivanchetti Gardens, Bengaluru, Karnataka. Pin-560042 (India) | 3,999 |
| New Horizon College Road, New Horizon College of Engineering, Kadubisanahalli, Bengaluru, Karnataka. Pin-560103 (India) | 3,785 |
| MBT Road, Devasandra Junction, KR Puram, Bengaluru, Karnataka. Pin-560036 (India) | 3,027 |
| Dispensary Road, Tasker Town, Shivaji Nagar, Bengaluru, Karnataka. Pin-560001 (India) | 2,670 |
| Bellary Road, Vinayaka Nagar, Hebbal, Bengaluru, Karnataka. Pin-560024 (India) | 2,639 |
| 5th Main Road, Kempe Gowda Circle, Gandhi Nagar, Bengaluru, Karnataka. Pin-560009 (India) | 2,604 |
| Main Guard Cross Road, Tasker Town, Shivaji Nagar, Bengaluru, Karnataka. Pin-560001 (India) | 2,549 |
| New Horizon College Road, Embassy Tech Village, Devara Beesana Halli, Bengaluru, Karnataka. Pin-560103 (India) | 2,416 |
| 3rd Cross Road, Kempegowda Extension, Chickpete, Bengaluru, Karnataka. Pin-560009 (India) | 2,315 |

### Top 10 Active Junctions
| Junction Name | Violation Count |
| :--- | :--- |
| No Junction | 147,880 |
| BTP051 - Safina Plaza Junction | 15,449 |
| BTP082 - KR Market Junction | 11,538 |
| BTP040 - Elite Junction | 10,718 |
| BTP044 - Sagar Theatre Junction | 10,549 |
| BTP211 - Central Street Junction | 5,388 |
| BTP058 - Subbanna Junction | 5,189 |
| BTP027 - Modi Bridge Junction | 4,584 |
| BTP020 - Hosahalli Metro Station | 4,101 |
| BTP057 - Anand Rao Junction | 3,935 |

---

## 4. Temporal Analysis (When do violations happen?)

### Violations by Day of Week
| Day of Week | Count | Percentage |
| :--- | :--- | :--- |
| Monday | 38,931 | 13.04% |
| Tuesday | 42,929 | 14.38% |
| Wednesday | 43,065 | 14.43% |
| Thursday | 41,528 | 13.91% |
| Friday | 41,702 | 13.97% |
| Saturday | 43,427 | 14.55% |
| Sunday | 46,863 | 15.70% |

### Violations by Month (Trend)
| Month | Count |
| :--- | :--- |
| 2023-11 | 44,117 |
| 2023-12 | 63,554 |
| 2024-01 | 65,813 |
| 2024-02 | 54,650 |
| 2024-03 | 55,229 |
| 2024-04 | 15,082 |
| NaT | 5 |

---

## 5. Validation Status (Police Verification)
| Validation Status | Count | Percentage |
| :--- | :--- | :--- |
| PENDING/NULL | 125,254 | 41.97% |
| approved | 115,400 | 38.67% |
| rejected | 49,754 | 16.67% |
| created1 | 7,044 | 2.36% |
| processing | 678 | 0.23% |
| duplicate | 320 | 0.11% |

---

## 6. Visualizations

The following plots have been generated and saved in the `plots/` directory:
*   **Violation Distribution**: `plots/violation_distribution.png`
*   **Vehicle Distribution**: `plots/vehicle_distribution.png`
*   **Hourly Trend**: `plots/hourly_trend.png`
*   **Weekly Trend**: `plots/weekly_trend.png`
