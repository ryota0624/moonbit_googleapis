///|
/// JsonSchema compilation errors
pub suberror ParseError {
  JsonDecodeError(@json.JsonDecodeError)
  PointerParseError(String)
  InvalidSchema(String)
}

///|
pub struct ValidationError {
  input : Json
  json_path : JsonPointer
  schema_path : JsonPointer
  message : String
  children : Array[ValidationError]?
} derive(Show, Eq)

///|
pub fn ValidationError::new(
  input : Json,
  json_path : JsonPointer,
  schema_path : JsonPointer,
  message : String,
  children? : Array[ValidationError],
) -> ValidationError {
  ValidationError::{ input, json_path, schema_path, message, children }
}
