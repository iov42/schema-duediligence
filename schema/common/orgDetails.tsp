
import "@typespec/json-schema";
import "./orgIdentifier.tsp";

using JsonSchema;

namespace DueDiligenceStandard;


model OrgDetails {
    
    @doc("Company name")
    name: string;

    @doc("Company identifiers")
    identifiers: OrgId[];
}