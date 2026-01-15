let
    Source = Staging_Folder,
    // Fix: Dynamically select by filename only, removing the hard-coded D:\ drive link
    SelectFile = Source{[Name="loads.csv"]}[Content],
    
    #"Imported CSV" = Csv.Document(SelectFile,[Delimiter=",", Columns=12, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"load_id", type text}, {"customer_id", type text}, {"route_id", type text}, {"load_date", type date}, {"load_type", type text}, {"weight_lbs", Int64.Type}, {"pieces", Int64.Type}, {"revenue", type number}, {"fuel_surcharge", type number}, {"accessorial_charges", Int64.Type}, {"load_status", type text}, {"booking_type", type text}})
in
    #"Changed Type"