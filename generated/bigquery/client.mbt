///| API client for bigquery v2

///| Base URL: https://bigquery.googleapis.com/bigquery/v2/

///|
pub struct BigqueryService {
  base_url : String
  access_token : String
  client : &@http.HttpClient
}

///|
pub fn BigqueryService::new(
  client : &@http.HttpClient,
  access_token : String,
) -> BigqueryService {
  BigqueryService::{
    base_url: "https://bigquery.googleapis.com/bigquery/v2",
    access_token,
    client,
  }
}

///|
fn BigqueryService::auth_headers(self : BigqueryService) -> Map[String, String] {
  {
    "Authorization": "Bearer " + self.access_token,
    "Accept": "application/json",
  }
}

///| bigquery.datasets.delete

///|
/// Deletes the dataset specified by the datasetId value. Before you can delete a dataset, you must delete all its tables, either manually or by specifying deleteContents. Immediately after deletion, you can create another dataset with the same name.
pub async fn BigqueryService::datasets_delete(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  delete_contents? : Bool? = None,
) -> @http.HttpResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match delete_contents {
    Some(v) => qp.push(("deleteContents", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
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
  resp
}

///| bigquery.datasets.get

///|
/// Returns the dataset specified by datasetID.
pub async fn BigqueryService::datasets_get(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  access_policy_version? : Int? = None,
  dataset_view? : String? = None,
) -> Dataset raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match access_policy_version {
    Some(v) => qp.push(("accessPolicyVersion", v.to_string()))
    None => ()
  }
  match dataset_view {
    Some(v) => qp.push(("datasetView", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id
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

///| bigquery.datasets.insert

///|
/// Creates a new empty dataset.
pub async fn BigqueryService::datasets_insert(
  self : BigqueryService,
  project_id : String,
  access_policy_version? : Int? = None,
) -> Dataset raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match access_policy_version {
    Some(v) => qp.push(("accessPolicyVersion", v.to_string()))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "projects" + "/" + project_id + "/" + "datasets"
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

///| bigquery.datasets.list

///|
/// Lists all datasets in the specified project to which the user has been granted the READER dataset role.
pub async fn BigqueryService::datasets_list(
  self : BigqueryService,
  project_id : String,
  all? : Bool? = None,
  filter? : String? = None,
  max_results? : Int? = None,
  page_token? : String? = None,
) -> DatasetList raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match all {
    Some(v) => qp.push(("all", if v { "true" } else { "false" }))
    None => ()
  }
  match filter {
    Some(v) => qp.push(("filter", url_encode(v)))
    None => ()
  }
  match max_results {
    Some(v) => qp.push(("maxResults", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "projects" + "/" + project_id + "/" + "datasets"
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

///| bigquery.datasets.patch

///|
/// Updates information in an existing dataset. The update method replaces the entire dataset resource, whereas the patch method only replaces fields that are provided in the submitted dataset resource. This method supports RFC5789 patch semantics.
pub async fn BigqueryService::datasets_patch(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  access_policy_version? : Int? = None,
  update_mode? : String? = None,
) -> Dataset raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match access_policy_version {
    Some(v) => qp.push(("accessPolicyVersion", v.to_string()))
    None => ()
  }
  match update_mode {
    Some(v) => qp.push(("updateMode", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id
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

///| bigquery.datasets.undelete

///|
/// Undeletes a dataset which is within time travel window based on datasetId. If a time is specified, the dataset version deleted at that time is undeleted, else the last live version is undeleted.
pub async fn BigqueryService::datasets_undelete(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
) -> Dataset raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    ":undelete"
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

///| bigquery.datasets.update

///|
/// Updates information in an existing dataset. The update method replaces the entire dataset resource, whereas the patch method only replaces fields that are provided in the submitted dataset resource.
pub async fn BigqueryService::datasets_update(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  access_policy_version? : Int? = None,
  update_mode? : String? = None,
) -> Dataset raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match access_policy_version {
    Some(v) => qp.push(("accessPolicyVersion", v.to_string()))
    None => ()
  }
  match update_mode {
    Some(v) => qp.push(("updateMode", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id
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

///| bigquery.jobs.cancel

///|
/// Requests that a job be cancelled. This call will return immediately, and the client will need to poll for the job status to see if the cancel completed successfully. Cancelled jobs may still incur costs.
pub async fn BigqueryService::jobs_cancel(
  self : BigqueryService,
  project_id : String,
  job_id : String,
  location? : String? = None,
) -> JobCancelResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match location {
    Some(v) => qp.push(("location", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "jobs" +
    "/" +
    job_id +
    "/" +
    "cancel"
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

///| bigquery.jobs.delete

///|
/// Requests the deletion of the metadata of a job. This call returns when the job's metadata is deleted.
pub async fn BigqueryService::jobs_delete(
  self : BigqueryService,
  project_id : String,
  job_id : String,
  location? : String? = None,
) -> @http.HttpResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match location {
    Some(v) => qp.push(("location", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "jobs" +
    "/" +
    job_id +
    "/" +
    "delete"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
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
  resp
}

///| bigquery.jobs.get

///|
/// Returns information about a specific job. Job information is available for a six month period after creation. Requires that you're the person who ran the job, or have the Is Owner project role.
pub async fn BigqueryService::jobs_get(
  self : BigqueryService,
  project_id : String,
  job_id : String,
  location? : String? = None,
) -> Job raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match location {
    Some(v) => qp.push(("location", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "projects" + "/" + project_id + "/" + "jobs" + "/" + job_id
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

///| bigquery.jobs.getQueryResults

///|
/// RPC to get the results of a query job.
pub async fn BigqueryService::jobs_get_query_results(
  self : BigqueryService,
  project_id : String,
  job_id : String,
  format_options_timestamp_output_format? : String? = None,
  format_options_use_int64_timestamp? : Bool? = None,
  location? : String? = None,
  max_results? : Int? = None,
  page_token? : String? = None,
  start_index? : String? = None,
  timeout_ms? : Int? = None,
) -> GetQueryResultsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match format_options_timestamp_output_format {
    Some(v) => qp.push(("formatOptions.timestampOutputFormat", url_encode(v)))
    None => ()
  }
  match format_options_use_int64_timestamp {
    Some(v) =>
      qp.push(
        ("formatOptions.useInt64Timestamp", if v { "true" } else { "false" }),
      )
    None => ()
  }
  match location {
    Some(v) => qp.push(("location", url_encode(v)))
    None => ()
  }
  match max_results {
    Some(v) => qp.push(("maxResults", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match start_index {
    Some(v) => qp.push(("startIndex", url_encode(v)))
    None => ()
  }
  match timeout_ms {
    Some(v) => qp.push(("timeoutMs", v.to_string()))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "queries" +
    "/" +
    job_id
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

///| bigquery.jobs.insert

///|
/// Starts a new asynchronous job. This API has two different kinds of endpoint URIs, as this method supports a variety of use cases. * The *Metadata* URI is used for most interactions, as it accepts the job configuration directly. * The *Upload* URI is ONLY for the case when you're sending both a load job configuration and a data stream together. In this case, the Upload URI accepts the job configuration and the data as two distinct multipart MIME parts.
pub async fn BigqueryService::jobs_insert(
  self : BigqueryService,
  project_id : String,
) -> Job raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "projects" + "/" + project_id + "/" + "jobs"
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

///| bigquery.jobs.list

///|
/// Lists all jobs that you started in the specified project. Job information is available for a six month period after creation. The job list is sorted in reverse chronological order, by job creation time. Requires the Can View project role, or the Is Owner project role if you set the allUsers property.
pub async fn BigqueryService::jobs_list(
  self : BigqueryService,
  project_id : String,
  all_users? : Bool? = None,
  max_creation_time? : String? = None,
  max_results? : Int? = None,
  min_creation_time? : String? = None,
  page_token? : String? = None,
  parent_job_id? : String? = None,
  projection? : String? = None,
  state_filter? : String? = None,
) -> JobList raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match all_users {
    Some(v) => qp.push(("allUsers", if v { "true" } else { "false" }))
    None => ()
  }
  match max_creation_time {
    Some(v) => qp.push(("maxCreationTime", url_encode(v)))
    None => ()
  }
  match max_results {
    Some(v) => qp.push(("maxResults", v.to_string()))
    None => ()
  }
  match min_creation_time {
    Some(v) => qp.push(("minCreationTime", url_encode(v)))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match parent_job_id {
    Some(v) => qp.push(("parentJobId", url_encode(v)))
    None => ()
  }
  match projection {
    Some(v) => qp.push(("projection", url_encode(v)))
    None => ()
  }
  match state_filter {
    Some(v) => qp.push(("stateFilter", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "projects" + "/" + project_id + "/" + "jobs"
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

///| bigquery.jobs.query

///|
/// Runs a BigQuery SQL query synchronously and returns query results if the query completes within a specified timeout.
pub async fn BigqueryService::jobs_query(
  self : BigqueryService,
  project_id : String,
) -> QueryResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "projects" + "/" + project_id + "/" + "queries"
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

///| bigquery.models.delete

///|
/// Deletes the model specified by modelId from the dataset.
pub async fn BigqueryService::models_delete(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  model_id : String,
) -> @http.HttpResponse raise @http.HttpError {
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "models" +
    "/" +
    model_id
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
  resp
}

///| bigquery.models.get

///|
/// Gets the specified model resource by model ID.
pub async fn BigqueryService::models_get(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  model_id : String,
) -> Model raise @http.HttpError {
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "models" +
    "/" +
    model_id
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

///| bigquery.models.list

///|
/// Lists all models in the specified dataset. Requires the READER dataset role. After retrieving the list of models, you can get information about a particular model by calling the models.get method.
pub async fn BigqueryService::models_list(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  max_results? : Int? = None,
  page_token? : String? = None,
) -> ListModelsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match max_results {
    Some(v) => qp.push(("maxResults", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "models"
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

///| bigquery.models.patch

///|
/// Patch specific fields in the specified model.
pub async fn BigqueryService::models_patch(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  model_id : String,
) -> Model raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "models" +
    "/" +
    model_id
  let url = self.base_url + path
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

///| bigquery.projects.getServiceAccount

///|
/// RPC to get the service account for a project used for interactions with Google Cloud KMS
pub async fn BigqueryService::projects_get_service_account(
  self : BigqueryService,
  project_id : String,
) -> GetServiceAccountResponse raise @http.HttpError {
  let path = "/" + "projects" + "/" + project_id + "/" + "serviceAccount"
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

///| bigquery.projects.list

///|
/// RPC to list projects to which the user has been granted any project role. Users of this method are encouraged to consider the [Resource Manager](https://cloud.google.com/resource-manager/docs/) API, which provides the underlying data for this method and has more capabilities.
pub async fn BigqueryService::projects_list(
  self : BigqueryService,
  max_results? : Int? = None,
  page_token? : String? = None,
) -> ProjectList raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match max_results {
    Some(v) => qp.push(("maxResults", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "projects"
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

///| bigquery.routines.delete

///|
/// Deletes the routine specified by routineId from the dataset.
pub async fn BigqueryService::routines_delete(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  routine_id : String,
) -> @http.HttpResponse raise @http.HttpError {
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "routines" +
    "/" +
    routine_id
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
  resp
}

///| bigquery.routines.get

///|
/// Gets the specified routine resource by routine ID.
pub async fn BigqueryService::routines_get(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  routine_id : String,
  read_mask? : String? = None,
) -> Routine raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match read_mask {
    Some(v) => qp.push(("readMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "routines" +
    "/" +
    routine_id
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

///| bigquery.routines.getIamPolicy

///|
/// Gets the access control policy for a resource. Returns an empty policy if the resource exists and does not have a policy set.
pub async fn BigqueryService::routines_get_iam_policy(
  self : BigqueryService,
  resource : String,
) -> Policy raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + resource + "/" + ":getIamPolicy"
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

///| bigquery.routines.insert

///|
/// Creates a new routine in the dataset.
pub async fn BigqueryService::routines_insert(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
) -> Routine raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "routines"
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

///| bigquery.routines.list

///|
/// Lists all routines in the specified dataset. Requires the READER dataset role.
pub async fn BigqueryService::routines_list(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  filter? : String? = None,
  max_results? : Int? = None,
  page_token? : String? = None,
  read_mask? : String? = None,
) -> ListRoutinesResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match filter {
    Some(v) => qp.push(("filter", url_encode(v)))
    None => ()
  }
  match max_results {
    Some(v) => qp.push(("maxResults", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match read_mask {
    Some(v) => qp.push(("readMask", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "routines"
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

///| bigquery.routines.setIamPolicy

///|
/// Sets the access control policy on the specified resource. Replaces any existing policy. Can return `NOT_FOUND`, `INVALID_ARGUMENT`, and `PERMISSION_DENIED` errors.
pub async fn BigqueryService::routines_set_iam_policy(
  self : BigqueryService,
  resource : String,
) -> Policy raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + resource + "/" + ":setIamPolicy"
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

///| bigquery.routines.testIamPermissions

///|
/// Returns permissions that a caller has on the specified resource. If the resource does not exist, this will return an empty set of permissions, not a `NOT_FOUND` error. Note: This operation is designed to be used for building permission-aware UIs and command-line tools, not for authorization checking. This operation may "fail open" without warning.
pub async fn BigqueryService::routines_test_iam_permissions(
  self : BigqueryService,
  resource : String,
) -> TestIamPermissionsResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + resource + "/" + ":testIamPermissions"
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

///| bigquery.routines.update

///|
/// Updates information in an existing routine. The update method replaces the entire Routine resource.
pub async fn BigqueryService::routines_update(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  routine_id : String,
) -> Routine raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "routines" +
    "/" +
    routine_id
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

///| bigquery.rowAccessPolicies.batchDelete

///|
/// Deletes provided row access policies.
pub async fn BigqueryService::row_access_policies_batch_delete(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  table_id : String,
) -> @http.HttpResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "tables" +
    "/" +
    table_id +
    "/" +
    "rowAccessPolicies:batchDelete"
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
  resp
}

///| bigquery.rowAccessPolicies.delete

///|
/// Deletes a row access policy.
pub async fn BigqueryService::row_access_policies_delete(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  table_id : String,
  policy_id : String,
  force? : Bool? = None,
) -> @http.HttpResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match force {
    Some(v) => qp.push(("force", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "tables" +
    "/" +
    table_id +
    "/" +
    "rowAccessPolicies" +
    "/" +
    policy_id
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
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
  resp
}

///| bigquery.rowAccessPolicies.get

///|
/// Gets the specified row access policy by policy ID.
pub async fn BigqueryService::row_access_policies_get(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  table_id : String,
  policy_id : String,
) -> RowAccessPolicy raise @http.HttpError {
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "tables" +
    "/" +
    table_id +
    "/" +
    "rowAccessPolicies" +
    "/" +
    policy_id
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

///| bigquery.rowAccessPolicies.getIamPolicy

///|
/// Gets the access control policy for a resource. Returns an empty policy if the resource exists and does not have a policy set.
pub async fn BigqueryService::row_access_policies_get_iam_policy(
  self : BigqueryService,
  resource : String,
) -> Policy raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + resource + "/" + ":getIamPolicy"
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

///| bigquery.rowAccessPolicies.insert

///|
/// Creates a row access policy.
pub async fn BigqueryService::row_access_policies_insert(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  table_id : String,
) -> RowAccessPolicy raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "tables" +
    "/" +
    table_id +
    "/" +
    "rowAccessPolicies"
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

///| bigquery.rowAccessPolicies.list

///|
/// Lists all row access policies on the specified table.
pub async fn BigqueryService::row_access_policies_list(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  table_id : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListRowAccessPoliciesResponse raise @http.HttpError {
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
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "tables" +
    "/" +
    table_id +
    "/" +
    "rowAccessPolicies"
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

///| bigquery.rowAccessPolicies.testIamPermissions

///|
/// Returns permissions that a caller has on the specified resource. If the resource does not exist, this will return an empty set of permissions, not a `NOT_FOUND` error. Note: This operation is designed to be used for building permission-aware UIs and command-line tools, not for authorization checking. This operation may "fail open" without warning.
pub async fn BigqueryService::row_access_policies_test_iam_permissions(
  self : BigqueryService,
  resource : String,
) -> TestIamPermissionsResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + resource + "/" + ":testIamPermissions"
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

///| bigquery.rowAccessPolicies.update

///|
/// Updates a row access policy.
pub async fn BigqueryService::row_access_policies_update(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  table_id : String,
  policy_id : String,
) -> RowAccessPolicy raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "tables" +
    "/" +
    table_id +
    "/" +
    "rowAccessPolicies" +
    "/" +
    policy_id
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

///| bigquery.tabledata.insertAll

///|
/// Streams data into BigQuery one record at a time without needing to run a load job.
pub async fn BigqueryService::tabledata_insert_all(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  table_id : String,
) -> TableDataInsertAllResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "tables" +
    "/" +
    table_id +
    "/" +
    "insertAll"
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

///| bigquery.tabledata.list

///|
/// List the content of a table in rows.
pub async fn BigqueryService::tabledata_list(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  table_id : String,
  format_options_timestamp_output_format? : String? = None,
  format_options_use_int64_timestamp? : Bool? = None,
  max_results? : Int? = None,
  page_token? : String? = None,
  selected_fields? : String? = None,
  start_index? : String? = None,
) -> TableDataList raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match format_options_timestamp_output_format {
    Some(v) => qp.push(("formatOptions.timestampOutputFormat", url_encode(v)))
    None => ()
  }
  match format_options_use_int64_timestamp {
    Some(v) =>
      qp.push(
        ("formatOptions.useInt64Timestamp", if v { "true" } else { "false" }),
      )
    None => ()
  }
  match max_results {
    Some(v) => qp.push(("maxResults", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match selected_fields {
    Some(v) => qp.push(("selectedFields", url_encode(v)))
    None => ()
  }
  match start_index {
    Some(v) => qp.push(("startIndex", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "tables" +
    "/" +
    table_id +
    "/" +
    "data"
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

///| bigquery.tables.delete

///|
/// Deletes the table specified by tableId from the dataset. If the table contains data, all the data will be deleted.
pub async fn BigqueryService::tables_delete(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  table_id : String,
) -> @http.HttpResponse raise @http.HttpError {
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "tables" +
    "/" +
    table_id
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
  resp
}

///| bigquery.tables.get

///|
/// Gets the specified table resource by table ID. This method does not return the data in the table, it only returns the table resource, which describes the structure of this table.
pub async fn BigqueryService::tables_get(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  table_id : String,
  selected_fields? : String? = None,
  view? : String? = None,
) -> Table raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match selected_fields {
    Some(v) => qp.push(("selectedFields", url_encode(v)))
    None => ()
  }
  match view {
    Some(v) => qp.push(("view", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "tables" +
    "/" +
    table_id
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

///| bigquery.tables.getIamPolicy

///|
/// Gets the access control policy for a resource. Returns an empty policy if the resource exists and does not have a policy set.
pub async fn BigqueryService::tables_get_iam_policy(
  self : BigqueryService,
  resource : String,
) -> Policy raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + resource + "/" + ":getIamPolicy"
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

///| bigquery.tables.insert

///|
/// Creates a new, empty table in the dataset.
pub async fn BigqueryService::tables_insert(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
) -> Table raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "tables"
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

///| bigquery.tables.list

///|
/// Lists all tables in the specified dataset. Requires the READER dataset role.
pub async fn BigqueryService::tables_list(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  max_results? : Int? = None,
  page_token? : String? = None,
) -> TableList raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match max_results {
    Some(v) => qp.push(("maxResults", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "tables"
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

///| bigquery.tables.patch

///|
/// Updates information in an existing table. The update method replaces the entire table resource, whereas the patch method only replaces fields that are provided in the submitted table resource. This method supports RFC5789 patch semantics.
pub async fn BigqueryService::tables_patch(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  table_id : String,
  autodetect_schema? : Bool? = None,
) -> Table raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match autodetect_schema {
    Some(v) => qp.push(("autodetect_schema", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "tables" +
    "/" +
    table_id
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

///| bigquery.tables.setIamPolicy

///|
/// Sets the access control policy on the specified resource. Replaces any existing policy. Can return `NOT_FOUND`, `INVALID_ARGUMENT`, and `PERMISSION_DENIED` errors.
pub async fn BigqueryService::tables_set_iam_policy(
  self : BigqueryService,
  resource : String,
) -> Policy raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + resource + "/" + ":setIamPolicy"
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

///| bigquery.tables.testIamPermissions

///|
/// Returns permissions that a caller has on the specified resource. If the resource does not exist, this will return an empty set of permissions, not a `NOT_FOUND` error. Note: This operation is designed to be used for building permission-aware UIs and command-line tools, not for authorization checking. This operation may "fail open" without warning.
pub async fn BigqueryService::tables_test_iam_permissions(
  self : BigqueryService,
  resource : String,
) -> TestIamPermissionsResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + resource + "/" + ":testIamPermissions"
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

///| bigquery.tables.update

///|
/// Updates information in an existing table. The update method replaces the entire Table resource, whereas the patch method only replaces fields that are provided in the submitted Table resource.
pub async fn BigqueryService::tables_update(
  self : BigqueryService,
  project_id : String,
  dataset_id : String,
  table_id : String,
  autodetect_schema? : Bool? = None,
) -> Table raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match autodetect_schema {
    Some(v) => qp.push(("autodetect_schema", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "datasets" +
    "/" +
    dataset_id +
    "/" +
    "tables" +
    "/" +
    table_id
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
