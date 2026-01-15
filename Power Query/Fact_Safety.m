let
    Source = Staging_Folder,
    SelectFile = Source{[Name="safety_incidents.csv"]}[Content],
    #"Imported CSV" = Csv.Document(SelectFile,[Delimiter=",", Columns=15, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"incident_id", type text}, {"trip_id", type text}, {"truck_id", type text}, {"driver_id", type text}, {"incident_date", type datetime}, {"incident_type", type text}, {"location_city", type text}, {"location_state", type text}, {"at_fault_flag", type logical}, {"injury_flag", type logical}, {"vehicle_damage_cost", type number}, {"cargo_damage_cost", type number}, {"claim_amount", type number}, {"preventable_flag", type logical}, {"description", type text}})
in
    #"Changed Type"