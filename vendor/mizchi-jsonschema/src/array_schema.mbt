///|
pub struct ArraySchema {
  items : JsonSchema?
  prefix_items : Array[JsonSchema]?
  contains : JsonSchema?
  min_contains : Int?
  max_contains : Int?
  min_items : Int?
  max_items : Int?
} derive (
  Show,
  Eq,
  FromJson(
    fields(
      prefix_items(rename="prefixItems"),
      min_contains(rename="minContains"),
      max_contains(rename="maxContains"),
      min_items(rename="minItems"),
      max_items(rename="maxItems"),
    ),
  ),
  ToJson(
    fields(
      prefix_items(rename="prefixItems"),
      min_contains(rename="minContains"),
      max_contains(rename="maxContains"),
      min_items(rename="minItems"),
      max_items(rename="maxItems"),
    ),
  ),
)

///|
impl JsonSchemaSerializable for ArraySchema with to_json_schema(self) {
  with_type_property(self.to_json(), "array")
}

///|
impl JsonSchemaSerializable for ArraySchema with parse(json) {
  try {
    let v : StringSchema = @json.from_json(json)
    v |> JsonSchema::String |> Ok
  } catch {
    _ => Err("Failed to parse StringConstraint".to_string())
  }
  // parsed |> Ok
}

///|
impl Validatable for ArraySchema with validate(
  self,
  value,
  resolver~,
  json_path~,
  schema_path~,
) {
  guard value is Json::Array(array) else {
    return [
      ValidationError::new(
        value, json_path, schema_path, "Value is not an array",
      ),
    ]
  }
  let errors : Array[ValidationError] = []
  let len = array.length()

  // Min items
  if self.min_items is Some(min) && len < min {
    errors.push(
      ValidationError::new(
        value,
        json_path,
        schema_path.key("minItems"),
        "Array length \{len} is less than minimum \{min}",
      ),
    )
  }

  // Max items
  if self.max_items is Some(max) && len > max {
    errors.push(
      ValidationError::new(
        value,
        json_path,
        schema_path.key("maxItems"),
        "Array length \{len} is greater than maximum \{max}",
      ),
    )
  }
  // check items
  if self.items is Some(item_schema) {
    for i, item in array {
      errors.append(
        item_schema.validate(
          item,
          resolver~,
          json_path=json_path.index(i),
          schema_path=schema_path.key("items"),
        ),
      )
    }
  }
  // check prefixItems
  if self.prefix_items is Some(prefix_items) {
    for idx, item_schema in prefix_items {
      match array.get(idx) {
        Some(item_value) =>
          errors.append(
            item_schema.validate(
              item_value,
              resolver~,
              json_path=json_path.index(idx),
              schema_path=schema_path.key("prefixItems").index(idx),
            ),
          )
        None =>
          errors.push(
            ValidationError::new(
              value,
              json_path,
              schema_path.key("prefixItems").index(idx),
              "Array does not have item at index \{idx}",
            ),
          )
      }
    }
  }
  errors
}
