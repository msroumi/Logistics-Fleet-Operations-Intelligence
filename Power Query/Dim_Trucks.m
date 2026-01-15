let
    Source = Staging_Folder,
    SelectFile = Source{[Name="trucks.csv"]}[Content],
    #"Imported CSV" = Csv.Document(SelectFile,[Delimiter=",", Columns=11, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"truck_id", type text}, {"unit_number", Int64.Type}, {"make", type text}, {"model_year", Int64.Type}, {"vin", type text}, {"acquisition_date", type date}, {"acquisition_mileage", Int64.Type}, {"fuel_type", type text}, {"tank_capacity_gallons", Int64.Type}, {"status", type text}, {"home_terminal", type text}})
in
    #"Changed Type"