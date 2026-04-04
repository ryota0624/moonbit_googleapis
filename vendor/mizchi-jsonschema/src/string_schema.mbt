///|
pub struct StringSchema {
  min_length : Int?
  max_length : Int?
  enum_ : Array[String]?
} derive (
  Show,
  Eq,
  FromJson(
    fields(
      min_length(rename="minLength"),
      max_length(rename="maxLength"),
      enum_(rename="enum"),
    ),
  ),
  ToJson(
    fields(
      min_length(rename="minLength"),
      max_length(rename="maxLength"),
      enum_(rename="enum"),
    ),
  ),
)

///|
impl JsonSchemaSerializable for StringSchema with to_json_schema(self) {
  with_type_property(self.to_json(), "string")
}

///|
impl JsonSchemaSerializable for StringSchema with parse(json) {
  try {
    let v : StringSchema = @json.from_json(json)
    v |> JsonSchema::String |> Ok
  } catch {
    _ => Err("Failed to parse StringConstraint".to_string())
  }
  // parsed |> Ok
}

///|
impl Validatable for StringSchema with validate(
  self,
  input,
  resolver~,
  json_path~,
  schema_path~,
) {
  ignore(resolver)
  guard input is Json::String(input) else {
    return [
      ValidationError::new(
        input, json_path, schema_path, "Value is not a string",
      ),
    ]
  }
  let errors : Array[ValidationError] = []
  let len = input.length()
  if self.min_length is Some(min) && len < min {
    errors.push(
      ValidationError::new(
        input.to_json(),
        json_path,
        schema_path.key("minLength"),
        "String length \{len} is less than minimum \{min}",
      ),
    )
  }
  if self.max_length is Some(max) && len > max {
    return [
      ValidationError::new(
        input.to_json(),
        json_path,
        schema_path.key("maxLength"),
        "String length \{len} is greater than maximum \{max}",
      ),
    ]
  }
  if self.enum_ is Some(enum_values) && !enum_values.contains(input) {
    return [
      ValidationError::new(
        input.to_json(),
        json_path,
        schema_path.key("enum"),
        "\{input} is not in \{enum_values}",
      ),
    ]
  }
  errors
}

///|
test "StringConstraint::from_json validate and to_json" {
  let json : Json = { "type": "string" }
  let s = StringSchema::parse(json).unwrap()
  let resolver = build_resolver({})
  s.validate(
    "hell",
    resolver~,
    json_path=JsonPointer::Root,
    schema_path=JsonPointer::Root,
  )
  |> assert_eq([])
  s.to_json() |> assert_eq(json)
}

///|
test "StringConstraint::validate" {
  let schema = StringSchema::{
    min_length: Some(3),
    max_length: Some(5),
    enum_: None,
  }
  let resolver = build_resolver({})
  let err_with_min_err = schema.validate(
    "h",
    resolver~,
    json_path=JsonPointer::Root,
    schema_path=JsonPointer::Root,
  )
  assert_not_eq(err_with_min_err, [])
  schema.validate(
    "hell",
    resolver~,
    json_path=JsonPointer::Root,
    schema_path=JsonPointer::Root,
  )
  |> assert_eq([])
  // not string
  schema.validate(
    1,
    resolver~,
    json_path=JsonPointer::Root,
    schema_path=JsonPointer::Root,
  )
  |> assert_not_eq([])
}
