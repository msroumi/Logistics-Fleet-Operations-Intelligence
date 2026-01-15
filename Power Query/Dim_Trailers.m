let
    Source = Staging_Folder,
    SelectFile = Source{[Name="trailers.csv"]}[Content],
    #"Imported CSV" = Csv.Document(SelectFile,[Delimiter=",", Columns=9, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"trailer_id", type text}, {"trailer_number", Int64.Type}, {"trailer_type", type text}, {"length_feet", Int64.Type}, {"model_year", Int64.Type}, {"vin", type text}, {"acquisition_date", type date}, {"status", type text}, {"current_location", type text}})
in
    #"Changed Type"