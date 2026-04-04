///|
struct IntegerSchema {
  minimum : Int?
  maximum : Int?
  exclusive_minimum : Int?
  exclusive_maximum : Int?
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
impl JsonSchemaSerializable for IntegerSchema with to_json_schema(self) {
  with_type_property(self.to_json(), "integer")
}

///|
impl JsonSchemaSerializable for IntegerSchema with parse(json) {
  try {
    let v : IntegerSchema = @json.from_json(json)
    v |> JsonSchema::Integer |> Ok
  } catch {
    _ => Err("Failed to parse IntegerSchema".to_string())
  }
  // parsed |> Ok
}

///|
impl Validatable for IntegerSchema with validate(
  self,
  value,
  resolver~,
  json_path~,
  schema_path~,
) {
  ignore(resolver)
  guard value is Json::Number(input, ..) && input == input.to_int().to_double() else {
    return [
      ValidationError::new(
        value, json_path, schema_path, "Value is not a number",
      ),
    ]
  }
  let { minimum, maximum, exclusive_minimum, exclusive_maximum } = self
  let errors : Array[ValidationError] = []
  let input : Int = input.to_int()
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
