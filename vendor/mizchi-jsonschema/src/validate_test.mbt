// JSON Schema Validator tests

///|
fn[T, E] assert_ok(x : Result[T, E]) -> Unit {
  guard x is Ok(_)
}

///|
// fn[T, E] assert_err(x : Result[T, E]) -> Unit {
//   guard x is Err(_)
// }

///|
// fn[T : Eq, E] expect_ok(x : Result[T, E], content? : T) -> T raise {
//   if x is Ok(v) {
//     if content is Some(content) {
//       if v == content {
//         return v
//       } else {
//         fail("Ok but content mismatch")
//       }
//     }
//     return x.unwrap()
//   }
//   fail("Expected Ok, got Err")
// }

fn expect_validate_ok(self : JsonSchema, value : Json) -> Unit raise {
  let resolver = build_resolver({})
  let errors = self.validate(
    value,
    resolver~,
    json_path=JsonPointer::Root,
    schema_path=JsonPointer::Root,
  )
  if errors.length() > 0 {
    fail("Expected no validation errors, got \{errors.length()} errors")
  }
  // (errors.length() == 0) |> assert_true(true)
}

///|
fn expect_validate_err(self : JsonSchema, value : Json) -> Unit raise {
  let resolver = build_resolver({})
  let errors = self.validate(
    value,
    resolver~,
    json_path=JsonPointer::Root,
    schema_path=JsonPointer::Root,
  )
  if errors.length() is 0 {
    fail("Expected validation errors, got none")
  }

  // errors.length() > 0
}

///|
test "validate null" {
  let b = Builder::new()
  let schema = b.null()
  schema.expect_validate_err({})
  schema.expect_validate_ok(null)
}

///|
test "validate const" {
  let b = Builder::new()
  let schema = b.const_("constant")
  schema.expect_validate_ok("constant")
  schema.expect_validate_err("not-constant")
  schema.expect_validate_err(1)
}

///|
test "validate const nested" {
  let b = Builder::new()
  let schema = b.const_({ "nested": true })
  schema.expect_validate_ok({ "nested": true })
  schema.expect_validate_err({ "nested": false })
  schema.expect_validate_err({})
  schema.expect_validate_err("not-constant")
}

///|
test "validate any" {
  let b = Builder::new()
  let schema = b.any()
  schema.expect_validate_ok("string")
  schema.expect_validate_ok(1)
  schema.expect_validate_ok(1.1)
  schema.expect_validate_ok(true)
}

///|
test "validate string with enum" {
  let b = Builder::new()
  let schema = b.string(enum_=["a", "b"])
  schema.expect_validate_ok("a")
  schema.expect_validate_ok("b")
  schema.expect_validate_err("c")
  schema.expect_validate_err(1)
}

///|
test "validate string type with minLength and maxLength" {
  let b = Builder::new()
  let schema = b.string(minLength=3, maxLength=5)
  schema.expect_validate_ok("abc")
  schema.expect_validate_ok("abcd")
  schema.expect_validate_ok("abcde")
  schema.expect_validate_err("ab")
  schema.expect_validate_err("abcdef")
  schema.expect_validate_err(1)
  schema.expect_validate_err(1111)
}

///|
test "validate enum" {
  let b = Builder::new()
  let schema = b.enum_(["red", "green", "blue"])
  schema.expect_validate_ok("red")
  schema.expect_validate_ok("green")
  schema.expect_validate_ok("blue")
  schema.expect_validate_err(1)
}

///|
test "validate number" {
  let b = Builder::new()
  let schema = b.number(minimum=0.0, maximum=100.0)
  schema.expect_validate_ok(0)
  schema.expect_validate_ok(0.1)
  schema.expect_validate_ok(1)
  schema.expect_validate_err(-10)
  schema.expect_validate_err(101)
  schema.expect_validate_err("not-a-number")
}

///|
test "validate number with constraints" {
  let b = Builder::new()
  let schema = b.number(minimum=0.0, maximum=100.0)
  schema.expect_validate_ok(0)
  schema.expect_validate_ok(0.1)
  schema.expect_validate_ok(1)
  schema.expect_validate_ok(100)
  schema.expect_validate_err(-10)
  schema.expect_validate_err(101)
  schema.expect_validate_err("invalid")
}

///|
test "validate number with exclusiveMinimum and exclusiveMaximum" {
  let b = Builder::new()
  let schema = b.number(exclusive_minimum=0.0, exclusive_maximum=10.0)
  schema.expect_validate_err(0.0)
  schema.expect_validate_ok(0.1)
  schema.expect_validate_ok(5.0)
  schema.expect_validate_err(10.0)
  schema.expect_validate_err(11.0)
}

