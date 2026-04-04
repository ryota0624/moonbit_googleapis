///|
pub struct NumberSchema {
  minimum : Double?
  maximum : Double?
  exclusive_minimum : Double?
  exclusive_maximum : Double?
  // multipleOf : Double?
} derive (
  Show,
  Eq,
  ToJson(
    fields(
      exclusive_minimum(rename="exclusiveMinimum"),
      exclusive_maximum(rename="exclusiveMaximum"),
      multiple_of(rename="multipleOf"),
    ),
  ),
  FromJson(
    fields(
      exclusive_minimum(rename="exclusiveMinimum"),
      exclusive_maximum(rename="exclusiveMaximum"),
      multiple_of(rename="multipleOf"),
    ),
  ),
)

///|
impl JsonSchemaSerializable for NumberSchema with to_json_schema(self) {
  with_type_property(self.to_json(), "number")
}

///|
impl JsonSchemaSerializable for NumberSchema with parse(json) {
  try {
    let v : NumberSchema = @json.from_json(json)
    v |> JsonSchema::Number |> Ok
  } catch {
    _ => Err("Failed to parse StringConstraint".to_string())
  }
  // parsed |> Ok
}

///|
impl Validatable for NumberSchema with validate(
  self,
  value,
  resolver~,
  json_path~,
  schema_path~,
) {
  ignore(resolver)
  guard value is Json::Number(input, ..) else {
    return [
      ValidationError::new(
        value, json_path, schema_path, "Value is not a number",
      ),
    ]
  }
  let { minimum, maximum, exclusive_minimum, exclusive_maximum } = self
  let errors : Array[ValidationError] = []
  if minimum is Some(min) && input < min {
    errors.push(
      ValidationError::new(
        value,
        json_path,
        schema_path.key("minimum"),
        "Value is less than minimum \{min}",
      ),
    )
  }
  if maximum is Some(max) && input > max {
    errors.push(
      ValidationError::new(
        value,
        json_path,
        schema_path.key("maximum"),
        "Value is greater than maximum \{max}",
      ),
    )
  }
  if exclusive_maximum is Some(max) && input >= max {
    errors.push(
      ValidationError::new(
        value,
        json_path,
        schema_path.key("exclusiveMaximum"),
        "\{input} is not less than exclusive maximum \{max}",
      ),
    )
  }
  if exclusive_minimum is Some(min) && input <= min {
    errors.push(
      ValidationError::new(
        value,
        json_path,
        schema_path.key("exclusiveMinimum"),
        "Value is not greater than exclusive minimum \{min}",
      ),
    )
  }
  errors
}
