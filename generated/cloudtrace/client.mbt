///| API client for cloudtrace v2

///| Base URL: https://cloudtrace.googleapis.com

///|
pub struct CloudtraceService {
  base_url : String
  client : @core.GoogleClient
}

///|
pub fn CloudtraceService::new(
  client : @core.GoogleClient,
  base_url? : String = "https://cloudtrace.googleapis.com",
) -> CloudtraceService {
  CloudtraceService::{ base_url, client }
}

///|
/// BatchWriteSpans
pub async fn CloudtraceService::batch_write_spans(
  self : CloudtraceService,
  name : String,
  request : BatchWriteSpansRequest,
) -> Json raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
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

///|
/// CreateSpan
pub async fn CloudtraceService::create_span(
  self : CloudtraceService,
  name : String,
  request : Span,
) -> Span raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
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
