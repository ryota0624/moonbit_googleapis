///| API client for clouderrorreporting v1beta1

///| Base URL: https://clouderrorreporting.googleapis.com/

///|
pub struct ClouderrorreportingService {
  base_url : String
  client : @core.GoogleClient
}

///|
pub fn ClouderrorreportingService::new(
  client : @core.GoogleClient,
) -> ClouderrorreportingService {
  ClouderrorreportingService::{
    base_url: "https://clouderrorreporting.googleapis.com",
    client,
  }
}

///| clouderrorreporting.projects.deleteEvents

///|
/// Deletes all error events of a given project.
pub async fn ClouderrorreportingService::projects_delete_events(
  self : ClouderrorreportingService,
  project_name : String,
) -> DeleteEventsResponse raise @http.HttpError {
  let path = "/" + "v1beta1" + "/" + project_name + "/" + "events"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(url, @http.HttpMethod::DELETE, {})
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

///| clouderrorreporting.projects.events.list

///|
/// Lists the specified events.
pub async fn ClouderrorreportingService::projects_events_list(
  self : ClouderrorreportingService,
  project_name : String,
  group_id? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  service_filter_resource_type? : String? = None,
  service_filter_service? : String? = None,
  service_filter_version? : String? = None,
  time_range_period? : String? = None,
) -> ListEventsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match group_id {
    Some(v) => qp.push(("groupId", url_encode(v)))
    None => ()
  }
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match service_filter_resource_type {
    Some(v) => qp.push(("serviceFilter.resourceType", url_encode(v)))
    None => ()
  }
  match service_filter_service {
    Some(v) => qp.push(("serviceFilter.service", url_encode(v)))
    None => ()
  }
  match service_filter_version {
    Some(v) => qp.push(("serviceFilter.version", url_encode(v)))
    None => ()
  }
  match time_range_period {
    Some(v) => qp.push(("timeRange.period", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v1beta1" + "/" + project_name + "/" + "events"
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

///| clouderrorreporting.projects.events.report

///|
/// Report an individual error event and record the event to a log. This endpoint accepts **either** an OAuth token, **or** an [API key](https://support.google.com/cloud/answer/6158862) for authentication. To use an API key, append it to the URL as the value of a `key` parameter. For example: `POST https://clouderrorreporting.googleapis.com/v1beta1/{projectName}/events:report?key=123ABC456` **Note:** [Error Reporting] (https://cloud.google.com/error-reporting) is a service built on Cloud Logging and can analyze log entries when all of the following are true: * Customer-managed encryption keys (CMEK) are disabled on the log bucket. * The log bucket satisfies one of the following: * The log bucket is stored in the same project where the logs originated. * The logs were routed to a project, and then that project stored those logs in a log bucket that it owns.
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

///| clouderrorreporting.projects.groupStats.list

///|
/// Lists the specified groups.
pub async fn ClouderrorreportingService::projects_group_stats_list(
  self : ClouderrorreportingService,
  project_name : String,
  alignment? : String? = None,
  alignment_time? : String? = None,
  group_id? : Array[String]? = None,
  order? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  service_filter_resource_type? : String? = None,
  service_filter_service? : String? = None,
  service_filter_version? : String? = None,
  time_range_period? : String? = None,
  timed_count_duration? : String? = None,
) -> ListGroupStatsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match alignment {
    Some(v) => qp.push(("alignment", url_encode(v)))
    None => ()
  }
  match alignment_time {
    Some(v) => qp.push(("alignmentTime", url_encode(v)))
    None => ()
  }
  match group_id {
    Some(vs) =>
      for v in vs {
        qp.push(("groupId", url_encode(v)))
      }
    None => ()
  }
  match order {
    Some(v) => qp.push(("order", url_encode(v)))
    None => ()
  }
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match service_filter_resource_type {
    Some(v) => qp.push(("serviceFilter.resourceType", url_encode(v)))
    None => ()
  }
  match service_filter_service {
    Some(v) => qp.push(("serviceFilter.service", url_encode(v)))
    None => ()
  }
  match service_filter_version {
    Some(v) => qp.push(("serviceFilter.version", url_encode(v)))
    None => ()
  }
  match time_range_period {
    Some(v) => qp.push(("timeRange.period", url_encode(v)))
    None => ()
  }
  match timed_count_duration {
    Some(v) => qp.push(("timedCountDuration", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v1beta1" + "/" + project_name + "/" + "groupStats"
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

///| clouderrorreporting.projects.groups.get

///|
/// Get the specified group.
pub async fn ClouderrorreportingService::projects_groups_get(
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

///| clouderrorreporting.projects.groups.update

///|
/// Replace the data for the specified group. Fails if the group does not exist.
pub async fn ClouderrorreportingService::projects_groups_update(
  self : ClouderrorreportingService,
  name : String,
  request : ErrorGroup,
) -> ErrorGroup raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v1beta1" + "/" + name
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

///| clouderrorreporting.projects.locations.deleteEvents

///|
/// Deletes all error events of a given project.
pub async fn ClouderrorreportingService::projects_locations_delete_events(
  self : ClouderrorreportingService,
  project_name : String,
) -> DeleteEventsResponse raise @http.HttpError {
  let path = "/" + "v1beta1" + "/" + project_name + "/" + "events"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(url, @http.HttpMethod::DELETE, {})
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

///| clouderrorreporting.projects.locations.events.list

///|
/// Lists the specified events.
pub async fn ClouderrorreportingService::projects_locations_events_list(
  self : ClouderrorreportingService,
  project_name : String,
  group_id? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  service_filter_resource_type? : String? = None,
  service_filter_service? : String? = None,
  service_filter_version? : String? = None,
  time_range_period? : String? = None,
) -> ListEventsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match group_id {
    Some(v) => qp.push(("groupId", url_encode(v)))
    None => ()
  }
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match service_filter_resource_type {
    Some(v) => qp.push(("serviceFilter.resourceType", url_encode(v)))
    None => ()
  }
  match service_filter_service {
    Some(v) => qp.push(("serviceFilter.service", url_encode(v)))
    None => ()
  }
  match service_filter_version {
    Some(v) => qp.push(("serviceFilter.version", url_encode(v)))
    None => ()
  }
  match time_range_period {
    Some(v) => qp.push(("timeRange.period", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v1beta1" + "/" + project_name + "/" + "events"
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

///| clouderrorreporting.projects.locations.groupStats.list

///|
/// Lists the specified groups.
pub async fn ClouderrorreportingService::projects_locations_group_stats_list(
  self : ClouderrorreportingService,
  project_name : String,
  alignment? : String? = None,
  alignment_time? : String? = None,
  group_id? : Array[String]? = None,
  order? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  service_filter_resource_type? : String? = None,
  service_filter_service? : String? = None,
  service_filter_version? : String? = None,
  time_range_period? : String? = None,
  timed_count_duration? : String? = None,
) -> ListGroupStatsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match alignment {
    Some(v) => qp.push(("alignment", url_encode(v)))
    None => ()
  }
  match alignment_time {
    Some(v) => qp.push(("alignmentTime", url_encode(v)))
    None => ()
  }
  match group_id {
    Some(vs) =>
      for v in vs {
        qp.push(("groupId", url_encode(v)))
      }
    None => ()
  }
  match order {
    Some(v) => qp.push(("order", url_encode(v)))
    None => ()
  }
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match service_filter_resource_type {
    Some(v) => qp.push(("serviceFilter.resourceType", url_encode(v)))
    None => ()
  }
  match service_filter_service {
    Some(v) => qp.push(("serviceFilter.service", url_encode(v)))
    None => ()
  }
  match service_filter_version {
    Some(v) => qp.push(("serviceFilter.version", url_encode(v)))
    None => ()
  }
  match time_range_period {
    Some(v) => qp.push(("timeRange.period", url_encode(v)))
    None => ()
  }
  match timed_count_duration {
    Some(v) => qp.push(("timedCountDuration", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v1beta1" + "/" + project_name + "/" + "groupStats"
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

///| clouderrorreporting.projects.locations.groups.get

///|
/// Get the specified group.
pub async fn ClouderrorreportingService::projects_locations_groups_get(
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

///| clouderrorreporting.projects.locations.groups.update

///|
/// Replace the data for the specified group. Fails if the group does not exist.
pub async fn ClouderrorreportingService::projects_locations_groups_update(
  self : ClouderrorreportingService,
  name : String,
  request : ErrorGroup,
) -> ErrorGroup raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v1beta1" + "/" + name
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
