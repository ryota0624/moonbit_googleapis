# Discovery → generated/ Code Generation Pipeline Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make `discovery/codegen` generate production-quality MoonBit code (types + client + helpers + moon.pkg) that matches the hand-written `services/drive/` quality, with file output and an actrun workflow.

**Architecture:** Extend `discovery/codegen.mbt` with improved type generation (derive, Option, pub(all)), full client generation (Service struct, method builders with path/query params), and add file-writing support to `discovery/main.mbt`. Wrap everything in an actrun GitHub Actions workflow.

**Tech Stack:** MoonBit, mizchi/x (fs/sys), actrun, Google Discovery API

---

## File Structure

| File | Action | Responsibility |
|------|--------|---------------|
| `discovery/codegen.mbt` | Modify | Improved type + client + helpers + moon.pkg generation |
| `discovery/codegen_test.mbt` | Modify | Updated snapshot tests for new output |
| `discovery/main.mbt` | Modify | Add --output file writing mode |
| `generated/drive/` | Generated | Output directory (created by codegen) |
| `.github/workflows/generate.yml` | Create | actrun workflow for full pipeline |

---

### Task 1: Improve types.mbt generation

**Files:**
- Modify: `discovery/codegen.mbt` (fn `write_schema_struct`, `schema_to_field_type`)
- Modify: `discovery/codegen_test.mbt`

**Reference:** Target output matches `services/drive/types.mbt` quality.

- [ ] **Step 1: Write snapshot test for improved type generation**

Add a test in `discovery/codegen_test.mbt` that verifies a small schema generates `pub(all) struct` with `derive(FromJson(rename_fields="camelCase"))`, Option fields, and `$ref` resolution:

```moonbit
///|
test "generate_types produces pub(all) with derive FromJson" {
  let desc = RestDescription::{
    name: "test", version: "v1", title: "Test", description: None,
    base_url: "https://example.com",
    schemas: Some({
      "File": JsonSchema::{
        id: Some("File"), type_: Some("object"), description: None,
        properties: Some({
          "id": JsonSchema::{ id: None, type_: Some("string"), description: None, properties: None, items: None, ref_: None },
          "mimeType": JsonSchema::{ id: None, type_: Some("string"), description: None, properties: None, items: None, ref_: None },
          "parents": JsonSchema::{ id: None, type_: Some("array"), description: None, properties: None, items: Some(JsonSchema::{ id: None, type_: Some("string"), description: None, properties: None, items: None, ref_: None }), ref_: None },
        }),
        items: None, ref_: None,
      },
    }),
    resources: None,
  }
  inspect!(generate_types(desc))
}
```

- [ ] **Step 2: Run test, update snapshot**

```bash
cd /Users/ryota.suzuki/git/moonbit_googleapis
moon test discovery --update
```

- [ ] **Step 3: Modify `write_schema_struct` in codegen.mbt**

Update `write_schema_struct` to generate:
- `pub(all) struct` instead of `pub struct`
- `derive(Eq, Show, FromJson(rename_fields="camelCase"))` 
- All fields as `T?` (Discovery schemas rarely specify `required`)
- Reserved word handling: `type` → `type_` with `fields(type_(rename="type"))` in derive
- Same for `ref` → `ref_`

