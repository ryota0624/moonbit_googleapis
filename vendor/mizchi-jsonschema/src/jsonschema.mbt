// JSON Schema types and definitions

///|
priv trait JsonSchemaSerializable {
  parse(Json) -> Result[JsonSchema, String]
  to_json_schema(Self) -> Json
}

///|
pub trait Validatable {
  validate(
    Self,
    Json,
    resolver~ : Resolver,
    json_path~ : JsonPointer,
    schema_path~ : JsonPointer,
  ) -> Array[ValidationError]
}

///|
/// JsonSchema
pub enum JsonSchema {
  Any(AnySchema)
  Null(NullSchema)
  Boolean(BooleanSchema)
  String(StringSchema)
  Number(NumberSchema)
  Integer(IntegerSchema)
  Array(ArraySchema)
  Object(ObjectSchema)
  AnyOf(AnyOfSchema)
  AllOf(AllOfSchema)
  OneOf(OneOfSchema)
  Ref(RefSchema)
  Enum(EnumSchema)
  Const(ConstSchema)
  // Not(JsonSchema)
  // If(Schema, Schema?, Schema?) // if, then, else
} derive(Show, Eq)

///|
/// TODO: Remove this helper function if possible
fn with_type_property(json : Json, type_name : String) -> Json {
  guard json is Json::Object(obj) else { return json }
  let json : Map[String, Json] = { "type": type_name.to_json() }
  for k, v in obj {
    json[k] = v
  }
  return json.to_json()
}

///|
pub impl ToJson for JsonSchema with to_json(self) -> Json {
  match self {
    Any(s) => s.to_json_schema()
    Null(s) => s.to_json_schema()
    Boolean(s) => s.to_json_schema()
    String(s) => s.to_json_schema()
    Number(s) => s.to_json_schema()
    Integer(s) => s.to_json_schema()
    Array(s) => s.to_json_schema()
    Object(s) => s.to_json_schema()
    JsonSchema::AnyOf(s) => s.to_json_schema()
    JsonSchema::AllOf(s) => s.to_json_schema()
    JsonSchema::OneOf(s) => s.to_json_schema()
    Ref(s) => s.to_json_schema()
    Const(s) => s.to_json_schema()
    Enum(s) => s.to_json_schema()
    // JsonSchema::Not(schema) => { "not": schema }
  }
}

///|
pub impl Validatable for JsonSchema with validate(
  self,
  value,
  resolver~,
  json_path~,
  schema_path~,
) {
  match self {
    Const(s) => s.validate(value, resolver~, json_path~, schema_path~)
    Integer(s) => s.validate(value, resolver~, json_path~, schema_path~)
    Enum(s) => s.validate(value, resolver~, json_path~, schema_path~)
    Boolean(s) => s.validate(value, resolver~, json_path~, schema_path~)
    Ref(s) => s.validate(value, resolver~, json_path~, schema_path~)
    Null(s) => s.validate(value, resolver~, json_path~, schema_path~)
    Any(s) => s.validate(value, resolver~, json_path~, schema_path~)
    Number(c) => c.validate(value, resolver~, json_path~, schema_path~)
    String(c) => c.validate(value, resolver~, json_path~, schema_path~)
    Array(c) => c.validate(value, resolver~, json_path~, schema_path~)
    Object(v) => v.validate(value, resolver~, json_path~, schema_path~)
    AllOf(s) => s.validate(value, resolver~, json_path~, schema_path~)
    OneOf(s) => s.validate(value, resolver~, json_path~, schema_path~)
    AnyOf(s) => s.validate(value, resolver~, json_path~, schema_path~)
    // WIP
    // Not(_schema) =>
    //   // TODO: implement Not validation
    //   []
  }
}

