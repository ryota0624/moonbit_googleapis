///| API client for monitoring v3

///| Base URL: https://monitoring.googleapis.com/

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

///| monitoring.folders.timeSeries.list

///|
/// Lists time series that match a filter.
pub async fn MonitoringService::folders_time_series_list(
  self : MonitoringService,
  name : String,
  aggregation_alignment_period? : String? = None,
  aggregation_cross_series_reducer? : String? = None,
  aggregation_group_by_fields? : Array[String]? = None,
  aggregation_per_series_aligner? : String? = None,
  filter? : String? = None,
  interval_end_time? : String? = None,
  interval_start_time? : String? = None,
  order_by? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  secondary_aggregation_alignment_period? : String? = None,
  secondary_aggregation_cross_series_reducer? : String? = None,
  secondary_aggregation_group_by_fields? : Array[String]? = None,
  secondary_aggregation_per_series_aligner? : String? = None,
  view? : String? = None,
) -> ListTimeSeriesResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match aggregation_alignment_period {
    Some(v) => qp.push(("aggregation.alignmentPeriod", url_encode(v)))
    None => ()
  }
  match aggregation_cross_series_reducer {
    Some(v) => qp.push(("aggregation.crossSeriesReducer", url_encode(v)))
    None => ()
  }
  match aggregation_group_by_fields {
    Some(vs) =>
      for v in vs {
        qp.push(("aggregation.groupByFields", url_encode(v)))
      }
    None => ()
  }
  match aggregation_per_series_aligner {
    Some(v) => qp.push(("aggregation.perSeriesAligner", url_encode(v)))
    None => ()
  }
  match filter {
    Some(v) => qp.push(("filter", url_encode(v)))
    None => ()
  }
  match interval_end_time {
    Some(v) => qp.push(("interval.endTime", url_encode(v)))
    None => ()
  }
  match interval_start_time {
    Some(v) => qp.push(("interval.startTime", url_encode(v)))
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
  match secondary_aggregation_alignment_period {
    Some(v) => qp.push(("secondaryAggregation.alignmentPeriod", url_encode(v)))
    None => ()
  }
  match secondary_aggregation_cross_series_reducer {
    Some(v) =>
      qp.push(("secondaryAggregation.crossSeriesReducer", url_encode(v)))
    None => ()
  }
  match secondary_aggregation_group_by_fields {
    Some(vs) =>
      for v in vs {
        qp.push(("secondaryAggregation.groupByFields", url_encode(v)))
      }
    None => ()
  }
  match secondary_aggregation_per_series_aligner {
    Some(v) => qp.push(("secondaryAggregation.perSeriesAligner", url_encode(v)))
    None => ()
  }
  match view {
    Some(v) => qp.push(("view", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v3" + "/" + name + "/" + "timeSeries"
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

///| monitoring.organizations.timeSeries.list

///|
/// Lists time series that match a filter.
pub async fn MonitoringService::organizations_time_series_list(
  self : MonitoringService,
  name : String,
  aggregation_alignment_period? : String? = None,
  aggregation_cross_series_reducer? : String? = None,
  aggregation_group_by_fields? : Array[String]? = None,
  aggregation_per_series_aligner? : String? = None,
  filter? : String? = None,
  interval_end_time? : String? = None,
  interval_start_time? : String? = None,
  order_by? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  secondary_aggregation_alignment_period? : String? = None,
  secondary_aggregation_cross_series_reducer? : String? = None,
  secondary_aggregation_group_by_fields? : Array[String]? = None,
  secondary_aggregation_per_series_aligner? : String? = None,
  view? : String? = None,
) -> ListTimeSeriesResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match aggregation_alignment_period {
    Some(v) => qp.push(("aggregation.alignmentPeriod", url_encode(v)))
    None => ()
  }
  match aggregation_cross_series_reducer {
    Some(v) => qp.push(("aggregation.crossSeriesReducer", url_encode(v)))
    None => ()
  }
  match aggregation_group_by_fields {
    Some(vs) =>
      for v in vs {
        qp.push(("aggregation.groupByFields", url_encode(v)))
      }
    None => ()
  }
  match aggregation_per_series_aligner {
    Some(v) => qp.push(("aggregation.perSeriesAligner", url_encode(v)))
    None => ()
  }
  match filter {
    Some(v) => qp.push(("filter", url_encode(v)))
    None => ()
  }
  match interval_end_time {
    Some(v) => qp.push(("interval.endTime", url_encode(v)))
    None => ()
  }
  match interval_start_time {
    Some(v) => qp.push(("interval.startTime", url_encode(v)))
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
  match secondary_aggregation_alignment_period {
    Some(v) => qp.push(("secondaryAggregation.alignmentPeriod", url_encode(v)))
    None => ()
  }
  match secondary_aggregation_cross_series_reducer {
    Some(v) =>
      qp.push(("secondaryAggregation.crossSeriesReducer", url_encode(v)))
    None => ()
  }
  match secondary_aggregation_group_by_fields {
    Some(vs) =>
      for v in vs {
        qp.push(("secondaryAggregation.groupByFields", url_encode(v)))
      }
    None => ()
  }
  match secondary_aggregation_per_series_aligner {
    Some(v) => qp.push(("secondaryAggregation.perSeriesAligner", url_encode(v)))
    None => ()
  }
  match view {
    Some(v) => qp.push(("view", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v3" + "/" + name + "/" + "timeSeries"
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

///| monitoring.projects.alertPolicies.create

///|
/// Creates a new alerting policy.Design your application to single-thread API calls that modify the state of alerting policies in a single project. This includes calls to CreateAlertPolicy, DeleteAlertPolicy and UpdateAlertPolicy.
pub async fn MonitoringService::projects_alert_policies_create(
  self : MonitoringService,
  name : String,
  request : AlertPolicy,
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

///| monitoring.projects.alertPolicies.delete

///|
/// Deletes an alerting policy.Design your application to single-thread API calls that modify the state of alerting policies in a single project. This includes calls to CreateAlertPolicy, DeleteAlertPolicy and UpdateAlertPolicy.
pub async fn MonitoringService::projects_alert_policies_delete(
  self : MonitoringService,
  name : String,
) -> Empty raise @http.HttpError {
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

///| monitoring.projects.alertPolicies.get

///|
/// Gets a single alerting policy.
pub async fn MonitoringService::projects_alert_policies_get(
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

///| monitoring.projects.alertPolicies.list

///|
/// Lists the existing alerting policies for the workspace.
pub async fn MonitoringService::projects_alert_policies_list(
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

///| monitoring.projects.alertPolicies.patch

///|
/// Updates an alerting policy. You can either replace the entire policy with a new one or replace only certain fields in the current alerting policy by specifying the fields to be updated via updateMask. Returns the updated alerting policy.Design your application to single-thread API calls that modify the state of alerting policies in a single project. This includes calls to CreateAlertPolicy, DeleteAlertPolicy and UpdateAlertPolicy.
pub async fn MonitoringService::projects_alert_policies_patch(
  self : MonitoringService,
  name : String,
  request : AlertPolicy,
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
  let path = "/" + "v3" + "/" + name
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

///| monitoring.projects.alerts.get

///|
/// Gets a single alert.
pub async fn MonitoringService::projects_alerts_get(
  self : MonitoringService,
  name : String,
) -> Alert raise @http.HttpError {
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

///| monitoring.projects.alerts.list

///|
/// Lists the existing alerts for the metrics scope of the project.
pub async fn MonitoringService::projects_alerts_list(
  self : MonitoringService,
  parent : String,
  filter? : String? = None,
  order_by? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListAlertsResponse raise @http.HttpError {
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
  let path = "/" + "v3" + "/" + parent + "/" + "alerts"
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

///| monitoring.projects.collectdTimeSeries.create

///|
/// Cloud Monitoring Agent only: Creates a new time series.This method is only for use by the Cloud Monitoring Agent. Use projects.timeSeries.create instead.
pub async fn MonitoringService::projects_collectd_time_series_create(
  self : MonitoringService,
  name : String,
  request : CreateCollectdTimeSeriesRequest,
) -> CreateCollectdTimeSeriesResponse raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + name + "/" + "collectdTimeSeries"
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

///| monitoring.projects.groups.create

///|
/// Creates a new group.
pub async fn MonitoringService::projects_groups_create(
  self : MonitoringService,
  name : String,
  request : Group,
  validate_only? : Bool? = None,
) -> Group raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match validate_only {
    Some(v) => qp.push(("validateOnly", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + name + "/" + "groups"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
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

///| monitoring.projects.groups.delete

///|
/// Deletes an existing group.
pub async fn MonitoringService::projects_groups_delete(
  self : MonitoringService,
  name : String,
  recursive? : Bool? = None,
) -> Empty raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match recursive {
    Some(v) => qp.push(("recursive", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v3" + "/" + name
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
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

///| monitoring.projects.groups.get

///|
/// Gets a single group.
pub async fn MonitoringService::projects_groups_get(
  self : MonitoringService,
  name : String,
) -> Group raise @http.HttpError {
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

///| monitoring.projects.groups.list

///|
/// Lists the existing groups.
pub async fn MonitoringService::projects_groups_list(
  self : MonitoringService,
  name : String,
  ancestors_of_group? : String? = None,
  children_of_group? : String? = None,
  descendants_of_group? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListGroupsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match ancestors_of_group {
    Some(v) => qp.push(("ancestorsOfGroup", url_encode(v)))
    None => ()
  }
  match children_of_group {
    Some(v) => qp.push(("childrenOfGroup", url_encode(v)))
    None => ()
  }
  match descendants_of_group {
    Some(v) => qp.push(("descendantsOfGroup", url_encode(v)))
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
  let path = "/" + "v3" + "/" + name + "/" + "groups"
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

///| monitoring.projects.groups.update

///|
/// Updates an existing group. You can change any group attributes except name.
pub async fn MonitoringService::projects_groups_update(
  self : MonitoringService,
  name : String,
  request : Group,
  validate_only? : Bool? = None,
) -> Group raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match validate_only {
    Some(v) => qp.push(("validateOnly", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + name
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
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

///| monitoring.projects.groups.members.list

///|
/// Lists the monitored resources that are members of a group.
pub async fn MonitoringService::projects_groups_members_list(
  self : MonitoringService,
  name : String,
  filter? : String? = None,
  interval_end_time? : String? = None,
  interval_start_time? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListGroupMembersResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match filter {
    Some(v) => qp.push(("filter", url_encode(v)))
    None => ()
  }
  match interval_end_time {
    Some(v) => qp.push(("interval.endTime", url_encode(v)))
    None => ()
  }
  match interval_start_time {
    Some(v) => qp.push(("interval.startTime", url_encode(v)))
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
  let path = "/" + "v3" + "/" + name + "/" + "members"
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

///| monitoring.projects.metricDescriptors.create

///|
/// Creates a new metric descriptor. The creation is executed asynchronously. User-created metric descriptors define custom metrics (https://cloud.google.com/monitoring/custom-metrics). The metric descriptor is updated if it already exists, except that metric labels are never removed.
pub async fn MonitoringService::projects_metric_descriptors_create(
  self : MonitoringService,
  name : String,
  request : MetricDescriptor,
) -> MetricDescriptor raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + name + "/" + "metricDescriptors"
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

///| monitoring.projects.metricDescriptors.delete

///|
/// Deletes a metric descriptor. Only user-created custom metrics (https://cloud.google.com/monitoring/custom-metrics) can be deleted.
pub async fn MonitoringService::projects_metric_descriptors_delete(
  self : MonitoringService,
  name : String,
) -> Empty raise @http.HttpError {
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

///| monitoring.projects.metricDescriptors.get

///|
/// Gets a single metric descriptor.
pub async fn MonitoringService::projects_metric_descriptors_get(
  self : MonitoringService,
  name : String,
) -> MetricDescriptor raise @http.HttpError {
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

///| monitoring.projects.metricDescriptors.list

///|
/// Lists metric descriptors that match a filter.
pub async fn MonitoringService::projects_metric_descriptors_list(
  self : MonitoringService,
  name : String,
  active_only? : Bool? = None,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListMetricDescriptorsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match active_only {
    Some(v) => qp.push(("activeOnly", if v { "true" } else { "false" }))
    None => ()
  }
  match filter {
    Some(v) => qp.push(("filter", url_encode(v)))
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
  let path = "/" + "v3" + "/" + name + "/" + "metricDescriptors"
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

///| monitoring.projects.monitoredResourceDescriptors.get

///|
/// Gets a single monitored resource descriptor.
pub async fn MonitoringService::projects_monitored_resource_descriptors_get(
  self : MonitoringService,
  name : String,
) -> MonitoredResourceDescriptor raise @http.HttpError {
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

///| monitoring.projects.monitoredResourceDescriptors.list

///|
/// Lists monitored resource descriptors that match a filter.
pub async fn MonitoringService::projects_monitored_resource_descriptors_list(
  self : MonitoringService,
  name : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListMonitoredResourceDescriptorsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match filter {
    Some(v) => qp.push(("filter", url_encode(v)))
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
  let path = "/" + "v3" + "/" + name + "/" + "monitoredResourceDescriptors"
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

///| monitoring.projects.notificationChannelDescriptors.get

///|
/// Gets a single channel descriptor. The descriptor indicates which fields are expected / permitted for a notification channel of the given type.
pub async fn MonitoringService::projects_notification_channel_descriptors_get(
  self : MonitoringService,
  name : String,
) -> NotificationChannelDescriptor raise @http.HttpError {
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

///| monitoring.projects.notificationChannelDescriptors.list

///|
/// Lists the descriptors for supported channel types. The use of descriptors makes it possible for new channel types to be dynamically added.
pub async fn MonitoringService::projects_notification_channel_descriptors_list(
  self : MonitoringService,
  name : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListNotificationChannelDescriptorsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v3" + "/" + name + "/" + "notificationChannelDescriptors"
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

///| monitoring.projects.notificationChannels.create

///|
/// Creates a new notification channel, representing a single notification endpoint such as an email address, SMS number, or PagerDuty service.Design your application to single-thread API calls that modify the state of notification channels in a single project. This includes calls to CreateNotificationChannel, DeleteNotificationChannel and UpdateNotificationChannel.
pub async fn MonitoringService::projects_notification_channels_create(
  self : MonitoringService,
  name : String,
  request : NotificationChannel,
) -> NotificationChannel raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + name + "/" + "notificationChannels"
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

///| monitoring.projects.notificationChannels.delete

///|
/// Deletes a notification channel.Design your application to single-thread API calls that modify the state of notification channels in a single project. This includes calls to CreateNotificationChannel, DeleteNotificationChannel and UpdateNotificationChannel.
pub async fn MonitoringService::projects_notification_channels_delete(
  self : MonitoringService,
  name : String,
  force? : Bool? = None,
) -> Empty raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match force {
    Some(v) => qp.push(("force", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v3" + "/" + name
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
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

///| monitoring.projects.notificationChannels.get

///|
/// Gets a single notification channel. The channel includes the relevant configuration details with which the channel was created. However, the response may truncate or omit passwords, API keys, or other private key matter and thus the response may not be 100% identical to the information that was supplied in the call to the create method.
pub async fn MonitoringService::projects_notification_channels_get(
  self : MonitoringService,
  name : String,
) -> NotificationChannel raise @http.HttpError {
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

///| monitoring.projects.notificationChannels.getVerificationCode

///|
/// Requests a verification code for an already verified channel that can then be used in a call to VerifyNotificationChannel() on a different channel with an equivalent identity in the same or in a different project. This makes it possible to copy a channel between projects without requiring manual reverification of the channel. If the channel is not in the verified state, this method will fail (in other words, this may only be used if the SendNotificationChannelVerificationCode and VerifyNotificationChannel paths have already been used to put the given channel into the verified state).There is no guarantee that the verification codes returned by this method will be of a similar structure or form as the ones that are delivered to the channel via SendNotificationChannelVerificationCode; while VerifyNotificationChannel() will recognize both the codes delivered via SendNotificationChannelVerificationCode() and returned from GetNotificationChannelVerificationCode(), it is typically the case that the verification codes delivered via SendNotificationChannelVerificationCode() will be shorter and also have a shorter expiration (e.g. codes such as "G-123456") whereas GetVerificationCode() will typically return a much longer, websafe base 64 encoded string that has a longer expiration time.
pub async fn MonitoringService::projects_notification_channels_get_verification_code(
  self : MonitoringService,
  name : String,
  request : GetNotificationChannelVerificationCodeRequest,
) -> GetNotificationChannelVerificationCodeResponse raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + name + "/" + ":getVerificationCode"
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

///| monitoring.projects.notificationChannels.list

///|
/// Lists the notification channels that have been created for the project. To list the types of notification channels that are supported, use the ListNotificationChannelDescriptors method.
pub async fn MonitoringService::projects_notification_channels_list(
  self : MonitoringService,
  name : String,
  filter? : String? = None,
  order_by? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListNotificationChannelsResponse raise @http.HttpError {
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
  let path = "/" + "v3" + "/" + name + "/" + "notificationChannels"
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

///| monitoring.projects.notificationChannels.patch

///|
/// Updates a notification channel. Fields not specified in the field mask remain unchanged.Design your application to single-thread API calls that modify the state of notification channels in a single project. This includes calls to CreateNotificationChannel, DeleteNotificationChannel and UpdateNotificationChannel.
pub async fn MonitoringService::projects_notification_channels_patch(
  self : MonitoringService,
  name : String,
  request : NotificationChannel,
  update_mask? : String? = None,
) -> NotificationChannel raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + name
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

///| monitoring.projects.notificationChannels.sendVerificationCode

///|
/// Causes a verification code to be delivered to the channel. The code can then be supplied in VerifyNotificationChannel to verify the channel.
pub async fn MonitoringService::projects_notification_channels_send_verification_code(
  self : MonitoringService,
  name : String,
  request : SendNotificationChannelVerificationCodeRequest,
) -> Empty raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + name + "/" + ":sendVerificationCode"
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

///| monitoring.projects.notificationChannels.verify

///|
/// Verifies a NotificationChannel by proving receipt of the code delivered to the channel as a result of calling SendNotificationChannelVerificationCode.
pub async fn MonitoringService::projects_notification_channels_verify(
  self : MonitoringService,
  name : String,
  request : VerifyNotificationChannelRequest,
) -> NotificationChannel raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + name + "/" + ":verify"
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

///| monitoring.projects.snoozes.create

///|
/// Creates a Snooze that will prevent alerts, which match the provided criteria, from being opened. The Snooze applies for a specific time interval.
pub async fn MonitoringService::projects_snoozes_create(
  self : MonitoringService,
  parent : String,
  request : Snooze,
) -> Snooze raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + parent + "/" + "snoozes"
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

///| monitoring.projects.snoozes.get

///|
/// Retrieves a Snooze by name.
pub async fn MonitoringService::projects_snoozes_get(
  self : MonitoringService,
  name : String,
) -> Snooze raise @http.HttpError {
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

///| monitoring.projects.snoozes.list

///|
/// Lists the Snoozes associated with a project. Can optionally pass in filter, which specifies predicates to match Snoozes.
pub async fn MonitoringService::projects_snoozes_list(
  self : MonitoringService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListSnoozesResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match filter {
    Some(v) => qp.push(("filter", url_encode(v)))
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
  let path = "/" + "v3" + "/" + parent + "/" + "snoozes"
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

///| monitoring.projects.snoozes.patch

///|
/// Updates a Snooze, identified by its name, with the parameters in the given Snooze object.
pub async fn MonitoringService::projects_snoozes_patch(
  self : MonitoringService,
  name : String,
  request : Snooze,
  update_mask? : String? = None,
) -> Snooze raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + name
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

///| monitoring.projects.timeSeries.create

///|
/// Creates or adds data to one or more time series. The response is empty if all time series in the request were written. If any time series could not be written, a corresponding failure message is included in the error response. This method does not support resource locations constraint of an organization policy (https://cloud.google.com/resource-manager/docs/organization-policy/defining-locations#setting_the_organization_policy).
pub async fn MonitoringService::projects_time_series_create(
  self : MonitoringService,
  name : String,
  request : CreateTimeSeriesRequest,
) -> Empty raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + name + "/" + "timeSeries"
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

///| monitoring.projects.timeSeries.createService

///|
/// Creates or adds data to one or more service time series. A service time series is a time series for a metric from a Google Cloud service. The response is empty if all time series in the request were written. If any time series could not be written, a corresponding failure message is included in the error response. This endpoint rejects writes to user-defined metrics. This method is only for use by Google Cloud services. Use projects.timeSeries.create instead.
pub async fn MonitoringService::projects_time_series_create_service(
  self : MonitoringService,
  name : String,
  request : CreateTimeSeriesRequest,
) -> Empty raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + name + "/" + "timeSeries:createService"
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

///| monitoring.projects.timeSeries.list

///|
/// Lists time series that match a filter.
pub async fn MonitoringService::projects_time_series_list(
  self : MonitoringService,
  name : String,
  aggregation_alignment_period? : String? = None,
  aggregation_cross_series_reducer? : String? = None,
  aggregation_group_by_fields? : Array[String]? = None,
  aggregation_per_series_aligner? : String? = None,
  filter? : String? = None,
  interval_end_time? : String? = None,
  interval_start_time? : String? = None,
  order_by? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  secondary_aggregation_alignment_period? : String? = None,
  secondary_aggregation_cross_series_reducer? : String? = None,
  secondary_aggregation_group_by_fields? : Array[String]? = None,
  secondary_aggregation_per_series_aligner? : String? = None,
  view? : String? = None,
) -> ListTimeSeriesResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match aggregation_alignment_period {
    Some(v) => qp.push(("aggregation.alignmentPeriod", url_encode(v)))
    None => ()
  }
  match aggregation_cross_series_reducer {
    Some(v) => qp.push(("aggregation.crossSeriesReducer", url_encode(v)))
    None => ()
  }
  match aggregation_group_by_fields {
    Some(vs) =>
      for v in vs {
        qp.push(("aggregation.groupByFields", url_encode(v)))
      }
    None => ()
  }
  match aggregation_per_series_aligner {
    Some(v) => qp.push(("aggregation.perSeriesAligner", url_encode(v)))
    None => ()
  }
  match filter {
    Some(v) => qp.push(("filter", url_encode(v)))
    None => ()
  }
  match interval_end_time {
    Some(v) => qp.push(("interval.endTime", url_encode(v)))
    None => ()
  }
  match interval_start_time {
    Some(v) => qp.push(("interval.startTime", url_encode(v)))
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
  match secondary_aggregation_alignment_period {
    Some(v) => qp.push(("secondaryAggregation.alignmentPeriod", url_encode(v)))
    None => ()
  }
  match secondary_aggregation_cross_series_reducer {
    Some(v) =>
      qp.push(("secondaryAggregation.crossSeriesReducer", url_encode(v)))
    None => ()
  }
  match secondary_aggregation_group_by_fields {
    Some(vs) =>
      for v in vs {
        qp.push(("secondaryAggregation.groupByFields", url_encode(v)))
      }
    None => ()
  }
  match secondary_aggregation_per_series_aligner {
    Some(v) => qp.push(("secondaryAggregation.perSeriesAligner", url_encode(v)))
    None => ()
  }
  match view {
    Some(v) => qp.push(("view", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v3" + "/" + name + "/" + "timeSeries"
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

///| monitoring.projects.timeSeries.query

///|
/// Queries time series by using Monitoring Query Language (MQL). We recommend using PromQL instead of MQL. For more information about the status of MQL, see the MQL deprecation notice (https://cloud.google.com/stackdriver/docs/deprecations/mql).
pub async fn MonitoringService::projects_time_series_query(
  self : MonitoringService,
  name : String,
  request : QueryTimeSeriesRequest,
) -> QueryTimeSeriesResponse raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + name + "/" + "timeSeries:query"
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

///| monitoring.projects.uptimeCheckConfigs.create

///|
/// Creates a new Uptime check configuration.
pub async fn MonitoringService::projects_uptime_check_configs_create(
  self : MonitoringService,
  parent : String,
  request : UptimeCheckConfig,
) -> UptimeCheckConfig raise @http.HttpError {
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + parent + "/" + "uptimeCheckConfigs"
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

///| monitoring.projects.uptimeCheckConfigs.delete

///|
/// Deletes an Uptime check configuration. Note that this method will fail if the Uptime check configuration is referenced by an alert policy or other dependent configs that would be rendered invalid by the deletion.
pub async fn MonitoringService::projects_uptime_check_configs_delete(
  self : MonitoringService,
  name : String,
) -> Empty raise @http.HttpError {
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

///| monitoring.projects.uptimeCheckConfigs.get

///|
/// Gets a single Uptime check configuration.
pub async fn MonitoringService::projects_uptime_check_configs_get(
  self : MonitoringService,
  name : String,
) -> UptimeCheckConfig raise @http.HttpError {
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

///| monitoring.projects.uptimeCheckConfigs.list

///|
/// Lists the existing valid Uptime check configurations for the project (leaving out any invalid configurations).
pub async fn MonitoringService::projects_uptime_check_configs_list(
  self : MonitoringService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListUptimeCheckConfigsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match filter {
    Some(v) => qp.push(("filter", url_encode(v)))
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
  let path = "/" + "v3" + "/" + parent + "/" + "uptimeCheckConfigs"
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

///| monitoring.projects.uptimeCheckConfigs.patch

///|
/// Updates an Uptime check configuration. You can either replace the entire configuration with a new one or replace only certain fields in the current configuration by specifying the fields to be updated via updateMask. Returns the updated configuration.
pub async fn MonitoringService::projects_uptime_check_configs_patch(
  self : MonitoringService,
  name : String,
  request : UptimeCheckConfig,
  update_mask? : String? = None,
) -> UptimeCheckConfig raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + name
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

///| monitoring.services.create

///|
/// Create a Service.
pub async fn MonitoringService::services_create(
  self : MonitoringService,
  parent : String,
  request : Service,
  service_id? : String? = None,
) -> Service raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match service_id {
    Some(v) => qp.push(("serviceId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + parent + "/" + "services"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
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

///| monitoring.services.delete

///|
/// Soft delete this Service.
pub async fn MonitoringService::services_delete(
  self : MonitoringService,
  name : String,
) -> Empty raise @http.HttpError {
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

///| monitoring.services.get

///|
/// Get the named Service.
pub async fn MonitoringService::services_get(
  self : MonitoringService,
  name : String,
) -> Service raise @http.HttpError {
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

///| monitoring.services.list

///|
/// List Services for this Metrics Scope.
pub async fn MonitoringService::services_list(
  self : MonitoringService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListServicesResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match filter {
    Some(v) => qp.push(("filter", url_encode(v)))
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
  let path = "/" + "v3" + "/" + parent + "/" + "services"
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

///| monitoring.services.patch

///|
/// Update this Service.
pub async fn MonitoringService::services_patch(
  self : MonitoringService,
  name : String,
  request : Service,
  update_mask? : String? = None,
) -> Service raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + name
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

///| monitoring.services.serviceLevelObjectives.create

///|
/// Create a ServiceLevelObjective for the given Service.
pub async fn MonitoringService::services_service_level_objectives_create(
  self : MonitoringService,
  parent : String,
  request : ServiceLevelObjective,
  service_level_objective_id? : String? = None,
) -> ServiceLevelObjective raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match service_level_objective_id {
    Some(v) => qp.push(("serviceLevelObjectiveId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + parent + "/" + "serviceLevelObjectives"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
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

///| monitoring.services.serviceLevelObjectives.delete

///|
/// Delete the given ServiceLevelObjective.
pub async fn MonitoringService::services_service_level_objectives_delete(
  self : MonitoringService,
  name : String,
) -> Empty raise @http.HttpError {
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

///| monitoring.services.serviceLevelObjectives.get

///|
/// Get a ServiceLevelObjective by name.
pub async fn MonitoringService::services_service_level_objectives_get(
  self : MonitoringService,
  name : String,
  view? : String? = None,
) -> ServiceLevelObjective raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match view {
    Some(v) => qp.push(("view", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v3" + "/" + name
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

///| monitoring.services.serviceLevelObjectives.list

///|
/// List the ServiceLevelObjectives for the given Service.
pub async fn MonitoringService::services_service_level_objectives_list(
  self : MonitoringService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  view? : String? = None,
) -> ListServiceLevelObjectivesResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match filter {
    Some(v) => qp.push(("filter", url_encode(v)))
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
  match view {
    Some(v) => qp.push(("view", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v3" + "/" + parent + "/" + "serviceLevelObjectives"
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

///| monitoring.services.serviceLevelObjectives.patch

///|
/// Update the given ServiceLevelObjective.
pub async fn MonitoringService::services_service_level_objectives_patch(
  self : MonitoringService,
  name : String,
  request : ServiceLevelObjective,
  update_mask? : String? = None,
) -> ServiceLevelObjective raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let body = request.to_json().stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "v3" + "/" + name
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

///| monitoring.uptimeCheckIps.list

///|
/// Returns the list of IP addresses that checkers run from.
pub async fn MonitoringService::uptime_check_ips_list(
  self : MonitoringService,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListUptimeCheckIpsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v3" + "/" + "uptimeCheckIps"
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
