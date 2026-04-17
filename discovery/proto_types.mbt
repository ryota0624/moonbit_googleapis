///|
pub struct ProtoImage {
  file : Array[ProtoFile]
} derive(FromJson(rename_fields="camelCase"))

///|
pub struct ProtoFile {
  name : String?
  package_ : String?
  message_type : Array[ProtoMessage]?
  service : Array[ProtoService]?
  enum_type : Array[ProtoEnum]?
} derive(FromJson(rename_fields="camelCase", fields(package_(rename="package"))))

///|
pub struct ProtoService {
  name : String?
  methods : Array[ProtoRpcMethod]?
  options : Map[String, Json]?
} derive(FromJson(rename_fields="camelCase", fields(methods(rename="method"))))

///|
pub struct ProtoRpcMethod {
  name : String?
  input_type : String?
  output_type : String?
  server_streaming : Bool?
  options : Map[String, Json]?
} derive(FromJson(rename_fields="camelCase"))

///|
pub struct ProtoMessage {
  name : String?
  field : Array[ProtoField]?
  nested_type : Array[ProtoMessage]?
  enum_type : Array[ProtoEnum]?
  oneof_decl : Array[ProtoOneofDecl]?
} derive(FromJson(rename_fields="camelCase"))

///|
pub struct ProtoField {
  name : String?
  label : String?
  type_ : String?
  type_name : String?
  json_name : String?
  oneof_index : Int?
} derive(FromJson(rename_fields="camelCase", fields(type_(rename="type"))))

///|
pub struct ProtoEnum {
  name : String?
} derive(FromJson(rename_fields="camelCase"))

///|
pub struct ProtoOneofDecl {
  name : String?
} derive(FromJson(rename_fields="camelCase"))

///|
pub struct HttpRule {
  get : String?
  post : String?
  patch : String?
  put : String?
  delete : String?
  body : String?
  additional_bindings : Array[HttpRule]?
} derive(FromJson(rename_fields="camelCase"))
