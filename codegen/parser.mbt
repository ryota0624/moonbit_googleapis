///|
pub fn parse_proto_image(json_str : String) -> ProtoImage raise ParseError {
  let root = @json.parse(json_str) catch {
    e => raise ParseError::JsonSyntax(e.to_string())
  }
  @json.from_json(root) catch {
    e => raise ParseError::WrongJsonType(e.to_string())
  }
}