///|
test "validate integer" {
  let b = Builder::new()
  let schema = b.integer()
  schema.expect_validate_ok(-10)
  schema.expect_validate_ok(0)
  schema.expect_validate_ok(10)
  schema.expect_validate_err(1.1)
}

///|
test "validate integer with constraints" {
  let b = Builder::new()
  let schema = b.integer(minimum=0, maximum=10)
  schema.expect_validate_ok(0)
  schema.expect_validate_ok(5)
  schema.expect_validate_ok(10)
  schema.expect_validate_err(-1)
  schema.expect_validate_err(11)
  schema.expect_validate_err(1.1)
}

// ///|

///|
test "validate integer with exclusiveMinimum and exclusiveMaximum" {
  let b = Builder::new()
  let schema = b.integer(exclusive_minimum=0, exclusive_maximum=10)
  schema.expect_validate_err(0)
  schema.expect_validate_ok(1)
  schema.expect_validate_ok(5)
  schema.expect_validate_err(10)
}

///|
test "validate object" {
  let b = Builder::new()
  let schema = b.object(properties={ "name": b.string() }, required=["name"])
  schema.expect_validate_ok({ "name": "John" })
  schema.expect_validate_err({ "name": 0 })
  schema.expect_validate_err({})
  let schema_no_required = b.object(properties={ "name": b.string() })
  schema_no_required.expect_validate_ok({})
  schema_no_required.expect_validate_ok({ "name": "foo" })
  schema_no_required.expect_validate_err({ "name": 1 })
}

///|
test "validate object with additionalProperties" {
  let b = Builder::new()
  let schema = b.object(properties={ "name": b.string() }, required=["name"])
  schema.expect_validate_err({ "name": "John", "notAllowd": true })
  let schema2 = b.object(
    properties={ "name": b.string() },
    required=["name"],
    additional_properties=b.string(),
  )
  schema2.expect_validate_ok({ "name": "John" })
  schema2.expect_validate_ok({ "name": "John", "ex1": "x" })
  schema2.expect_validate_err({ "name": "John", "ex1": 1 })
}

///|
test "validate array" {
  let b = Builder::new()
  let schema = b.array(
    items=b.object(properties={ "id": b.integer() }, required=["id"]),
  )
  schema.expect_validate_ok([])
  schema.expect_validate_ok([{ "id": 1 }])
  schema.expect_validate_err([{ "id": "not-allowed" }])
  schema.expect_validate_err([{ "no-id": 1 }])
  schema.expect_validate_err(1)
  schema.expect_validate_err("string")
}

///|
test "validate array with constraints" {
  let b = Builder::new()
  let schema = b.array(items=b.integer(), min_items=1, max_items=3)
  schema.expect_validate_err([])
  schema.expect_validate_ok([1])
  schema.expect_validate_ok([1, 2])
  schema.expect_validate_ok([1, 2, 3])
  schema.expect_validate_err([1, 2, 3, 4])
  schema.expect_validate_err([1, "a"])
}

///|
test "validate array with prefixItems" {
  let b = Builder::new()
  let schema = b.array(prefix_items=[b.const_("t"), b.integer()])
  schema.expect_validate_err([])
  schema.expect_validate_ok(["t", 1])
  schema.expect_validate_err(["t", "v"])
  schema.expect_validate_err(["x", 1, 2])
}

///|
test "validate oneOf" {
  let b = Builder::new()
  let schema = b.one_of([b.string()])
  schema.expect_validate_ok("hello")
  schema.expect_validate_err(1)
  let schema2 = b.one_of([b.string(), b.null()])
  schema2.expect_validate_ok("hello")
  schema2.expect_validate_ok(null)
  schema2.expect_validate_err(1)
}

///|
test "validate allOf" {
  let b = Builder::new()
  let schema = b.all_of([b.string()])
  schema.expect_validate_err(1)
  schema.expect_validate_ok("hello")
  let schema2 = b.all_of([b.string(), b.const_("foo")])
  schema2.expect_validate_ok("foo")
  schema2.expect_validate_err("bar")

  // never valid
  let schema3 = b.all_of([b.string(), b.const_("foo"), b.number()])
  schema3.expect_validate_err("foo")
  schema3.expect_validate_err(1)
  schema3.expect_validate_err("bar")
  schema3.expect_validate_err(true)
}

///|
test "validate anyOf" {
  let b = Builder::new()
  let schema = b.any_of([b.string()])
  schema.expect_validate_err(1)
  schema.expect_validate_ok("hello")
  let schema2 = b.any_of([b.string(), b.const_("foo")])
  schema2.expect_validate_ok("foo")
  schema2.expect_validate_err(1)
  let schema3 = b.any_of([b.string(), b.const_("foo"), b.null()])
  schema3.expect_validate_ok(null)
  schema3.expect_validate_ok("foo")
  schema3.expect_validate_ok("bar")
  schema3.expect_validate_err(1)
  schema3.expect_validate_err(true)
}

