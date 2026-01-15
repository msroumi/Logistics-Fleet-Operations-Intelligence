# Logistics & Fleet Operations Intelligence Suite

## Project Overview
This project is an end-to-end BI solution designed to optimize the "Middle Mile" for logistics firms. It integrates 17 data streams to provide a 360-degree view of operational costs vs. revenue, enabling data-driven decisions on asset retirement and customer contract negotiations.

## Technical Architecture
* **Star Schema:** A complex model featuring 6 Fact tables and 11 Dimension tables for high-performance filtering.
* **Portable M-Logic:** 100% parameter-driven folder paths, ensuring the report is environment-agnostic.
* **Dynamic Benchmarking:** DAX measures that calculate fleet-wide averages to provide real-time performance context.

## Measure Catalog
### 01. Financial KPIs
* **Net Profit / Margin %:** Bottom-line health tracking.
* **Total Fuel & Maintenance Cost:** Granular expense auditing.
* **Total Revenue:** Gross earnings from the `Fact_Loads` table.

### 02. Operational Efficiency
* **Fuel Efficiency (MPG):** Identifying underperforming assets.
* **Cost/Revenue per Mile:** The primary metrics for quadrant analysis and route auditing.

### 03. Benchmarks
* **Average Profit/Maintenance/Miles:** Fleet-wide standards used to highlight "Outlier" trucks and drivers.

## ⚙️ Setup
1. Download the `Data` folder.
2. Open the `.pbix` file.
3. Update the `Staging_Folder` parameter in Power Query to point to your local data folder.

## Key Business Impact
* **Asset Retirement:** Data-driven identification of high-cost/low-utilization trucks.
* **Contract Negotiation:** Direct evidence for renegotiating low-margin, high-volume customer contracts.
* **Fuel Strategy:** Monitoring of MPG targets to identify driver training needs or engine maintenance issues.
