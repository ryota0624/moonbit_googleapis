///| API client for monitoring v3

///| Base URL: https://monitoring.googleapis.com

///|
pub struct MonitoringService {
  base_url : String
  client : @core.GoogleClient
}

///|
pub fn MonitoringService::new(
  client : @core.GoogleClient,
  base_url? : String = "https://monitoring.googleapis.com",
) -> MonitoringService {
  MonitoringService::{ base_url, client }
}

///|
/// CreateAlertPolicy
pub async fn MonitoringService::create_alert_policy(
  self : MonitoringService,
  name : String,
  request : CreateAlertPolicyRequest,
) -> AlertPolicy raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + name + "/" + "alertPolicies"
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
/// DeleteAlertPolicy
pub async fn MonitoringService::delete_alert_policy(
  self : MonitoringService,
  name : String,
) -> Json raise @http.HttpError {
  let path = "/" + "v3" + "/" + name
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

///|
/// GetAlertPolicy
pub async fn MonitoringService::get_alert_policy(
  self : MonitoringService,
  name : String,
) -> AlertPolicy raise @http.HttpError {
  let path = "/" + "v3" + "/" + name
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
/// ListAlertPolicies
pub async fn MonitoringService::list_alert_policies(
  self : MonitoringService,
  name : String,
  filter? : String? = None,
  order_by? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListAlertPoliciesResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match filter {
    Some(v) => qp.push(("filter", url_encode(v)))
    None => ()
  }
  match order_by {
    Some(v) => qp.push(("orderBy", url_encode(v)))
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
  let qs = build_query_string(qp)
  let path = "/" + "v3" + "/" + name + "/" + "alertPolicies"
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
/// UpdateAlertPolicy
pub async fn MonitoringService::update_alert_policy(
  self : MonitoringService,
  alert_policy_name : String,
  request : UpdateAlertPolicyRequest,
  update_mask? : String? = None,
) -> AlertPolicy raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + alert_policy_name
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::PATCH,
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
