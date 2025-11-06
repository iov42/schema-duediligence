
import "@typespec/json-schema";

import "./countryCodes.tsp";

using JsonSchema;

namespace DueDiligenceStandard;

enum OrgIdType {
    @doc("The local jurisdiction VAT number for the entity.")
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

@discriminator("type")
model OrgId {
    
    @doc("The actual identifier")
    id: string;
    
    @doc("The type of the identifier. This may be company registration number ")
    type: OrgIdType;

    @doc("If the OrgIdType is Other then this should indicate what the Id represents.")
    description?: string;
}

model VatId extends OrgId {
    type: OrgIdType.VAT;

    jurisdiction: CountryCode;
}

model RegistrationId extends OrgId {
    type: OrgIdType.Registration;

    jurisdiction: CountryCode;
}

model IsniId extends OrgId {
    type: OrgIdType.ISNI;

    @pattern("^(?:\\d{15}[\\dXx]|\\d{4}-\\d{4}-\\d{4}-\\d{3}[\\dXx])$")
    id: string;
}

model LeiId extends OrgId {
    type: OrgIdType.LEI;

    @pattern("^[A-Za-z0-9]{4}00[A-Za-z0-9]{12}\\d{2}$")
    id: string;
}

model Iso6523Id extends OrgId {
    type: OrgIdType.iso6523;

    @pattern("^(?<icd>\\d{4}):(?<oid>[A-Za-z0-9]{1,35})(?::(?<opi>[A-Za-z0-9]{1,35}))?$")
    id: string;
}

model OtherId extends OrgId {
    type: OrgIdType.Other;

    @doc("Containt a description for the id type.")
    description: string;
}

