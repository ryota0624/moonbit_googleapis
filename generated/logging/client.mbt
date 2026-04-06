///| API client for logging v2

///| Base URL: https://logging.googleapis.com/

///|
pub struct LoggingService {
  base_url : String
  access_token : String
  client : &@http.HttpClient
}

///|
pub fn LoggingService::new(
  client : &@http.HttpClient,
  access_token : String,
) -> LoggingService {
  LoggingService::{
    base_url: "https://logging.googleapis.com",
    access_token,
    client,
  }
}

///|
fn LoggingService::auth_headers(self : LoggingService) -> Map[String, String] {
  {
    "Authorization": "Bearer " + self.access_token,
    "Accept": "application/json",
  }
}

///| logging.billingAccounts.getCmekSettings

///|
/// Gets the Logging CMEK settings for the given resource.Note: CMEK for the Log Router can be configured for Google Cloud projects, folders, organizations, and billing accounts. Once configured for an organization, it applies to all projects and folders in the Google Cloud organization.See Configure CMEK for Cloud Logging (https://docs.cloud.google.com/logging/docs/routing/managed-encryption) for more information.
pub async fn LoggingService::billing_accounts_get_cmek_settings(
  self : LoggingService,
  name : String,
) -> CmekSettings raise @http.HttpError {
  let path = "/" + "v2" + "/" + name + "/" + "cmekSettings"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.getSettings

///|
/// Gets the settings for the given resource.Note: Settings can be retrieved for Google Cloud projects, folders, organizations, and billing accounts.See View default resource settings for Logging (https://docs.cloud.google.com/logging/docs/default-settings#view-org-settings) for more information.
pub async fn LoggingService::billing_accounts_get_settings(
  self : LoggingService,
  name : String,
) -> Settings raise @http.HttpError {
  let path = "/" + "v2" + "/" + name + "/" + "settings"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.exclusions.create

///|
/// Creates a new exclusion in the _Default sink in a specified parent resource. Only log entries belonging to that resource can be excluded. You can have up to 10 exclusions in a resource.
pub async fn LoggingService::billing_accounts_exclusions_create(
  self : LoggingService,
  parent : String,
) -> LogExclusion raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "exclusions"
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

///| logging.billingAccounts.exclusions.delete

///|
/// Deletes an exclusion in the _Default sink.
pub async fn LoggingService::billing_accounts_exclusions_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.billingAccounts.exclusions.get

///|
/// Gets the description of an exclusion in the _Default sink.
pub async fn LoggingService::billing_accounts_exclusions_get(
  self : LoggingService,
  name : String,
) -> LogExclusion raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.exclusions.list

///|
/// Lists all the exclusions on the _Default sink in a parent resource.
pub async fn LoggingService::billing_accounts_exclusions_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListExclusionsResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "exclusions"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.exclusions.patch

///|
/// Changes one or more properties of an existing exclusion in the _Default sink.
pub async fn LoggingService::billing_accounts_exclusions_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogExclusion raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.billingAccounts.locations.get

///|
/// Gets information about a location.
pub async fn LoggingService::billing_accounts_locations_get(
  self : LoggingService,
  name : String,
) -> Location raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.list

///|
/// Lists information about the supported locations for this service.This method lists locations based on the resource scope provided in the ListLocationsRequest.name field: Global locations: If name is empty, the method lists the public locations available to all projects. Project-specific locations: If name follows the format projects/{project}, the method lists locations visible to that specific project. This includes public, private, or other project-specific locations enabled for the project.For gRPC and client library implementations, the resource name is passed as the name field. For direct service calls, the resource name is incorporated into the request path based on the specific service implementation and version.
pub async fn LoggingService::billing_accounts_locations_list(
  self : LoggingService,
  name : String,
  extra_location_types? : String? = None,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListLocationsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match extra_location_types {
    Some(v) => qp.push(("extraLocationTypes", url_encode(v)))
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
  let path = "/" + "v2" + "/" + name + "/" + "locations"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.buckets.create

///|
/// Creates a log bucket that can be used to store log entries. After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::billing_accounts_locations_buckets_create(
  self : LoggingService,
  parent : String,
  bucket_id? : String? = None,
) -> LogBucket raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match bucket_id {
    Some(v) => qp.push(("bucketId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "buckets"
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

///| logging.billingAccounts.locations.buckets.createAsync

///|
/// Creates a log bucket asynchronously that can be used to store log entries.After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::billing_accounts_locations_buckets_create_async(
  self : LoggingService,
  parent : String,
  bucket_id? : String? = None,
) -> Operation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match bucket_id {
    Some(v) => qp.push(("bucketId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "buckets:createAsync"
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

///| logging.billingAccounts.locations.buckets.delete

///|
/// Deletes a log bucket.Changes the bucket's lifecycle_state to the DELETE_REQUESTED state. After 7 days, the bucket will be purged and all log entries in the bucket will be permanently deleted.
pub async fn LoggingService::billing_accounts_locations_buckets_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.buckets.get

///|
/// Gets a log bucket.
pub async fn LoggingService::billing_accounts_locations_buckets_get(
  self : LoggingService,
  name : String,
) -> LogBucket raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.buckets.list

///|
/// Lists log buckets.
pub async fn LoggingService::billing_accounts_locations_buckets_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListBucketsResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "buckets"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.buckets.patch

///|
/// Updates a log bucket.If the bucket has a lifecycle_state of DELETE_REQUESTED, then FAILED_PRECONDITION will be returned.After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::billing_accounts_locations_buckets_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogBucket raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.billingAccounts.locations.buckets.undelete

///|
/// Undeletes a log bucket. A bucket that has been deleted can be undeleted within the grace period of 7 days.
pub async fn LoggingService::billing_accounts_locations_buckets_undelete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":undelete"
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

///| logging.billingAccounts.locations.buckets.updateAsync

///|
/// Updates a log bucket asynchronously.If the bucket has a lifecycle_state of DELETE_REQUESTED, then FAILED_PRECONDITION will be returned.After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::billing_accounts_locations_buckets_update_async(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> Operation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":updateAsync"
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

///| logging.billingAccounts.locations.buckets.links.create

///|
/// Asynchronously creates a linked dataset in BigQuery which makes it possible to use BigQuery to read the logs stored in the log bucket. A log bucket may currently only contain one link.
pub async fn LoggingService::billing_accounts_locations_buckets_links_create(
  self : LoggingService,
  parent : String,
  link_id? : String? = None,
) -> Operation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match link_id {
    Some(v) => qp.push(("linkId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "links"
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

///| logging.billingAccounts.locations.buckets.links.delete

///|
/// Deletes a link. This will also delete the corresponding BigQuery linked dataset.
pub async fn LoggingService::billing_accounts_locations_buckets_links_delete(
  self : LoggingService,
  name : String,
) -> Operation raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.buckets.links.get

///|
/// Gets a link.
pub async fn LoggingService::billing_accounts_locations_buckets_links_get(
  self : LoggingService,
  name : String,
) -> Link raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.buckets.links.list

///|
/// Lists links.
pub async fn LoggingService::billing_accounts_locations_buckets_links_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListLinksResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "links"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.buckets.views.create

///|
/// Creates a view over log entries in a log bucket. A bucket may contain a maximum of 30 views.
pub async fn LoggingService::billing_accounts_locations_buckets_views_create(
  self : LoggingService,
  parent : String,
  view_id? : String? = None,
) -> LogView raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match view_id {
    Some(v) => qp.push(("viewId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "views"
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

///| logging.billingAccounts.locations.buckets.views.delete

///|
/// Deletes a view on a log bucket. If an UNAVAILABLE error is returned, this indicates that system is not in a state where it can delete the view. If this occurs, please try again in a few minutes.
pub async fn LoggingService::billing_accounts_locations_buckets_views_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.buckets.views.get

///|
/// Gets a view on a log bucket.
pub async fn LoggingService::billing_accounts_locations_buckets_views_get(
  self : LoggingService,
  name : String,
) -> LogView raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.buckets.views.list

///|
/// Lists views on a log bucket.
pub async fn LoggingService::billing_accounts_locations_buckets_views_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListViewsResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "views"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.buckets.views.patch

///|
/// Updates a view on a log bucket. This method replaces the value of the filter field from the existing view with the corresponding value from the new view. If an UNAVAILABLE error is returned, this indicates that system is not in a state where it can update the view. If this occurs, please try again in a few minutes.
pub async fn LoggingService::billing_accounts_locations_buckets_views_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogView raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.billingAccounts.locations.buckets.views.logs.list

///|
/// Lists the logs in projects, organizations, folders, or billing accounts. Only logs that have entries are listed.
pub async fn LoggingService::billing_accounts_locations_buckets_views_logs_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
  resource_names? : String? = None,
) -> ListLogsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match resource_names {
    Some(v) => qp.push(("resourceNames", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v2" + "/" + parent + "/" + "logs"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.operations.cancel

///|
/// Starts asynchronous cancellation on a long-running operation. The server makes a best effort to cancel the operation, but success is not guaranteed. If the server doesn't support this method, it returns google.rpc.Code.UNIMPLEMENTED. Clients can use Operations.GetOperation or other methods to check whether the cancellation succeeded or whether the operation completed despite cancellation. On successful cancellation, the operation is not deleted; instead, it becomes an operation with an Operation.error value with a google.rpc.Status.code of 1, corresponding to Code.CANCELLED.
pub async fn LoggingService::billing_accounts_locations_operations_cancel(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":cancel"
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

///| logging.billingAccounts.locations.operations.get

///|
/// Gets the latest state of a long-running operation. Clients can use this method to poll the operation result at intervals as recommended by the API service.
pub async fn LoggingService::billing_accounts_locations_operations_get(
  self : LoggingService,
  name : String,
) -> Operation raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.operations.list

///|
/// Lists operations that match the specified filter in the request. If the server doesn't support this method, it returns UNIMPLEMENTED.
pub async fn LoggingService::billing_accounts_locations_operations_list(
  self : LoggingService,
  name : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  return_partial_success? : Bool? = None,
) -> ListOperationsResponse raise @http.HttpError {
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
  match return_partial_success {
    Some(v) =>
      qp.push(("returnPartialSuccess", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v2" + "/" + name + "/" + "operations"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.recentQueries.list

///|
/// Lists the RecentQueries that were created by the user making the request.
pub async fn LoggingService::billing_accounts_locations_recent_queries_list(
  self : LoggingService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListRecentQueriesResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "recentQueries"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.savedQueries.create

///|
/// Creates a new SavedQuery for the user making the request.
pub async fn LoggingService::billing_accounts_locations_saved_queries_create(
  self : LoggingService,
  parent : String,
  saved_query_id? : String? = None,
) -> SavedQuery raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match saved_query_id {
    Some(v) => qp.push(("savedQueryId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "savedQueries"
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

///| logging.billingAccounts.locations.savedQueries.delete

///|
/// Deletes an existing SavedQuery that was created by the user making the request.
pub async fn LoggingService::billing_accounts_locations_saved_queries_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.savedQueries.get

///|
/// Returns all data associated with the requested query.
pub async fn LoggingService::billing_accounts_locations_saved_queries_get(
  self : LoggingService,
  name : String,
) -> SavedQuery raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.savedQueries.list

///|
/// Lists the SavedQueries that were created by the user making the request.
pub async fn LoggingService::billing_accounts_locations_saved_queries_list(
  self : LoggingService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListSavedQueriesResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "savedQueries"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.locations.savedQueries.patch

///|
/// Updates an existing SavedQuery.
pub async fn LoggingService::billing_accounts_locations_saved_queries_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> SavedQuery raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.billingAccounts.logs.delete

///|
/// Deletes all the log entries in a log for the global _Default Log Bucket. The log reappears if it receives new entries. Log entries written shortly before the delete operation might not be deleted. Entries received after the delete operation with a timestamp before the operation will be deleted.
pub async fn LoggingService::billing_accounts_logs_delete(
  self : LoggingService,
  log_name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + log_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.billingAccounts.logs.list

///|
/// Lists the logs in projects, organizations, folders, or billing accounts. Only logs that have entries are listed.
pub async fn LoggingService::billing_accounts_logs_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
  resource_names? : String? = None,
) -> ListLogsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match resource_names {
    Some(v) => qp.push(("resourceNames", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v2" + "/" + parent + "/" + "logs"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.sinks.create

///|
/// Creates a sink that exports specified log entries to a destination. The export begins upon ingress, unless the sink's writer_identity is not permitted to write to the destination. A sink can export log entries only from the resource owning the sink.
pub async fn LoggingService::billing_accounts_sinks_create(
  self : LoggingService,
  parent : String,
  custom_writer_identity? : String? = None,
  unique_writer_identity? : Bool? = None,
) -> LogSink raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match custom_writer_identity {
    Some(v) => qp.push(("customWriterIdentity", url_encode(v)))
    None => ()
  }
  match unique_writer_identity {
    Some(v) =>
      qp.push(("uniqueWriterIdentity", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "sinks"
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

///| logging.billingAccounts.sinks.delete

///|
/// Deletes a sink. If the sink has a unique writer_identity, then that service account is also deleted.
pub async fn LoggingService::billing_accounts_sinks_delete(
  self : LoggingService,
  sink_name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + sink_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.billingAccounts.sinks.get

///|
/// Gets a sink.
pub async fn LoggingService::billing_accounts_sinks_get(
  self : LoggingService,
  sink_name : String,
) -> LogSink raise @http.HttpError {
  let path = "/" + "v2" + "/" + sink_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.sinks.list

///|
/// Lists sinks.
pub async fn LoggingService::billing_accounts_sinks_list(
  self : LoggingService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListSinksResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "sinks"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.billingAccounts.sinks.patch

///|
/// Updates a sink. This method replaces the values of the destination and filter fields of the existing sink with the corresponding values from the new sink.The updated sink might also have a new writer_identity; see the unique_writer_identity field.
pub async fn LoggingService::billing_accounts_sinks_patch(
  self : LoggingService,
  sink_name : String,
  custom_writer_identity? : String? = None,
  unique_writer_identity? : Bool? = None,
  update_mask? : String? = None,
) -> LogSink raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match custom_writer_identity {
    Some(v) => qp.push(("customWriterIdentity", url_encode(v)))
    None => ()
  }
  match unique_writer_identity {
    Some(v) =>
      qp.push(("uniqueWriterIdentity", if v { "true" } else { "false" }))
    None => ()
  }
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + sink_name
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

///| logging.billingAccounts.sinks.update

///|
/// Updates a sink. This method replaces the values of the destination and filter fields of the existing sink with the corresponding values from the new sink.The updated sink might also have a new writer_identity; see the unique_writer_identity field.
pub async fn LoggingService::billing_accounts_sinks_update(
  self : LoggingService,
  sink_name : String,
  custom_writer_identity? : String? = None,
  unique_writer_identity? : Bool? = None,
  update_mask? : String? = None,
) -> LogSink raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match custom_writer_identity {
    Some(v) => qp.push(("customWriterIdentity", url_encode(v)))
    None => ()
  }
  match unique_writer_identity {
    Some(v) =>
      qp.push(("uniqueWriterIdentity", if v { "true" } else { "false" }))
    None => ()
  }
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + sink_name
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

///| logging.entries.copy

///|
/// Copies a set of log entries from a log bucket to a Cloud Storage bucket.
pub async fn LoggingService::entries_copy(
  self : LoggingService,
) -> Operation raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + "entries:copy"
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

///| logging.entries.list

///|
/// Lists log entries. Use this method to retrieve log entries that originated from a project/folder/organization/billing account. For ways to export log entries, see Routing overview (https://docs.cloud.google.com/logging/docs/routing/overview).
pub async fn LoggingService::entries_list(
  self : LoggingService,
) -> ListLogEntriesResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + "entries:list"
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

///| logging.entries.tail

///|
/// Streaming read of log entries as they are received. Until the stream is terminated, it will continue reading logs.
pub async fn LoggingService::entries_tail(
  self : LoggingService,
) -> TailLogEntriesResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + "entries:tail"
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

///| logging.entries.write

///|
/// Writes log entries to Logging. This API method is the only way to send log entries to Logging. This method is used, directly or indirectly, by the Logging agent (fluentd) and all logging libraries configured to use Logging. A single request may contain log entries for a maximum of 1000 different resource names (projects, organizations, billing accounts or folders), where the resource name for a log entry is determined from its logName field.
pub async fn LoggingService::entries_write(
  self : LoggingService,
) -> WriteLogEntriesResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + "entries:write"
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

///| logging.exclusions.create

///|
/// Creates a new exclusion in the _Default sink in a specified parent resource. Only log entries belonging to that resource can be excluded. You can have up to 10 exclusions in a resource.
pub async fn LoggingService::exclusions_create(
  self : LoggingService,
  parent : String,
) -> LogExclusion raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "exclusions"
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

///| logging.exclusions.delete

///|
/// Deletes an exclusion in the _Default sink.
pub async fn LoggingService::exclusions_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.exclusions.get

///|
/// Gets the description of an exclusion in the _Default sink.
pub async fn LoggingService::exclusions_get(
  self : LoggingService,
  name : String,
) -> LogExclusion raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.exclusions.list

///|
/// Lists all the exclusions on the _Default sink in a parent resource.
pub async fn LoggingService::exclusions_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListExclusionsResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "exclusions"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.exclusions.patch

///|
/// Changes one or more properties of an existing exclusion in the _Default sink.
pub async fn LoggingService::exclusions_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogExclusion raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.folders.getCmekSettings

///|
/// Gets the Logging CMEK settings for the given resource.Note: CMEK for the Log Router can be configured for Google Cloud projects, folders, organizations, and billing accounts. Once configured for an organization, it applies to all projects and folders in the Google Cloud organization.See Configure CMEK for Cloud Logging (https://docs.cloud.google.com/logging/docs/routing/managed-encryption) for more information.
pub async fn LoggingService::folders_get_cmek_settings(
  self : LoggingService,
  name : String,
) -> CmekSettings raise @http.HttpError {
  let path = "/" + "v2" + "/" + name + "/" + "cmekSettings"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.getSettings

///|
/// Gets the settings for the given resource.Note: Settings can be retrieved for Google Cloud projects, folders, organizations, and billing accounts.See View default resource settings for Logging (https://docs.cloud.google.com/logging/docs/default-settings#view-org-settings) for more information.
pub async fn LoggingService::folders_get_settings(
  self : LoggingService,
  name : String,
) -> Settings raise @http.HttpError {
  let path = "/" + "v2" + "/" + name + "/" + "settings"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.updateSettings

///|
/// Updates the settings for the given resource. This method applies to all feature configurations for organization and folders.UpdateSettings fails when any of the following are true: The value of storage_location either isn't supported by Logging or violates the location OrgPolicy. The default_sink_config field is set, but it has an unspecified filter write mode. The value of kms_key_name is invalid. The associated service account doesn't have the required roles/cloudkms.cryptoKeyEncrypterDecrypter role assigned for the key. Access to the key is disabled.See Configure default settings for organizations and folders (https://docs.cloud.google.com/logging/docs/default-settings) for more information.
pub async fn LoggingService::folders_update_settings(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> Settings raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + "settings"
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

///| logging.folders.exclusions.create

///|
/// Creates a new exclusion in the _Default sink in a specified parent resource. Only log entries belonging to that resource can be excluded. You can have up to 10 exclusions in a resource.
pub async fn LoggingService::folders_exclusions_create(
  self : LoggingService,
  parent : String,
) -> LogExclusion raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "exclusions"
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

///| logging.folders.exclusions.delete

///|
/// Deletes an exclusion in the _Default sink.
pub async fn LoggingService::folders_exclusions_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.folders.exclusions.get

///|
/// Gets the description of an exclusion in the _Default sink.
pub async fn LoggingService::folders_exclusions_get(
  self : LoggingService,
  name : String,
) -> LogExclusion raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.exclusions.list

///|
/// Lists all the exclusions on the _Default sink in a parent resource.
pub async fn LoggingService::folders_exclusions_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListExclusionsResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "exclusions"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.exclusions.patch

///|
/// Changes one or more properties of an existing exclusion in the _Default sink.
pub async fn LoggingService::folders_exclusions_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogExclusion raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.folders.locations.get

///|
/// Gets information about a location.
pub async fn LoggingService::folders_locations_get(
  self : LoggingService,
  name : String,
) -> Location raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.locations.list

///|
/// Lists information about the supported locations for this service.This method lists locations based on the resource scope provided in the ListLocationsRequest.name field: Global locations: If name is empty, the method lists the public locations available to all projects. Project-specific locations: If name follows the format projects/{project}, the method lists locations visible to that specific project. This includes public, private, or other project-specific locations enabled for the project.For gRPC and client library implementations, the resource name is passed as the name field. For direct service calls, the resource name is incorporated into the request path based on the specific service implementation and version.
pub async fn LoggingService::folders_locations_list(
  self : LoggingService,
  name : String,
  extra_location_types? : String? = None,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListLocationsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match extra_location_types {
    Some(v) => qp.push(("extraLocationTypes", url_encode(v)))
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
  let path = "/" + "v2" + "/" + name + "/" + "locations"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.locations.buckets.create

///|
/// Creates a log bucket that can be used to store log entries. After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::folders_locations_buckets_create(
  self : LoggingService,
  parent : String,
  bucket_id? : String? = None,
) -> LogBucket raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match bucket_id {
    Some(v) => qp.push(("bucketId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "buckets"
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

///| logging.folders.locations.buckets.createAsync

///|
/// Creates a log bucket asynchronously that can be used to store log entries.After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::folders_locations_buckets_create_async(
  self : LoggingService,
  parent : String,
  bucket_id? : String? = None,
) -> Operation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match bucket_id {
    Some(v) => qp.push(("bucketId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "buckets:createAsync"
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

///| logging.folders.locations.buckets.delete

///|
/// Deletes a log bucket.Changes the bucket's lifecycle_state to the DELETE_REQUESTED state. After 7 days, the bucket will be purged and all log entries in the bucket will be permanently deleted.
pub async fn LoggingService::folders_locations_buckets_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.folders.locations.buckets.get

///|
/// Gets a log bucket.
pub async fn LoggingService::folders_locations_buckets_get(
  self : LoggingService,
  name : String,
) -> LogBucket raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.locations.buckets.list

///|
/// Lists log buckets.
pub async fn LoggingService::folders_locations_buckets_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListBucketsResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "buckets"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.locations.buckets.patch

///|
/// Updates a log bucket.If the bucket has a lifecycle_state of DELETE_REQUESTED, then FAILED_PRECONDITION will be returned.After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::folders_locations_buckets_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogBucket raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.folders.locations.buckets.undelete

///|
/// Undeletes a log bucket. A bucket that has been deleted can be undeleted within the grace period of 7 days.
pub async fn LoggingService::folders_locations_buckets_undelete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":undelete"
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

///| logging.folders.locations.buckets.updateAsync

///|
/// Updates a log bucket asynchronously.If the bucket has a lifecycle_state of DELETE_REQUESTED, then FAILED_PRECONDITION will be returned.After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::folders_locations_buckets_update_async(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> Operation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":updateAsync"
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

///| logging.folders.locations.buckets.links.create

///|
/// Asynchronously creates a linked dataset in BigQuery which makes it possible to use BigQuery to read the logs stored in the log bucket. A log bucket may currently only contain one link.
pub async fn LoggingService::folders_locations_buckets_links_create(
  self : LoggingService,
  parent : String,
  link_id? : String? = None,
) -> Operation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match link_id {
    Some(v) => qp.push(("linkId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "links"
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

///| logging.folders.locations.buckets.links.delete

///|
/// Deletes a link. This will also delete the corresponding BigQuery linked dataset.
pub async fn LoggingService::folders_locations_buckets_links_delete(
  self : LoggingService,
  name : String,
) -> Operation raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.folders.locations.buckets.links.get

///|
/// Gets a link.
pub async fn LoggingService::folders_locations_buckets_links_get(
  self : LoggingService,
  name : String,
) -> Link raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.locations.buckets.links.list

///|
/// Lists links.
pub async fn LoggingService::folders_locations_buckets_links_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListLinksResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "links"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.locations.buckets.views.create

///|
/// Creates a view over log entries in a log bucket. A bucket may contain a maximum of 30 views.
pub async fn LoggingService::folders_locations_buckets_views_create(
  self : LoggingService,
  parent : String,
  view_id? : String? = None,
) -> LogView raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match view_id {
    Some(v) => qp.push(("viewId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "views"
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

///| logging.folders.locations.buckets.views.delete

///|
/// Deletes a view on a log bucket. If an UNAVAILABLE error is returned, this indicates that system is not in a state where it can delete the view. If this occurs, please try again in a few minutes.
pub async fn LoggingService::folders_locations_buckets_views_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.folders.locations.buckets.views.get

///|
/// Gets a view on a log bucket.
pub async fn LoggingService::folders_locations_buckets_views_get(
  self : LoggingService,
  name : String,
) -> LogView raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.locations.buckets.views.getIamPolicy

///|
/// Gets the access control policy for a resource. Returns an empty policy if the resource exists and does not have a policy set.
pub async fn LoggingService::folders_locations_buckets_views_get_iam_policy(
  self : LoggingService,
  resource : String,
) -> Policy raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + resource + "/" + ":getIamPolicy"
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

///| logging.folders.locations.buckets.views.list

///|
/// Lists views on a log bucket.
pub async fn LoggingService::folders_locations_buckets_views_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListViewsResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "views"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.locations.buckets.views.patch

///|
/// Updates a view on a log bucket. This method replaces the value of the filter field from the existing view with the corresponding value from the new view. If an UNAVAILABLE error is returned, this indicates that system is not in a state where it can update the view. If this occurs, please try again in a few minutes.
pub async fn LoggingService::folders_locations_buckets_views_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogView raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.folders.locations.buckets.views.setIamPolicy

///|
/// Sets the access control policy on the specified resource. Replaces any existing policy.Can return NOT_FOUND, INVALID_ARGUMENT, and PERMISSION_DENIED errors.
pub async fn LoggingService::folders_locations_buckets_views_set_iam_policy(
  self : LoggingService,
  resource : String,
) -> Policy raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + resource + "/" + ":setIamPolicy"
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

///| logging.folders.locations.buckets.views.testIamPermissions

///|
/// Returns permissions that a caller has on the specified resource. If the resource does not exist, this will return an empty set of permissions, not a NOT_FOUND error.Note: This operation is designed to be used for building permission-aware UIs and command-line tools, not for authorization checking. This operation may "fail open" without warning.
pub async fn LoggingService::folders_locations_buckets_views_test_iam_permissions(
  self : LoggingService,
  resource : String,
) -> TestIamPermissionsResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + resource + "/" + ":testIamPermissions"
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

///| logging.folders.locations.buckets.views.logs.list

///|
/// Lists the logs in projects, organizations, folders, or billing accounts. Only logs that have entries are listed.
pub async fn LoggingService::folders_locations_buckets_views_logs_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
  resource_names? : String? = None,
) -> ListLogsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match resource_names {
    Some(v) => qp.push(("resourceNames", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v2" + "/" + parent + "/" + "logs"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.locations.logScopes.create

///|
/// Creates a log scope.
pub async fn LoggingService::folders_locations_log_scopes_create(
  self : LoggingService,
  parent : String,
  log_scope_id? : String? = None,
) -> LogScope raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match log_scope_id {
    Some(v) => qp.push(("logScopeId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "logScopes"
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

///| logging.folders.locations.logScopes.delete

///|
/// Deletes a log scope.
pub async fn LoggingService::folders_locations_log_scopes_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.folders.locations.logScopes.get

///|
/// Gets a log scope.
pub async fn LoggingService::folders_locations_log_scopes_get(
  self : LoggingService,
  name : String,
) -> LogScope raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.locations.logScopes.list

///|
/// Lists log scopes.
pub async fn LoggingService::folders_locations_log_scopes_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListLogScopesResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "logScopes"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.locations.logScopes.patch

///|
/// Updates a log scope.
pub async fn LoggingService::folders_locations_log_scopes_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogScope raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.folders.locations.operations.cancel

///|
/// Starts asynchronous cancellation on a long-running operation. The server makes a best effort to cancel the operation, but success is not guaranteed. If the server doesn't support this method, it returns google.rpc.Code.UNIMPLEMENTED. Clients can use Operations.GetOperation or other methods to check whether the cancellation succeeded or whether the operation completed despite cancellation. On successful cancellation, the operation is not deleted; instead, it becomes an operation with an Operation.error value with a google.rpc.Status.code of 1, corresponding to Code.CANCELLED.
pub async fn LoggingService::folders_locations_operations_cancel(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":cancel"
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

///| logging.folders.locations.operations.get

///|
/// Gets the latest state of a long-running operation. Clients can use this method to poll the operation result at intervals as recommended by the API service.
pub async fn LoggingService::folders_locations_operations_get(
  self : LoggingService,
  name : String,
) -> Operation raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.locations.operations.list

///|
/// Lists operations that match the specified filter in the request. If the server doesn't support this method, it returns UNIMPLEMENTED.
pub async fn LoggingService::folders_locations_operations_list(
  self : LoggingService,
  name : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  return_partial_success? : Bool? = None,
) -> ListOperationsResponse raise @http.HttpError {
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
  match return_partial_success {
    Some(v) =>
      qp.push(("returnPartialSuccess", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v2" + "/" + name + "/" + "operations"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.locations.recentQueries.list

///|
/// Lists the RecentQueries that were created by the user making the request.
pub async fn LoggingService::folders_locations_recent_queries_list(
  self : LoggingService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListRecentQueriesResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "recentQueries"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.locations.savedQueries.create

///|
/// Creates a new SavedQuery for the user making the request.
pub async fn LoggingService::folders_locations_saved_queries_create(
  self : LoggingService,
  parent : String,
  saved_query_id? : String? = None,
) -> SavedQuery raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match saved_query_id {
    Some(v) => qp.push(("savedQueryId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "savedQueries"
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

///| logging.folders.locations.savedQueries.delete

///|
/// Deletes an existing SavedQuery that was created by the user making the request.
pub async fn LoggingService::folders_locations_saved_queries_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.folders.locations.savedQueries.get

///|
/// Returns all data associated with the requested query.
pub async fn LoggingService::folders_locations_saved_queries_get(
  self : LoggingService,
  name : String,
) -> SavedQuery raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.locations.savedQueries.list

///|
/// Lists the SavedQueries that were created by the user making the request.
pub async fn LoggingService::folders_locations_saved_queries_list(
  self : LoggingService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListSavedQueriesResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "savedQueries"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.locations.savedQueries.patch

///|
/// Updates an existing SavedQuery.
pub async fn LoggingService::folders_locations_saved_queries_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> SavedQuery raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.folders.logs.delete

///|
/// Deletes all the log entries in a log for the global _Default Log Bucket. The log reappears if it receives new entries. Log entries written shortly before the delete operation might not be deleted. Entries received after the delete operation with a timestamp before the operation will be deleted.
pub async fn LoggingService::folders_logs_delete(
  self : LoggingService,
  log_name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + log_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.folders.logs.list

///|
/// Lists the logs in projects, organizations, folders, or billing accounts. Only logs that have entries are listed.
pub async fn LoggingService::folders_logs_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
  resource_names? : String? = None,
) -> ListLogsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match resource_names {
    Some(v) => qp.push(("resourceNames", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v2" + "/" + parent + "/" + "logs"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.sinks.create

///|
/// Creates a sink that exports specified log entries to a destination. The export begins upon ingress, unless the sink's writer_identity is not permitted to write to the destination. A sink can export log entries only from the resource owning the sink.
pub async fn LoggingService::folders_sinks_create(
  self : LoggingService,
  parent : String,
  custom_writer_identity? : String? = None,
  unique_writer_identity? : Bool? = None,
) -> LogSink raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match custom_writer_identity {
    Some(v) => qp.push(("customWriterIdentity", url_encode(v)))
    None => ()
  }
  match unique_writer_identity {
    Some(v) =>
      qp.push(("uniqueWriterIdentity", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "sinks"
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

///| logging.folders.sinks.delete

///|
/// Deletes a sink. If the sink has a unique writer_identity, then that service account is also deleted.
pub async fn LoggingService::folders_sinks_delete(
  self : LoggingService,
  sink_name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + sink_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.folders.sinks.get

///|
/// Gets a sink.
pub async fn LoggingService::folders_sinks_get(
  self : LoggingService,
  sink_name : String,
) -> LogSink raise @http.HttpError {
  let path = "/" + "v2" + "/" + sink_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.sinks.list

///|
/// Lists sinks.
pub async fn LoggingService::folders_sinks_list(
  self : LoggingService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListSinksResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "sinks"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.folders.sinks.patch

///|
/// Updates a sink. This method replaces the values of the destination and filter fields of the existing sink with the corresponding values from the new sink.The updated sink might also have a new writer_identity; see the unique_writer_identity field.
pub async fn LoggingService::folders_sinks_patch(
  self : LoggingService,
  sink_name : String,
  custom_writer_identity? : String? = None,
  unique_writer_identity? : Bool? = None,
  update_mask? : String? = None,
) -> LogSink raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match custom_writer_identity {
    Some(v) => qp.push(("customWriterIdentity", url_encode(v)))
    None => ()
  }
  match unique_writer_identity {
    Some(v) =>
      qp.push(("uniqueWriterIdentity", if v { "true" } else { "false" }))
    None => ()
  }
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + sink_name
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

///| logging.folders.sinks.update

///|
/// Updates a sink. This method replaces the values of the destination and filter fields of the existing sink with the corresponding values from the new sink.The updated sink might also have a new writer_identity; see the unique_writer_identity field.
pub async fn LoggingService::folders_sinks_update(
  self : LoggingService,
  sink_name : String,
  custom_writer_identity? : String? = None,
  unique_writer_identity? : Bool? = None,
  update_mask? : String? = None,
) -> LogSink raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match custom_writer_identity {
    Some(v) => qp.push(("customWriterIdentity", url_encode(v)))
    None => ()
  }
  match unique_writer_identity {
    Some(v) =>
      qp.push(("uniqueWriterIdentity", if v { "true" } else { "false" }))
    None => ()
  }
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + sink_name
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

///| logging.locations.get

///|
/// Gets information about a location.
pub async fn LoggingService::locations_get(
  self : LoggingService,
  name : String,
) -> Location raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.locations.list

///|
/// Lists information about the supported locations for this service.This method lists locations based on the resource scope provided in the ListLocationsRequest.name field: Global locations: If name is empty, the method lists the public locations available to all projects. Project-specific locations: If name follows the format projects/{project}, the method lists locations visible to that specific project. This includes public, private, or other project-specific locations enabled for the project.For gRPC and client library implementations, the resource name is passed as the name field. For direct service calls, the resource name is incorporated into the request path based on the specific service implementation and version.
pub async fn LoggingService::locations_list(
  self : LoggingService,
  name : String,
  extra_location_types? : String? = None,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListLocationsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match extra_location_types {
    Some(v) => qp.push(("extraLocationTypes", url_encode(v)))
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
  let path = "/" + "v2" + "/" + name + "/" + "locations"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.locations.buckets.create

///|
/// Creates a log bucket that can be used to store log entries. After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::locations_buckets_create(
  self : LoggingService,
  parent : String,
  bucket_id? : String? = None,
) -> LogBucket raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match bucket_id {
    Some(v) => qp.push(("bucketId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "buckets"
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

///| logging.locations.buckets.createAsync

///|
/// Creates a log bucket asynchronously that can be used to store log entries.After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::locations_buckets_create_async(
  self : LoggingService,
  parent : String,
  bucket_id? : String? = None,
) -> Operation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match bucket_id {
    Some(v) => qp.push(("bucketId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "buckets:createAsync"
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

///| logging.locations.buckets.delete

///|
/// Deletes a log bucket.Changes the bucket's lifecycle_state to the DELETE_REQUESTED state. After 7 days, the bucket will be purged and all log entries in the bucket will be permanently deleted.
pub async fn LoggingService::locations_buckets_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.locations.buckets.get

///|
/// Gets a log bucket.
pub async fn LoggingService::locations_buckets_get(
  self : LoggingService,
  name : String,
) -> LogBucket raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.locations.buckets.list

///|
/// Lists log buckets.
pub async fn LoggingService::locations_buckets_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListBucketsResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "buckets"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.locations.buckets.patch

///|
/// Updates a log bucket.If the bucket has a lifecycle_state of DELETE_REQUESTED, then FAILED_PRECONDITION will be returned.After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::locations_buckets_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogBucket raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.locations.buckets.undelete

///|
/// Undeletes a log bucket. A bucket that has been deleted can be undeleted within the grace period of 7 days.
pub async fn LoggingService::locations_buckets_undelete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":undelete"
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

///| logging.locations.buckets.updateAsync

///|
/// Updates a log bucket asynchronously.If the bucket has a lifecycle_state of DELETE_REQUESTED, then FAILED_PRECONDITION will be returned.After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::locations_buckets_update_async(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> Operation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":updateAsync"
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

///| logging.locations.buckets.links.create

///|
/// Asynchronously creates a linked dataset in BigQuery which makes it possible to use BigQuery to read the logs stored in the log bucket. A log bucket may currently only contain one link.
pub async fn LoggingService::locations_buckets_links_create(
  self : LoggingService,
  parent : String,
  link_id? : String? = None,
) -> Operation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match link_id {
    Some(v) => qp.push(("linkId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "links"
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

///| logging.locations.buckets.links.delete

///|
/// Deletes a link. This will also delete the corresponding BigQuery linked dataset.
pub async fn LoggingService::locations_buckets_links_delete(
  self : LoggingService,
  name : String,
) -> Operation raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.locations.buckets.links.get

///|
/// Gets a link.
pub async fn LoggingService::locations_buckets_links_get(
  self : LoggingService,
  name : String,
) -> Link raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.locations.buckets.links.list

///|
/// Lists links.
pub async fn LoggingService::locations_buckets_links_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListLinksResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "links"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.locations.buckets.views.create

///|
/// Creates a view over log entries in a log bucket. A bucket may contain a maximum of 30 views.
pub async fn LoggingService::locations_buckets_views_create(
  self : LoggingService,
  parent : String,
  view_id? : String? = None,
) -> LogView raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match view_id {
    Some(v) => qp.push(("viewId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "views"
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

///| logging.locations.buckets.views.delete

///|
/// Deletes a view on a log bucket. If an UNAVAILABLE error is returned, this indicates that system is not in a state where it can delete the view. If this occurs, please try again in a few minutes.
pub async fn LoggingService::locations_buckets_views_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.locations.buckets.views.get

///|
/// Gets a view on a log bucket.
pub async fn LoggingService::locations_buckets_views_get(
  self : LoggingService,
  name : String,
) -> LogView raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.locations.buckets.views.getIamPolicy

///|
/// Gets the access control policy for a resource. Returns an empty policy if the resource exists and does not have a policy set.
pub async fn LoggingService::locations_buckets_views_get_iam_policy(
  self : LoggingService,
  resource : String,
) -> Policy raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + resource + "/" + ":getIamPolicy"
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

///| logging.locations.buckets.views.list

///|
/// Lists views on a log bucket.
pub async fn LoggingService::locations_buckets_views_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListViewsResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "views"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.locations.buckets.views.patch

///|
/// Updates a view on a log bucket. This method replaces the value of the filter field from the existing view with the corresponding value from the new view. If an UNAVAILABLE error is returned, this indicates that system is not in a state where it can update the view. If this occurs, please try again in a few minutes.
pub async fn LoggingService::locations_buckets_views_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogView raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.locations.buckets.views.setIamPolicy

///|
/// Sets the access control policy on the specified resource. Replaces any existing policy.Can return NOT_FOUND, INVALID_ARGUMENT, and PERMISSION_DENIED errors.
pub async fn LoggingService::locations_buckets_views_set_iam_policy(
  self : LoggingService,
  resource : String,
) -> Policy raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + resource + "/" + ":setIamPolicy"
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

///| logging.locations.buckets.views.testIamPermissions

///|
/// Returns permissions that a caller has on the specified resource. If the resource does not exist, this will return an empty set of permissions, not a NOT_FOUND error.Note: This operation is designed to be used for building permission-aware UIs and command-line tools, not for authorization checking. This operation may "fail open" without warning.
pub async fn LoggingService::locations_buckets_views_test_iam_permissions(
  self : LoggingService,
  resource : String,
) -> TestIamPermissionsResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + resource + "/" + ":testIamPermissions"
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

///| logging.locations.operations.cancel

///|
/// Starts asynchronous cancellation on a long-running operation. The server makes a best effort to cancel the operation, but success is not guaranteed. If the server doesn't support this method, it returns google.rpc.Code.UNIMPLEMENTED. Clients can use Operations.GetOperation or other methods to check whether the cancellation succeeded or whether the operation completed despite cancellation. On successful cancellation, the operation is not deleted; instead, it becomes an operation with an Operation.error value with a google.rpc.Status.code of 1, corresponding to Code.CANCELLED.
pub async fn LoggingService::locations_operations_cancel(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":cancel"
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

///| logging.locations.operations.get

///|
/// Gets the latest state of a long-running operation. Clients can use this method to poll the operation result at intervals as recommended by the API service.
pub async fn LoggingService::locations_operations_get(
  self : LoggingService,
  name : String,
) -> Operation raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.locations.operations.list

///|
/// Lists operations that match the specified filter in the request. If the server doesn't support this method, it returns UNIMPLEMENTED.
pub async fn LoggingService::locations_operations_list(
  self : LoggingService,
  name : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  return_partial_success? : Bool? = None,
) -> ListOperationsResponse raise @http.HttpError {
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
  match return_partial_success {
    Some(v) =>
      qp.push(("returnPartialSuccess", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v2" + "/" + name + "/" + "operations"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.logs.delete

///|
/// Deletes all the log entries in a log for the global _Default Log Bucket. The log reappears if it receives new entries. Log entries written shortly before the delete operation might not be deleted. Entries received after the delete operation with a timestamp before the operation will be deleted.
pub async fn LoggingService::logs_delete(
  self : LoggingService,
  log_name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + log_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.logs.list

///|
/// Lists the logs in projects, organizations, folders, or billing accounts. Only logs that have entries are listed.
pub async fn LoggingService::logs_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
  resource_names? : String? = None,
) -> ListLogsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match resource_names {
    Some(v) => qp.push(("resourceNames", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v2" + "/" + parent + "/" + "logs"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.monitoredResourceDescriptors.list

///|
/// Lists the descriptors for monitored resource types used by Logging.
pub async fn LoggingService::monitored_resource_descriptors_list(
  self : LoggingService,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListMonitoredResourceDescriptorsResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + "monitoredResourceDescriptors"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.getCmekSettings

///|
/// Gets the Logging CMEK settings for the given resource.Note: CMEK for the Log Router can be configured for Google Cloud projects, folders, organizations, and billing accounts. Once configured for an organization, it applies to all projects and folders in the Google Cloud organization.See Configure CMEK for Cloud Logging (https://docs.cloud.google.com/logging/docs/routing/managed-encryption) for more information.
pub async fn LoggingService::organizations_get_cmek_settings(
  self : LoggingService,
  name : String,
) -> CmekSettings raise @http.HttpError {
  let path = "/" + "v2" + "/" + name + "/" + "cmekSettings"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.getSettings

///|
/// Gets the settings for the given resource.Note: Settings can be retrieved for Google Cloud projects, folders, organizations, and billing accounts.See View default resource settings for Logging (https://docs.cloud.google.com/logging/docs/default-settings#view-org-settings) for more information.
pub async fn LoggingService::organizations_get_settings(
  self : LoggingService,
  name : String,
) -> Settings raise @http.HttpError {
  let path = "/" + "v2" + "/" + name + "/" + "settings"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.updateCmekSettings

///|
/// Updates the Log Router CMEK settings for the given resource.Note: CMEK for the Log Router can currently only be configured for Google Cloud organizations. Once configured, it applies to all projects and folders in the Google Cloud organization.UpdateCmekSettings fails when any of the following are true: The value of kms_key_name is invalid. The associated service account doesn't have the required roles/cloudkms.cryptoKeyEncrypterDecrypter role assigned for the key. Access to the key is disabled.See Configure CMEK for Cloud Logging (https://docs.cloud.google.com/logging/docs/routing/managed-encryption) for more information.
pub async fn LoggingService::organizations_update_cmek_settings(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> CmekSettings raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + "cmekSettings"
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

///| logging.organizations.updateSettings

///|
/// Updates the settings for the given resource. This method applies to all feature configurations for organization and folders.UpdateSettings fails when any of the following are true: The value of storage_location either isn't supported by Logging or violates the location OrgPolicy. The default_sink_config field is set, but it has an unspecified filter write mode. The value of kms_key_name is invalid. The associated service account doesn't have the required roles/cloudkms.cryptoKeyEncrypterDecrypter role assigned for the key. Access to the key is disabled.See Configure default settings for organizations and folders (https://docs.cloud.google.com/logging/docs/default-settings) for more information.
pub async fn LoggingService::organizations_update_settings(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> Settings raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + "settings"
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

///| logging.organizations.exclusions.create

///|
/// Creates a new exclusion in the _Default sink in a specified parent resource. Only log entries belonging to that resource can be excluded. You can have up to 10 exclusions in a resource.
pub async fn LoggingService::organizations_exclusions_create(
  self : LoggingService,
  parent : String,
) -> LogExclusion raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "exclusions"
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

///| logging.organizations.exclusions.delete

///|
/// Deletes an exclusion in the _Default sink.
pub async fn LoggingService::organizations_exclusions_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.organizations.exclusions.get

///|
/// Gets the description of an exclusion in the _Default sink.
pub async fn LoggingService::organizations_exclusions_get(
  self : LoggingService,
  name : String,
) -> LogExclusion raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.exclusions.list

///|
/// Lists all the exclusions on the _Default sink in a parent resource.
pub async fn LoggingService::organizations_exclusions_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListExclusionsResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "exclusions"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.exclusions.patch

///|
/// Changes one or more properties of an existing exclusion in the _Default sink.
pub async fn LoggingService::organizations_exclusions_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogExclusion raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.organizations.locations.get

///|
/// Gets information about a location.
pub async fn LoggingService::organizations_locations_get(
  self : LoggingService,
  name : String,
) -> Location raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.locations.list

///|
/// Lists information about the supported locations for this service.This method lists locations based on the resource scope provided in the ListLocationsRequest.name field: Global locations: If name is empty, the method lists the public locations available to all projects. Project-specific locations: If name follows the format projects/{project}, the method lists locations visible to that specific project. This includes public, private, or other project-specific locations enabled for the project.For gRPC and client library implementations, the resource name is passed as the name field. For direct service calls, the resource name is incorporated into the request path based on the specific service implementation and version.
pub async fn LoggingService::organizations_locations_list(
  self : LoggingService,
  name : String,
  extra_location_types? : String? = None,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListLocationsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match extra_location_types {
    Some(v) => qp.push(("extraLocationTypes", url_encode(v)))
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
  let path = "/" + "v2" + "/" + name + "/" + "locations"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.locations.buckets.create

///|
/// Creates a log bucket that can be used to store log entries. After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::organizations_locations_buckets_create(
  self : LoggingService,
  parent : String,
  bucket_id? : String? = None,
) -> LogBucket raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match bucket_id {
    Some(v) => qp.push(("bucketId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "buckets"
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

///| logging.organizations.locations.buckets.createAsync

///|
/// Creates a log bucket asynchronously that can be used to store log entries.After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::organizations_locations_buckets_create_async(
  self : LoggingService,
  parent : String,
  bucket_id? : String? = None,
) -> Operation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match bucket_id {
    Some(v) => qp.push(("bucketId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "buckets:createAsync"
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

///| logging.organizations.locations.buckets.delete

///|
/// Deletes a log bucket.Changes the bucket's lifecycle_state to the DELETE_REQUESTED state. After 7 days, the bucket will be purged and all log entries in the bucket will be permanently deleted.
pub async fn LoggingService::organizations_locations_buckets_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.organizations.locations.buckets.get

///|
/// Gets a log bucket.
pub async fn LoggingService::organizations_locations_buckets_get(
  self : LoggingService,
  name : String,
) -> LogBucket raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.locations.buckets.list

///|
/// Lists log buckets.
pub async fn LoggingService::organizations_locations_buckets_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListBucketsResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "buckets"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.locations.buckets.patch

///|
/// Updates a log bucket.If the bucket has a lifecycle_state of DELETE_REQUESTED, then FAILED_PRECONDITION will be returned.After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::organizations_locations_buckets_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogBucket raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.organizations.locations.buckets.undelete

///|
/// Undeletes a log bucket. A bucket that has been deleted can be undeleted within the grace period of 7 days.
pub async fn LoggingService::organizations_locations_buckets_undelete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":undelete"
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

///| logging.organizations.locations.buckets.updateAsync

///|
/// Updates a log bucket asynchronously.If the bucket has a lifecycle_state of DELETE_REQUESTED, then FAILED_PRECONDITION will be returned.After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::organizations_locations_buckets_update_async(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> Operation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":updateAsync"
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

///| logging.organizations.locations.buckets.links.create

///|
/// Asynchronously creates a linked dataset in BigQuery which makes it possible to use BigQuery to read the logs stored in the log bucket. A log bucket may currently only contain one link.
pub async fn LoggingService::organizations_locations_buckets_links_create(
  self : LoggingService,
  parent : String,
  link_id? : String? = None,
) -> Operation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match link_id {
    Some(v) => qp.push(("linkId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "links"
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

///| logging.organizations.locations.buckets.links.delete

///|
/// Deletes a link. This will also delete the corresponding BigQuery linked dataset.
pub async fn LoggingService::organizations_locations_buckets_links_delete(
  self : LoggingService,
  name : String,
) -> Operation raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.organizations.locations.buckets.links.get

///|
/// Gets a link.
pub async fn LoggingService::organizations_locations_buckets_links_get(
  self : LoggingService,
  name : String,
) -> Link raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.locations.buckets.links.list

///|
/// Lists links.
pub async fn LoggingService::organizations_locations_buckets_links_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListLinksResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "links"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.locations.buckets.views.create

///|
/// Creates a view over log entries in a log bucket. A bucket may contain a maximum of 30 views.
pub async fn LoggingService::organizations_locations_buckets_views_create(
  self : LoggingService,
  parent : String,
  view_id? : String? = None,
) -> LogView raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match view_id {
    Some(v) => qp.push(("viewId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "views"
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

///| logging.organizations.locations.buckets.views.delete

///|
/// Deletes a view on a log bucket. If an UNAVAILABLE error is returned, this indicates that system is not in a state where it can delete the view. If this occurs, please try again in a few minutes.
pub async fn LoggingService::organizations_locations_buckets_views_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.organizations.locations.buckets.views.get

///|
/// Gets a view on a log bucket.
pub async fn LoggingService::organizations_locations_buckets_views_get(
  self : LoggingService,
  name : String,
) -> LogView raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.locations.buckets.views.getIamPolicy

///|
/// Gets the access control policy for a resource. Returns an empty policy if the resource exists and does not have a policy set.
pub async fn LoggingService::organizations_locations_buckets_views_get_iam_policy(
  self : LoggingService,
  resource : String,
) -> Policy raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + resource + "/" + ":getIamPolicy"
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

///| logging.organizations.locations.buckets.views.list

///|
/// Lists views on a log bucket.
pub async fn LoggingService::organizations_locations_buckets_views_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListViewsResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "views"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.locations.buckets.views.patch

///|
/// Updates a view on a log bucket. This method replaces the value of the filter field from the existing view with the corresponding value from the new view. If an UNAVAILABLE error is returned, this indicates that system is not in a state where it can update the view. If this occurs, please try again in a few minutes.
pub async fn LoggingService::organizations_locations_buckets_views_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogView raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.organizations.locations.buckets.views.setIamPolicy

///|
/// Sets the access control policy on the specified resource. Replaces any existing policy.Can return NOT_FOUND, INVALID_ARGUMENT, and PERMISSION_DENIED errors.
pub async fn LoggingService::organizations_locations_buckets_views_set_iam_policy(
  self : LoggingService,
  resource : String,
) -> Policy raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + resource + "/" + ":setIamPolicy"
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

///| logging.organizations.locations.buckets.views.testIamPermissions

///|
/// Returns permissions that a caller has on the specified resource. If the resource does not exist, this will return an empty set of permissions, not a NOT_FOUND error.Note: This operation is designed to be used for building permission-aware UIs and command-line tools, not for authorization checking. This operation may "fail open" without warning.
pub async fn LoggingService::organizations_locations_buckets_views_test_iam_permissions(
  self : LoggingService,
  resource : String,
) -> TestIamPermissionsResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + resource + "/" + ":testIamPermissions"
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

///| logging.organizations.locations.buckets.views.logs.list

///|
/// Lists the logs in projects, organizations, folders, or billing accounts. Only logs that have entries are listed.
pub async fn LoggingService::organizations_locations_buckets_views_logs_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
  resource_names? : String? = None,
) -> ListLogsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match resource_names {
    Some(v) => qp.push(("resourceNames", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v2" + "/" + parent + "/" + "logs"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.locations.logScopes.create

///|
/// Creates a log scope.
pub async fn LoggingService::organizations_locations_log_scopes_create(
  self : LoggingService,
  parent : String,
  log_scope_id? : String? = None,
) -> LogScope raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match log_scope_id {
    Some(v) => qp.push(("logScopeId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "logScopes"
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

///| logging.organizations.locations.logScopes.delete

///|
/// Deletes a log scope.
pub async fn LoggingService::organizations_locations_log_scopes_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.organizations.locations.logScopes.get

///|
/// Gets a log scope.
pub async fn LoggingService::organizations_locations_log_scopes_get(
  self : LoggingService,
  name : String,
) -> LogScope raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.locations.logScopes.list

///|
/// Lists log scopes.
pub async fn LoggingService::organizations_locations_log_scopes_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListLogScopesResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "logScopes"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.locations.logScopes.patch

///|
/// Updates a log scope.
pub async fn LoggingService::organizations_locations_log_scopes_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogScope raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.organizations.locations.operations.cancel

///|
/// Starts asynchronous cancellation on a long-running operation. The server makes a best effort to cancel the operation, but success is not guaranteed. If the server doesn't support this method, it returns google.rpc.Code.UNIMPLEMENTED. Clients can use Operations.GetOperation or other methods to check whether the cancellation succeeded or whether the operation completed despite cancellation. On successful cancellation, the operation is not deleted; instead, it becomes an operation with an Operation.error value with a google.rpc.Status.code of 1, corresponding to Code.CANCELLED.
pub async fn LoggingService::organizations_locations_operations_cancel(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":cancel"
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

///| logging.organizations.locations.operations.get

///|
/// Gets the latest state of a long-running operation. Clients can use this method to poll the operation result at intervals as recommended by the API service.
pub async fn LoggingService::organizations_locations_operations_get(
  self : LoggingService,
  name : String,
) -> Operation raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.locations.operations.list

///|
/// Lists operations that match the specified filter in the request. If the server doesn't support this method, it returns UNIMPLEMENTED.
pub async fn LoggingService::organizations_locations_operations_list(
  self : LoggingService,
  name : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  return_partial_success? : Bool? = None,
) -> ListOperationsResponse raise @http.HttpError {
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
  match return_partial_success {
    Some(v) =>
      qp.push(("returnPartialSuccess", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v2" + "/" + name + "/" + "operations"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.locations.recentQueries.list

///|
/// Lists the RecentQueries that were created by the user making the request.
pub async fn LoggingService::organizations_locations_recent_queries_list(
  self : LoggingService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListRecentQueriesResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "recentQueries"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.locations.savedQueries.create

///|
/// Creates a new SavedQuery for the user making the request.
pub async fn LoggingService::organizations_locations_saved_queries_create(
  self : LoggingService,
  parent : String,
  saved_query_id? : String? = None,
) -> SavedQuery raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match saved_query_id {
    Some(v) => qp.push(("savedQueryId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "savedQueries"
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

///| logging.organizations.locations.savedQueries.delete

///|
/// Deletes an existing SavedQuery that was created by the user making the request.
pub async fn LoggingService::organizations_locations_saved_queries_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.organizations.locations.savedQueries.get

///|
/// Returns all data associated with the requested query.
pub async fn LoggingService::organizations_locations_saved_queries_get(
  self : LoggingService,
  name : String,
) -> SavedQuery raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.locations.savedQueries.list

///|
/// Lists the SavedQueries that were created by the user making the request.
pub async fn LoggingService::organizations_locations_saved_queries_list(
  self : LoggingService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListSavedQueriesResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "savedQueries"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.locations.savedQueries.patch

///|
/// Updates an existing SavedQuery.
pub async fn LoggingService::organizations_locations_saved_queries_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> SavedQuery raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.organizations.logs.delete

///|
/// Deletes all the log entries in a log for the global _Default Log Bucket. The log reappears if it receives new entries. Log entries written shortly before the delete operation might not be deleted. Entries received after the delete operation with a timestamp before the operation will be deleted.
pub async fn LoggingService::organizations_logs_delete(
  self : LoggingService,
  log_name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + log_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.organizations.logs.list

///|
/// Lists the logs in projects, organizations, folders, or billing accounts. Only logs that have entries are listed.
pub async fn LoggingService::organizations_logs_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
  resource_names? : String? = None,
) -> ListLogsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match resource_names {
    Some(v) => qp.push(("resourceNames", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v2" + "/" + parent + "/" + "logs"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.sinks.create

///|
/// Creates a sink that exports specified log entries to a destination. The export begins upon ingress, unless the sink's writer_identity is not permitted to write to the destination. A sink can export log entries only from the resource owning the sink.
pub async fn LoggingService::organizations_sinks_create(
  self : LoggingService,
  parent : String,
  custom_writer_identity? : String? = None,
  unique_writer_identity? : Bool? = None,
) -> LogSink raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match custom_writer_identity {
    Some(v) => qp.push(("customWriterIdentity", url_encode(v)))
    None => ()
  }
  match unique_writer_identity {
    Some(v) =>
      qp.push(("uniqueWriterIdentity", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "sinks"
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

///| logging.organizations.sinks.delete

///|
/// Deletes a sink. If the sink has a unique writer_identity, then that service account is also deleted.
pub async fn LoggingService::organizations_sinks_delete(
  self : LoggingService,
  sink_name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + sink_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.organizations.sinks.get

///|
/// Gets a sink.
pub async fn LoggingService::organizations_sinks_get(
  self : LoggingService,
  sink_name : String,
) -> LogSink raise @http.HttpError {
  let path = "/" + "v2" + "/" + sink_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.sinks.list

///|
/// Lists sinks.
pub async fn LoggingService::organizations_sinks_list(
  self : LoggingService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListSinksResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "sinks"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.organizations.sinks.patch

///|
/// Updates a sink. This method replaces the values of the destination and filter fields of the existing sink with the corresponding values from the new sink.The updated sink might also have a new writer_identity; see the unique_writer_identity field.
pub async fn LoggingService::organizations_sinks_patch(
  self : LoggingService,
  sink_name : String,
  custom_writer_identity? : String? = None,
  unique_writer_identity? : Bool? = None,
  update_mask? : String? = None,
) -> LogSink raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match custom_writer_identity {
    Some(v) => qp.push(("customWriterIdentity", url_encode(v)))
    None => ()
  }
  match unique_writer_identity {
    Some(v) =>
      qp.push(("uniqueWriterIdentity", if v { "true" } else { "false" }))
    None => ()
  }
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + sink_name
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

///| logging.organizations.sinks.update

///|
/// Updates a sink. This method replaces the values of the destination and filter fields of the existing sink with the corresponding values from the new sink.The updated sink might also have a new writer_identity; see the unique_writer_identity field.
pub async fn LoggingService::organizations_sinks_update(
  self : LoggingService,
  sink_name : String,
  custom_writer_identity? : String? = None,
  unique_writer_identity? : Bool? = None,
  update_mask? : String? = None,
) -> LogSink raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match custom_writer_identity {
    Some(v) => qp.push(("customWriterIdentity", url_encode(v)))
    None => ()
  }
  match unique_writer_identity {
    Some(v) =>
      qp.push(("uniqueWriterIdentity", if v { "true" } else { "false" }))
    None => ()
  }
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + sink_name
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

///| logging.projects.getCmekSettings

///|
/// Gets the Logging CMEK settings for the given resource.Note: CMEK for the Log Router can be configured for Google Cloud projects, folders, organizations, and billing accounts. Once configured for an organization, it applies to all projects and folders in the Google Cloud organization.See Configure CMEK for Cloud Logging (https://docs.cloud.google.com/logging/docs/routing/managed-encryption) for more information.
pub async fn LoggingService::projects_get_cmek_settings(
  self : LoggingService,
  name : String,
) -> CmekSettings raise @http.HttpError {
  let path = "/" + "v2" + "/" + name + "/" + "cmekSettings"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.getSettings

///|
/// Gets the settings for the given resource.Note: Settings can be retrieved for Google Cloud projects, folders, organizations, and billing accounts.See View default resource settings for Logging (https://docs.cloud.google.com/logging/docs/default-settings#view-org-settings) for more information.
pub async fn LoggingService::projects_get_settings(
  self : LoggingService,
  name : String,
) -> Settings raise @http.HttpError {
  let path = "/" + "v2" + "/" + name + "/" + "settings"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.exclusions.create

///|
/// Creates a new exclusion in the _Default sink in a specified parent resource. Only log entries belonging to that resource can be excluded. You can have up to 10 exclusions in a resource.
pub async fn LoggingService::projects_exclusions_create(
  self : LoggingService,
  parent : String,
) -> LogExclusion raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "exclusions"
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

///| logging.projects.exclusions.delete

///|
/// Deletes an exclusion in the _Default sink.
pub async fn LoggingService::projects_exclusions_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.projects.exclusions.get

///|
/// Gets the description of an exclusion in the _Default sink.
pub async fn LoggingService::projects_exclusions_get(
  self : LoggingService,
  name : String,
) -> LogExclusion raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.exclusions.list

///|
/// Lists all the exclusions on the _Default sink in a parent resource.
pub async fn LoggingService::projects_exclusions_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListExclusionsResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "exclusions"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.exclusions.patch

///|
/// Changes one or more properties of an existing exclusion in the _Default sink.
pub async fn LoggingService::projects_exclusions_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogExclusion raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.projects.locations.get

///|
/// Gets information about a location.
pub async fn LoggingService::projects_locations_get(
  self : LoggingService,
  name : String,
) -> Location raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.locations.list

///|
/// Lists information about the supported locations for this service.This method lists locations based on the resource scope provided in the ListLocationsRequest.name field: Global locations: If name is empty, the method lists the public locations available to all projects. Project-specific locations: If name follows the format projects/{project}, the method lists locations visible to that specific project. This includes public, private, or other project-specific locations enabled for the project.For gRPC and client library implementations, the resource name is passed as the name field. For direct service calls, the resource name is incorporated into the request path based on the specific service implementation and version.
pub async fn LoggingService::projects_locations_list(
  self : LoggingService,
  name : String,
  extra_location_types? : String? = None,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListLocationsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match extra_location_types {
    Some(v) => qp.push(("extraLocationTypes", url_encode(v)))
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
  let path = "/" + "v2" + "/" + name + "/" + "locations"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.locations.buckets.create

///|
/// Creates a log bucket that can be used to store log entries. After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::projects_locations_buckets_create(
  self : LoggingService,
  parent : String,
  bucket_id? : String? = None,
) -> LogBucket raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match bucket_id {
    Some(v) => qp.push(("bucketId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "buckets"
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

///| logging.projects.locations.buckets.createAsync

///|
/// Creates a log bucket asynchronously that can be used to store log entries.After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::projects_locations_buckets_create_async(
  self : LoggingService,
  parent : String,
  bucket_id? : String? = None,
) -> Operation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match bucket_id {
    Some(v) => qp.push(("bucketId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "buckets:createAsync"
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

///| logging.projects.locations.buckets.delete

///|
/// Deletes a log bucket.Changes the bucket's lifecycle_state to the DELETE_REQUESTED state. After 7 days, the bucket will be purged and all log entries in the bucket will be permanently deleted.
pub async fn LoggingService::projects_locations_buckets_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.projects.locations.buckets.get

///|
/// Gets a log bucket.
pub async fn LoggingService::projects_locations_buckets_get(
  self : LoggingService,
  name : String,
) -> LogBucket raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.locations.buckets.list

///|
/// Lists log buckets.
pub async fn LoggingService::projects_locations_buckets_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListBucketsResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "buckets"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.locations.buckets.patch

///|
/// Updates a log bucket.If the bucket has a lifecycle_state of DELETE_REQUESTED, then FAILED_PRECONDITION will be returned.After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::projects_locations_buckets_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogBucket raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.projects.locations.buckets.undelete

///|
/// Undeletes a log bucket. A bucket that has been deleted can be undeleted within the grace period of 7 days.
pub async fn LoggingService::projects_locations_buckets_undelete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":undelete"
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

///| logging.projects.locations.buckets.updateAsync

///|
/// Updates a log bucket asynchronously.If the bucket has a lifecycle_state of DELETE_REQUESTED, then FAILED_PRECONDITION will be returned.After a bucket has been created, the bucket's location cannot be changed.
pub async fn LoggingService::projects_locations_buckets_update_async(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> Operation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":updateAsync"
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

///| logging.projects.locations.buckets.links.create

///|
/// Asynchronously creates a linked dataset in BigQuery which makes it possible to use BigQuery to read the logs stored in the log bucket. A log bucket may currently only contain one link.
pub async fn LoggingService::projects_locations_buckets_links_create(
  self : LoggingService,
  parent : String,
  link_id? : String? = None,
) -> Operation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match link_id {
    Some(v) => qp.push(("linkId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "links"
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

///| logging.projects.locations.buckets.links.delete

///|
/// Deletes a link. This will also delete the corresponding BigQuery linked dataset.
pub async fn LoggingService::projects_locations_buckets_links_delete(
  self : LoggingService,
  name : String,
) -> Operation raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.projects.locations.buckets.links.get

///|
/// Gets a link.
pub async fn LoggingService::projects_locations_buckets_links_get(
  self : LoggingService,
  name : String,
) -> Link raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.locations.buckets.links.list

///|
/// Lists links.
pub async fn LoggingService::projects_locations_buckets_links_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListLinksResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "links"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.locations.buckets.views.create

///|
/// Creates a view over log entries in a log bucket. A bucket may contain a maximum of 30 views.
pub async fn LoggingService::projects_locations_buckets_views_create(
  self : LoggingService,
  parent : String,
  view_id? : String? = None,
) -> LogView raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match view_id {
    Some(v) => qp.push(("viewId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "views"
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

///| logging.projects.locations.buckets.views.delete

///|
/// Deletes a view on a log bucket. If an UNAVAILABLE error is returned, this indicates that system is not in a state where it can delete the view. If this occurs, please try again in a few minutes.
pub async fn LoggingService::projects_locations_buckets_views_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.projects.locations.buckets.views.get

///|
/// Gets a view on a log bucket.
pub async fn LoggingService::projects_locations_buckets_views_get(
  self : LoggingService,
  name : String,
) -> LogView raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.locations.buckets.views.getIamPolicy

///|
/// Gets the access control policy for a resource. Returns an empty policy if the resource exists and does not have a policy set.
pub async fn LoggingService::projects_locations_buckets_views_get_iam_policy(
  self : LoggingService,
  resource : String,
) -> Policy raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + resource + "/" + ":getIamPolicy"
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

///| logging.projects.locations.buckets.views.list

///|
/// Lists views on a log bucket.
pub async fn LoggingService::projects_locations_buckets_views_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListViewsResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "views"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.locations.buckets.views.patch

///|
/// Updates a view on a log bucket. This method replaces the value of the filter field from the existing view with the corresponding value from the new view. If an UNAVAILABLE error is returned, this indicates that system is not in a state where it can update the view. If this occurs, please try again in a few minutes.
pub async fn LoggingService::projects_locations_buckets_views_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogView raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.projects.locations.buckets.views.setIamPolicy

///|
/// Sets the access control policy on the specified resource. Replaces any existing policy.Can return NOT_FOUND, INVALID_ARGUMENT, and PERMISSION_DENIED errors.
pub async fn LoggingService::projects_locations_buckets_views_set_iam_policy(
  self : LoggingService,
  resource : String,
) -> Policy raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + resource + "/" + ":setIamPolicy"
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

///| logging.projects.locations.buckets.views.testIamPermissions

///|
/// Returns permissions that a caller has on the specified resource. If the resource does not exist, this will return an empty set of permissions, not a NOT_FOUND error.Note: This operation is designed to be used for building permission-aware UIs and command-line tools, not for authorization checking. This operation may "fail open" without warning.
pub async fn LoggingService::projects_locations_buckets_views_test_iam_permissions(
  self : LoggingService,
  resource : String,
) -> TestIamPermissionsResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + resource + "/" + ":testIamPermissions"
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

///| logging.projects.locations.buckets.views.logs.list

///|
/// Lists the logs in projects, organizations, folders, or billing accounts. Only logs that have entries are listed.
pub async fn LoggingService::projects_locations_buckets_views_logs_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
  resource_names? : String? = None,
) -> ListLogsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match resource_names {
    Some(v) => qp.push(("resourceNames", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v2" + "/" + parent + "/" + "logs"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.locations.logScopes.create

///|
/// Creates a log scope.
pub async fn LoggingService::projects_locations_log_scopes_create(
  self : LoggingService,
  parent : String,
  log_scope_id? : String? = None,
) -> LogScope raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match log_scope_id {
    Some(v) => qp.push(("logScopeId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "logScopes"
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

///| logging.projects.locations.logScopes.delete

///|
/// Deletes a log scope.
pub async fn LoggingService::projects_locations_log_scopes_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.projects.locations.logScopes.get

///|
/// Gets a log scope.
pub async fn LoggingService::projects_locations_log_scopes_get(
  self : LoggingService,
  name : String,
) -> LogScope raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.locations.logScopes.list

///|
/// Lists log scopes.
pub async fn LoggingService::projects_locations_log_scopes_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListLogScopesResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "logScopes"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.locations.logScopes.patch

///|
/// Updates a log scope.
pub async fn LoggingService::projects_locations_log_scopes_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> LogScope raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.projects.locations.operations.cancel

///|
/// Starts asynchronous cancellation on a long-running operation. The server makes a best effort to cancel the operation, but success is not guaranteed. If the server doesn't support this method, it returns google.rpc.Code.UNIMPLEMENTED. Clients can use Operations.GetOperation or other methods to check whether the cancellation succeeded or whether the operation completed despite cancellation. On successful cancellation, the operation is not deleted; instead, it becomes an operation with an Operation.error value with a google.rpc.Status.code of 1, corresponding to Code.CANCELLED.
pub async fn LoggingService::projects_locations_operations_cancel(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":cancel"
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

///| logging.projects.locations.operations.get

///|
/// Gets the latest state of a long-running operation. Clients can use this method to poll the operation result at intervals as recommended by the API service.
pub async fn LoggingService::projects_locations_operations_get(
  self : LoggingService,
  name : String,
) -> Operation raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.locations.operations.list

///|
/// Lists operations that match the specified filter in the request. If the server doesn't support this method, it returns UNIMPLEMENTED.
pub async fn LoggingService::projects_locations_operations_list(
  self : LoggingService,
  name : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  return_partial_success? : Bool? = None,
) -> ListOperationsResponse raise @http.HttpError {
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
  match return_partial_success {
    Some(v) =>
      qp.push(("returnPartialSuccess", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v2" + "/" + name + "/" + "operations"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.locations.recentQueries.list

///|
/// Lists the RecentQueries that were created by the user making the request.
pub async fn LoggingService::projects_locations_recent_queries_list(
  self : LoggingService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListRecentQueriesResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "recentQueries"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.locations.savedQueries.create

///|
/// Creates a new SavedQuery for the user making the request.
pub async fn LoggingService::projects_locations_saved_queries_create(
  self : LoggingService,
  parent : String,
  saved_query_id? : String? = None,
) -> SavedQuery raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match saved_query_id {
    Some(v) => qp.push(("savedQueryId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "savedQueries"
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

///| logging.projects.locations.savedQueries.delete

///|
/// Deletes an existing SavedQuery that was created by the user making the request.
pub async fn LoggingService::projects_locations_saved_queries_delete(
  self : LoggingService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.projects.locations.savedQueries.get

///|
/// Returns all data associated with the requested query.
pub async fn LoggingService::projects_locations_saved_queries_get(
  self : LoggingService,
  name : String,
) -> SavedQuery raise @http.HttpError {
  let path = "/" + "v2" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.locations.savedQueries.list

///|
/// Lists the SavedQueries that were created by the user making the request.
pub async fn LoggingService::projects_locations_saved_queries_list(
  self : LoggingService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListSavedQueriesResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "savedQueries"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.locations.savedQueries.patch

///|
/// Updates an existing SavedQuery.
pub async fn LoggingService::projects_locations_saved_queries_patch(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> SavedQuery raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name
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

///| logging.projects.logs.delete

///|
/// Deletes all the log entries in a log for the global _Default Log Bucket. The log reappears if it receives new entries. Log entries written shortly before the delete operation might not be deleted. Entries received after the delete operation with a timestamp before the operation will be deleted.
pub async fn LoggingService::projects_logs_delete(
  self : LoggingService,
  log_name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + log_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.projects.logs.list

///|
/// Lists the logs in projects, organizations, folders, or billing accounts. Only logs that have entries are listed.
pub async fn LoggingService::projects_logs_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
  resource_names? : String? = None,
) -> ListLogsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match resource_names {
    Some(v) => qp.push(("resourceNames", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v2" + "/" + parent + "/" + "logs"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.metrics.create

///|
/// Creates a logs-based metric.
pub async fn LoggingService::projects_metrics_create(
  self : LoggingService,
  parent : String,
) -> LogMetric raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "metrics"
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

///| logging.projects.metrics.delete

///|
/// Deletes a logs-based metric.
pub async fn LoggingService::projects_metrics_delete(
  self : LoggingService,
  metric_name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + metric_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.projects.metrics.get

///|
/// Gets a logs-based metric.
pub async fn LoggingService::projects_metrics_get(
  self : LoggingService,
  metric_name : String,
) -> LogMetric raise @http.HttpError {
  let path = "/" + "v2" + "/" + metric_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.metrics.list

///|
/// Lists logs-based metrics.
pub async fn LoggingService::projects_metrics_list(
  self : LoggingService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListLogMetricsResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "metrics"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.metrics.update

///|
/// Creates or updates a logs-based metric.
pub async fn LoggingService::projects_metrics_update(
  self : LoggingService,
  metric_name : String,
) -> LogMetric raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + metric_name
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

///| logging.projects.sinks.create

///|
/// Creates a sink that exports specified log entries to a destination. The export begins upon ingress, unless the sink's writer_identity is not permitted to write to the destination. A sink can export log entries only from the resource owning the sink.
pub async fn LoggingService::projects_sinks_create(
  self : LoggingService,
  parent : String,
  custom_writer_identity? : String? = None,
  unique_writer_identity? : Bool? = None,
) -> LogSink raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match custom_writer_identity {
    Some(v) => qp.push(("customWriterIdentity", url_encode(v)))
    None => ()
  }
  match unique_writer_identity {
    Some(v) =>
      qp.push(("uniqueWriterIdentity", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "sinks"
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

///| logging.projects.sinks.delete

///|
/// Deletes a sink. If the sink has a unique writer_identity, then that service account is also deleted.
pub async fn LoggingService::projects_sinks_delete(
  self : LoggingService,
  sink_name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + sink_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.projects.sinks.get

///|
/// Gets a sink.
pub async fn LoggingService::projects_sinks_get(
  self : LoggingService,
  sink_name : String,
) -> LogSink raise @http.HttpError {
  let path = "/" + "v2" + "/" + sink_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.sinks.list

///|
/// Lists sinks.
pub async fn LoggingService::projects_sinks_list(
  self : LoggingService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListSinksResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "sinks"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.projects.sinks.patch

///|
/// Updates a sink. This method replaces the values of the destination and filter fields of the existing sink with the corresponding values from the new sink.The updated sink might also have a new writer_identity; see the unique_writer_identity field.
pub async fn LoggingService::projects_sinks_patch(
  self : LoggingService,
  sink_name : String,
  custom_writer_identity? : String? = None,
  unique_writer_identity? : Bool? = None,
  update_mask? : String? = None,
) -> LogSink raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match custom_writer_identity {
    Some(v) => qp.push(("customWriterIdentity", url_encode(v)))
    None => ()
  }
  match unique_writer_identity {
    Some(v) =>
      qp.push(("uniqueWriterIdentity", if v { "true" } else { "false" }))
    None => ()
  }
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + sink_name
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

///| logging.projects.sinks.update

///|
/// Updates a sink. This method replaces the values of the destination and filter fields of the existing sink with the corresponding values from the new sink.The updated sink might also have a new writer_identity; see the unique_writer_identity field.
pub async fn LoggingService::projects_sinks_update(
  self : LoggingService,
  sink_name : String,
  custom_writer_identity? : String? = None,
  unique_writer_identity? : Bool? = None,
  update_mask? : String? = None,
) -> LogSink raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match custom_writer_identity {
    Some(v) => qp.push(("customWriterIdentity", url_encode(v)))
    None => ()
  }
  match unique_writer_identity {
    Some(v) =>
      qp.push(("uniqueWriterIdentity", if v { "true" } else { "false" }))
    None => ()
  }
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + sink_name
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

///| logging.sinks.create

///|
/// Creates a sink that exports specified log entries to a destination. The export begins upon ingress, unless the sink's writer_identity is not permitted to write to the destination. A sink can export log entries only from the resource owning the sink.
pub async fn LoggingService::sinks_create(
  self : LoggingService,
  parent : String,
  custom_writer_identity? : String? = None,
  unique_writer_identity? : Bool? = None,
) -> LogSink raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match custom_writer_identity {
    Some(v) => qp.push(("customWriterIdentity", url_encode(v)))
    None => ()
  }
  match unique_writer_identity {
    Some(v) =>
      qp.push(("uniqueWriterIdentity", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "sinks"
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

///| logging.sinks.delete

///|
/// Deletes a sink. If the sink has a unique writer_identity, then that service account is also deleted.
pub async fn LoggingService::sinks_delete(
  self : LoggingService,
  sink_name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v2" + "/" + sink_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::DELETE,
    self.auth_headers(),
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

///| logging.sinks.get

///|
/// Gets a sink.
pub async fn LoggingService::sinks_get(
  self : LoggingService,
  sink_name : String,
) -> LogSink raise @http.HttpError {
  let path = "/" + "v2" + "/" + sink_name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.sinks.list

///|
/// Lists sinks.
pub async fn LoggingService::sinks_list(
  self : LoggingService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListSinksResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "sinks"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.sinks.update

///|
/// Updates a sink. This method replaces the values of the destination and filter fields of the existing sink with the corresponding values from the new sink.The updated sink might also have a new writer_identity; see the unique_writer_identity field.
pub async fn LoggingService::sinks_update(
  self : LoggingService,
  sink_name : String,
  custom_writer_identity? : String? = None,
  unique_writer_identity? : Bool? = None,
  update_mask? : String? = None,
) -> LogSink raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match custom_writer_identity {
    Some(v) => qp.push(("customWriterIdentity", url_encode(v)))
    None => ()
  }
  match unique_writer_identity {
    Some(v) =>
      qp.push(("uniqueWriterIdentity", if v { "true" } else { "false" }))
    None => ()
  }
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + sink_name
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

///| logging.getCmekSettings

///|
/// Gets the Logging CMEK settings for the given resource.Note: CMEK for the Log Router can be configured for Google Cloud projects, folders, organizations, and billing accounts. Once configured for an organization, it applies to all projects and folders in the Google Cloud organization.See Configure CMEK for Cloud Logging (https://docs.cloud.google.com/logging/docs/routing/managed-encryption) for more information.
pub async fn LoggingService::v2_get_cmek_settings(
  self : LoggingService,
  name : String,
) -> CmekSettings raise @http.HttpError {
  let path = "/" + "v2" + "/" + name + "/" + "cmekSettings"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.getSettings

///|
/// Gets the settings for the given resource.Note: Settings can be retrieved for Google Cloud projects, folders, organizations, and billing accounts.See View default resource settings for Logging (https://docs.cloud.google.com/logging/docs/default-settings#view-org-settings) for more information.
pub async fn LoggingService::v2_get_settings(
  self : LoggingService,
  name : String,
) -> Settings raise @http.HttpError {
  let path = "/" + "v2" + "/" + name + "/" + "settings"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::GET,
    self.auth_headers(),
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

///| logging.updateCmekSettings

///|
/// Updates the Log Router CMEK settings for the given resource.Note: CMEK for the Log Router can currently only be configured for Google Cloud organizations. Once configured, it applies to all projects and folders in the Google Cloud organization.UpdateCmekSettings fails when any of the following are true: The value of kms_key_name is invalid. The associated service account doesn't have the required roles/cloudkms.cryptoKeyEncrypterDecrypter role assigned for the key. Access to the key is disabled.See Configure CMEK for Cloud Logging (https://docs.cloud.google.com/logging/docs/routing/managed-encryption) for more information.
pub async fn LoggingService::v2_update_cmek_settings(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> CmekSettings raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + "cmekSettings"
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

///| logging.updateSettings

///|
/// Updates the settings for the given resource. This method applies to all feature configurations for organization and folders.UpdateSettings fails when any of the following are true: The value of storage_location either isn't supported by Logging or violates the location OrgPolicy. The default_sink_config field is set, but it has an unspecified filter write mode. The value of kms_key_name is invalid. The associated service account doesn't have the required roles/cloudkms.cryptoKeyEncrypterDecrypter role assigned for the key. Access to the key is disabled.See Configure default settings for organizations and folders (https://docs.cloud.google.com/logging/docs/default-settings) for more information.
pub async fn LoggingService::v2_update_settings(
  self : LoggingService,
  name : String,
  update_mask? : String? = None,
) -> Settings raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match update_mask {
    Some(v) => qp.push(("updateMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + "settings"
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
