///|
test "parse_discovery reads core fields and nested resources" {
  let json =
    #|{
    #|  "name": "drive",
    #|  "version": "v3",
    #|  "title": "Drive API",
    #|  "description": "The Drive API",
    #|  "baseUrl": "https://www.googleapis.com/",
    #|  "schemas": {
    #|    "File": {
    #|      "id": "File",
    #|      "type": "object",
    #|      "description": "A file",
    #|      "properties": {
    #|        "id": { "type": "string", "description": "file id" },
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
    #|          "description": "Lists files",
    #|          "parameters": {
    #|            "pageSize": {
    #|              "type": "integer",
    #|              "location": "query",
    #|              "required": false
    #|            }
    #|          }
    #|        }
    #|      },
    #|      "resources": {
    #|        "comments": {
    #|          "methods": {
    #|            "delete": {
    #|              "id": "drive.comments.delete",
    #|              "path": "files/{fileId}/comments/{commentId}",
    #|              "httpMethod": "DELETE"
    #|            }
    #|          }
    #|        }
    #|      }
    #|    }
    #|  }
    #|}
  let d = parse_discovery(json)
  assert_eq(d.name, "drive")
  assert_eq(d.version, "v3")
  assert_eq(d.title, "Drive API")
  assert_eq(d.description, Some("The Drive API"))
  assert_eq(d.base_url, "https://www.googleapis.com/")
  let schemas = d.schemas.unwrap()
  assert_eq(schemas.length(), 1)
  let file_schema = schemas.get("File").unwrap()
  assert_eq(file_schema.type_, Some("object"))
  assert_eq(file_schema.properties.unwrap().length(), 2)
  let files = d.resources.unwrap().get("files").unwrap()
  assert_eq(files.methods.unwrap().length(), 1)
  let list_m = files.methods.unwrap().get("list").unwrap()
  assert_eq(list_m.http_method, "GET")
  assert_eq(list_m.path, "files")
  assert_eq(list_m.parameters.unwrap().length(), 1)
  let page = list_m.parameters.unwrap().get("pageSize").unwrap()
  assert_eq(page.type_, Some("integer"))
  assert_eq(page.location, Some("query"))
  assert_eq(page.required.unwrap_or(false), false)
  let comments = files.resources.unwrap().get("comments").unwrap()
  let del_m = comments.methods.unwrap().get("delete").unwrap()
  assert_eq(del_m.http_method, "DELETE")
}
