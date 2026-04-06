///| API client for cloudtrace v2

///| Base URL: https://cloudtrace.googleapis.com/

///|
pub struct CloudtraceService {
  base_url : String
  get_token : async () -> String
  client : &@http.HttpClient
}

///|
pub fn CloudtraceService::new(
  client : &@http.HttpClient,
  get_token : async () -> String,
) -> CloudtraceService {
  CloudtraceService::{
    base_url: "https://cloudtrace.googleapis.com",
    get_token,
    client,
  }
}

///|
async fn CloudtraceService::auth_headers(
  self : CloudtraceService,
) -> Map[String, String] raise @http.HttpError {
  let token = (self.get_token)() catch {
    e => raise @http.HttpError::NetworkError(e.to_string())
  }
  { "Authorization": "Bearer " + token, "Accept": "application/json" }
}

///| cloudtrace.projects.traces.batchWrite

///|
/// Batch writes new spans to new or existing traces. You cannot update existing spans. If a span ID already exists, an additional copy of the span will be stored.
pub async fn CloudtraceService::projects_traces_batch_write(
  self : CloudtraceService,
  name : String,
) -> Empty raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + "traces:batchWrite"
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

///| cloudtrace.projects.traces.spans.createSpan

///|
/// Creates a new span. If a span ID already exists, an additional copy of the span will be stored.
pub async fn CloudtraceService::projects_traces_spans_create_span(
  self : CloudtraceService,
  name : String,
) -> Span raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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
