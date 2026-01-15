let
    Source = Staging_Folder,
    SelectFile = Source{[Name="customers.csv"]}[Content],
    #"Imported CSV" = Csv.Document(SelectFile,[Delimiter=",", Columns=8, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"customer_id", type text}, {"customer_name", type text}, {"customer_type", type text}, {"credit_terms_days", Int64.Type}, {"primary_freight_type", type text}, {"account_status", type text}, {"contract_start_date", type date}, {"annual_revenue_potential", Int64.Type}})
in
    #"Changed Type"