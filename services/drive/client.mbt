///|
pub(all) struct DriveService {
  base_url : String
  access_token : String
}

///|
pub fn DriveService::new(access_token : String) -> DriveService {
  DriveService::{
    base_url: "https://www.googleapis.com/drive/v3",
    access_token,
  }
}

///|
fn DriveService::auth_headers(self : DriveService) -> Map[String, String] {
  {
    "Authorization": "Bearer " + self.access_token,
    "Accept": "application/json",
  }
}

///|
pub fn DriveService::files_list(
  self : DriveService,
  page_size? : Int? = None,
  page_token? : String? = None,
  q? : String? = None,
) -> @http.HttpRequest {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(n) => qp.push(("pageSize", n.to_string()))
    None => ()
  }
  match page_token {
    Some(t) => qp.push(("pageToken", url_encode(t)))
    None => ()
  }
  match q {
    Some(query) => qp.push(("q", url_encode(query)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/files"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  @http.HttpRequest::new(url, @http.HttpMethod::GET, self.auth_headers())
}

///|
pub fn DriveService::files_get(
  self : DriveService,
  file_id : String,
  fields? : String? = None,
) -> @http.HttpRequest {
  let qp : Array[(String, String)] = Array::new()
  match fields {
    Some(f) => qp.push(("fields", url_encode(f)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/files/" + file_id
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  @http.HttpRequest::new(url, @http.HttpMethod::GET, self.auth_headers())
}

///|
pub fn DriveService::files_create(
  self : DriveService,
  name : String,
  mime_type : String,
  parents? : Array[String]? = None,
) -> @http.HttpRequest {
  let meta : Map[String, Json] = Map::new()
  meta.set("name", Json::string(name))
  meta.set("mimeType", Json::string(mime_type))
  match parents {
    Some(ps) => {
      let ja : Array[Json] = Array::new()
      for p in ps {
        ja.push(Json::string(p))
      }
      meta.set("parents", Json::array(ja))
    }
    None => ()
  }
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  @http.HttpRequest::new(
    self.base_url + "/files",
    @http.HttpMethod::POST,
    h,
    body=Some(body),
  )
}
