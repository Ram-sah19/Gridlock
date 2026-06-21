Sub CreateASTraMIntelPresentation()
    Dim pptApp As Object
    Dim pptPres As Object
    Dim slideIndex As Integer
    
    ' Colors (BTP Dark Theme Palette)
    Dim bgCol As Long: bgCol = RGB(14, 22, 36)      ' Dark navy background (#0E1624)
    Dim titleCol As Long: titleCol = RGB(243, 244, 246) ' Off-white title (#F3F4F6)
    Dim textCol As Long: textCol = RGB(156, 163, 175)  ' Muted gray body (#9CA3AF)
    Dim accentBlue As Long: accentBlue = RGB(0, 122, 255) ' Neon blue accent (#007AFF)
    Dim accentRed As Long: accentRed = RGB(255, 59, 48)  ' Neon red accent (#FF3B30)
    
    Set pptPres = ActivePresentation
    
    ' Clear existing slides
    Dim i As Integer
    For i = pptPres.Slides.Count To 1 Step -1
        pptPres.Slides(i).Delete
    Next i
    
    ' =========================================================================
    ' SLIDE 1: TITLE SLIDE
    ' =========================================================================
    Dim slide1 As Slide
    Set slide1 = pptPres.Slides.Add(1, ppLayoutBlank)
    slide1.Background.Fill.Solid
    slide1.Background.Fill.ForeColor.RGB = bgCol
    
    ' Title text box
    Dim titleBox1 As Shape
    Set titleBox1 = slide1.Shapes.AddTextbox(msoOrientationHorizontal, 50, 150, 860, 150)
    With titleBox1.TextFrame
        .TextRange.Text = "ASTraM-Intel: AI-Driven Parking Intelligence" & vbCrLf & "& Congestion Mitigation System"
        .TextRange.Font.Name = "Outfit"
        .TextRange.Font.Size = 40
        .TextRange.Font.Bold = True
        .TextRange.Font.Color.RGB = titleCol
    End With
    
    ' Subtitle text box
    Dim subBox1 As Shape
    Set subBox1 = slide1.Shapes.AddTextbox(msoOrientationHorizontal, 50, 320, 860, 150)
    With subBox1.TextFrame
        .TextRange.Text = "Proactive Patrol Dispatching & Congestion Scoring for Bengaluru Traffic Police (BTP)" & vbCrLf & vbCrLf & _
                          "Theme: Poor Visibility on Parking-Induced Congestion" & vbCrLf & _
                          "Submission by: Gridlock Hackathon Team"
        .TextRange.Font.Name = "Inter"
        .TextRange.Font.Size = 18
        .TextRange.Font.Color.RGB = accentBlue
    End With

    ' =========================================================================
    ' SLIDE 2: THE CHALLENGE
    ' =========================================================================
    Dim slide2 As Slide
    Set slide2 = pptPres.Slides.Add(2, ppLayoutBlank)
    slide2.Background.Fill.Solid
    slide2.Background.Fill.ForeColor.RGB = bgCol
    
    ' Slide Title
    Dim titleBox2 As Shape
    Set titleBox2 = slide2.Shapes.AddTextbox(msoOrientationHorizontal, 50, 40, 860, 80)
    With titleBox2.TextFrame
        .TextRange.Text = "Operational Bottlenecks: Why City Traffic Chokes"
        .TextRange.Font.Name = "Outfit"
        .TextRange.Font.Size = 32
        .TextRange.Font.Bold = True
        .TextRange.Font.Color.RGB = titleCol
    End With
    
    ' Body Content
    Dim bodyBox2 As Shape
    Set bodyBox2 = slide2.Shapes.AddTextbox(msoOrientationHorizontal, 50, 140, 860, 450)
    With bodyBox2.TextFrame
        .TextRange.Text = "- Reactive & Manual Patrols: Wardens search roads blindly; enforcement arrives after gridlocks propagate upstream." & vbCrLf & vbCrLf & _
                          "- No Impact Metric: A scooter parked on a side-street is treated with the same urgency as a truck blocking a major turning." & vbCrLf & vbCrLf & _
                          "- Inefficient Towing Allocation: Resources are deployed based on intuition rather than historical hotspot density." & vbCrLf & vbCrLf & vbCrLf & _
                          "Core Metric: 95.2% of all BTP traffic violation logs are parking-related, confirming it is the primary driver of city congestion."
        .TextRange.Font.Name = "Inter"
        .TextRange.Font.Size = 18
        .TextRange.Font.Color.RGB = textCol
        .TextRange.Paragraphs(4).Font.Color.RGB = accentRed
        .TextRange.Paragraphs(4).Font.Bold = True
    End With

    ' =========================================================================
    ' SLIDE 3: THE ASTRAM-INTEL SOLUTION
    ' =========================================================================
    Dim slide3 As Slide
    Set slide3 = pptPres.Slides.Add(3, ppLayoutBlank)
    slide3.Background.Fill.Solid
    slide3.Background.Fill.ForeColor.RGB = bgCol
    
    ' Slide Title
    Dim titleBox3 As Shape
    Set titleBox3 = slide3.Shapes.AddTextbox(msoOrientationHorizontal, 50, 40, 860, 80)
    With titleBox3.TextFrame
        .TextRange.Text = "ASTraM-Intel Framework Architecture"
        .TextRange.Font.Name = "Outfit"
        .TextRange.Font.Size = 32
        .TextRange.Font.Bold = True
        .TextRange.Font.Color.RGB = titleCol
    End With
    
    ' Body Content
    Dim bodyBox3 As Shape
    Set bodyBox3 = slide3.Shapes.AddTextbox(msoOrientationHorizontal, 50, 140, 860, 450)
    With bodyBox3.TextFrame
        .TextRange.Text = "- CCTV Edge AI Module: Existing CCTV traffic feeds detect stationary duration and classify vehicles automatically." & vbCrLf & vbCrLf & _
                          "- Parking Congestion Index (PCI): Calculates traffic obstruction score in real-time based on vehicle footprint and peak demand." & vbCrLf & vbCrLf & _
                          "- DBSCAN Spatial Clustering: Groups individual violations within a 100m radius into active congestion hotspots." & vbCrLf & vbCrLf & _
                          "- Command Dispatch Dashboard: Displays active hotspots ranked by severity, providing automated routing paths for patrol wardens."
        .TextRange.Font.Name = "Inter"
        .TextRange.Font.Size = 18
        .TextRange.Font.Color.RGB = textCol
    End With

    ' =========================================================================
    ' SLIDE 4: THE MATHEMATICAL MODEL: PCI
    ' =========================================================================
    Dim slide4 As Slide
    Set slide4 = pptPres.Slides.Add(4, ppLayoutBlank)
    slide4.Background.Fill.Solid
    slide4.Background.Fill.ForeColor.RGB = bgCol
    
    ' Slide Title
    Dim titleBox4 As Shape
    Set titleBox4 = slide4.Shapes.AddTextbox(msoOrientationHorizontal, 50, 40, 860, 80)
    With titleBox4.TextFrame
        .TextRange.Text = "Quantifying Obstruction: The Parking Congestion Index"
        .TextRange.Font.Name = "Outfit"
        .TextRange.Font.Size = 32
        .TextRange.Font.Bold = True
        .TextRange.Font.Color.RGB = titleCol
    End With
    
    ' Formula Text
    Dim formulaBox As Shape
    Set formulaBox = slide4.Shapes.AddTextbox(msoOrientationHorizontal, 50, 120, 860, 60)
    With formulaBox.TextFrame
        .TextRange.Text = "PCI = W_vehicle x W_temporal x W_spatial x W_validation"
        .TextRange.Font.Name = "Courier New"
        .TextRange.Font.Size = 24
        .TextRange.Font.Bold = True
        .TextRange.Font.Color.RGB = accentBlue
    End With
    
    ' Body Content
    Dim bodyBox4 As Shape
    Set bodyBox4 = slide4.Shapes.AddTextbox(msoOrientationHorizontal, 50, 200, 860, 400)
    With bodyBox4.TextFrame
        .TextRange.Text = "- Vehicle Footprint Weight (W_vehicle): Scooters (1.0) | Cars/SUVs (3.0) | Buses/HGVs (10.0 - blocks entire lanes)." & vbCrLf & vbCrLf & _
                          "- Temporal Peak Weight (W_temporal): Peak Commute Hours (2.0) | Off-Peak Hours (1.0)." & vbCrLf & vbCrLf & _
                          "- Spatial Proximity Weight (W_spatial): Near Intersection/Junction Box (1.5) | Mid-block (1.0)." & vbCrLf & vbCrLf & _
                          "- Data Quality Weight (W_validation): Approved/Verified (1.0) | Pending Review (0.8) | Rejected (0.0)."
        .TextRange.Font.Name = "Inter"
        .TextRange.Font.Size = 16
        .TextRange.Font.Color.RGB = textCol
    End With

    ' =========================================================================
    ' SLIDE 5: EMPIRICAL DATA insights
    ' =========================================================================
    Dim slide5 As Slide
    Set slide5 = pptPres.Slides.Add(5, ppLayoutBlank)
    slide5.Background.Fill.Solid
    slide5.Background.Fill.ForeColor.RGB = bgCol
    
    ' Slide Title
    Dim titleBox5 As Shape
    Set titleBox5 = slide5.Shapes.AddTextbox(msoOrientationHorizontal, 50, 40, 860, 80)
    With titleBox5.TextFrame
        .TextRange.Text = "Data-Backed Proof: Analysis of 298,450 BTP Records"
        .TextRange.Font.Name = "Outfit"
        .TextRange.Font.Size = 32
        .TextRange.Font.Bold = True
        .TextRange.Font.Color.RGB = titleCol
    End With
    
    ' Body Content
    Dim bodyBox5 As Shape
    Set bodyBox5 = slide5.Shapes.AddTextbox(msoOrientationHorizontal, 50, 140, 860, 450)
    With bodyBox5.TextFrame
        .TextRange.Text = "- Parking Domination: 95.2% of all traffic violations in the BTP logs are parking-related (Wrong Parking 47.35%, No Parking 39.90%)." & vbCrLf & vbCrLf & _
                          "- Primary Offenders: Scooters (31.78%) and Cars (29.78%) are the dominant vehicle categories involved." & vbCrLf & vbCrLf & _
                          "- Sunday Surge: Sunday has the highest daily violation rate (15.70%), driven by shoppers near commercial hubs." & vbCrLf & vbCrLf & _
                          "- Chokepoint Jurisdictions: Upparpet represents 11.55% of all violations, followed by Shivajinagar (9.40%)."
        .TextRange.Font.Name = "Inter"
        .TextRange.Font.Size = 18
        .TextRange.Font.Color.RGB = textCol
    End With

    ' =========================================================================
    ' SLIDE 6: SPATIAL HOTSPOT CLUSTERING
    ' =========================================================================
    Dim slide6 As Slide
    Set slide6 = pptPres.Slides.Add(6, ppLayoutBlank)
    slide6.Background.Fill.Solid
    slide6.Background.Fill.ForeColor.RGB = bgCol
    
    ' Slide Title
    Dim titleBox6 As Shape
    Set titleBox6 = slide6.Shapes.AddTextbox(msoOrientationHorizontal, 50, 40, 860, 80)
    With titleBox6.TextFrame
        .TextRange.Text = "DBSCAN Clustering: Pinpointing City Chokepoints"
        .TextRange.Font.Name = "Outfit"
        .TextRange.Font.Size = 32
        .TextRange.Font.Bold = True
        .TextRange.Font.Color.RGB = titleCol
    End With
    
    ' Body Content
    Dim bodyBox6 As Shape
    Set bodyBox6 = slide6.Shapes.AddTextbox(msoOrientationHorizontal, 50, 140, 860, 450)
    With bodyBox6.TextFrame
        .TextRange.Text = "- Spatial Engine: Runs DBSCAN clustering on active parking violations (100m radius, min threshold of 50 violations)." & vbCrLf & vbCrLf & _
                          "- Centroid Snapping: Center coordinates are snapped to actual road corridors by finding the violation with the highest PCI." & vbCrLf & vbCrLf & _
                          "- Results: Identified 265 high-density hotspots city-wide." & vbCrLf & vbCrLf & _
                          "- Top Priority Zones: Majestic Metro Junction (Upparpet), Shivajinagar Bus Station, New Horizon College Road, and Embassy Tech Village."
        .TextRange.Font.Name = "Inter"
        .TextRange.Font.Size = 18
        .TextRange.Font.Color.RGB = textCol
    End With

    ' =========================================================================
    ' SLIDE 7: WORKING PROTOTYPE: BTP DASHBOARD
    ' =========================================================================
    Dim slide7 As Slide
    Set slide7 = pptPres.Slides.Add(7, ppLayoutBlank)
    slide7.Background.Fill.Solid
    slide7.Background.Fill.ForeColor.RGB = bgCol
    
    ' Slide Title
    Dim titleBox7 As Shape
    Set titleBox7 = slide7.Shapes.AddTextbox(msoOrientationHorizontal, 50, 40, 860, 80)
    With titleBox7.TextFrame
        .TextRange.Text = "Working Prototype: Smart Dispatch Dashboard"
        .TextRange.Font.Name = "Outfit"
        .TextRange.Font.Size = 32
        .TextRange.Font.Bold = True
        .TextRange.Font.Color.RGB = titleCol
    End With
    
    ' Body Content
    Dim bodyBox7 As Shape
    Set bodyBox7 = slide7.Shapes.AddTextbox(msoOrientationHorizontal, 50, 140, 860, 450)
    With bodyBox7.TextFrame
        .TextRange.Text = "- Interactive Map: Dark mode Leaflet map plotting active BTP hotspots with real-time status pulses." & vbCrLf & vbCrLf & _
                          "- Prioritized Site Queue: Hotspots sorted by cumulative PCI, allowing command units to focus resources on critical blockages." & vbCrLf & vbCrLf & _
                          "- Live Alert Feed: Real-time ticker showing simulation logs, sensor approvals, and active dispatch requests." & vbCrLf & vbCrLf & _
                          "- Local Execution: Standalone HTML5/JS page - opens directly in browser without server dependencies."
        .TextRange.Font.Name = "Inter"
        .TextRange.Font.Size = 18
        .TextRange.Font.Color.RGB = textCol
    End With

    ' =========================================================================
    ' SLIDE 8: LIVE PATROL DISPATCH SIMULATOR
    ' =========================================================================
    Dim slide8 As Slide
    Set slide8 = pptPres.Slides.Add(8, ppLayoutBlank)
    slide8.Background.Fill.Solid
    slide8.Background.Fill.ForeColor.RGB = bgCol
    
    ' Slide Title
    Dim titleBox8 As Shape
    Set titleBox8 = slide8.Shapes.AddTextbox(msoOrientationHorizontal, 50, 40, 860, 80)
    With titleBox8.TextFrame
        .TextRange.Text = "Simulated Enforcement & Resolution Loop"
        .TextRange.Font.Name = "Outfit"
        .TextRange.Font.Size = 32
        .TextRange.Font.Bold = True
        .TextRange.Font.Color.RGB = titleCol
    End With
    
    ' Body Content
    Dim bodyBox8 As Shape
    Set bodyBox8 = slide8.Shapes.AddTextbox(msoOrientationHorizontal, 50, 140, 860, 450)
    With bodyBox8.TextFrame
        .TextRange.Text = "- Command Dispatch: Operator clicks 'Dispatch' to assign a warden unit to a hotspot." & vbCrLf & vbCrLf & _
                          "- Path Navigation: Patrol car marker emerges from BTP HQ and animates along a routing path on the map." & vbCrLf & vbCrLf & _
                          "- Travel Progress: Dashboard displays live progress bars and ETA countdowns." & vbCrLf & vbCrLf & _
                          "- Gridlock Clearance: On-site tow operations are simulated. Upon completion, the hotspot clears, reducing local PCI by 85%."
        .TextRange.Font.Name = "Inter"
        .TextRange.Font.Size = 18
        .TextRange.Font.Color.RGB = textCol
    End With

    ' =========================================================================
    ' SLIDE 9: EXPECTED IMPACT
    ' =========================================================================
    Dim slide9 As Slide
    Set slide9 = pptPres.Slides.Add(9, ppLayoutBlank)
    slide9.Background.Fill.Solid
    slide9.Background.Fill.ForeColor.RGB = bgCol
    
    ' Slide Title
    Dim titleBox9 As Shape
    Set titleBox9 = slide9.Shapes.AddTextbox(msoOrientationHorizontal, 50, 40, 860, 80)
    With titleBox9.TextFrame
        .TextRange.Text = "Expected Outcomes & BTP Operational Value"
        .TextRange.Font.Name = "Outfit"
        .TextRange.Font.Size = 32
        .TextRange.Font.Bold = True
        .TextRange.Font.Color.RGB = titleCol
    End With
    
    ' Body Content
    Dim bodyBox9 As Shape
    Set bodyBox9 = slide9.Shapes.AddTextbox(msoOrientationHorizontal, 50, 140, 860, 450)
    With bodyBox9.TextFrame
        .TextRange.Text = "- Targeted Resource Deployment: Shifts patrol units from random routing to high-PCI hotspots, reducing BTP fuel and labor costs." & vbCrLf & vbCrLf & _
                          "- Junction Clearance: Keeping turnings and intersection boxes clear prevents blockages from propagating into full-gridlocks." & vbCrLf & vbCrLf & _
                          "- Quantifiable Campaigns: Police stations can track the decline in their cumulative PCI index over time to measure campaign success."
        .TextRange.Font.Name = "Inter"
        .TextRange.Font.Size = 18
        .TextRange.Font.Color.RGB = textCol
    End With

    ' =========================================================================
    ' SLIDE 10: TECH STACK & ROADMAP
    ' =========================================================================
    Dim slide10 As Slide
    Set slide10 = pptPres.Slides.Add(10, ppLayoutBlank)
    slide10.Background.Fill.Solid
    slide10.Background.Fill.ForeColor.RGB = bgCol
    
    ' Slide Title
    Dim titleBox10 As Shape
    Set titleBox10 = slide10.Shapes.AddTextbox(msoOrientationHorizontal, 50, 40, 860, 80)
    With titleBox10.TextFrame
        .TextRange.Text = "Technical Stack & Scalability Roadmap"
        .TextRange.Font.Name = "Outfit"
        .TextRange.Font.Size = 32
        .TextRange.Font.Bold = True
        .TextRange.Font.Color.RGB = titleCol
    End With
    
    ' Body Content
    Dim bodyBox10 As Shape
    Set bodyBox10 = slide10.Shapes.AddTextbox(msoOrientationHorizontal, 50, 140, 860, 450)
    With bodyBox10.TextFrame
        .TextRange.Text = "- Data & Core ML: Python, Scikit-Learn (DBSCAN), Pandas, Folium, YOLOv8-nano." & vbCrLf & vbCrLf & _
                          "- Prototype Stack: HTML5, CSS3 (Glassmorphism), JavaScript (ES6), Leaflet.js, Chart.js." & vbCrLf & vbCrLf & _
                          "- Production Scalability: Integration with the BTP ASTraM application and WhatsApp reporting chatbots." & vbCrLf & vbCrLf & _
                          "- Onsite Demonstration: The prototype is fully operational and ready for live verification at the July 3 Finale!"
        .TextRange.Font.Name = "Inter"
        .TextRange.Font.Size = 18
        .TextRange.Font.Color.RGB = textCol
    End With
    
    MsgBox "ASTraM-Intel PowerPoint Presentation created successfully!", vbInformation, "Success"
End Sub
