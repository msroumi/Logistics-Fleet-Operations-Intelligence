# DAX Measure Catalog

This document contains the core DAX measures used in the **Logistics & Fleet Operations Intelligence Suite**.  
Measures are grouped by purpose and designed for **performance, clarity, and business interpretability**.

---

## 00. Fleet Benchmarks
Used for fleet-wide comparisons and outlier detection.

```DAX
Average Maintenance Benchmark =
CALCULATE(
    AVERAGEX(
        VALUES(Dim_Trucks[truck_id]),
        [Total Maintenance Cost]
    ),
    ALL(Dim_Trucks)
)
```

```DAX
Average Miles Benchmark =
CALCULATE(
    AVERAGEX(
        VALUES(Dim_Trucks[truck_id]),
        [Total Miles]
    ),
    ALL(Dim_Trucks)
)
```

```DAX
Average Profit Benchmark =
CALCULATE(
    AVERAGEX(
        VALUES(Dim_Customers[customer_id]),
        [Net Profit]
    ),
    ALL(Dim_Customers)
)
```

## 01. Financial KPIs
Core financial health metrics

```DAX
Total Revenue = SUM(Fact_Loads[revenue])
```

```DAX
Total Fuel Cost = SUM(Fact_Fuel[total_cost])
```

```DAX
Total Maintenance Cost = SUM(Fact_Maintenance[total_cost])
```

```DAX
Net Profit =
[Total Revenue] - ([Total Fuel Cost] + [Total Maintenance Cost])
```

```DAX
Net Profit Margin % =
DIVIDE([Net Profit], [Total Revenue], 0)
```

## 02. Operational Efficiency Metrics
The engine behind the Quadrant Analysis and Asset Auditing

```DAX
Total Miles = SUM(Fact_Trips[actual_distance_miles])
```

```DAX
Revenue per Mile =
DIVIDE([Total Revenue], [Total Miles], 0)
```

```DAX
Cost per Mile =
DIVIDE(
    ([Total Fuel Cost] + [Total Maintenance Cost]),
    [Total Miles],
    0
)
```

```DAX
Fuel Efficiency (MPG) =
DIVIDE(
    [Total Miles],
    SUM(Fact_Trips[fuel_gallons_used]),
    0
)
```

```DAX
Average MPG = AVERAGE(Fact_Trips[average_mpg])
```
