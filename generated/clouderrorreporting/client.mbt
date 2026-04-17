///| API client for clouderrorreporting v1beta1

///| Base URL: https://clouderrorreporting.googleapis.com

///|
pub struct ClouderrorreportingService {
  base_url : String
  client : @core.GoogleClient
}

///|
pub fn ClouderrorreportingService::new(
  client : @core.GoogleClient,
  base_url? : String = "https://clouderrorreporting.googleapis.com",
) -> ClouderrorreportingService {
  ClouderrorreportingService::{ base_url, client }
}

///|
/// GetGroup
pub async fn ClouderrorreportingService::get_group(
  self : ClouderrorreportingService,
  group_name : String,
) -> ErrorGroup raise @http.HttpError {
  let path = "/" + "v1beta1" + "/" + group_name
  let url = self.base_url + path
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
/// ReportErrorEvent
pub async fn ClouderrorreportingService::projects_events_report(
  self : ClouderrorreportingService,
  project_name : String,
  request : ReportedErrorEvent,
) -> ReportErrorEventResponse raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v1beta1" + "/" + project_name + "/" + "events:report"
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
/// UpdateGroup
pub async fn ClouderrorreportingService::update_group(
  self : ClouderrorreportingService,
  group_name : String,
  request : ErrorGroup,
) -> ErrorGroup raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v1beta1" + "/" + group_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::PUT,
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