///|
pub impl @json.FromJson for JsonSchema with from_json(
  json : Json,
  json_path : @json.JsonPath,
) -> JsonSchema raise {
  guard json is Json::Object(obj) else {
    raise @json.JsonDecodeError((json_path, "Expected an object"))
  }
  match obj {
    { "type": "any", .. } =>
      AnySchema::from_json(json, json_path) |> JsonSchema::Any
    { "const": value, .. } => Const({ value, })
    { "$ref": String(_), .. } => RefSchema::parse(json).unwrap()
    { "type": "object", .. } =>
      ObjectSchema::from_json(json, json_path) |> JsonSchema::Object
    { "type": "array", .. } =>
      ArraySchema::from_json(json, json_path) |> JsonSchema::Array
    { "type": "null", .. } => JsonSchema::Null(NullSchema::{  })
    { "type": "boolean", .. } => JsonSchema::Boolean(BooleanSchema::{  })
    { "type": "string", .. } =>
      StringSchema::from_json(json, json_path) |> JsonSchema::String
    { "type": "number", .. } =>
      NumberSchema::from_json(json, json_path) |> JsonSchema::Number
    { "type": "integer", .. } =>
      IntegerSchema::from_json(json, json_path) |> JsonSchema::Integer
    { "anyOf": Array(schemas), .. } =>
      JsonSchema::AnyOf({
        schemas: schemas.map(fn(s) {
          @json.from_json(s, path=json_path.add_key("anyOf"))
        }),
      })
    { "allOf": Array(schemas), .. } =>
      JsonSchema::AllOf({
        schemas: schemas.map(fn(s) {
          @json.from_json(s, path=json_path.add_key("allOf"))
        }),
      })
    { "oneOf": Array(schemas), .. } =>
      JsonSchema::OneOf({
        schemas: schemas.mapi(fn(i, s) {
          @json.from_json(s, path=json_path.add_key("oneOf").add_index(i))
        }),
        parsed_enumerable: None,
        parsed_nullable: None,
      })
    //   JsonSchema::Not(@json.from_json(schema, path=json_path.add_key("not")))
    { "enum": Array(values), .. } => JsonSchema::Enum(EnumSchema::{ values, })
    _ => JsonSchema::Any(AnySchema::{  })
  }
}

///| Primitive types

///|
pub struct AnySchema {} derive(Show, Eq, FromJson, ToJson)

///|
impl JsonSchemaSerializable for AnySchema with to_json_schema(_self) {
  { "type": "any" }
}

///|
impl JsonSchemaSerializable for AnySchema with parse(json) {
  if not(json is { "type": "any", .. }) {
    return Err("Expected an object for AnySchema".to_string())
  }
  try {
    let v : AnySchema = @json.from_json(json)
    v |> JsonSchema::Any |> Ok
  } catch {
    _ => Err("Failed to parse AnySchema".to_string())
  }
}

///|
impl Validatable for AnySchema with validate(
  _self,
  _value,
  resolver~,
  json_path~,
  schema_path~,
) {
  ignore((json_path, schema_path, resolver))
  []
}

///|
pub struct NullSchema {} derive(Show, Eq, FromJson, ToJson)

///|
impl JsonSchemaSerializable for NullSchema with to_json_schema(_self) {
  with_type_property({}, "null")
}

///|
impl JsonSchemaSerializable for NullSchema with parse(json) {
  if not(json is { "type": "null", .. }) {
    return Err("Expected an object for NullSchema".to_string())
  }
  try {
    let v : NullSchema = @json.from_json(json)
    v |> JsonSchema::Null |> Ok
  } catch {
    _ => Err("Failed to parse NullSchema".to_string())
  }
}

///|
impl Validatable for NullSchema with validate(
  _self,
  value,
  resolver~,
  json_path~,
  schema_path~,
) {
  ignore((json_path, schema_path, resolver))
  match value {
    Json::Null => []
    _ =>
      [ValidationError::new(value, json_path, schema_path, "Value is not null")]
  }
  // []
}

///|
pub struct BooleanSchema {} derive(Show, Eq, FromJson, ToJson)

///|
impl JsonSchemaSerializable for BooleanSchema with to_json_schema(_self) {
  with_type_property({}, "boolean")
}

///|
impl JsonSchemaSerializable for BooleanSchema with parse(json) {
  if not(json is { "type": "boolean", .. }) {
    return Err("Expected an object for NullSchema".to_string())
  }
  try {
    let v : BooleanSchema = @json.from_json(json)
    v |> JsonSchema::Boolean |> Ok
  } catch {
    _ => Err("Failed to parse NullSchema".to_string())
  }
}

///|
impl Validatable for BooleanSchema with validate(
  _self,
  value,
  resolver~,
  json_path~,
  schema_path~,
) {
  ignore((json_path, schema_path, resolver))
  match value {
    Json::True => []
    Json::False => []
    _ =>
      [
        ValidationError::new(
          value, json_path, schema_path, "Value is not a boolean",
        ),
      ]
  }
}
