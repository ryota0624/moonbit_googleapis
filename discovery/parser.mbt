///|
pub fn parse_discovery(json_str : String) -> RestDescription raise ParseError {
  let root = @json.parse(json_str) catch {
    e => raise ParseError::JsonSyntax(e.to_string())
  }
  @json.from_json(root) catch {
    e => raise ParseError::WrongJsonType(e.to_string())
  }
}