```moonbit
///|
fn is_reserved_word(s : String) -> Bool {
  match s {
    "type" | "ref" | "match" | "if" | "else" | "for" | "while" | "break" |
    "continue" | "return" | "fn" | "let" | "mut" | "pub" | "priv" | "struct" |
    "enum" | "trait" | "impl" | "true" | "false" | "method" => true
    _ => false
  }
}

///|
fn safe_field_name(name : String) -> String {
  let snake = to_snake_case(name)
  if is_reserved_word(snake) { snake + "_" } else { snake }
}

///|
fn collect_renamed_fields(props : Map[String, JsonSchema]) -> Array[(String, String)] {
  let renamed : Array[(String, String)] = []
  props.each((field_name, _prop) => {
    let safe = safe_field_name(field_name)
    if safe != to_snake_case(field_name) {
      renamed.push((safe, field_name))
    }
  })
  renamed
}

///|
fn write_schema_struct(b : StringBuilder, schema_name : String, schema : JsonSchema) -> Unit {
  let type_name = sanitize_type_identifier(schema_name)
  b.write_string("///| Schema \{schema_name}\n")
  
  // Collect renamed fields for derive annotation
  let renamed = match schema.properties {
    Some(props) => collect_renamed_fields(props)
    None => []
  }
  
  b.write_string("pub(all) struct \{type_name} {\n")
  match schema.properties {
    Some(props) =>
      props.each((field_name, prop) => {
        let field = safe_field_name(field_name)
        let ty = schema_to_field_type(prop)
        b.write_string("  \{field} : \{ty}?\n")
      })
    None => b.write_string("  // no properties\n")
  }
  b.write_string("}")
  
  // Build derive annotation
  if renamed.is_empty() {
    b.write_string(" derive(Eq, Show, FromJson(rename_fields=\"camelCase\"))\n\n")
  } else {
    b.write_string(" derive(Eq, Show, FromJson(rename_fields=\"camelCase\", fields(")
    for i in 0..<renamed.length() {
      let (safe, original) = renamed[i]
      if i > 0 { b.write_string(", ") }
      b.write_string("\{safe}(rename=\"\{original}\")")
    }
    b.write_string(")))\n\n")
  }
}
```

- [ ] **Step 4: Run tests, update snapshots**

```bash
moon test discovery --update
moon check
```

- [ ] **Step 5: Commit**

```bash
git add discovery/codegen.mbt discovery/codegen_test.mbt
git commit -m "Improve type generation: pub(all), derive(FromJson), Option fields"
```

---

### Task 2: Generate client.mbt

**Files:**
- Modify: `discovery/codegen.mbt` (rewrite `walk_resources`, `generate_client`)
- Modify: `discovery/codegen_test.mbt`

**Reference:** Target output matches `services/drive/client.mbt`.

- [ ] **Step 1: Write snapshot test for client generation**

```moonbit
///|
test "generate_client produces service struct and methods" {
  let desc = RestDescription::{
    name: "drive", version: "v3", title: "Drive", description: None,
    base_url: "https://www.googleapis.com/drive/v3",
    schemas: None,
    resources: Some({
      "files": RestResource::{
        methods: Some({
          "list": RestMethod::{
            id: "drive.files.list", path: "files", http_method: "GET",
            description: Some("Lists files."),
            parameters: Some({
              "pageSize": MethodParameter::{ type_: Some("integer"), description: Some("Max results"), required: Some(false), location: Some("query") },
              "q": MethodParameter::{ type_: Some("string"), description: Some("Query string"), required: Some(false), location: Some("query") },
            }),
            request: None, response: Some(MethodMedia::{ ref_: Some("FileList") }),
          },
          "get": RestMethod::{
            id: "drive.files.get", path: "files/{fileId}", http_method: "GET",
            description: Some("Gets a file."),
            parameters: Some({
              "fileId": MethodParameter::{ type_: Some("string"), description: Some("File ID"), required: Some(true), location: Some("path") },
            }),
            request: None, response: Some(MethodMedia::{ ref_: Some("File") }),
          },
        }),
        resources: None,
      },
    }),
  }
  inspect!(generate_client(desc))
}
```

- [ ] **Step 2: Run test, capture initial snapshot**

```bash
moon test discovery --update
```

- [ ] **Step 3: Rewrite `generate_client` in codegen.mbt**

Generate a full Service struct and methods:

