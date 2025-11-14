# Due Diligence Messaging Schema

This repository contains [JSON Schema](https://json-schema.org/) for a proposed messaging format intended to allow organisations to exchange Due Diligence Information within supply chains to help with their due diligence processes.

## Creating JSON Schema

In order to easily create JSON Schema with minimal errors this repo leverages [TypeSpec](https://typespec.io/). TypeSpec is a rapidly evolving and developing technology that allows the specification of APIs and Schema. The use of this reduces the inconsistencies within the generate schema and it will also allow organisations to take the same definition and include it in any API definitions they wish to create.

### Prerequisites

This assumes that you already have npm installed which can be done by installing [NodeJS](https://nodejs.org/en/download/current).


### Building the Schema

You can either leverage the built and checked-in JSON schema or you can download the repo and built it yourself. 

Once you have cloned the repo then to set up the solution run 

```
npm install
```

You can now compile the TypeSpec Schema:

```
npm run compile
```






## Schemas

It is early days yet, the initial focus is on the specific need of transferring [EUDR](https://environment.ec.europa.eu/topics/forests/deforestation/regulation-deforestation-free-products_en) information between supply chain participants.

### Delivery Due Diligence Information

Allows the transmission of Due Diligence Information included EUDR Due Diligence Reference Numbers (+Verification) as well as Production Places including Geolocations according to the [GeoJson](https://geojson.org/) specification outlined in the [GeoJson Schema](https://geojson.org/schema/GeoJSON.json)

More information about the message schema can be found here: [link](./docs/DeliveryDueDiligenceSchema.md);

The schema file: [link](./schema/deliveryddinfo.schema.json)
