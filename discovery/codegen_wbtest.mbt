///|
async test "generate_helpers matches generated/drive/helpers.mbt" {
  let expected = @fs.read_file("generated/drive/helpers.mbt").text()
  assert_eq(generate_helpers(), expected)
}

///|
test "generate_moon_pkg" {
  let want =
    #|import {
    #|  "moonbitlang/core/buffer" @buffer,
    #|  "moonbitlang/core/json" @json,
    #|  "ryota0624/googleapis/http" @http,
    #|}
    #|
    #|warnings = "-0001"

  assert_eq(generate_moon_pkg("ryota0624/googleapis", "drive"), want + "\n")
}

///|
test "to_snake_case" {
  assert_eq(to_snake_case("mimeType"), "mime_type")
  assert_eq(to_snake_case("drive"), "drive")
  assert_eq(to_snake_case("FileId"), "file_id")
}

///|
test "safe_field_name strips plus and sanitizes dots dashes" {
  assert_eq(safe_field_name("+name"), "name")
  assert_eq(safe_field_name("++project"), "project")
  assert_eq(
    safe_field_name("serviceFilter.resourceType"),
    "service_filter_resource_type",
  )
  assert_eq(safe_field_name("serviceFilter.service"), "service_filter_service")
  assert_eq(safe_field_name("foo-bar"), "foo_bar")
}

///|
test "capitalize_first" {
  assert_eq(capitalize_first("drive"), "Drive")
  assert_eq(capitalize_first(""), "")
  assert_eq(capitalize_first("a"), "A")
}

