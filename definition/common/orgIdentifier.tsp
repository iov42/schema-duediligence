
import "@typespec/json-schema";

namespace DueDiligenceStandard;

enum OrgIdType {
    @doc("The local jurisdiction Tax number for the entity.")
    VAT,
    @doc("The local jurisdiction registration number for the entity.")
    Registration,
    @doc("International Standard Name Identifier")
    ISNI,
    @doc("Business Identifier Code (BIC)")
    BIC,
    @doc("Legal Entity Identifier as defined by ISO 17442.")
    LEI,
    @doc("Set of identifiers as defined by the ISO 6523 standard and issued by the authority for ICD (International Code Designator).")
    iso6523,
    @doc("Some other identifier.")
    Other
}

model OrgId {
    
    @doc("The official identifier")
    id: string;
    
    @doc("The type of the identifier (e.g. VAT, Company Reg Number etc)")
    type: OrgIdType;

    @doc("If the OrgIdType is Other then this should indicate what the Id represents, if the OrgIdType is iso6532 then it should indicate which id schema it falls under.")
    description?: string;
}

