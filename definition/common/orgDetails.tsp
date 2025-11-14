
import "@typespec/json-schema";
import "./countryCode.tsp";
import "./orgIdentifier.tsp";

namespace DueDiligenceStandard;

model OrgDetails {
    
    @doc("Name of the sending company - ideally the legal entity name.")
    name: string;

    @doc("The ISO 3166-1 alpha-2 country code that is the jurisdiction of the sending company.")
    country: CountryCode;

    @doc("List of different ways to identify the company using official identifiers.")
    identifiers: OrgId[];
}