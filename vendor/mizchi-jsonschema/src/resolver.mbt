///|
pub fn build_resolver(root_json : Json) -> Resolver raise ParseError {
  Resolver::new(root_json)
}

///|
pub struct Resolver {
  priv resolver_map : Map[JsonPointer, JsonSchema]
}

///|
pub fn Resolver::new(root_json : Json) -> Resolver raise ParseError {
  let resolver_map : Map[JsonPointer, JsonSchema] = {}
  let using_refs = collect_refs(root_json)
  for ref_expr in using_refs {
    guard JsonPointer::from_string(ref_expr) is Ok(pointer) else {
      raise ParseError::PointerParseError(ref_expr)
    }
    match pointer.access(root_json) {
      Some(json) =>
        try {
          let schema : JsonSchema = @json.from_json(json)
          resolver_map.set(pointer, schema)
        } catch {
          _ =>
            raise ParseError::InvalidSchema(
              "Failed to parse schema at reference '\{ref_expr}'",
            )
        }
      None => ()
    }
  }
  Resolver::{ resolver_map, }
}

///|
pub fn resolve(self : Resolver, pointer : JsonPointer) -> JsonSchema? {
  self.resolver_map.get(pointer)
}

///|
pub fn has(self : Resolver, ref_expr : JsonPointer) -> Bool {
  self.resolver_map.contains(ref_expr)
}

///|
pub fn get_refs(self : Resolver) -> Array[JsonPointer] {
  self.resolver_map.keys().to_array()
}

///|
/// get $ref references in json
pub fn collect_refs(json : Json) -> Set[String] {
  let set : Set[String] = Set::new()
  match json {
    Object(obj) =>
      for key, value in obj {
        if key == "$ref" && value is String(s) {
          set.add(s)
        } else {
          let newset = collect_refs(value)
          for s in newset {
            set.add(s)
          }
        }
      }
    Array(arr) =>
      for item in arr {
        let newset = collect_refs(item)
        for s in newset {
          set.add(s)
        }
      }
    _ => ()
  }
  set
}

///|
test "collect_refs" {
  let json : Json = {
    "type": "object",
    "properties": {
      "name": { "type": "string" },
      "age": { "$ref": "#/definitions/PositiveInteger" },
      "friends": {
        "type": "array",
        "items": { "$ref": "#/definitions/Person" },
      },
    },
    "definitions": {
      "Person": {
        "type": "object",
        "properties": {
          "name": { "type": "string" },
          "age": { "$ref": "#/definitions/PositiveInteger" },
        },
      },
      "PositiveInteger": { "type": "integer", "minimum": 0 },
    },
  }
  let refs = collect_refs(json)
  assert_eq(
    refs,
    Set::from_array(["#/definitions/PositiveInteger", "#/definitions/Person"]),
  )
}
