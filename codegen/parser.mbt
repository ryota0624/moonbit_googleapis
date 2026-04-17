///|
pub fn parse_proto_image(json_str : String) -> ProtoImage raise ParseError {
  let root = @json.parse(json_str) catch {
    e => raise ParseError::JsonSyntax(e.to_string())
  }
  @json.from_json(root) catch {
    e => raise ParseError::WrongJsonType(e.to_string())
  }
}

///|
/// Parse a Google Discovery API REST description JSON directly into a
/// `RestDescription`. The codegen internal model (`RestDescription`) mirrors
/// the Discovery JSON shape exactly, so parsing is a single `from_json`.
pub fn parse_discovery_rest_description(
  json_str : String,
) -> RestDescription raise ParseError {
  let root = @json.parse(json_str) catch {
    e => raise ParseError::JsonSyntax(e.to_string())
  }
  @json.from_json(root) catch {
    e => raise ParseError::WrongJsonType(e.to_string())
  }
}

///|
/// Input formats accepted by the codegen.
pub enum InputFormat {
  /// buf-built proto image (FileDescriptorSet JSON). Requires a
  /// `proto_package` argument to select which package to generate.
  Proto
  /// Google Discovery API JSON document (e.g. fetched from
  /// `https://www.googleapis.com/discovery/v1/apis/<api>/<version>/rest`).
  Discovery
} derive(Eq, Debug)

///|
/// Detect the input format by peeking at the top-level JSON object:
/// - Discovery: top-level `kind == "discovery#restDescription"`
/// - Proto image (buf): top-level has a `file` array.
pub fn detect_input_format(json_str : String) -> InputFormat raise ParseError {
  let root = @json.parse(json_str) catch {
    e => raise ParseError::JsonSyntax(e.to_string())
  }
  match root {
    Object(m) =>
      match m.get("kind") {
        Some(String(k)) =>
          if k == "discovery#restDescription" {
            InputFormat::Discovery
          } else {
            raise ParseError::WrongJsonType(
              "unknown top-level kind: \{k} (expected \"discovery#restDescription\" or a buf proto image)",
            )
          }
        _ =>
          match m.get("file") {
            Some(Array(_)) => InputFormat::Proto
            _ =>
              raise ParseError::WrongJsonType(
                "cannot detect input format: expected either a Discovery document (kind=\"discovery#restDescription\") or a buf proto image (top-level \"file\" array)",
              )
          }
      }
    _ =>
      raise ParseError::WrongJsonType(
        "top-level JSON must be an object, got \{root}",
      )
  }
}