```moonbit
///|
fn capitalize_first(s : String) -> String {
  if s.is_empty() { return s }
  let b = StringBuilder::new()
  let mut first = true
  for c in s.iter() {
    if first {
      b.write_char(c.to_ascii_uppercase())
      first = false
    } else {
      b.write_char(c)
    }
  }
  b.to_string()
}

///|
fn param_type_to_moonbit(type_str : String?) -> String {
  match type_str {
    Some("string") => "String"
    Some("integer") => "Int"
    Some("number") => "Double"
    Some("boolean") => "Bool"
    _ => "String"
  }
}

///|
pub fn generate_client(desc : RestDescription) -> String {
  let b = StringBuilder::new()
  let svc_name = capitalize_first(desc.name) + "Service"
  
  // Service struct
  b.write_string("///| API client for \{desc.name} \{desc.version}\n")
  b.write_string("pub(all) struct \{svc_name} {\n")
  b.write_string("  base_url : String\n")
  b.write_string("  access_token : String\n")
  b.write_string("}\n\n")
  
  // Constructor
  b.write_string("///|\n")
  b.write_string("pub fn \{svc_name}::new(access_token : String) -> \{svc_name} {\n")
  b.write_string("  \{svc_name}::{ base_url: \"\{desc.base_url}\", access_token }\n")
  b.write_string("}\n\n")
  
  // Auth headers helper
  b.write_string("///|\n")
  b.write_string("fn \{svc_name}::auth_headers(self : \{svc_name}) -> Map[String, String] {\n")
  b.write_string("  { \"Authorization\": \"Bearer \" + self.access_token, \"Accept\": \"application/json\" }\n")
  b.write_string("}\n\n")
  
  // Methods
  walk_resources_v2(b, svc_name, "", resources_or_empty(desc.resources))
  b.to_string()
}
```

Implement `walk_resources_v2` that generates methods with:
- Path params as required arguments
- Query params as optional arguments (`param? : Type? = None`)
- GET: query string building
- POST/PUT/PATCH: JSON body building
- Returns `@http.HttpRequest`

- [ ] **Step 4: Run tests, update snapshots, verify**

```bash
moon test discovery --update
moon check
```

- [ ] **Step 5: Commit**

```bash
git add discovery/codegen.mbt discovery/codegen_test.mbt
git commit -m "Generate full client code with Service struct and method builders"
```

---

### Task 3: Generate helpers.mbt and moon.pkg

**Files:**
- Modify: `discovery/codegen.mbt` (add `generate_helpers`, `generate_moon_pkg`)

- [ ] **Step 1: Add `generate_helpers` function**

```moonbit
///|
pub fn generate_helpers() -> String {
  // Emit the same url_encode and build_query_string as services/drive/helpers.mbt
  // This is static content, same for all APIs
  let b = StringBuilder::new()
  b.write_string("///|\nfn is_unreserved(c : Char) -> Bool {\n")
  // ... (exact copy of helpers.mbt content)
  b.to_string()
}

///|
pub fn generate_moon_pkg(module_name : String, api_name : String) -> String {
  let b = StringBuilder::new()
  b.write_string("import {\n")
  b.write_string("  \"moonbitlang/core/buffer\" @buffer,\n")
  b.write_string("  \"moonbitlang/core/json\" @json,\n")
  b.write_string("  \"\{module_name}/http\" @http,\n")
  b.write_string("}\n")
  b.to_string()
}
```

- [ ] **Step 2: Run checks**

```bash
moon check
```

- [ ] **Step 3: Commit**

```bash
git add discovery/codegen.mbt
git commit -m "Add helpers.mbt and moon.pkg generation"
```

---

### Task 4: Add --output file writing to discovery CLI

**Files:**
- Modify: `discovery/main.mbt`
- Modify: `discovery/moon.pkg` (ensure @fs is imported)

- [ ] **Step 1: Update main.mbt to support --output**

