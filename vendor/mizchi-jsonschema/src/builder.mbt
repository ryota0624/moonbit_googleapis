// builder

///|
/// Schema builder like a zod schema
/// Example usage:
/// ```moon
/// let b = @jsonschema.Builder::new()
/// let schema = b.object(
///   properties={
///     name: b.string(),
///     age: b.number(),
///   },
///   required=["name", "age"],
/// )
/// let _result = schema.validate({ "name": "Alice", "age": 30.0 }).unwrap()
/// ```
pub struct Builder {
  priv internal_state : Map[JsonPointer, JsonSchema]
}

///|
pub fn Builder::new() -> Builder {
  // TODO: use with resolver later
  Builder::{ internal_state: Map::new() }
}

///|
pub fn define_schema(
  self : Builder,
  pointer : JsonPointer,
  schema : JsonSchema,
) -> RefSchema {
  self.internal_state.set(pointer, schema)
  RefSchema::{ pointer, }
  // Builder::{ internal_state: Map::new().set(name, schema) }
}

///|
pub fn emit_json_schema(_self : Builder) -> Json {
  let raw : Json = {}
  // set json[...] = Schema.to_json() for each schema
  // for pointer, schema in self.internal_state {
  //   // wip
  // }
  raw
  // self.internal_state
}

///|
/// { "type": "string" }
pub fn Builder::string(
  _self : Builder,
  minLength? : Int,
  maxLength? : Int,
  enum_? : Array[String],
) -> JsonSchema {
  JsonSchema::String({ min_length: minLength, max_length: maxLength, enum_ })
}

///|
/// { "type": "number" }
pub fn Builder::number(
  _self : Builder,
  minimum? : Double,
  maximum? : Double,
  exclusive_minimum? : Double,
  exclusive_maximum? : Double,
) -> JsonSchema {
  JsonSchema::Number({ minimum, maximum, exclusive_minimum, exclusive_maximum },
    // multipleOf,
  )
}

///|
/// { "type": "integer" }
pub fn Builder::integer(
  _self : Builder,
  minimum? : Int,
  maximum? : Int,
  exclusive_minimum? : Int,
  exclusive_maximum? : Int,
) -> JsonSchema {
  JsonSchema::Integer({ minimum, maximum, exclusive_minimum, exclusive_maximum })
}

///|
/// { "type": "array" }
pub fn Builder::array(
  _self : Builder,
  items? : JsonSchema,
  prefix_items? : Array[JsonSchema],
  contains? : JsonSchema,
  min_contains? : Int,
  max_contains? : Int,
  min_items? : Int,
  max_items? : Int,
) -> JsonSchema {
  JsonSchema::Array({
    items,
    prefix_items,
    contains,
    min_contains,
    max_contains,
    min_items,
    max_items,
  })
}

///|
/// { "type": "null" }
pub fn Builder::null(_self : Builder) -> JsonSchema {
  Null(NullSchema::{  })
}

///|
/// { "type": "boolean" }
pub fn Builder::boolean(_self : Builder) -> JsonSchema {
  Boolean(BooleanSchema::{  })
}

///|
/// { "type": "any" }
pub fn Builder::any(_self : Builder) -> JsonSchema {
  Any(AnySchema::{  })
}

///|
/// { "type": "object" }
pub fn Builder::object(
  _self : Builder,
  properties? : Map[String, JsonSchema],
  required? : Array[String],
  additional_properties? : JsonSchema,
  // patternProperties? : Map[String, JsonSchema],
  // propertyNames? : JsonSchema,
  // dependentSchemas? : Map[String, JsonSchema],
  // dependentRequired? : Map[String, Array[String]],
  // minProperties? : Int,
  // maxProperties? : Int,
  // over
  required_all? : Bool = false,
) -> JsonSchema {
  JsonSchema::Object(ObjectSchema::{
      // description,
      properties,
      required: if required_all && properties is Some(props) {
        props.keys().to_array() |> Some
      } else {
        required
      },
      additional_properties,
    },
    // pattern_properties: patternProperties,
    // property_names: propertyNames,
    // dependent_schemas: dependentSchemas,
    // dependent_required: dependentRequired,
    // min_properties: minProperties,
    // max_properties: maxProperties,
  )
}

///|
/// { "enum": [...] }
pub fn Builder::enum_(_self : Builder, values : Array[Json]) -> JsonSchema {
  JsonSchema::Enum({ values, })
}

///|
/// { "const": value }
pub fn Builder::const_(_self : Builder, value : Json) -> JsonSchema {
  JsonSchema::Const({ value, })
}

///|
/// { "oneOf": [...] }
pub fn Builder::one_of(
  _self : Builder,
  schemas : Array[JsonSchema],
) -> JsonSchema {
  JsonSchema::OneOf({ schemas, parsed_enumerable: None, parsed_nullable: None })
}

