///| API client for bigquery_storage v1

///| Base URL: https://bigquerystorage.googleapis.com

///|
pub struct Bigquery_storageService {
  base_url : String
  client : @core.GoogleClient
}

///|
pub fn Bigquery_storageService::new(
  client : @core.GoogleClient,
  base_url? : String = "https://bigquerystorage.googleapis.com",
) -> Bigquery_storageService {
  Bigquery_storageService::{ base_url, client }
}

///|
/// CreateReadSession
pub async fn Bigquery_storageService::create_read_session(
  self : Bigquery_storageService,
  read_session_table : String,
  request : CreateReadSessionRequest,
) -> ReadSession raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + read_session_table
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::POST,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///|
/// ReadRows
pub async fn Bigquery_storageService::read_rows(
  self : Bigquery_storageService,
  read_stream : String,
  offset? : String? = None,
) -> Array[ReadRowsResponse] raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match offset {
    Some(v) => qp.push(("offset", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v1" + "/" + read_stream
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///|
/// SplitReadStream
pub async fn Bigquery_storageService::split_read_stream(
  self : Bigquery_storageService,
  name : String,
  fraction? : Double? = None,
) -> SplitReadStreamResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match fraction {
    Some(v) => qp.push(("fraction", v.to_string()))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v1" + "/" + name
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}
