///|
/// OneOf schema
pub struct OneOfSchema {
  schemas : Array[JsonSchema]
  parsed_nullable : JsonSchema?
  parsed_enumerable : Array[Enumerable]?
} derive(Show, Eq)

///|
impl JsonSchemaSerializable for OneOfSchema with to_json_schema(self) {
  { "oneOf": self.schemas.map(fn(s) { s.to_json() }) }
}

///|
impl JsonSchemaSerializable for OneOfSchema with parse(_json) {
  ...
}

///|
impl Validatable for OneOfSchema with validate(
  self,
  value,
  resolver~,
  json_path~,
  schema_path~,
) {
  let errors : Array[ValidationError] = []
  let mut passed = 0
  for idx, schema in self.schemas {
    let sub_errors = schema.validate(
      value,
      json_path~,
      schema_path=schema_path.key("oneOf").index(idx),
      resolver~,
    )
    if sub_errors.length() == 0 {
      passed += 1
    } else {
      errors.append(sub_errors)
    }
  }
  if passed == 1 {
    []
  } else {
    errors.push(
      ValidationError::new(
        value,
        json_path,
        schema_path.key("oneOf"),
        "Value does not match exactly one schema in oneOf",
      ),
    )
    errors
  }
}

///|
pub(all) struct Enumerable {
  // variant tag
  tag : String
  // positional types
  positionals : Array[JsonSchema]?
  // named parameters
  params : Map[String, JsonSchema]?
} derive(Show, Eq)

///|
pub fn Enumerable::new(
  tag : String,
  positionals : Array[JsonSchema]?,
  // should be Object with properties
  params : Map[String, JsonSchema]?,
) -> Enumerable {
  { tag, positionals, params }
}

///|
pub fn Enumerable::parse_enumerable(schema : OneOfSchema) -> Array[Enumerable]? {
  // guard schema is JsonSchema::OneOf(schemas) else { return None }
  let parsed : Array[Enumerable] = []
  for schema in schema.schemas {
    match schema {
      // {"const": "A"}
      Const(s) if s.value is String(tag_value) =>
        parsed.push(Enumerable::new(tag_value, None, None))
      // [{"const": "A"}, { "type": "array", .. }]
      Array(
        {
          prefix_items: Some([JsonSchema::Const({ value: String(tag_value) })]),
          ..,
        }
      ) => parsed.push(Enumerable::new(tag_value, None, None))
      // [{"const": "A"}, ..]
      Array(
        {
          prefix_items: Some(
            [Const({ value: String(tag_value) }), .. child_schemas]
          ),
          ..,
        }
      ) => {
        let matched = match child_schemas.to_array() {
          [] => { tag: tag_value, positionals: None, params: None }
          // [.. positionals, Object(properties=Some(params), ..)] =>
          [.. positionals, Object(v)] =>
            {
              tag: tag_value,
              positionals: positionals.to_array() |> Some,
              params: v.properties,
            }
          [.. positionals] =>
            {
              tag: tag_value,
              positionals: positionals.to_array() |> Some,
              params: None,
            }
        }
        parsed.push(matched)
      }
      _ => ()
    }
  }
  return Some(parsed)
  // }
  // None
}

///|
/// detect nullable enumerable by [ <Schema>, {"type": "null"}]
pub fn OneOfSchema::parse_nullable(schema : OneOfSchema) -> JsonSchema? {
  match schema.schemas {
    [s, JsonSchema::Null(_)] | [JsonSchema::Null(_), s] => return Some(s)
    _ => return None
  }
}

///|
test "parse enumerable" {
  let enumerable : Json = {
    "oneOf": [
      { "const": "Single" },
      {
        "type": "array",
        "prefixItems": [
          { "const": "A" },
          { "type": "integer" },
          { "type": "string" },
        ],
      },
      // B(Number)
      {
        "type": "array",
        "prefixItems": [{ "const": "B" }, { "type": "number" }],
      },
      // C(~a: Int)
      {
        "type": "array",
        "prefixItems": [{ "const": "C" }, { "type": "integer" }],
      },
    ],
  }
  let schema : JsonSchema = @json.from_json(enumerable)
  assert_true(schema is JsonSchema::OneOf(_))
  guard schema is JsonSchema::OneOf(schema) else {
    raise fail("Failed to parse OneOfSchema")
  }
  guard Enumerable::parse_enumerable(schema) is Some(enum_values) else {
    raise fail("Failed to parse enumerable")
  }
  inspect(
    enum_values,
    content=(
      #|[{tag: "Single", positionals: None, params: None}, {tag: "A", positionals: Some([Integer({minimum: None, maximum: None, exclusive_minimum: None, exclusive_maximum: None}), String({min_length: None, max_length: None, enum_: None})]), params: None}, {tag: "B", positionals: Some([Number({minimum: None, maximum: None, exclusive_minimum: None, exclusive_maximum: None})]), params: None}, {tag: "C", positionals: Some([Integer({minimum: None, maximum: None, exclusive_minimum: None, exclusive_maximum: None})]), params: None}]
    ),
  )
}

///|
test "validate enum" {
  let b = Builder::new()
  let reschema = b.one_of([
    b.array(prefix_items=[b.const_("A"), b.integer(), b.string()]),
    b.array(prefix_items=[b.const_("B"), b.number()]),
    b.array(prefix_items=[b.const_("C"), b.integer()]),
    b.const_("D"),
    b.array(prefix_items=[
      b.const_("Paramed"),
      b.object(properties={ "a": b.integer() }, required=["a"]),
    ]),
  ])
  let resolver = build_resolver({})
  // @test_utils::expect_ok(reschema.validate("D"), "D")
  reschema.validate(
    "Not match",
    resolver~,
    json_path=JsonPointer::Root,
    schema_path=JsonPointer::Root,
  )
  |> assert_not_eq([])
  reschema.validate(
    "D",
    resolver~,
    json_path=JsonPointer::Root,
    schema_path=JsonPointer::Root,
  )
  |> assert_eq([])
  reschema.validate(
    ["A", 1, "str"],
    resolver~,
    json_path=JsonPointer::Root,
    schema_path=JsonPointer::Root,
  )
  |> assert_eq([])
  reschema.validate(
    ["B", 3.14],
    resolver~,
    json_path=JsonPointer::Root,
    schema_path=JsonPointer::Root,
  )
  |> assert_eq([])
  // reschema.validate(["A", 1, "str"]) |> assert_ok
  // reschema.validate(["B", 3.14]) |> assert_ok
  // reschema.validate(["B", "err"]) |> assert_err
  // reschema.validate(["C", 42]) |> assert_ok
  // reschema.validate("D") |> assert_ok
  // reschema.validate("NotExist") |> assert_err
  // reschema.validate(["Paramed", { "a": 10 }]) |> assert_ok
  // reschema.validate(["Paramed", { "a": "not a number" }]) |> assert_err
}
