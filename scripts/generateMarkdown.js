import parse from 'json-schema-to-markdown'

import { createRequire } from 'node:module';
import { jsonschema2md } from '@adobe/jsonschema2md';
import { mkdir, writeFile } from 'node:fs/promises';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = dirname(fileURLToPath(import.meta.url));

const require = createRequire(import.meta.url);
const ddsSchema = require('../tsp-output/schema/ddsReference.schema.json');


const markdown = parse(ddsSchema);

console.log(markdown);

/*
const markdown = jsonschema2md(ddsSchema, {
  includeReadme: true,
});

const ensureString = (val) => {
  if (typeof val === 'string') return val;
  if (val && typeof val === 'object' && typeof val.content === 'string') return val.content;
  // Fallback so we never pass a raw object to writeFile:
  return JSON.stringify(val, null, 2);
};

const outFile = resolve(__dirname, '../docs/reference/ddsReference.md');
await mkdir(dirname(outFile), { recursive: true });
await writeFile(outFile, ensureString(markdown), 'utf8');

console.log(`Wrote ${outFile}`);
*/
