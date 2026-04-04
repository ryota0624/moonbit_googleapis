# @mizchi/jsonschema

```
$ moon add mizchi/jsonschema
```

## Features

- Parse raw json schema to build Validator
- Schema Builder like a zod
- Moonbit Code generation from json schema
  - `mizchi/jsonschema/codegen`

## Supported

- [x] type: any
- [x] type: null
- [x] type: number
  - [x] minimum
  - [x] maximum
  - [x] exclusiveMinimum
  - [x] exclusiveMaximum
  - [ ] multipleOf
- [x] type: integer

  - [x] minimum
  - [x] maximum
  - [x] exclusiveMinimum
  - [x] exclusiveMaximum
  - [ ] multipleOf

- [x] type: string
  - [x] minLength
  - [x] maxLength
  - [x] enum
- [x] type: boolean
- [x] type: array
  - [x] items
  - [x] minItems
  - [x] maxItems
  - [x] prefixItems
  - [ ] additionalItems
  - [ ] contains
  - [ ] minContains
  - [ ] maxContains
- [x] type: object

  - [x] properties
  - [x] `additionalProperties: true`
  - [x] `additionalProperties: false`
  - [ ] `additionalProperties: { "type": "..." }`
  - [ ] patternProperties
  - [ ] propertyNames
  - [ ] dependentSchemas
  - [ ] dependentRequired
  - [ ] minProperties
  - [ ] maxProperties

- [x] anyOf
- [x] allOf
- [x] oneOf
- [ ] not
- [x] `$ref`
  - [x] key `#/defs/bar`
  - [x] index `#/defs/items/0/bar`
- [ ] if
- [x] const
- [ ] `{ "type": ["string", "null"] }`

## LICENSE

MIT
