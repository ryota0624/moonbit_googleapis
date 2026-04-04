///|
/// Prototype: run `moon run prototype/jsonschema_test --target native -- <discovery.json>`.
/// Uses Discovery Document root JSON so `#/schemas/...` $refs resolve.

///|
async fn main {
  let args = @sys.get_cli_args()
  if args.length() < 2 {
    println(
      "usage: moon run prototype/jsonschema_test --target native -- <discovery.json>",
    )
    @sys.exit(1)
    panic()
  }
  let path = args[1]
  let json_str = @fs.read_file(path).text() catch {
    e => {
      println(e.to_string())
      @sys.exit(1)
      panic()
    }
  }
  let raw_json = @json.parse(json_str) catch {
    e => {
      println("JSON parse error: " + e.to_string())
      @sys.exit(1)
      panic()
    }
  }
  let schemas_map = match raw_json {
    Json::Object(root) =>
      match root.get("schemas") {
        Some(Json::Object(m)) => m
        _ => {
          println("missing or invalid top-level \"schemas\" object")
          @sys.exit(1)
          panic()
        }
      }
    _ => {
      println("root JSON value must be an object")
      @sys.exit(1)
      panic()
    }
  }
  let entrypoints : Array[@jsonschema.JsonPointer] = Array::new()
  for name, _ in schemas_map {
    entrypoints.push(@jsonschema.JsonPointer::Root.key("schemas").key(name))
  }
  try {
    let result = @codegen.generate(raw_json, entrypoints)
    match result {
      Ok(code) => println(code)
      Err(e) => {
        println("generate error: " + e)
        @sys.exit(1)
        panic()
      }
    }
  } catch {
    e => {
      println("generate raised: " + e.to_string())
      @sys.exit(1)
      panic()
    }
  }
}