///|
test "validate $ref" {
  let raw_schema : Json = {
    "definitions": { "PositiveInteger": { "type": "integer", "minimum": 0 } },
    "$ref": "#/definitions/PositiveInteger",
  }
  let validator = build_validator(raw_schema)
  validator.validate(5) |> assert_ok
  validator.validate("err").unwrap_err()
  |> inspect(
    content=(
      #|[{input: String("err"), json_path: #, schema_path: #/$ref, message: "Value is not a number", children: None}]
    ),
  )
}

///|
test "validate $ref in array" {
  let raw_schema : Json = {
    "definitions": {
      "Point": {
        "type": "object",
        "required": ["x", "y"],
        "properties": { "x": { "type": "integer" }, "y": { "type": "integer" } },
      },
    },
    "type": "array",
    "items": { "$ref": "#/definitions/Point" },
  }
  let validator = build_validator(raw_schema)
  validator.validate([{ "x": 1, "y": 2 }]) |> assert_ok
  validator.validate([{ "x": "err", "y": 2 }]).unwrap_err()
  |> inspect(
    content=(
      #|[{input: String("err"), json_path: #/0/x, schema_path: #/items/$ref/properties/x, message: "Value is not a number", children: None}]
    ),
  )
}

///|
test "validate $ref in object" {
  let raw_schema : Json = {
    "definitions": {
      "Point": {
        "type": "object",
        "required": ["x", "y"],
        "properties": { "x": { "type": "integer" }, "y": { "type": "integer" } },
      },
    },
    "type": "object",
    "required": ["p1", "p2"],
    "properties": {
      "p1": { "$ref": "#/definitions/Point" },
      "p2": { "$ref": "#/definitions/Point" },
    },
  }
  let validator = build_validator(raw_schema)
  validator
  .validate({ "p1": { "x": 1, "y": 2 }, "p2": { "x": 3, "y": 4 } })
  .unwrap()
  |> inspect(content="()")
  validator
  .validate({ "p1": { "x": 1, "y": 2 }, "p3": { "x": 3, "y": 4 } })
  .unwrap_err()
  |> inspect(
    content=(
      #|[{input: Object({"p1": Object({"x": Number(1), "y": Number(2)}), "p3": Object({"x": Number(3), "y": Number(4)})}), json_path: #/p2, schema_path: #/required, message: "Required property 'p2' is missing", children: None}, {input: Object({"p1": Object({"x": Number(1), "y": Number(2)}), "p3": Object({"x": Number(3), "y": Number(4)})}), json_path: #/p3, schema_path: #/additionalProperties, message: "Additional property '{\"p3\"}' is not allowed", children: None}]
    ),
  )
}

///|
// test "validate by schema builder" {
//   let b = Builder::new()
//   let resolver = build_resolver({})
//   let schema = b.object(properties={ "v": b.string() }, required=["v"])
//   schema.validate(
//     { "v": "test" },
//     resolver~,
//     json_path=JsonPointer::Root,
//     schema_path=JsonPointer::Root,
//   )
//   |> assert_eq([])
// }

///|
test "validate by schema builder with custome resolver" {
  let raw : Json = {
    "definitions": {
      "Point": {
        "type": "object",
        "required": ["x", "y"],
        "properties": { "x": { "type": "integer" }, "y": { "type": "integer" } },
      },
    },
    "type": "object",
    "required": ["p1", "p2"],
    "properties": {
      "p1": { "$ref": "#/definitions/Point" },
      "p2": { "$ref": "#/definitions/Point" },
    },
  }
  let validator = build_validator(raw)
  validator.validate({ "p1": { "x": 1, "y": 2 }, "p2": { "x": 3, "y": 4 } })
  |> assert_ok
  validator
  .validate({ "p1": { "x": 1, "y": 2 }, "p3": { "x": 3, "y": 4 } })
  .unwrap_err()
  |> inspect(
    content=(
      #|[{input: Object({"p1": Object({"x": Number(1), "y": Number(2)}), "p3": Object({"x": Number(3), "y": Number(4)})}), json_path: #/p2, schema_path: #/required, message: "Required property 'p2' is missing", children: None}, {input: Object({"p1": Object({"x": Number(1), "y": Number(2)}), "p3": Object({"x": Number(3), "y": Number(4)})}), json_path: #/p3, schema_path: #/additionalProperties, message: "Additional property '{\"p3\"}' is not allowed", children: None}]
    ),
  )
}
