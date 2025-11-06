
import "@typespec/json-schema";

import "../common/orgDetails.tsp";
import "../common/countryCodes.tsp";
import "../common/geojson.tsp";

namespace DueDiligenceStandard;

@doc("Provides due diligence information relevant to EUDR Due Diligence declarations.")
model DDDeliveryInfo {

    @doc("The supplier details.")
    supplier: OrgDetails;

    @doc("Supplier reference for the delivery.")
    supplierRef?: string;
    
    @doc("Customer reference for the delivery.")
    customerRef?: string;

    @doc("Actual or expected delivery date.")
    deliveryDate?: string;

    @doc("Provides Due Diligence information for each line item.")
    deliveryItems: DDLineItem[];

    @doc("List of production places that are references within the line items.")
    productionPlaces: ProductionPlace[];
}

model DDLineItem {
    
    @doc("The identifier for a given line item.")
    lineItemId: string;

    @doc("The HS Code for the line item.")
    hsCode?: string;

    @doc("Product description.")
    description?: string;

    @doc("The net weight for this line item within the delivery.")
    weightKg: decimal;
    
    @doc("Due Diligence Statement references.")
    references: DDSReference[];

    @doc("Relevant producers for this line item.")
    producers: Producer[];
}


model DDSReference {
    
    @doc("The DD Statement Reference Number")
    ddrn: string;
    
    @doc("The DD Statement Verification Number")
    ddvn: string;
}

model Producer {
    @doc("The name of the producer.")
    name: string;

    @doc("The country of the producer. ISO 3166-1 alpha-2 format.")
    country: CountryCode;

    @doc("List of production place ids that are relevant to this producer.")
    productionPlaceRefs: string[];
}

model ProductionPlace {
    
    @doc("Unique identifier for this production place.")
    id: string;
    
    @doc("The name ofr the production place.")
    name: string;

    @doc("The geodata representing the area for the production place.")
    geoData?: GeoJSON.FeatureCollection;
    
    @doc("The area that this production place covers.")
    areaInHa?: decimal;
}