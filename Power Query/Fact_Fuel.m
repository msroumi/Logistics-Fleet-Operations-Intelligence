let
    Source = Staging_Folder,
    SelectFile = Source{[Name="fuel_purchases.csv"]}[Content],
    #"Imported CSV" = Csv.Document(SelectFile,[Delimiter=",", Columns=11, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"fuel_purchase_id", type text}, {"trip_id", type text}, {"truck_id", type text}, {"driver_id", type text}, {"purchase_date", type datetime}, {"location_city", type text}, {"location_state", type text}, {"gallons", type number}, {"price_per_gallon", type number}, {"total_cost", type number}, {"fuel_card_number", type text}})
in
    #"Changed Type"