///|
/// { "oneOf": [...] }
pub fn Builder::enumerable_one_of(
  self : Builder,
  tag : String,
  schemas : Array[JsonSchema],
  params~ : JsonSchema?,
) -> JsonSchema {
  // TODO: validate schemas
  if params is Some(params) {
    JsonSchema::OneOf({
      schemas: [
        self.const_(tag.to_json()),
        self.array(prefix_items=schemas),
        params,
      ],
      parsed_enumerable: None,
      parsed_nullable: None,
    })
  } else {
    JsonSchema::OneOf({
      schemas: [self.const_(tag.to_json()), self.array(prefix_items=schemas)],
      parsed_enumerable: None,
      parsed_nullable: None,
    })
  }
}

///|
/// { "anyOf": [...] }
pub fn Builder::any_of(
  _self : Builder,
  schemas : Array[JsonSchema],
) -> JsonSchema {
  JsonSchema::AnyOf({ schemas, })
}

///|
/// { "allOf": [...] }
pub fn Builder::all_of(
  _self : Builder,
  schemas : Array[JsonSchema],
) -> JsonSchema {
  JsonSchema::AllOf({ schemas, })
}

///|
/// { "$ref": ... }
pub fn Builder::ref_from_string(
  _self : Builder,
  pointer : String,
) -> JsonSchema {
  // TODO: validate pointer
  let p = JsonPointer::from_string(pointer).unwrap()
  JsonSchema::Ref({ pointer: p })
}

///|
pub fn Builder::ref_(_self : Builder, pointer : JsonPointer) -> JsonSchema {
  JsonSchema::Ref({ pointer, })
}

///|
test "parse object" {
  let input =
    #|{
    #|  "type": "object",
    #|  "properties": {
    #|    "name": { "type": "string" },
    #|    "age": { "type": "number" }
    #|  },
    #|  "required": ["name", "age"]
    #|}
  let jsonschema : Json = @json.parse(input)
  let schema : JsonSchema = @json.from_json(jsonschema)
  let resolver = build_resolver({})
  schema.validate(
    { "name": "Alice", "age": 30.0 },
    resolver~,
    json_path=JsonPointer::Root,
    schema_path=JsonPointer::Root,
  )
  |> inspect(content="[]")
  schema.validate(
    { "name": 42, "age": 30.0 },
    resolver~,
    json_path=JsonPointer::Root,
    schema_path=JsonPointer::Root,
  )
  |> inspect(
    content=(
      #|[{input: Number(42), json_path: #/name, schema_path: #/properties/name, message: "Value is not a string", children: None}]
    ),
  )
  schema.to_json().to_string()
  |> inspect(
    content=(
      #|Object({"type": String("object"), "properties": Object({"name": Object({"type": String("string")}), "age": Object({"type": String("number")})}), "required": Array([String("name"), String("age")])})
    ),
  )
  ()
}

///|
test "parse array" {
  let input =
    #|{
    #|  "type": "array",
    #|  "items": { "type": "string" }
    #|}
  let jsonschema : Json = @json.parse(input)
  let schema : JsonSchema = @json.from_json(jsonschema)
  let resolver = build_resolver({})
  schema.validate(
    ["a", "b"],
    resolver~,
    json_path=JsonPointer::Root,
    schema_path=JsonPointer::Root,
  )
  |> inspect(content="[]")
  schema.validate(
    ["a", 1],
    resolver~,
    json_path=JsonPointer::Root,
    schema_path=JsonPointer::Root,
  )
  |> inspect(
    content=(
      #|[{input: Number(1), json_path: #/1, schema_path: #/items, message: "Value is not a string", children: None}]
    ),
  )
}

///|
test "parse nested" {
  let input =
    #|{
    #|  "type": "object",
    #|  "properties": {
    #|    "name": { "type": "string" },
    #|    "age": { "type": "integer" },
    #|    "friends": { "type": "array", "items": { "type": "string" } },
    #|    "nullValue": { "type": "null" },
    #|    "anyValue": { "type": "any" }
    #|  },
    #|  "required": ["name", "age", "friends", "nullValue", "anyValue"]
    #|}
  let jsonschema : Json = @json.parse(input)
  let schema : JsonSchema = @json.from_json(jsonschema)
  let resolver = build_resolver({})
  schema.validate(
    {
      "name": "Alice",
      "age": 30,
      "friends": ["Bob"],
      "nullValue": null,
      "anyValue": "anything",
    },
    resolver~,
    json_path=JsonPointer::Root,
    schema_path=JsonPointer::Root,
  )
  |> inspect(content="[]")
  schema.validate(
    {
      "name": "Alice",
      "age": 30,
      "friends": [1],
      "nullValue": null,
      "anyValue": "anything",
    },
    resolver~,
    json_path=JsonPointer::Root,
    schema_path=JsonPointer::Root,
  )
  |> inspect(
    content=(
      #|[{input: Number(1), json_path: #/friends/0, schema_path: #/properties/friends/items, message: "Value is not a string", children: None}]
    ),
  )
}
