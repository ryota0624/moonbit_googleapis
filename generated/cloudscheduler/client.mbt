///| API client for cloudscheduler v1

///| Base URL: https://cloudscheduler.googleapis.com/

///|
pub struct CloudschedulerService {
  base_url : String
  get_token : async () -> String
  client : &@http.HttpClient
}

///|
pub fn CloudschedulerService::new(
  client : &@http.HttpClient,
  get_token : async () -> String,
) -> CloudschedulerService {
  CloudschedulerService::{
    base_url: "https://cloudscheduler.googleapis.com",
    get_token,
    client,
  }
}

///|
async fn CloudschedulerService::auth_headers(
  self : CloudschedulerService,
) -> Map[String, String] raise @http.HttpError {
  let token = (self.get_token)() catch {
    e => raise @http.HttpError::NetworkError(e.to_string())
  }
  { "Authorization": "Bearer " + token, "Accept": "application/json" }
}

///| cloudscheduler.projects.locations.get

///|
/// Gets information about a location.
pub async fn CloudschedulerService::projects_locations_get(
  self : CloudschedulerService,
  name : String,
) -> Location raise @http.HttpError {
  let path = "/" + "v1" + "/" + name
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

///| cloudscheduler.projects.locations.getCmekConfig

///|
/// Gets the Scheduler config in the project/region.
pub async fn CloudschedulerService::projects_locations_get_cmek_config(
  self : CloudschedulerService,
  name : String,
) -> CmekConfig raise @http.HttpError {
  let path = "/" + "v1" + "/" + name
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

///| cloudscheduler.projects.locations.list

///|
/// Lists information about the supported locations for this service. This method can be called in two ways: * **List all public locations:** Use the path `GET /v1/locations`. * **List project-visible locations:** Use the path `GET /v1/projects/{project_id}/locations`. This may include public locations as well as private or other locations specifically visible to the project.
pub async fn CloudschedulerService::projects_locations_list(
  self : CloudschedulerService,
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
  let path = "/" + "v1" + "/" + name + "/" + "locations"
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

///| cloudscheduler.projects.locations.updateCmekConfig

///|
/// Initializes or Updates the a scheduler config.
pub async fn CloudschedulerService::projects_locations_update_cmek_config(
  self : CloudschedulerService,
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
  let path = "/" + "v1" + "/" + name
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

///| cloudscheduler.projects.locations.jobs.create

///|
/// Creates a job.
pub async fn CloudschedulerService::projects_locations_jobs_create(
  self : CloudschedulerService,
  parent : String,
) -> Job raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + parent + "/" + "jobs"
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

///| cloudscheduler.projects.locations.jobs.delete

///|
/// Deletes a job.
pub async fn CloudschedulerService::projects_locations_jobs_delete(
  self : CloudschedulerService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v1" + "/" + name
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

///| cloudscheduler.projects.locations.jobs.get

///|
/// Gets a job.
pub async fn CloudschedulerService::projects_locations_jobs_get(
  self : CloudschedulerService,
  name : String,
) -> Job raise @http.HttpError {
  let path = "/" + "v1" + "/" + name
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

///| cloudscheduler.projects.locations.jobs.list

///|
/// Lists jobs.
pub async fn CloudschedulerService::projects_locations_jobs_list(
  self : CloudschedulerService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListJobsResponse raise @http.HttpError {
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
  let path = "/" + "v1" + "/" + parent + "/" + "jobs"
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

///| cloudscheduler.projects.locations.jobs.patch

///|
/// Updates a job. If successful, the updated Job is returned. If the job does not exist, `NOT_FOUND` is returned. If UpdateJob does not successfully return, it is possible for the job to be in an Job.State.UPDATE_FAILED state. A job in this state may not be executed. If this happens, retry the UpdateJob request until a successful response is received.
pub async fn CloudschedulerService::projects_locations_jobs_patch(
  self : CloudschedulerService,
  name : String,
  update_mask? : String? = None,
) -> Job raise @http.HttpError {
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
  let path = "/" + "v1" + "/" + name
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

///| cloudscheduler.projects.locations.jobs.pause

///|
/// Pauses a job. If a job is paused then the system will stop executing the job until it is re-enabled via ResumeJob. The state of the job is stored in state; if paused it will be set to Job.State.PAUSED. A job must be in Job.State.ENABLED to be paused.
pub async fn CloudschedulerService::projects_locations_jobs_pause(
  self : CloudschedulerService,
  name : String,
) -> Job raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + name + "/" + ":pause"
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

///| cloudscheduler.projects.locations.jobs.resume

///|
/// Resume a job. This method reenables a job after it has been Job.State.PAUSED. The state of a job is stored in Job.state; after calling this method it will be set to Job.State.ENABLED. A job must be in Job.State.PAUSED to be resumed.
pub async fn CloudschedulerService::projects_locations_jobs_resume(
  self : CloudschedulerService,
  name : String,
) -> Job raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + name + "/" + ":resume"
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

///| cloudscheduler.projects.locations.jobs.run

///|
/// Forces a job to run now. When this method is called, Cloud Scheduler will dispatch the job, even if the job is already running.
pub async fn CloudschedulerService::projects_locations_jobs_run(
  self : CloudschedulerService,
  name : String,
) -> Job raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + name + "/" + ":run"
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

///| cloudscheduler.projects.locations.operations.cancel

///|
/// Starts asynchronous cancellation on a long-running operation. The server makes a best effort to cancel the operation, but success is not guaranteed. If the server doesn't support this method, it returns `google.rpc.Code.UNIMPLEMENTED`. Clients can use Operations.GetOperation or other methods to check whether the cancellation succeeded or whether the operation completed despite cancellation. On successful cancellation, the operation is not deleted; instead, it becomes an operation with an Operation.error value with a google.rpc.Status.code of `1`, corresponding to `Code.CANCELLED`.
pub async fn CloudschedulerService::projects_locations_operations_cancel(
  self : CloudschedulerService,
  name : String,
) -> Empty raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + name + "/" + ":cancel"
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

///| cloudscheduler.projects.locations.operations.delete

///|
/// Deletes a long-running operation. This method indicates that the client is no longer interested in the operation result. It does not cancel the operation. If the server doesn't support this method, it returns `google.rpc.Code.UNIMPLEMENTED`.
pub async fn CloudschedulerService::projects_locations_operations_delete(
  self : CloudschedulerService,
  name : String,
) -> Empty raise @http.HttpError {
  let path = "/" + "v1" + "/" + name
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

///| cloudscheduler.projects.locations.operations.get

///|
/// Gets the latest state of a long-running operation. Clients can use this method to poll the operation result at intervals as recommended by the API service.
pub async fn CloudschedulerService::projects_locations_operations_get(
  self : CloudschedulerService,
  name : String,
) -> Operation raise @http.HttpError {
  let path = "/" + "v1" + "/" + name
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

///| cloudscheduler.projects.locations.operations.list

///|
/// Lists operations that match the specified filter in the request. If the server doesn't support this method, it returns `UNIMPLEMENTED`.
pub async fn CloudschedulerService::projects_locations_operations_list(
  self : CloudschedulerService,
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
  let path = "/" + "v1" + "/" + name + "/" + "operations"
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
