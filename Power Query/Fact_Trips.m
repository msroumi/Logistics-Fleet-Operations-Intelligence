let
    Source = Staging_Folder,
    SelectFile = Source{[Name="trips.csv"]}[Content],
    #"Imported CSV" = Csv.Document(SelectFile,[Delimiter=",", Columns=12, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"trip_id", type text}, {"load_id", type text}, {"driver_id", type text}, {"truck_id", type text}, {"trailer_id", type text}, {"dispatch_date", type date}, {"actual_distance_miles", Int64.Type}, {"actual_duration_hours", type number}, {"fuel_gallons_used", type number}, {"average_mpg", type number}, {"idle_time_hours", type number}, {"trip_status", type text}})
in
    #"Changed Type"