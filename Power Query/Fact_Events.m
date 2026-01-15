let
    Source = Staging_Folder,
    SelectFile = Source{[Name="delivery_events.csv"]}[Content],
    #"Imported CSV" = Csv.Document(SelectFile,[Delimiter=",", Columns=11, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"event_id", type text}, {"load_id", type text}, {"trip_id", type text}, {"event_type", type text}, {"facility_id", type text}, {"scheduled_datetime", type datetime}, {"actual_datetime", type datetime}, {"detention_minutes", Int64.Type}, {"on_time_flag", type logical}, {"location_city", type text}, {"location_state", type text}})
in
    #"Changed Type"