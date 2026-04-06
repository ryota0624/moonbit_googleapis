///| API client for cloudtasks v2

///| Base URL: https://cloudtasks.googleapis.com/

///|
pub struct CloudtasksService {
  base_url : String
  get_token : async () -> String
  client : &@http.HttpClient
}

///|
pub fn CloudtasksService::new(
  client : &@http.HttpClient,
  get_token : async () -> String,
) -> CloudtasksService {
  CloudtasksService::{
    base_url: "https://cloudtasks.googleapis.com",
    get_token,
    client,
  }
}

///|
async fn CloudtasksService::auth_headers(
  self : CloudtasksService,
) -> Map[String, String] raise @http.HttpError {
  let token = (self.get_token)() catch {
    e => raise @http.HttpError::NetworkError(e.to_string())
  }
  { "Authorization": "Bearer " + token, "Accept": "application/json" }
}

///| cloudtasks.projects.locations.get

///|
/// Gets information about a location.
pub async fn CloudtasksService::projects_locations_get(
  self : CloudtasksService,
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

///| cloudtasks.projects.locations.getCmekConfig

///|
/// Gets the CMEK config. Gets the Customer Managed Encryption Key configured with the Cloud Tasks lcoation. By default there is no kms_key configured.
pub async fn CloudtasksService::projects_locations_get_cmek_config(
  self : CloudtasksService,
  name : String,
) -> CmekConfig raise @http.HttpError {
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

///| cloudtasks.projects.locations.list

///|
/// Lists information about the supported locations for this service. This method lists locations based on the resource scope provided in the [ListLocationsRequest.name] field: * **Global locations**: If `name` is empty, the method lists the public locations available to all projects. * **Project-specific locations**: If `name` follows the format `projects/{project}`, the method lists locations visible to that specific project. This includes public, private, or other project-specific locations enabled for the project. For gRPC and client library implementations, the resource name is passed as the `name` field. For direct service calls, the resource name is incorporated into the request path based on the specific service implementation and version.
pub async fn CloudtasksService::projects_locations_list(
  self : CloudtasksService,
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

///| cloudtasks.projects.locations.updateCmekConfig

///|
/// Creates or Updates a CMEK config. Updates the Customer Managed Encryption Key associated with the Cloud Tasks location (Creates if the key does not already exist). All new tasks created in the location will be encrypted at-rest with the KMS-key provided in the config.
pub async fn CloudtasksService::projects_locations_update_cmek_config(
  self : CloudtasksService,
  name : String,
  update_mask? : String? = None,
) -> CmekConfig raise @http.HttpError {
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

///| cloudtasks.projects.locations.queues.create

///|
/// Creates a queue. Queues created with this method allow tasks to live for a maximum of 31 days. After a task is 31 days old, the task will be deleted regardless of whether it was dispatched or not. WARNING: Using this method may have unintended side effects if you are using an App Engine `queue.yaml` or `queue.xml` file to manage your queues. Read [Overview of Queue Management and queue.yaml](https://cloud.google.com/tasks/docs/queue-yaml) before using this method.
pub async fn CloudtasksService::projects_locations_queues_create(
  self : CloudtasksService,
  parent : String,
) -> Queue raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "queues"
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

///| cloudtasks.projects.locations.queues.delete

///|
/// Deletes a queue. This command will delete the queue even if it has tasks in it. Note: If you delete a queue, you may be prevented from creating a new queue with the same name as the deleted queue for a tombstone window of up to 3 days. During this window, the CreateQueue operation may appear to recreate the queue, but this can be misleading. If you attempt to create a queue with the same name as one that is in the tombstone window, run GetQueue to confirm that the queue creation was successful. If GetQueue returns 200 response code, your queue was successfully created with the name of the previously deleted queue. Otherwise, your queue did not successfully recreate. WARNING: Using this method may have unintended side effects if you are using an App Engine `queue.yaml` or `queue.xml` file to manage your queues. Read [Overview of Queue Management and queue.yaml](https://cloud.google.com/tasks/docs/queue-yaml) before using this method.
pub async fn CloudtasksService::projects_locations_queues_delete(
  self : CloudtasksService,
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

///| cloudtasks.projects.locations.queues.get

///|
/// Gets a queue.
pub async fn CloudtasksService::projects_locations_queues_get(
  self : CloudtasksService,
  name : String,
) -> Queue raise @http.HttpError {
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

///| cloudtasks.projects.locations.queues.getIamPolicy

///|
/// Gets the access control policy for a Queue. Returns an empty policy if the resource exists and does not have a policy set. Authorization requires the following [Google IAM](https://cloud.google.com/iam) permission on the specified resource parent: * `cloudtasks.queues.getIamPolicy`
pub async fn CloudtasksService::projects_locations_queues_get_iam_policy(
  self : CloudtasksService,
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

///| cloudtasks.projects.locations.queues.list

///|
/// Lists queues. Queues are returned in lexicographical order.
pub async fn CloudtasksService::projects_locations_queues_list(
  self : CloudtasksService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListQueuesResponse raise @http.HttpError {
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
  let path = "/" + "v2" + "/" + parent + "/" + "queues"
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

///| cloudtasks.projects.locations.queues.patch

///|
/// Updates a queue. This method creates the queue if it does not exist and updates the queue if it does exist. Queues created with this method allow tasks to live for a maximum of 31 days. After a task is 31 days old, the task will be deleted regardless of whether it was dispatched or not. WARNING: Using this method may have unintended side effects if you are using an App Engine `queue.yaml` or `queue.xml` file to manage your queues. Read [Overview of Queue Management and queue.yaml](https://cloud.google.com/tasks/docs/queue-yaml) before using this method.
pub async fn CloudtasksService::projects_locations_queues_patch(
  self : CloudtasksService,
  name : String,
  update_mask? : String? = None,
) -> Queue raise @http.HttpError {
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

///| cloudtasks.projects.locations.queues.pause

///|
/// Pauses the queue. If a queue is paused then the system will stop dispatching tasks until the queue is resumed via ResumeQueue. Tasks can still be added when the queue is paused. A queue is paused if its state is PAUSED.
pub async fn CloudtasksService::projects_locations_queues_pause(
  self : CloudtasksService,
  name : String,
) -> Queue raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":pause"
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

///| cloudtasks.projects.locations.queues.purge

///|
/// Purges a queue by deleting all of its tasks. All tasks created before this method is called are permanently deleted. Purge operations can take up to one minute to take effect. Tasks might be dispatched before the purge takes effect. A purge is irreversible.
pub async fn CloudtasksService::projects_locations_queues_purge(
  self : CloudtasksService,
  name : String,
) -> Queue raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":purge"
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

///| cloudtasks.projects.locations.queues.resume

///|
/// Resume a queue. This method resumes a queue after it has been PAUSED or DISABLED. The state of a queue is stored in the queue's state; after calling this method it will be set to RUNNING. WARNING: Resuming many high-QPS queues at the same time can lead to target overloading. If you are resuming high-QPS queues, follow the 500/50/5 pattern described in [Managing Cloud Tasks Scaling Risks](https://cloud.google.com/tasks/docs/manage-cloud-task-scaling).
pub async fn CloudtasksService::projects_locations_queues_resume(
  self : CloudtasksService,
  name : String,
) -> Queue raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":resume"
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

///| cloudtasks.projects.locations.queues.setIamPolicy

///|
/// Sets the access control policy for a Queue. Replaces any existing policy. Note: The Cloud Console does not check queue-level IAM permissions yet. Project-level permissions are required to use the Cloud Console. Authorization requires the following [Google IAM](https://cloud.google.com/iam) permission on the specified resource parent: * `cloudtasks.queues.setIamPolicy`
pub async fn CloudtasksService::projects_locations_queues_set_iam_policy(
  self : CloudtasksService,
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

///| cloudtasks.projects.locations.queues.testIamPermissions

///|
/// Returns permissions that a caller has on a Queue. If the resource does not exist, this will return an empty set of permissions, not a NOT_FOUND error. Note: This operation is designed to be used for building permission-aware UIs and command-line tools, not for authorization checking. This operation may "fail open" without warning.
pub async fn CloudtasksService::projects_locations_queues_test_iam_permissions(
  self : CloudtasksService,
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

///| cloudtasks.projects.locations.queues.tasks.buffer

///|
/// Creates and buffers a new task without the need to explicitly define a Task message. The queue must have HTTP target. To create the task with a custom ID, use the following format and set TASK_ID to your desired ID: projects/PROJECT_ID/locations/LOCATION_ID/queues/QUEUE_ID/tasks/TASK_ID:buffer To create the task with an automatically generated ID, use the following format: projects/PROJECT_ID/locations/LOCATION_ID/queues/QUEUE_ID/tasks:buffer.
pub async fn CloudtasksService::projects_locations_queues_tasks_buffer(
  self : CloudtasksService,
  queue : String,
  task_id : String,
) -> BufferTaskResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "v2" +
    "/" +
    queue +
    "/" +
    "tasks" +
    "/" +
    task_id +
    "/" +
    ":buffer"
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

///| cloudtasks.projects.locations.queues.tasks.create

///|
/// Creates a task and adds it to a queue. Tasks cannot be updated after creation; there is no UpdateTask command. * The maximum task size is 100KB.
pub async fn CloudtasksService::projects_locations_queues_tasks_create(
  self : CloudtasksService,
  parent : String,
) -> Task raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + parent + "/" + "tasks"
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

///| cloudtasks.projects.locations.queues.tasks.delete

///|
/// Deletes a task. A task can be deleted if it is scheduled or dispatched. A task cannot be deleted if it has executed successfully or permanently failed.
pub async fn CloudtasksService::projects_locations_queues_tasks_delete(
  self : CloudtasksService,
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

///| cloudtasks.projects.locations.queues.tasks.get

///|
/// Gets a task. After a task is successfully executed or has exhausted its retry attempts, the task is deleted. A `GetTask` request for a deleted task returns a `NOT_FOUND` error.
pub async fn CloudtasksService::projects_locations_queues_tasks_get(
  self : CloudtasksService,
  name : String,
  response_view? : String? = None,
) -> Task raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match response_view {
    Some(v) => qp.push(("responseView", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v2" + "/" + name
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

///| cloudtasks.projects.locations.queues.tasks.list

///|
/// Lists the tasks in a queue. By default, only the BASIC view is retrieved due to performance considerations; response_view controls the subset of information which is returned. The tasks may be returned in any order. The ordering may change at any time.
pub async fn CloudtasksService::projects_locations_queues_tasks_list(
  self : CloudtasksService,
  parent : String,
  page_size? : Int? = None,
  page_token? : String? = None,
  response_view? : String? = None,
) -> ListTasksResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match response_view {
    Some(v) => qp.push(("responseView", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v2" + "/" + parent + "/" + "tasks"
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

///| cloudtasks.projects.locations.queues.tasks.run

///|
/// Forces a task to run now. When this method is called, Cloud Tasks will dispatch the task, even if the task is already running, the queue has reached its RateLimits or is PAUSED. This command is meant to be used for manual debugging. For example, RunTask can be used to retry a failed task after a fix has been made or to manually force a task to be dispatched now. If Cloud Tasks receives a successful response from the task's target, then the task will be deleted; otherwise the task's schedule_time will be reset to the time that RunTask was called plus the retry delay specified in the queue's RetryConfig. RunTask returns NOT_FOUND when it is called on a task that has already succeeded or permanently failed.
pub async fn CloudtasksService::projects_locations_queues_tasks_run(
  self : CloudtasksService,
  name : String,
) -> Task raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v2" + "/" + name + "/" + ":run"
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
