///|
pub struct RefSchema {
  pointer : JsonPointer
} derive(Show, Eq, FromJson, ToJson)

///|
impl JsonSchemaSerializable for RefSchema with to_json_schema(self) {
  { "$ref": self.pointer.to_string() }
}

///|
impl JsonSchemaSerializable for RefSchema with parse(json) {
  guard json is { "$ref": String(refstr), .. } else {
    return Err("Expected string for RefSchema".to_string())
  }
  let pointer = JsonPointer::from_string(refstr).unwrap()
  RefSchema::{ pointer, } |> JsonSchema::Ref |> Ok
}

///|
impl Validatable for RefSchema with validate(
  self,
  value,
  resolver~,
  json_path~,
  schema_path~,
) {
  // ignore((json_path, schema_path))
  // ...
  match resolver.resolve(self.pointer) {
    Some(resolved_schema) => {
      // let opath = ObjectPath::from_json_pointer(ref_expr)
      let errors = resolved_schema.validate(
        value,
        json_path~,
        // TODO: fix schema_path to reference path
        schema_path=schema_path.key("$ref"),
        resolver~,
      )
      errors
    }
    None =>
      [
        ValidationError::new(
          value,
          json_path,
          schema_path.key("$ref"),
          "Failed to resolve reference '\{self.pointer}'",
        ),
      ]
  }
}