```moonbit
///|
async fn main {
  let args = @sys.get_cli_args()
  if args.length() < 2 {
    println("usage: moon run discovery -- <discovery.json> [--output <dir>]")
    @sys.exit(1)
  }
  let path = args[1]
  
  // Parse --output option
  let mut output_dir : String? = None
  let mut i = 2
  while i < args.length() {
    if args[i] == "--output" && i + 1 < args.length() {
      output_dir = Some(args[i + 1])
      i = i + 2
    } else {
      i = i + 1
    }
  }
  
  let json_str = @fs.read_file(path).text() catch {
    e => { println(e.to_string()); @sys.exit(1); panic() }
  }
  let desc = parse_discovery(json_str) catch {
    e => { println(e.to_string()); @sys.exit(1); panic() }
  }
  
  let types_code = generate_types(desc)
  let client_code = generate_client(desc)
  let helpers_code = generate_helpers()
  let moon_pkg_code = generate_moon_pkg("ryota0624/googleapis", desc.name)
  
  match output_dir {
    None => {
      println(types_code)
      println(client_code)
    }
    Some(dir) => {
      @fs.write_file(dir + "/types.mbt", types_code) catch {
        e => { println(e.to_string()); @sys.exit(1); panic() }
      }
      @fs.write_file(dir + "/client.mbt", client_code) catch {
        e => { println(e.to_string()); @sys.exit(1); panic() }
      }
      @fs.write_file(dir + "/helpers.mbt", helpers_code) catch {
        e => { println(e.to_string()); @sys.exit(1); panic() }
      }
      @fs.write_file(dir + "/moon.pkg", moon_pkg_code) catch {
        e => { println(e.to_string()); @sys.exit(1); panic() }
      }
      println("Generated \{desc.name} client in \{dir}/")
    }
  }
}
```

- [ ] **Step 2: Verify compilation**

```bash
moon check
```

- [ ] **Step 3: Manual test with Drive Discovery Document**

```bash
curl -o /tmp/drive_discovery.json "https://www.googleapis.com/discovery/v1/apis/drive/v3/rest"
mkdir -p generated/drive
moon run discovery/ --target native -- /tmp/drive_discovery.json --output generated/drive
moon check generated/drive
```

- [ ] **Step 4: Commit**

```bash
git add discovery/main.mbt
git commit -m "Add --output option for file-based code generation"
```

---

### Task 5: Create actrun workflow

**Files:**
- Create: `.github/workflows/generate.yml`

- [ ] **Step 1: Write workflow file**

```yaml
name: Generate API clients

on:
  workflow_dispatch:

jobs:
  generate:
    runs-on: self-hosted
    steps:
      - uses: actions/checkout@v4

      - name: Download Drive Discovery Document
        run: curl -sS -o /tmp/drive_discovery.json "https://www.googleapis.com/discovery/v1/apis/drive/v3/rest"

      - name: Create output directory
        run: mkdir -p generated/drive

      - name: Generate Drive API client
        run: moon run discovery/ --target native -- /tmp/drive_discovery.json --output generated/drive

      - name: Format generated code
        run: moon fmt generated/drive

      - name: Check compilation
        run: moon check

      - name: Run tests
        run: moon test
```

- [ ] **Step 2: Test with actrun**

```bash
actrun workflow run .github/workflows/generate.yml
```

- [ ] **Step 3: Commit**

```bash
git add .github/workflows/generate.yml
git commit -m "Add actrun workflow for API client generation pipeline"
```

---

### Task 6: End-to-end verification

- [ ] **Step 1: Run full pipeline**

```bash
actrun workflow run .github/workflows/generate.yml
```

- [ ] **Step 2: Compare generated vs hand-written**

```bash
diff generated/drive/types.mbt services/drive/types.mbt
diff generated/drive/client.mbt services/drive/client.mbt
```

Review differences. The generated code should be functionally equivalent.

- [ ] **Step 3: Run all tests**

```bash
moon check
moon test
```

- [ ] **Step 4: Final commit**

```bash
git add generated/
git commit -m "Add generated Drive API client from Discovery Document"
```
