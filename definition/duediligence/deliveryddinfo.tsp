
import "@typespec/json-schema";
import "@typespec/http";

import "../common/countryCode.tsp";
import "../common/orgDetails.tsp";

namespace DueDiligenceStandard;

@doc("Provides due diligence information relevant to EUDR Due Diligence declarations.")
model DeliveryDueDiligenceInfo {

    @doc("The supplier details.")
    supplier: OrgDetails;

    @doc("Supplier reference for the delivery.")
    supplierRef: string;
    
    @doc("Customer reference for the delivery.")
    customerRef: string;

    @doc("Actual or expected delivery date.")
    deliveryDate?: utcDateTime;

    @doc("Provides Due Diligence information for each line item.")
    deliveryItems?: DueDiligenceLineItem[];

    @doc("List of production places that are references within the line items.")
    productionPlaces?: ProductionPlace[];
}

model DueDiligenceLineItem {
    
    @doc("The sender unique reference for a line item.")
    id: string;

    @doc("If there is a batch number that links a particular product item together than include that identity here.")
    batchNo: string;
    
    @doc("The HS (Harmonised System) Code of the line item Product.")
    hsCode: string;

    @doc("A description of the line item Product.")
    description: string;

    @doc("Quantity(ies) of the line item with provision to provide extra units aside from base units.")
    quantity: Quantity[];
    
    @doc("Information about the relevant DDS References.")
    references: DDSReference[];

    @doc("List of Producer information.")
    producers: Producer[];
}


enum QuantityType {
    @doc("Kilograms (Mass)")
    kg,
    @doc("Meters (Length)")
    m,
    @doc("Meters Squared (Area)")
    m2,
    @doc("Meters Cubed (Volume)")
    m3,
    @doc("Other (Any other quantity type e.g. tonnes)")
    other
}

model Quantity {
    
    @doc("The actual quantity for the line item.")
    value: decimal;

    @doc("The unit that the quantity represents")
    unit: QuantityType;

    @doc("If the unit is other then included a definition here.")
    type?: string;
}

model DDSReference {
    
    @doc("The DD Statement Reference Number")
    ddrn: string;
    
    @doc("The DD Statement Verification Number")
    ddvn: string;
}

model Producer {
    
    @doc("The supplier unique identifier for Producer.")
    id: string;
    
    @doc("The name of the producer.")
    name: string;

    @doc("The country of the producer. ISO 3166-1 alpha-2 format.")
    country: CountryCode;

    @doc("List of production place ids that are relevant to this producer.")
    productionPlaceRefs: string[];
}


enum AreaUnit {
    m2,
    ha,
    acre
}

model ProductionPlace {
    
    @doc("The supplier’s unique identifier for this production place.")
    id: string;
    
    @doc("The name of the production place.")
    name: string;

    @doc("Base64 encoded string that contains the GeoJson. The expectation is that content follows the GeoJSON Schema. This means the contents can be parsed or downloaded without worrying about parsing.")
    @encode(BytesKnownEncoding.base64)
    geoData?: bytes;
    
    @doc("The area that this production place covers.")
    area?: decimal;

    @doc("The are unit in either Meters Squared, Hectares or Acres")
    areaUnit?: AreaUnit; 
}