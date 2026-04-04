///|
test "to_snake_case" {
  assert_eq(to_snake_case("mimeType"), "mime_type")
  assert_eq(to_snake_case("drive"), "drive")
  assert_eq(to_snake_case("FileId"), "file_id")
}

///|
test "generate_types and generate_client snapshot" {
  let json =
    #|{
    #|  "name": "drive",
    #|  "version": "v3",
    #|  "title": "Drive API",
    #|  "baseUrl": "https://www.googleapis.com/",
    #|  "schemas": {
    #|    "File": {
    #|      "id": "File",
    #|      "type": "object",
    #|      "properties": {
    #|        "id": { "type": "string" },
    #|        "mimeType": { "type": "string" }
    #|      }
    #|    }
    #|  },
    #|  "resources": {
    #|    "files": {
    #|      "methods": {
    #|        "list": {
    #|          "id": "drive.files.list",
    #|          "path": "files",
    #|          "httpMethod": "GET",
    #|          "description": "Lists files"
    #|        }
    #|      }
    #|    }
    #|  }
    #|}
  let d = parse_discovery(json)
  let out = generate_types(d) + "\n---\n" + generate_client(d)
  let expected =
    #|///| Schema File
    #|pub struct File {
    #|  id : String
    #|  mime_type : String
    #|}
    #|
    #|
    #|---
    #|///| API client stubs for drive v3
    #|///| Base URL: https://www.googleapis.com/
    #|
    #|///| drive.files.list
    #|///| Lists files
    #|pub fn files_list() -> Unit {
    #|  // GET https://www.googleapis.com/files
    #|}
    #|
    #|
  inspect(out, content=expected)
}
