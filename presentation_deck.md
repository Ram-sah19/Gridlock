# Pitch Deck Outline: ASTraM-Intel (BTP Dispatch Dashboard)

This document provides a slide-by-slide layout for a **10-slide Presentation Deck** to submit on the HackerEarth portal alongside your proposal and prototype code. 

---

### Slide 1: Title Slide
* **Slide Title**: ASTraM-Intel: AI-Driven Parking Intelligence & Congestion Mitigation System
* **Sub-title**: Proactive Patrol Dispatching & Congestion Scoring for Bengaluru Traffic Police (BTP)
* **Team Name**: [Your Team Name]
* **Visuals**: BTP Logo, screenshot of the interactive `index.html` dashboard mockup in dark mode.

---

### Slide 2: The Gridlock Challenge
* **Slide Title**: Operational Bottlenecks: Why City Traffic Chokes
* **Key Bullet Points**:
  * **Reactive & Manual Patrols**: Wardens search roads blindly; enforcement arrives after gridlocks propagate upstream.
  * **No Impact Metric**: A scooter parked on a side-street is treated with the same urgency as a truck blocking a major turning.
  * **Inefficient Towing Allocation**: Resources are dispatched based on intuition rather than historical hotspot density.
* **Core Metric**: **95.2%** of all BTP traffic violation logs are parking-related, confirming it is the primary driver of city congestion.

---

### Slide 3: The ASTraM-Intel Framework
* **Slide Title**: ASTraM-Intel: Safe City Intelligent Traffic Analytics
* **Key Bullet Points**:
  * **Edge AI Module**: Existing CCTV traffic feeds detect stationary duration and classify vehicles.
  * **PCI Engine**: Scores the obstruction severity in real-time.
  * **DBSCAN Clustering**: Combines individual violations within a 100m radius into active hotspots.
  * **Command Dispatch**: Renders prioritized patrol routes and ETAs for warden units.
* **Visuals**: A flowchart showing CCTV Feed ➔ Vehicle Detection ➔ PCI Processing ➔ DBSCAN Clustering ➔ Warden Dispatch.

---

### Slide 4: The Mathematical Model: PCI
* **Slide Title**: Quantifying Obstruction: The Parking Congestion Index
* **The Formula**: 
  $$PCI_i = W_{\text{vehicle}} \times W_{\text{temporal}} \times W_{\text{spatial}} \times W_{\text{validation}}$$
* **Weight Breakdown**:
  * **Vehicle Footprint ($W_{\text{vehicle}}$)**: Scooter ($1.0$), Car ($3.0$), Bus/HGV ($10.0$ - blocks entire lanes).
  * **Temporal Demand ($W_{\text{temporal}}$)**: Peak Commute Hours ($2.0$), Off-Peak ($1.0$).
  * **Spatial Proximity ($W_{\text{spatial}}$)**: Near Intersections/Junction Box ($1.5$), Mid-block ($1.0$).
  * **Data Quality ($W_{\text{validation}}$)**: Approved ($1.0$), Pending ($0.8$), Rejected ($0.0$).

---

### Slide 5: Empirical Validation (Dataset Insights)
* **Slide Title**: Data-Backed Proof: Analysis of 298,450 BTP Records
* **Key Findings**:
  * **Peak Offenders**: Scooters ($31.78\%$) and Cars ($29.78\%$) dominate parking violations.
  * **Temporal Trends**: Sundays are the most congested days ($15.70\%$) due to commercial shopping surges.
  * **Chokepoint Jurisdictions**: Upparpet jurisdiction represents **$11.55\%$** of all violations, followed by Shivajinagar ($9.40\%$).
* **Visuals**: Small bar charts of weekly trends and vehicle distribution (saved in the `plots/` folder).

---

### Slide 6: Spatial Hotspot Clustering
* **Slide Title**: DBSCAN Clustering: Identifying Chokepoints
* **Methodology**:
  * Run DBSCAN on valid coordinates ($\epsilon = 100\text{ meters}$, $\text{min\_samples} = 50$).
  * Centroids are snapped to actual road corridors by selecting the coordinate of the violation with the highest PCI in that cluster.
* **Results**: Identified **265 high-density hotspots** city-wide.
  * *Top hotspots*: Majestic Metro Junction, Shivajinagar Bus Station, New Horizon College Road, and Embassy Tech Village (Kadubeesanahalli).

---

### Slide 7: Working Prototype: BTP Dispatch Command
* **Slide Title**: Working Prototype: Interactive Patrol Command
* **Key Features of the Prototype (`index.html`)**:
  * **Dark Mode Grid Map**: Interactive Leaflet map displaying active hotspots and jurisdiction boundaries.
  * **Prioritized Site Queue**: Hotspots sorted by cumulative PCI, allowing command to focus on the worst chokepoints first.
  * **Live Alert Feed**: Logs simulated reports and sensor validation logs in real-time.
* **Visuals**: Screenshot highlighting the sidebar controls and Leaflet map markers.

---

### Slide 8: Live Patrol Dispatch Simulator
* **Slide Title**: Simulated Enforcement Loop: Proactive Clearing
* **Interactive Simulator Flow**:
  1. Operator clicks **"Dispatch Patrol Unit"** on a high-severity hotspot.
  2. A patrol car marker emerges from BTP HQ and **animates along a routing path** on the map.
  3. UI displays a live travel progress bar and ETA countdown.
  4. On arrival, the warden enters the towing phase. The gridlock clears, and the hotspot's PCI is reduced by 85%, resolving command metrics.
* **Visuals**: Animated GIF or video clip of the patrol car moving on the dashboard map.

---

### Slide 9: Impact & Value Proposition
* **Slide Title**: Expected Outcomes & BTP Operational Value
* **Key Benefits**:
  * **Targeted Wardens**: Reduces patrol mileage and optimizes towing resources by routing them to the highest-priority chokepoints.
  * **Junction Clearance**: Proactive clearing of buses/cars parked near box junctions prevents gridlocks before they propagate.
  * **Quantifiable Enforcement**: Jurisdictions can track their cumulative PCI over time, measuring the direct effectiveness of traffic campaigns.

---

### Slide 10: Future Roadmap & Technical Stack
* **Slide Title**: System Scalability & Onsite Finale
* **Technical Stack**:
  * *Data/ML*: Python, Scikit-Learn (DBSCAN), Pandas, Folium, YOLOv8-nano.
  * *Prototype Frontend*: HTML5, Vanilla CSS3 (Glassmorphism), Leaflet.js, Chart.js.
  * *Production Plan*: Integration with BTP ASTraM app and WhatsApp chatbot.
* **Ready for July 3**: The working prototype is fully operational and ready for live demonstration at the onsite finale!
