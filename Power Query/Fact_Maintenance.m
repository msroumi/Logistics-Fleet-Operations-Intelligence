let
    Source = Staging_Folder,
    SelectFile = Source{[Name="maintenance_records.csv"]}[Content],
    #"Imported CSV" = Csv.Document(SelectFile,[Delimiter=",", Columns=12, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"maintenance_id", type text}, {"truck_id", type text}, {"maintenance_date", type date}, {"maintenance_type", type text}, {"odometer_reading", Int64.Type}, {"labor_hours", type number}, {"labor_cost", type number}, {"parts_cost", type number}, {"total_cost", type number}, {"facility_location", type text}, {"downtime_hours", type number}, {"service_description", type text}})
in
    #"Changed Type"