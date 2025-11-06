
import "@typespec/json-schema";
import "./schema/duediligence/ddDeliveryInfo.tsp";

using JsonSchema;


//@service(#{ title: "Supply Chain Compliance Data Format" })
@jsonSchema
namespace ComplianceStandard;