///|
test "param_type_to_moonbit" {
  assert_eq(param_type_to_moonbit(Some("string")), "String")
  assert_eq(param_type_to_moonbit(Some("integer")), "Int")
  assert_eq(param_type_to_moonbit(Some("number")), "Double")
  assert_eq(param_type_to_moonbit(Some("boolean")), "Bool")
  assert_eq(param_type_to_moonbit(Some("array")), "Array[String]")
  assert_eq(param_type_to_moonbit(None), "String")
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
    #|        "mimeType": { "type": "string" },
    #|        "type": { "type": "string" },
    #|        "ref": { "type": "string" }
    #|      }
    #|    },
    #|    "FileList": {
    #|      "id": "FileList",
    #|      "type": "object",
    #|      "properties": {
    #|        "files": { "type": "array", "items": { "$ref": "File" } }
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
    #|          "response": { "$ref": "FileList" },
    #|          "parameters": {
    #|            "pageSize": { "type": "integer", "location": "query" },
    #|            "pageToken": { "type": "string", "location": "query" },
    #|            "q": { "type": "string", "location": "query" }
    #|          }
    #|        },
    #|        "get": {
    #|          "id": "drive.files.get",
    #|          "path": "files/{fileId}",
    #|          "httpMethod": "GET",
    #|          "description": "Gets a file",
    #|          "response": { "$ref": "File" },
    #|          "parameters": {
    #|            "fileId": { "type": "string", "required": true, "location": "path" },
    #|            "fields": { "type": "string", "location": "query" }
    #|          }
    #|        },
    #|        "create": {
    #|          "id": "drive.files.create",
    #|          "path": "files",
    #|          "httpMethod": "POST",
    #|          "description": "Creates a file",
    #|          "response": { "$ref": "File" },
    #|          "parameters": {
    #|            "name": { "type": "string", "required": true, "location": "body" },
    #|            "mimeType": { "type": "string", "required": true, "location": "body" },
    #|            "parents": { "type": "array", "location": "body" }
    #|          }
    #|        }
    #|      }
    #|    }
    #|  }
    #|}
  let d = parse_discovery(json)
  let out = generate_types(d) + "\n---\n" + generate_client(d)
  inspect(
    out,
    content=(
      #|///| Schema File
      #|pub(all) struct File {
      #|  id : String?
      #|  mime_type : String?
      #|  type_ : String?
      #|  ref_ : String?
      #|} derive(Eq, Show, FromJson(rename_fields="camelCase", fields(type_(rename="type"), ref_(rename="ref"))))
      #|
      #|///| Schema FileList
      #|pub(all) struct FileList {
      #|  files : Array[File]?
      #|} derive(Eq, Show, FromJson(rename_fields="camelCase"))
      #|
      #|
      #|---
      #|///| API client for drive v3
      #|///| Base URL: https://www.googleapis.com/
      #|
      #|///|
      #|pub(all) struct DriveService {
      #|  base_url : String
      #|  access_token : String
      #|}
      #|
      #|///|
      #|pub fn DriveService::new(access_token : String) -> DriveService {
      #|  DriveService::{
      #|    base_url: "https://www.googleapis.com",
      #|    access_token,
      #|  }
      #|}
      #|
      #|///|
      #|fn DriveService::auth_headers(self : DriveService) -> Map[String, String] {
      #|  {
      #|    "Authorization": "Bearer " + self.access_token,
      #|    "Accept": "application/json",
      #|  }
      #|}
      #|
      #|///| drive.files.create
      #|///| Creates a file
      #|pub async fn DriveService::files_create(
      #|  self : DriveService,
      #|  client : &@http.HttpClient,
      #|  name : String,
      #|  mime_type : String,
      #|  parents? : Array[String]? = None,
      #|) -> File raise @http.HttpError {
      #|  let meta : Map[String, Json] = Map::new()
      #|  meta.set("name", Json::string(name))
      #|  meta.set("mimeType", Json::string(mime_type))
      #|  match parents {
      #|    Some(v) => {
      #|      let ja : Array[Json] = Array::new()
      #|      for x in v {
      #|        ja.push(Json::string(x))
      #|      }
      #|      meta.set("parents", Json::array(ja))
      #|    }
      #|    None => ()
      #|  }
      #|  let body = Json::object(meta).stringify()
      #|  let h = self.auth_headers()
      #|  h.set("Content-Type", "application/json")
      #|  let path = "/" + "files"
      #|  let url = self.base_url + path
      #|  let req = @http.HttpRequest::new(url, @http.HttpMethod::POST, h, body=Some(body))
      #|  let resp = client.request(req) catch {
      #|    e => raise e
      #|  }
      #|  if resp.status_code >= 400 {
      #|    raise @http.HttpError::network_message(
      #|      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
      #|    )
      #|  }
      #|  let json = @json.parse(resp.body) catch {
      #|    e => raise @http.HttpError::network_message(e.to_string())
      #|  }
      #|  @json.from_json(json) catch {
      #|    e => raise @http.HttpError::network_message(e.to_string())
      #|  }
      #|}
      #|
      #|///| drive.files.get
      #|///| Gets a file
      #|pub async fn DriveService::files_get(
      #|  self : DriveService,
      #|  client : &@http.HttpClient,
      #|  file_id : String,
      #|  fields? : String? = None,
      #|) -> File raise @http.HttpError {
      #|  let qp : Array[(String, String)] = Array::new()
      #|  match fields {
      #|    Some(v) => qp.push(("fields", url_encode(v)))
      #|    None => ()
      #|  }
      #|  let qs = build_query_string(qp)
      #|  let path = "/" + "files" + "/" + file_id
      #|  let url = if qs.is_empty() {
      #|    self.base_url + path
      #|  } else {
      #|    self.base_url + path + "?" + qs
      #|  }
      #|  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, self.auth_headers())
      #|  let resp = client.request(req) catch {
      #|    e => raise e
      #|  }
      #|  if resp.status_code >= 400 {
      #|    raise @http.HttpError::network_message(
      #|      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
      #|    )
      #|  }
      #|  let json = @json.parse(resp.body) catch {
      #|    e => raise @http.HttpError::network_message(e.to_string())
      #|  }
      #|  @json.from_json(json) catch {
      #|    e => raise @http.HttpError::network_message(e.to_string())
      #|  }
      #|}
      #|
      #|///| drive.files.list
      #|///| Lists files
      #|pub async fn DriveService::files_list(
      #|  self : DriveService,
      #|  client : &@http.HttpClient,
      #|  page_size? : Int? = None,
      #|  page_token? : String? = None,
      #|  q? : String? = None,
      #|) -> FileList raise @http.HttpError {
      #|  let qp : Array[(String, String)] = Array::new()
      #|  match page_size {
      #|    Some(v) => qp.push(("pageSize", v.to_string()))
      #|    None => ()
      #|  }
      #|  match page_token {
      #|    Some(v) => qp.push(("pageToken", url_encode(v)))
      #|    None => ()
      #|  }
      #|  match q {
      #|    Some(v) => qp.push(("q", url_encode(v)))
      #|    None => ()
      #|  }
      #|  let qs = build_query_string(qp)
      #|  let path = "/" + "files"
      #|  let url = if qs.is_empty() {
      #|    self.base_url + path
      #|  } else {
      #|    self.base_url + path + "?" + qs
      #|  }
      #|  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, self.auth_headers())
      #|  let resp = client.request(req) catch {
      #|    e => raise e
      #|  }
      #|  if resp.status_code >= 400 {
      #|    raise @http.HttpError::network_message(
      #|      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
      #|    )
      #|  }
      #|  let json = @json.parse(resp.body) catch {
      #|    e => raise @http.HttpError::network_message(e.to_string())
      #|  }
      #|  @json.from_json(json) catch {
      #|    e => raise @http.HttpError::network_message(e.to_string())
      #|  }
      #|}
      #|
      #|
    ),
  )
}
