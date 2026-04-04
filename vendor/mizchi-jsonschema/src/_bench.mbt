///|
test (b : @bench.T) {
  let jsonschema : Json = @json.parse(
    (
      #|{
      #|  "type": "object",
      #|  "properties": {
      #|    "name": { "type": "string" },
      #|    "age": { "type": "number" }
      #|  },
      #|  "required": ["name", "age"]
      #|}
    ),
  )
  let validator = build_validator(jsonschema)
  b.bench(fn() {
    let _ = validator.validate({ "name": "Alice", "age": 30.0 })

  })
}
