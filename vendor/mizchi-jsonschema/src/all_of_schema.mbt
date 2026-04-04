///|
pub struct AllOfSchema {
  schemas : Array[JsonSchema]
} derive(Show, Eq)

///|
impl JsonSchemaSerializable for AllOfSchema with to_json_schema(self) {
  { "allOf": self.schemas.map(fn(s) { s.to_json() }) }
}

///|
impl JsonSchemaSerializable for AllOfSchema with parse(_json) {
  ...
}

///|
impl Validatable for AllOfSchema with validate(
  self,
  value,
  resolver~,
  json_path~,
  schema_path~,
) {
  let errors : Array[ValidationError] = []
  let mut passed = 0
  for idx, schema in self.schemas {
    let sub_errors = schema.validate(
      value,
      resolver~,
      json_path~,
      schema_path=schema_path.key("oneOf").index(idx),
    )
    if sub_errors.length() == 0 {
      passed += 1
    } else {
      errors.append(sub_errors)
    }
  }
  if passed == self.schemas.length() {
    []
  } else {
    errors.push(
      ValidationError::new(
        value,
        json_path,
        schema_path.key("allOf"),
        "Value does not match exactly one schema in allOf",
      ),
    )
    errors
  }
}
