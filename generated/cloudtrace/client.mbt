///| API client for cloudtrace v2

///| Base URL: https://cloudtrace.googleapis.com/

///|
pub(all) struct CloudtraceService {
  base_url : String
  access_token : String
}

///|
pub fn CloudtraceService::new(access_token : String) -> CloudtraceService {
  CloudtraceService::{
    base_url: "https://cloudtrace.googleapis.com",
    access_token,
  }
}

///|
fn CloudtraceService::auth_headers(
  self : CloudtraceService,
) -> Map[String, String] {
  {
    "Authorization": "Bearer " + self.access_token,
    "Accept": "application/json",
  }
}

///| cloudtrace.projects.traces.batchWrite

///|
/// Batch writes new spans to new or existing traces. You cannot update existing spans. If a span ID already exists, an additional copy of the span will be stored.
pub async fn CloudtraceService::projects_traces_batch_write(
  self : CloudtraceService,
  client : &@http.HttpClient,
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
  let resp = client.request(req) catch { e => raise e }
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
  client : &@http.HttpClient,
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
  let resp = client.request(req) catch { e => raise e }
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
