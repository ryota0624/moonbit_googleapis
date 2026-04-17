///|
pub suberror ParseError {
  JsonSyntax(String)
  WrongJsonType(String)
} derive(Debug)

///|
pub impl Show for ParseError with output(self, logger) {
  match self {
    JsonSyntax(s) => logger.write_string("JsonSyntax(\{s})")
    WrongJsonType(s) => logger.write_string("WrongJsonType(\{s})")
  }
}

///|
pub struct RestDescription {
  name : String
  version : String
  title : String
  description : String?
  base_url : String
  schemas : Map[String, JsonSchema]?
  resources : Map[String, RestResource]?
} derive(FromJson(rename_fields="camelCase"))

///|
pub struct JsonSchema {
  id : String?
  type_ : String?
  description : String?
  properties : Map[String, JsonSchema]?
  items : JsonSchema?
  ref_ : String?
} derive (
  FromJson(
    rename_fields="camelCase",
    fields(type_(rename="type"), ref_(rename="$ref")),
  ),
)

///|
pub struct RestResource {
  methods : Map[String, RestMethod]?
  resources : Map[String, RestResource]?
} derive(FromJson(rename_fields="camelCase"))

///|
pub struct RestMethod {
  id : String
  path : String
  http_method : String
  description : String?
  parameters : Map[String, MethodParameter]?
  request : MethodMedia?
  response : MethodMedia?
  server_streaming : Bool?
} derive(FromJson(rename_fields="camelCase"))

///|
pub struct MethodParameter {
  type_ : String?
  description : String?
  required : Bool?
  location : String?
  repeated : Bool?
} derive(FromJson(rename_fields="camelCase", fields(type_(rename="type"))))

///|
pub struct MethodMedia {
  ref_ : String?
} derive(FromJson(fields(ref_(rename="$ref"))))
