# Due Diligence Delivery Schema (v 1.0.1)

## 1. Overview

This document explains the structure of the Due Diligence Delivery data message model. This allows the exchange of high level Due Diligence Delivery Information relevant to EUDR Due Diligence declarations.

## 2. Change Log

| Version | Date | Changes |
| :---- | :---- | :---- |
| 1.0.0 | 2025-11-10 | Initial version |
| 1.0.1 | 2025-11-13 | Added country code to supplier org details. OrgId Type specified with an ‘Other’ option  GeoJson field changed to base64 encoded GeoJson Changed areaInHa to area and provided area unit |
|  |  |  |

## 3. Data Model

### Delivery Due Diligence Info

This is the main data class. It holds all the key information for providing EUDR Relevant Due Diligence Information.

| Fields | Type | Details |
| :---- | :---- | :---- |
| supplier | OrgDetails | Information about the supplier  |
| supplierRef | string | Supplier reference for the delivery/order e.g. Supplier Sales Order Number |
| customerRef | string | Customer reference for the delivery/order. e.g Customer PO Number |
| deliveryDate? | utcDateTime | The actual or expected delivery date (in UTC) |
| deliveryItems | DueDiligenceLineItem\[\]  (list) | List of Delivery Items, each line one containing information relevant to a line item of the delivery. |
| productionPlaces | ProductionPlace\[\] (list) | Contains information about each production place. This can include geojson data. |

### OrgDetails

This model represents the information about the sending entity.

| Fields | Type | Details |
| :---- | :---- | :---- |
| name | string | Name of the sending company |
| country | string | The ISO 3166-1 alpha-2 country code that is the jurisdiction of the sending company. |
| identifiers | OrgId\[\] (list) | List of different ways to identify the company using official identifiers. |

### OrgId

This model represents the identification information about the sending entity.

| Fields | Type | Details |
| :---- | :---- | :---- |
| id | string | The official identifier |
| type | string | The type of the identifier (e.g. VAT, Company Reg Number etc) VAT Registration ISNI BIC LEI iso6523 Other |
| description? | string | If the OrgIdType is Other then this should indicate what the Id represents, if the OrgIdType is iso6532 then it should indicate which id schema it falls under. |

### Due Diligence Line Item

This model represents an individual line item in the delivery.

| Fields | Type | Details |
| :---- | :---- | :---- |
| id | string | The sender's unique reference for a line item. |
| batchNo? | string | If there is a batch number that links a particular product item together than include that identity here. |
| hsCode | string | The HS (Harmonised System) Code of the line item Product. |
| description | string | A description of the line item Product. |
| quantity | Quantity\[\] | Quantity(ies) of the line item with provision to provide extra units aside from base units. |
| references | DDSReference\[\] (list) | Information about the relevant DDS References.  |
| producers? | Producer\[\] (list) | List of Producer information. |

### Quantity

Represents the quantity of the item.

| Fields | Type | Details |
| :---- | :---- | :---- |
| value | decimal | The sender's unique reference for a line item. |
| unit | string | The unit that the quantity represents: kg m m2 m3 other (if other, specify type) |
| type | string | If unit is other, then include its definition here (e.g tonne) |

### DDSReference

This model represents a Due Diligence Statement (DDS) Reference

| DDSReference Fields | Type | Details |
| :---- | :---- | :---- |
| ddrn | string | Due Diligence Reference Number |
| ddvn | string | Due Diligence Verification Number |

### Producer

This model represents information about a Producer

| Fields | Type | Details |
| :---- | :---- | :---- |
| id | string | The supplier unique identifier for Producer. |
| name | string | The name of the producer |
| country | string | The ISO 3166-1 alpha-2 country code. |
| productionPlaceRefs | String\[\] (list) | List of production place references. Reference the ids of records contained in the list of Production Places.  |

### ProductionPlace

This model represents a Production Place

| Fields | Type | Details |
| :---- | :---- | :---- |
| id | string | The supplier’s unique identifier for this production place. |
| name | string | The name of the production place. |
| geoData? | string | Base64 encoded string that contains the GeoJson. The expectation is that content follows the GeoJSON Schema ([link](https://geojson.org/schema/FeatureCollection.json)). This means the contents can be parsed or downloaded without worrying about parsing. |
| area? | decimal | The area represented. |
| areaUnit | string | m2 ha acre |

## 3. JSON Example

```json
{
  "supplier": {
    "name": "Example Supplier Ltd",
    "country": "UK",
    "identifiers": [
      {
        "id": "GB12345678",
        "type": "VAT"
      }
    ]
  },
  "supplierRef": "JKLEFNKLADEWKJ1234123",
  "customerRef": "0938490234",
  "deliveryDate": "2024-08-16T12:40:20.37484Z",
  "deliveryItems": [
    {
     	"id": "LINE-001",
    	"hsCode": "440301",
	"description": "Rough wood",
	"quantity": [
            {
                "value": 113.5,
                "unit": "kg"
            }
        ],
     	"references": [
        {
          "ddrn": "1FALK24J34FEI21W",
          "ddvn": "F3KI43KC"
        }
      ],
      "producers": [
        {
          "id": "",
          "name": "Rough Wood Producers",
          "country": "BR",
          "productionPlaceRefs": [
            "PP-100"
          ]
        }
      ]
    }
  ],
  "productionPlaces": [
    {
      "id": "PP-100",
      "name": "Fazenda Vista Alegre",
      "geoData": "<GeoJSON Encoded Data>",
      "area": 140,
      "areaUnit": "ha",
    }
  ]
}
```