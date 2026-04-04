///|
pub struct ObjectSchema {
  properties : Map[String, JsonSchema]?
  required : Array[String]?
  additional_properties : JsonSchema?
} derive (
  Show,
  Eq,
  FromJson(
    fields(
      additional_properties(rename="additionalProperties"),
      pattern_properties(rename="patternProperties"),
      property_names(rename="propertyNames"),
    ),
  ),
  ToJson(
    fields(
      additional_properties(rename="additionalProperties"),
      pattern_properties(rename="patternProperties"),
    ),
  ),
)

///|
impl JsonSchemaSerializable for ObjectSchema with to_json_schema(self) {
  with_type_property(self.to_json(), "object")
}

///|
impl JsonSchemaSerializable for ObjectSchema with parse(json) {
  try {
    let v : ObjectSchema = @json.from_json(json)
    v |> JsonSchema::Object |> Ok
  } catch {
    _ => Err("Failed to parse StringConstraint".to_string())
  }
}

///|
impl Validatable for ObjectSchema with validate(
  self,
  value,
  resolver~,
  json_path~,
  schema_path~,
) {
  guard value is Json::Object(obj) else {
    return [
      ValidationError::new(
        value,
        json_path,
        schema_path,
        "\{value} is not an object",
      ),
    ]
  }
  // Required properties
  let errors : Array[ValidationError] = []

  // let required_keys: Array[String] = []
  if self.required is Some(required_keys) {
    let non_exsited_keys = required_keys.filter(fn(key) { !obj.contains(key) })
    for key in non_exsited_keys {
      errors.push(
        ValidationError::new(
          value,
          json_path.key(key),
          schema_path.key("required"),
          "Required property '\{key}' is missing",
        ),
      )
    }
  }
  // TODO: {type: string}
  let required_keys = match self.required {
    Some(keys) => Set::from_array(keys)
    None => Set::new()
  }
  let props_keys = match self.properties {
    Some(props) => props.keys() |> Set::from_iter
    None => Set::new()
  }
  let additional_props = obj
    .keys()
    .filter(fn(key) {
      !required_keys.contains(key) && !props_keys.contains(key)
    })
    |> Set::from_iter
  if self.additional_properties is Some(schema) {
    for key in additional_props {
      guard obj.get(key) is Some(child_value) else { continue }
      let child_errors = schema.validate(
        child_value,
        json_path=json_path.key(key),
        schema_path=schema_path.key("additionalProperties"),
        resolver~,
      )
      errors.append(child_errors)
    }
  } else if additional_props.size() > 0 {
    for key in additional_props {
      errors.push(
        ValidationError::new(
          value,
          json_path.key(key),
          schema_path.key("additionalProperties"),
          "Additional property '\{additional_props}' is not allowed",
        ),
      )
    }
  }
  // Properties validation
  if self.properties is Some(props) {
    props.each(fn(prop_name, child_schema) {
      guard obj.get(prop_name) is Some(child_value) else { return }
      let child_errors = child_schema.validate(
        child_value,
        json_path=json_path.key(prop_name),
        schema_path=schema_path.key("properties").key(prop_name),
        resolver~,
      )
      errors.append(child_errors)
    })
    // No properties to validate
  }
  errors
}
