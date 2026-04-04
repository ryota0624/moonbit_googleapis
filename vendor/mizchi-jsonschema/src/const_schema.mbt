///|
pub struct ConstSchema {
  value : Json
} derive(Show, Eq, FromJson, ToJson)

///|
impl JsonSchemaSerializable for ConstSchema with to_json_schema(self) {
  { "const": self.value.to_json() }
}

///|
impl JsonSchemaSerializable for ConstSchema with parse(_json) {
  ...
}

///|
impl Validatable for ConstSchema with validate(
  self,
  value,
  resolver~,
  json_path~,
  schema_path~,
) {
  ignore(resolver)
  // ...
  if value != self.value {
    [
      ValidationError::new(
        value,
        json_path,
        schema_path,
        "Value does not match constant value \{self.value}",
      ),
    ]
  } else {
    []
  }
}

///|
pub struct EnumSchema {
  values : Array[Json]
} derive(Show, Eq, FromJson, ToJson)

///|
impl JsonSchemaSerializable for EnumSchema with to_json_schema(self) {
  { "enum": self.values.to_json() }
}

///|
impl JsonSchemaSerializable for EnumSchema with parse(_json) {
  ...
}

///|
impl Validatable for EnumSchema with validate(
  self,
  value,
  resolver~,
  json_path~,
  schema_path~,
) {
  ignore(resolver)
  if !self.values.contains(value) {
    [
      ValidationError::new(
        value,
        json_path,
        schema_path,
        "\{value} is not in \{self.values}",
      ),
    ]
  } else {
    []
  }
}
