@doc("A country code in ISO 3166-1 alpha-2 format (e.g., \"US\", \"FR\").")
@pattern("^[A-Z]{2}$")
scalar CountryCode extends string;