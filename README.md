# Logistics & Fleet Operations Intelligence Suite

## Project Overview
This 3-page interactive Business Intelligence suite was developed to solve a critical challenge in the logistics industry: **The disconnect between operational volume and bottom-line profitability.**

By integrating Trip, Fuel, Maintenance, and Customer data, this engine identifies "Profit Leaks" in routes, "Lemon" assets in the fleet, and high-risk customer contracts.

## Technical Highlights
* **Portable Architecture:** Built with parameter-driven Power Query (M) logic, allowing the report to run on any machine by simply updating the `Staging_Folder` path.
* **Advanced Data Modeling:** Star Schema implementation linking multiple fact tables (Trips, Fuel, Maintenance) to shared dimensions (Trucks, Drivers, Routes).
* **Strategic DAX:** Custom measures for RPM (Revenue Per Mile), CPM (Cost Per Mile), and dynamic fleet-wide MPG benchmarking.
* **Executive UX:** Custom page navigation, invisible-overlay info buttons, and bookmark-based filter resets.

## Report Pages

### 1. Executive Overview (Finance)
Focused on Net Profit and Margin health. This page highlights geographical profitability by Origin/Destination to identify "Deadhead" routes and regional inefficiencies.

### 2. Strategic Insights (Sales & Customers)
Features a **Customer Quadrant Analysis** (Scatter Chart) that segments clients into:
* **Strategic Partners:** High Volume / High Profit.
* **Operational Risk:** High Volume / Low Profit.

### 3. Fleet Operations (Mechanical Health)
Utilizes a **"Lemon Detector"** to correlate maintenance spend against mileage. It tracks fuel efficiency against an industry-standard **6.5 MPG benchmark**.

## How to Use This Repo
1.  **Download** the `.pbix` file and the `/Data` folder.
2.  **Open** the report in Power BI Desktop.
3.  **Update Path:** Go to `Transform Data` > `Edit Parameters` and paste your local folder path into the `Staging_Folder` parameter.
4.  **Refresh:** Click 'Apply Changes' to see the data load instantly.

## Key Business Impact
* **Asset Retirement:** Data-driven identification of high-cost/low-utilization trucks.
* **Contract Negotiation:** Direct evidence for renegotiating low-margin, high-volume customer contracts.
* **Fuel Strategy:** Monitoring of MPG targets to identify driver training needs or engine maintenance issues.
