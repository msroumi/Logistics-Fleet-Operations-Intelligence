let
    Source = Staging_Folder,
    // Fix: Removed hard-coded D:\ path from the selection criteria
    SelectFile = Source{[Name="truck_utilization_metrics.csv"]}[Content],
    
    #"Imported CSV" = Csv.Document(SelectFile,[Delimiter=",", Columns=10, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"truck_id", type text}, {"month", type date}, {"trips_completed", Int64.Type}, {"total_miles", Int64.Type}, {"total_revenue", type number}, {"average_mpg", type number}, {"maintenance_events", Int64.Type}, {"maintenance_cost", type number}, {"downtime_hours", type number}, {"utilization_rate", type number}})
in
    #"Changed Type"