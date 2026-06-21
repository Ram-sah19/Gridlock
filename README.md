# ASTraM-Intel: AI-Driven Parking Intelligence & Congestion Mitigation System

### target Organization: Bengaluru Traffic Police (BTP)
### Theme: Poor Visibility on Parking-Induced Congestion
### Submission Category: Concept Note, Framework, & Working Prototype (Round 2)

---

## 1. Executive Summary
Bengaluru’s carriageways are heavily congested due to illegal on-street parking and vehicle spillovers, particularly around commercial zones, transit nodes, and IT corridors. Traditional traffic enforcement is reactive and warden-dependent, with no quantitative metric to assess how a specific parking violation affects overall city traffic flow.

**ASTraM-Intel (Safe City Intelligent Traffic Analytics)** resolves this by introducing:
1. **Parking Congestion Index (PCI)**: A custom mathematical model scoring parking violations based on physical vehicle footprint, temporal peak commute factors, and spatial proximity to major junctions.
2. **DBSCAN Spatial Clustering**: An engine that groups individual violations into high-density chokepoints (100m ground radius).
3. **Smart Patrol Dispatch Dashboard**: A real-world interactive front-end dashboard that lists hotspots ranked by cumulative PCI and provides automated dispatch routes for patrol units/tow trucks to proactively clear major turnings and corridors.

---

## 2. Repository Structure
The project folder is organized as follows:
* `index.html`: The **Working Prototype** dashboard. An interactive, dark-themed, glassmorphic single-page web app built with Leaflet.js, Chart.js, and a Patrol Dispatch Simulator.
* `parking_congestion_proposal.md`: The official concept note and solution proposal document.
* `dataset_analysis_report.md`: An automated data analysis report summarizing city-wide statistical trends.
* `parking_congestion_analysis.ipynb`: The complete Python Jupyter Notebook showing dataset cleaning, feature engineering, PCI calculations, DBSCAN clustering, and folium map generation.
* `parking_hotspots_map.html`: The interactive spatial heatmap generated directly from python (using Folium).
* `police_patrol_priority.csv`: The priority ranking CSV of BTP jurisdictions sorted by cumulative PCI.
* `plots/`: Directory containing statistical distributions:
  * `violation_distribution.png`: Frequency chart of violation types.
  * `vehicle_distribution.png`: Frequency chart of offending vehicle classes.
  * `hourly_trend.png`: Distribution of violations over a 24-hour cycle.
  * `weekly_trend.png`: Violation trends by day of the week.
* `btp_dispatch_dashboard.png`: High-fidelity UI mockup of the patrol dashboard.
* `analyze_dataset.py`: The python script that analyzes the raw dataset and outputs the plots and Markdown report.
* `generate_notebook.py`: The script that generates the Jupyter Notebook structure.

---

## 3. The Mathematical Model: Parking Congestion Index (PCI)
For each violation $i$, the traffic obstruction severity is scored as:

$$PCI_i = W_{\text{vehicle}} \times W_{\text{temporal}} \times W_{\text{spatial}} \times W_{\text{validation}}$$

Where:
* **Vehicle Footprint Weight ($W_{\text{vehicle}}$)**: Models blocked road width.
  * *Two-Wheelers (Scooters/Motorcycles)*: $1.0$
  * *Cars, SUVs, Vans*: $3.0$
  * *Buses, HGVs, Lorries*: $10.0$ (critical blockages)
* **Temporal Peak Weight ($W_{\text{temporal}}$)**: Models commute demand.
  * *Peak Hours (08:00 - 11:00 & 17:00 - 20:00)*: $2.0$
  * *Off-Peak Hours*: $1.0$
* **Spatial Proximity Weight ($W_{\text{spatial}}$)**: Models turnings & box junctions blockages.
  * *Near Intersection (within major junction)*: $1.5$
  * *Mid-block*: $1.0$
* **Validation Confidence Weight ($W_{\text{validation}}$)**: Accounts for reporting quality.
  * *Approved/Verified*: $1.0$
  * *Pending Review*: $0.8$
  * *Rejected*: $0.0$ (ignored)

---

## 4. Key Empirical Insights (Validated on 298k Records)
Analysis of the raw BTP logs containing **298,450 records** (Nov 2023 – Apr 2024) reveals:
* **Parking Dominates City Violation Logs**: **95.2%** of all recorded violations are parking-related (Wrong Parking: 47.35%, No Parking: 39.90%, Main Road Parking: 6.87%, Footpath Parking: 1.08%).
* **Primary Offenders**: Scooters (**31.78%**) and Cars (**29.78%**) are the primary vehicle categories.
* **Sunday Surge**: Sunday has the highest daily violation rate (**15.70%**), driven by shoppers near commercial markets.
* **Jurisdiction Hotspots**: Upparpet is the single most congested jurisdiction, representing **11.55%** of city-wide parking violations, followed by Shivajinagar (**9.40%**).
* **DBSCAN Clustering**: The spatial engine identified **265 high-density hotspots** (using a 100m radius and a threshold of at least 50 cases), with Majestic, Shivajinagar, and HAL Old Airport Road/Embassy Tech Village showing the highest cumulative PCI.

---

## 5. How to Run & Verify

### A. Opening the Interactive Prototype (No Setup Required)
1. Locate `index.html` in this folder.
2. Double-click it to open in any web browser (Chrome, Edge, Safari, Firefox).
3. **Features to Test**:
   * Click **Majestic Metro Station** in the prioritized site list. The map will pan to it.
   * Click **"Dispatch Patrol Unit"** in the details card.
   * Watch the patrol unit navigate the streets from BTP HQ, arrive onsite, run towing clearance, and resolve the congestion (reducing the PCI score dynamically on the map and sidebar).
   * Filter the map by jurisdiction or priority using the top-right overlay filters.

### B. Running the Data Pipeline & Notebook
If you have a Python environment set up with pandas, scikit-learn, matplotlib, seaborn, and folium:
1. Run `python analyze_dataset.py` to regenerate the plots and statistical markdown report.
2. Run the notebook `parking_congestion_analysis.ipynb` in VS Code or Jupyter Lab to see the full code execution outputs and view the Folium HTML map.
