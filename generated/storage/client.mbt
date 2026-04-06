///| API client for storage v1

///| Base URL: https://storage.googleapis.com/storage/v1/

///|
pub struct StorageService {
  base_url : String
  get_token : async () -> String
  client : &@http.HttpClient
}

///|
pub fn StorageService::new(
  client : &@http.HttpClient,
  get_token : async () -> String,
) -> StorageService {
  StorageService::{
    base_url: "https://storage.googleapis.com/storage/v1",
    get_token,
    client,
  }
}

///|
async fn StorageService::auth_headers(
  self : StorageService,
) -> Map[String, String] raise @http.HttpError {
  let token = (self.get_token)() catch {
    e => raise @http.HttpError::NetworkError(e.to_string())
  }
  { "Authorization": "Bearer " + token, "Accept": "application/json" }
}

///| storage.anywhereCaches.disable

///|
/// Disables an Anywhere Cache instance.
pub async fn StorageService::anywhere_caches_disable(
  self : StorageService,
  bucket : String,
  anywhere_cache_id : String,
) -> AnywhereCache raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "anywhereCaches" +
    "/" +
    anywhere_cache_id +
    "/" +
    "disable"
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

///| storage.anywhereCaches.get

///|
/// Returns the metadata of an Anywhere Cache instance.
pub async fn StorageService::anywhere_caches_get(
  self : StorageService,
  bucket : String,
  anywhere_cache_id : String,
) -> AnywhereCache raise @http.HttpError {
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "anywhereCaches" +
    "/" +
    anywhere_cache_id
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

///| storage.anywhereCaches.insert

///|
/// Creates an Anywhere Cache instance.
pub async fn StorageService::anywhere_caches_insert(
  self : StorageService,
  bucket : String,
) -> GoogleLongrunningOperation raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "anywhereCaches"
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

///| storage.anywhereCaches.list

///|
/// Returns a list of Anywhere Cache instances of the bucket matching the criteria.
pub async fn StorageService::anywhere_caches_list(
  self : StorageService,
  bucket : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> AnywhereCaches raise @http.HttpError {
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
  let path = "/" + "b" + "/" + bucket + "/" + "anywhereCaches"
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

///| storage.anywhereCaches.pause

///|
/// Pauses an Anywhere Cache instance.
pub async fn StorageService::anywhere_caches_pause(
  self : StorageService,
  bucket : String,
  anywhere_cache_id : String,
) -> AnywhereCache raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "anywhereCaches" +
    "/" +
    anywhere_cache_id +
    "/" +
    "pause"
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

///| storage.anywhereCaches.resume

///|
/// Resumes a paused or disabled Anywhere Cache instance.
pub async fn StorageService::anywhere_caches_resume(
  self : StorageService,
  bucket : String,
  anywhere_cache_id : String,
) -> AnywhereCache raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "anywhereCaches" +
    "/" +
    anywhere_cache_id +
    "/" +
    "resume"
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

///| storage.anywhereCaches.update

///|
/// Updates the config(ttl and admissionPolicy) of an Anywhere Cache instance.
pub async fn StorageService::anywhere_caches_update(
  self : StorageService,
  bucket : String,
  anywhere_cache_id : String,
) -> GoogleLongrunningOperation raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "anywhereCaches" +
    "/" +
    anywhere_cache_id
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

///| storage.bucketAccessControls.delete

///|
/// Permanently deletes the ACL entry for the specified entity on the specified bucket.
pub async fn StorageService::bucket_access_controls_delete(
  self : StorageService,
  bucket : String,
  entity : String,
  user_project? : String? = None,
) -> @http.HttpResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "acl" + "/" + entity
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

///| storage.bucketAccessControls.get

///|
/// Returns the ACL entry for the specified entity on the specified bucket.
pub async fn StorageService::bucket_access_controls_get(
  self : StorageService,
  bucket : String,
  entity : String,
  user_project? : String? = None,
) -> BucketAccessControl raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "acl" + "/" + entity
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

///| storage.bucketAccessControls.insert

///|
/// Creates a new ACL entry on the specified bucket.
pub async fn StorageService::bucket_access_controls_insert(
  self : StorageService,
  bucket : String,
  user_project? : String? = None,
) -> BucketAccessControl raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "acl"
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

///| storage.bucketAccessControls.list

///|
/// Retrieves ACL entries on the specified bucket.
pub async fn StorageService::bucket_access_controls_list(
  self : StorageService,
  bucket : String,
  user_project? : String? = None,
) -> BucketAccessControls raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "acl"
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

///| storage.bucketAccessControls.patch

///|
/// Patches an ACL entry on the specified bucket.
pub async fn StorageService::bucket_access_controls_patch(
  self : StorageService,
  bucket : String,
  entity : String,
  user_project? : String? = None,
) -> BucketAccessControl raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "acl" + "/" + entity
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

///| storage.bucketAccessControls.update

///|
/// Updates an ACL entry on the specified bucket.
pub async fn StorageService::bucket_access_controls_update(
  self : StorageService,
  bucket : String,
  entity : String,
  user_project? : String? = None,
) -> BucketAccessControl raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "acl" + "/" + entity
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

///| storage.buckets.delete

///|
/// Deletes an empty bucket. Deletions are permanent unless soft delete is enabled on the bucket.
pub async fn StorageService::buckets_delete(
  self : StorageService,
  bucket : String,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
  user_project? : String? = None,
) -> @http.HttpResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket
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

///| storage.buckets.get

///|
/// Returns metadata for the specified bucket.
pub async fn StorageService::buckets_get(
  self : StorageService,
  bucket : String,
  generation? : String? = None,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
  projection? : String? = None,
  soft_deleted? : Bool? = None,
  user_project? : String? = None,
) -> Bucket raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match generation {
    Some(v) => qp.push(("generation", url_encode(v)))
    None => ()
  }
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  match projection {
    Some(v) => qp.push(("projection", url_encode(v)))
    None => ()
  }
  match soft_deleted {
    Some(v) => qp.push(("softDeleted", if v { "true" } else { "false" }))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket
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

///| storage.buckets.getIamPolicy

///|
/// Returns an IAM policy for the specified bucket.
pub async fn StorageService::buckets_get_iam_policy(
  self : StorageService,
  bucket : String,
  options_requested_policy_version? : Int? = None,
  user_project? : String? = None,
) -> Policy raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match options_requested_policy_version {
    Some(v) => qp.push(("optionsRequestedPolicyVersion", v.to_string()))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "iam"
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

///| storage.buckets.getStorageLayout

///|
/// Returns the storage layout configuration for the specified bucket. Note that this operation requires storage.objects.list permission.
pub async fn StorageService::buckets_get_storage_layout(
  self : StorageService,
  bucket : String,
  prefix? : String? = None,
) -> BucketStorageLayout raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match prefix {
    Some(v) => qp.push(("prefix", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "storageLayout"
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

///| storage.buckets.insert

///|
/// Creates a new bucket.
pub async fn StorageService::buckets_insert(
  self : StorageService,
  enable_object_retention? : Bool? = None,
  predefined_acl? : String? = None,
  predefined_default_object_acl? : String? = None,
  project? : String? = None,
  projection? : String? = None,
  user_project? : String? = None,
) -> Bucket raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match enable_object_retention {
    Some(v) =>
      qp.push(("enableObjectRetention", if v { "true" } else { "false" }))
    None => ()
  }
  match predefined_acl {
    Some(v) => qp.push(("predefinedAcl", url_encode(v)))
    None => ()
  }
  match predefined_default_object_acl {
    Some(v) => qp.push(("predefinedDefaultObjectAcl", url_encode(v)))
    None => ()
  }
  match project {
    Some(v) => qp.push(("project", url_encode(v)))
    None => ()
  }
  match projection {
    Some(v) => qp.push(("projection", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b"
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

///| storage.buckets.list

///|
/// Retrieves a list of buckets for a given project.
pub async fn StorageService::buckets_list(
  self : StorageService,
  max_results? : Int? = None,
  page_token? : String? = None,
  prefix? : String? = None,
  project? : String? = None,
  projection? : String? = None,
  return_partial_success? : Bool? = None,
  soft_deleted? : Bool? = None,
  user_project? : String? = None,
) -> Buckets raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match max_results {
    Some(v) => qp.push(("maxResults", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match prefix {
    Some(v) => qp.push(("prefix", url_encode(v)))
    None => ()
  }
  match project {
    Some(v) => qp.push(("project", url_encode(v)))
    None => ()
  }
  match projection {
    Some(v) => qp.push(("projection", url_encode(v)))
    None => ()
  }
  match return_partial_success {
    Some(v) =>
      qp.push(("returnPartialSuccess", if v { "true" } else { "false" }))
    None => ()
  }
  match soft_deleted {
    Some(v) => qp.push(("softDeleted", if v { "true" } else { "false" }))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b"
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

///| storage.buckets.lockRetentionPolicy

///|
/// Locks retention policy on a bucket.
pub async fn StorageService::buckets_lock_retention_policy(
  self : StorageService,
  bucket : String,
  if_metageneration_match? : String? = None,
  user_project? : String? = None,
) -> Bucket raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "lockRetentionPolicy"
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

///| storage.buckets.patch

///|
/// Patches a bucket. Changes to the bucket will be readable immediately after writing, but configuration changes may take time to propagate.
pub async fn StorageService::buckets_patch(
  self : StorageService,
  bucket : String,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
  predefined_acl? : String? = None,
  predefined_default_object_acl? : String? = None,
  projection? : String? = None,
  user_project? : String? = None,
) -> Bucket raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  match predefined_acl {
    Some(v) => qp.push(("predefinedAcl", url_encode(v)))
    None => ()
  }
  match predefined_default_object_acl {
    Some(v) => qp.push(("predefinedDefaultObjectAcl", url_encode(v)))
    None => ()
  }
  match projection {
    Some(v) => qp.push(("projection", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket
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

///| storage.buckets.relocate

///|
/// Initiates a long-running Relocate Bucket operation on the specified bucket.
pub async fn StorageService::buckets_relocate(
  self : StorageService,
  bucket : String,
) -> GoogleLongrunningOperation raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "relocate"
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

///| storage.buckets.restore

///|
/// Restores a soft-deleted bucket.
pub async fn StorageService::buckets_restore(
  self : StorageService,
  bucket : String,
  generation? : String? = None,
  projection? : String? = None,
  user_project? : String? = None,
) -> Bucket raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match generation {
    Some(v) => qp.push(("generation", url_encode(v)))
    None => ()
  }
  match projection {
    Some(v) => qp.push(("projection", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "restore"
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

///| storage.buckets.setIamPolicy

///|
/// Updates an IAM policy for the specified bucket.
pub async fn StorageService::buckets_set_iam_policy(
  self : StorageService,
  bucket : String,
  user_project? : String? = None,
) -> Policy raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "iam"
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

///| storage.buckets.testIamPermissions

///|
/// Tests a set of permissions on the given bucket to see which, if any, are held by the caller.
pub async fn StorageService::buckets_test_iam_permissions(
  self : StorageService,
  bucket : String,
  permissions? : String? = None,
  user_project? : String? = None,
) -> TestIamPermissionsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match permissions {
    Some(v) => qp.push(("permissions", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "iam" + "/" + "testPermissions"
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

///| storage.buckets.update

///|
/// Updates a bucket. Changes to the bucket will be readable immediately after writing, but configuration changes may take time to propagate.
pub async fn StorageService::buckets_update(
  self : StorageService,
  bucket : String,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
  predefined_acl? : String? = None,
  predefined_default_object_acl? : String? = None,
  projection? : String? = None,
  user_project? : String? = None,
) -> Bucket raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  match predefined_acl {
    Some(v) => qp.push(("predefinedAcl", url_encode(v)))
    None => ()
  }
  match predefined_default_object_acl {
    Some(v) => qp.push(("predefinedDefaultObjectAcl", url_encode(v)))
    None => ()
  }
  match projection {
    Some(v) => qp.push(("projection", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket
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

///| storage.channels.stop

///|
/// Stop watching resources through this channel
pub async fn StorageService::channels_stop(
  self : StorageService,
) -> @http.HttpResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "channels" + "/" + "stop"
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

///| storage.defaultObjectAccessControls.delete

///|
/// Permanently deletes the default object ACL entry for the specified entity on the specified bucket.
pub async fn StorageService::default_object_access_controls_delete(
  self : StorageService,
  bucket : String,
  entity : String,
  user_project? : String? = None,
) -> @http.HttpResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "defaultObjectAcl" + "/" + entity
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

///| storage.defaultObjectAccessControls.get

///|
/// Returns the default object ACL entry for the specified entity on the specified bucket.
pub async fn StorageService::default_object_access_controls_get(
  self : StorageService,
  bucket : String,
  entity : String,
  user_project? : String? = None,
) -> ObjectAccessControl raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "defaultObjectAcl" + "/" + entity
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

///| storage.defaultObjectAccessControls.insert

///|
/// Creates a new default object ACL entry on the specified bucket.
pub async fn StorageService::default_object_access_controls_insert(
  self : StorageService,
  bucket : String,
  user_project? : String? = None,
) -> ObjectAccessControl raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "defaultObjectAcl"
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

///| storage.defaultObjectAccessControls.list

///|
/// Retrieves default object ACL entries on the specified bucket.
pub async fn StorageService::default_object_access_controls_list(
  self : StorageService,
  bucket : String,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
  user_project? : String? = None,
) -> ObjectAccessControls raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "defaultObjectAcl"
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

///| storage.defaultObjectAccessControls.patch

///|
/// Patches a default object ACL entry on the specified bucket.
pub async fn StorageService::default_object_access_controls_patch(
  self : StorageService,
  bucket : String,
  entity : String,
  user_project? : String? = None,
) -> ObjectAccessControl raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "defaultObjectAcl" + "/" + entity
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

///| storage.defaultObjectAccessControls.update

///|
/// Updates a default object ACL entry on the specified bucket.
pub async fn StorageService::default_object_access_controls_update(
  self : StorageService,
  bucket : String,
  entity : String,
  user_project? : String? = None,
) -> ObjectAccessControl raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "defaultObjectAcl" + "/" + entity
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

///| storage.folders.delete

///|
/// Permanently deletes a folder. Only applicable to buckets with hierarchical namespace enabled.
pub async fn StorageService::folders_delete(
  self : StorageService,
  bucket : String,
  folder : String,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
) -> @http.HttpResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "folders" + "/" + folder
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

///| storage.folders.deleteRecursive

///|
/// Deletes a folder recursively. Only applicable to buckets with hierarchical namespace enabled.
pub async fn StorageService::folders_delete_recursive(
  self : StorageService,
  bucket : String,
  folder : String,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
) -> GoogleLongrunningOperation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "folders" +
    "/" +
    folder +
    "/" +
    "deleteRecursive"
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

///| storage.folders.get

///|
/// Returns metadata for the specified folder. Only applicable to buckets with hierarchical namespace enabled.
pub async fn StorageService::folders_get(
  self : StorageService,
  bucket : String,
  folder : String,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
) -> Folder raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "folders" + "/" + folder
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

///| storage.folders.insert

///|
/// Creates a new folder. Only applicable to buckets with hierarchical namespace enabled.
pub async fn StorageService::folders_insert(
  self : StorageService,
  bucket : String,
  recursive? : Bool? = None,
) -> Folder raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match recursive {
    Some(v) => qp.push(("recursive", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "folders"
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

///| storage.folders.list

///|
/// Retrieves a list of folders matching the criteria. Only applicable to buckets with hierarchical namespace enabled.
pub async fn StorageService::folders_list(
  self : StorageService,
  bucket : String,
  delimiter? : String? = None,
  end_offset? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  prefix? : String? = None,
  start_offset? : String? = None,
) -> Folders raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match delimiter {
    Some(v) => qp.push(("delimiter", url_encode(v)))
    None => ()
  }
  match end_offset {
    Some(v) => qp.push(("endOffset", url_encode(v)))
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
  match prefix {
    Some(v) => qp.push(("prefix", url_encode(v)))
    None => ()
  }
  match start_offset {
    Some(v) => qp.push(("startOffset", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "folders"
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

///| storage.folders.rename

///|
/// Renames a source folder to a destination folder. Only applicable to buckets with hierarchical namespace enabled.
pub async fn StorageService::folders_rename(
  self : StorageService,
  bucket : String,
  source_folder : String,
  destination_folder : String,
  if_source_metageneration_match? : String? = None,
  if_source_metageneration_not_match? : String? = None,
) -> GoogleLongrunningOperation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match if_source_metageneration_match {
    Some(v) => qp.push(("ifSourceMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_source_metageneration_not_match {
    Some(v) => qp.push(("ifSourceMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "folders" +
    "/" +
    source_folder +
    "/" +
    "renameTo" +
    "/" +
    "folders" +
    "/" +
    destination_folder
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

///| storage.managedFolders.delete

///|
/// Permanently deletes a managed folder.
pub async fn StorageService::managed_folders_delete(
  self : StorageService,
  bucket : String,
  managed_folder : String,
  allow_non_empty? : Bool? = None,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
) -> @http.HttpResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match allow_non_empty {
    Some(v) => qp.push(("allowNonEmpty", if v { "true" } else { "false" }))
    None => ()
  }
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "managedFolders" +
    "/" +
    managed_folder
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

///| storage.managedFolders.get

///|
/// Returns metadata of the specified managed folder.
pub async fn StorageService::managed_folders_get(
  self : StorageService,
  bucket : String,
  managed_folder : String,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
) -> ManagedFolder raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "managedFolders" +
    "/" +
    managed_folder
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

///| storage.managedFolders.getIamPolicy

///|
/// Returns an IAM policy for the specified managed folder.
pub async fn StorageService::managed_folders_get_iam_policy(
  self : StorageService,
  bucket : String,
  managed_folder : String,
  options_requested_policy_version? : Int? = None,
  user_project? : String? = None,
) -> Policy raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match options_requested_policy_version {
    Some(v) => qp.push(("optionsRequestedPolicyVersion", v.to_string()))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "managedFolders" +
    "/" +
    managed_folder +
    "/" +
    "iam"
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

///| storage.managedFolders.insert

///|
/// Creates a new managed folder.
pub async fn StorageService::managed_folders_insert(
  self : StorageService,
  bucket : String,
) -> ManagedFolder raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "managedFolders"
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

///| storage.managedFolders.list

///|
/// Lists managed folders in the given bucket.
pub async fn StorageService::managed_folders_list(
  self : StorageService,
  bucket : String,
  page_size? : Int? = None,
  page_token? : String? = None,
  prefix? : String? = None,
) -> ManagedFolders raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match prefix {
    Some(v) => qp.push(("prefix", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "managedFolders"
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

///| storage.managedFolders.setIamPolicy

///|
/// Updates an IAM policy for the specified managed folder.
pub async fn StorageService::managed_folders_set_iam_policy(
  self : StorageService,
  bucket : String,
  managed_folder : String,
  user_project? : String? = None,
) -> Policy raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "managedFolders" +
    "/" +
    managed_folder +
    "/" +
    "iam"
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

///| storage.managedFolders.testIamPermissions

///|
/// Tests a set of permissions on the given managed folder to see which, if any, are held by the caller.
pub async fn StorageService::managed_folders_test_iam_permissions(
  self : StorageService,
  bucket : String,
  managed_folder : String,
  permissions? : String? = None,
  user_project? : String? = None,
) -> TestIamPermissionsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match permissions {
    Some(v) => qp.push(("permissions", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "managedFolders" +
    "/" +
    managed_folder +
    "/" +
    "iam" +
    "/" +
    "testPermissions"
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

///| storage.notifications.delete

///|
/// Permanently deletes a notification subscription.
pub async fn StorageService::notifications_delete(
  self : StorageService,
  bucket : String,
  notification : String,
  user_project? : String? = None,
) -> @http.HttpResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "notificationConfigs" +
    "/" +
    notification
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

///| storage.notifications.get

///|
/// View a notification configuration.
pub async fn StorageService::notifications_get(
  self : StorageService,
  bucket : String,
  notification : String,
  user_project? : String? = None,
) -> Notification raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "notificationConfigs" +
    "/" +
    notification
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

///| storage.notifications.insert

///|
/// Creates a notification subscription for a given bucket.
pub async fn StorageService::notifications_insert(
  self : StorageService,
  bucket : String,
  user_project? : String? = None,
) -> Notification raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "notificationConfigs"
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

///| storage.notifications.list

///|
/// Retrieves a list of notification subscriptions for a given bucket.
pub async fn StorageService::notifications_list(
  self : StorageService,
  bucket : String,
  user_project? : String? = None,
) -> Notifications raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "notificationConfigs"
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

///| storage.objectAccessControls.delete

///|
/// Permanently deletes the ACL entry for the specified entity on the specified object.
pub async fn StorageService::object_access_controls_delete(
  self : StorageService,
  bucket : String,
  object : String,
  entity : String,
  generation? : String? = None,
  user_project? : String? = None,
) -> @http.HttpResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match generation {
    Some(v) => qp.push(("generation", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "o" +
    "/" +
    object +
    "/" +
    "acl" +
    "/" +
    entity
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

///| storage.objectAccessControls.get

///|
/// Returns the ACL entry for the specified entity on the specified object.
pub async fn StorageService::object_access_controls_get(
  self : StorageService,
  bucket : String,
  object : String,
  entity : String,
  generation? : String? = None,
  user_project? : String? = None,
) -> ObjectAccessControl raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match generation {
    Some(v) => qp.push(("generation", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "o" +
    "/" +
    object +
    "/" +
    "acl" +
    "/" +
    entity
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

///| storage.objectAccessControls.insert

///|
/// Creates a new ACL entry on the specified object.
pub async fn StorageService::object_access_controls_insert(
  self : StorageService,
  bucket : String,
  object : String,
  generation? : String? = None,
  user_project? : String? = None,
) -> ObjectAccessControl raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match generation {
    Some(v) => qp.push(("generation", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "o" + "/" + object + "/" + "acl"
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

///| storage.objectAccessControls.list

///|
/// Retrieves ACL entries on the specified object.
pub async fn StorageService::object_access_controls_list(
  self : StorageService,
  bucket : String,
  object : String,
  generation? : String? = None,
  user_project? : String? = None,
) -> ObjectAccessControls raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match generation {
    Some(v) => qp.push(("generation", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "o" + "/" + object + "/" + "acl"
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

///| storage.objectAccessControls.patch

///|
/// Patches an ACL entry on the specified object.
pub async fn StorageService::object_access_controls_patch(
  self : StorageService,
  bucket : String,
  object : String,
  entity : String,
  generation? : String? = None,
  user_project? : String? = None,
) -> ObjectAccessControl raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match generation {
    Some(v) => qp.push(("generation", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "o" +
    "/" +
    object +
    "/" +
    "acl" +
    "/" +
    entity
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

///| storage.objectAccessControls.update

///|
/// Updates an ACL entry on the specified object.
pub async fn StorageService::object_access_controls_update(
  self : StorageService,
  bucket : String,
  object : String,
  entity : String,
  generation? : String? = None,
  user_project? : String? = None,
) -> ObjectAccessControl raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match generation {
    Some(v) => qp.push(("generation", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "o" +
    "/" +
    object +
    "/" +
    "acl" +
    "/" +
    entity
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

///| storage.objects.bulkRestore

///|
/// Initiates a long-running bulk restore operation on the specified bucket.
pub async fn StorageService::objects_bulk_restore(
  self : StorageService,
  bucket : String,
) -> GoogleLongrunningOperation raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "o" + "/" + "bulkRestore"
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

///| storage.objects.compose

///|
/// Concatenates a list of existing objects into a new object in the same bucket.
pub async fn StorageService::objects_compose(
  self : StorageService,
  destination_bucket : String,
  destination_object : String,
  destination_predefined_acl? : String? = None,
  drop_context_groups? : String? = None,
  if_generation_match? : String? = None,
  if_metageneration_match? : String? = None,
  kms_key_name? : String? = None,
  user_project? : String? = None,
) -> Object raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match destination_predefined_acl {
    Some(v) => qp.push(("destinationPredefinedAcl", url_encode(v)))
    None => ()
  }
  match drop_context_groups {
    Some(v) => qp.push(("dropContextGroups", url_encode(v)))
    None => ()
  }
  match if_generation_match {
    Some(v) => qp.push(("ifGenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match kms_key_name {
    Some(v) => qp.push(("kmsKeyName", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "b" +
    "/" +
    destination_bucket +
    "/" +
    "o" +
    "/" +
    destination_object +
    "/" +
    "compose"
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

///| storage.objects.copy

///|
/// Copies a source object to a destination object. Optionally overrides metadata.
pub async fn StorageService::objects_copy(
  self : StorageService,
  source_bucket : String,
  source_object : String,
  destination_bucket : String,
  destination_object : String,
  destination_kms_key_name? : String? = None,
  destination_predefined_acl? : String? = None,
  if_generation_match? : String? = None,
  if_generation_not_match? : String? = None,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
  if_source_generation_match? : String? = None,
  if_source_generation_not_match? : String? = None,
  if_source_metageneration_match? : String? = None,
  if_source_metageneration_not_match? : String? = None,
  projection? : String? = None,
  source_generation? : String? = None,
  user_project? : String? = None,
) -> Object raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match destination_kms_key_name {
    Some(v) => qp.push(("destinationKmsKeyName", url_encode(v)))
    None => ()
  }
  match destination_predefined_acl {
    Some(v) => qp.push(("destinationPredefinedAcl", url_encode(v)))
    None => ()
  }
  match if_generation_match {
    Some(v) => qp.push(("ifGenerationMatch", url_encode(v)))
    None => ()
  }
  match if_generation_not_match {
    Some(v) => qp.push(("ifGenerationNotMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  match if_source_generation_match {
    Some(v) => qp.push(("ifSourceGenerationMatch", url_encode(v)))
    None => ()
  }
  match if_source_generation_not_match {
    Some(v) => qp.push(("ifSourceGenerationNotMatch", url_encode(v)))
    None => ()
  }
  match if_source_metageneration_match {
    Some(v) => qp.push(("ifSourceMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_source_metageneration_not_match {
    Some(v) => qp.push(("ifSourceMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  match projection {
    Some(v) => qp.push(("projection", url_encode(v)))
    None => ()
  }
  match source_generation {
    Some(v) => qp.push(("sourceGeneration", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "b" +
    "/" +
    source_bucket +
    "/" +
    "o" +
    "/" +
    source_object +
    "/" +
    "copyTo" +
    "/" +
    "b" +
    "/" +
    destination_bucket +
    "/" +
    "o" +
    "/" +
    destination_object
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

///| storage.objects.delete

///|
/// Deletes an object and its metadata. Deletions are permanent if versioning is not enabled for the bucket, or if the generation parameter is used.
pub async fn StorageService::objects_delete(
  self : StorageService,
  bucket : String,
  object : String,
  generation? : String? = None,
  if_generation_match? : String? = None,
  if_generation_not_match? : String? = None,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
  user_project? : String? = None,
) -> @http.HttpResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match generation {
    Some(v) => qp.push(("generation", url_encode(v)))
    None => ()
  }
  match if_generation_match {
    Some(v) => qp.push(("ifGenerationMatch", url_encode(v)))
    None => ()
  }
  match if_generation_not_match {
    Some(v) => qp.push(("ifGenerationNotMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "o" + "/" + object
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

///| storage.objects.get

///|
/// Retrieves an object or its metadata.
pub async fn StorageService::objects_get(
  self : StorageService,
  bucket : String,
  object : String,
  generation? : String? = None,
  if_generation_match? : String? = None,
  if_generation_not_match? : String? = None,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
  projection? : String? = None,
  restore_token? : String? = None,
  soft_deleted? : Bool? = None,
  user_project? : String? = None,
) -> Object raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match generation {
    Some(v) => qp.push(("generation", url_encode(v)))
    None => ()
  }
  match if_generation_match {
    Some(v) => qp.push(("ifGenerationMatch", url_encode(v)))
    None => ()
  }
  match if_generation_not_match {
    Some(v) => qp.push(("ifGenerationNotMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  match projection {
    Some(v) => qp.push(("projection", url_encode(v)))
    None => ()
  }
  match restore_token {
    Some(v) => qp.push(("restoreToken", url_encode(v)))
    None => ()
  }
  match soft_deleted {
    Some(v) => qp.push(("softDeleted", if v { "true" } else { "false" }))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "o" + "/" + object
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

///| storage.objects.getIamPolicy

///|
/// Returns an IAM policy for the specified object.
pub async fn StorageService::objects_get_iam_policy(
  self : StorageService,
  bucket : String,
  object : String,
  generation? : String? = None,
  user_project? : String? = None,
) -> Policy raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match generation {
    Some(v) => qp.push(("generation", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "o" + "/" + object + "/" + "iam"
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

///| storage.objects.insert

///|
/// Stores a new object and metadata.
pub async fn StorageService::objects_insert(
  self : StorageService,
  bucket : String,
  content_encoding? : String? = None,
  if_generation_match? : String? = None,
  if_generation_not_match? : String? = None,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
  kms_key_name? : String? = None,
  name? : String? = None,
  predefined_acl? : String? = None,
  projection? : String? = None,
  user_project? : String? = None,
) -> Object raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match content_encoding {
    Some(v) => qp.push(("contentEncoding", url_encode(v)))
    None => ()
  }
  match if_generation_match {
    Some(v) => qp.push(("ifGenerationMatch", url_encode(v)))
    None => ()
  }
  match if_generation_not_match {
    Some(v) => qp.push(("ifGenerationNotMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  match kms_key_name {
    Some(v) => qp.push(("kmsKeyName", url_encode(v)))
    None => ()
  }
  match name {
    Some(v) => qp.push(("name", url_encode(v)))
    None => ()
  }
  match predefined_acl {
    Some(v) => qp.push(("predefinedAcl", url_encode(v)))
    None => ()
  }
  match projection {
    Some(v) => qp.push(("projection", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "o"
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

///| storage.objects.list

///|
/// Retrieves a list of objects matching the criteria.
pub async fn StorageService::objects_list(
  self : StorageService,
  bucket : String,
  delimiter? : String? = None,
  end_offset? : String? = None,
  filter? : String? = None,
  include_folders_as_prefixes? : Bool? = None,
  include_trailing_delimiter? : Bool? = None,
  match_glob? : String? = None,
  max_results? : Int? = None,
  page_token? : String? = None,
  prefix? : String? = None,
  projection? : String? = None,
  soft_deleted? : Bool? = None,
  start_offset? : String? = None,
  user_project? : String? = None,
  versions? : Bool? = None,
) -> Objects raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match delimiter {
    Some(v) => qp.push(("delimiter", url_encode(v)))
    None => ()
  }
  match end_offset {
    Some(v) => qp.push(("endOffset", url_encode(v)))
    None => ()
  }
  match filter {
    Some(v) => qp.push(("filter", url_encode(v)))
    None => ()
  }
  match include_folders_as_prefixes {
    Some(v) =>
      qp.push(("includeFoldersAsPrefixes", if v { "true" } else { "false" }))
    None => ()
  }
  match include_trailing_delimiter {
    Some(v) =>
      qp.push(("includeTrailingDelimiter", if v { "true" } else { "false" }))
    None => ()
  }
  match match_glob {
    Some(v) => qp.push(("matchGlob", url_encode(v)))
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
  match prefix {
    Some(v) => qp.push(("prefix", url_encode(v)))
    None => ()
  }
  match projection {
    Some(v) => qp.push(("projection", url_encode(v)))
    None => ()
  }
  match soft_deleted {
    Some(v) => qp.push(("softDeleted", if v { "true" } else { "false" }))
    None => ()
  }
  match start_offset {
    Some(v) => qp.push(("startOffset", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  match versions {
    Some(v) => qp.push(("versions", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "b" + "/" + bucket + "/" + "o"
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

///| storage.objects.move

///|
/// Moves the source object to the destination object in the same bucket.
pub async fn StorageService::objects_move(
  self : StorageService,
  bucket : String,
  source_object : String,
  destination_object : String,
  if_generation_match? : String? = None,
  if_generation_not_match? : String? = None,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
  if_source_generation_match? : String? = None,
  if_source_generation_not_match? : String? = None,
  if_source_metageneration_match? : String? = None,
  if_source_metageneration_not_match? : String? = None,
  projection? : String? = None,
  user_project? : String? = None,
) -> Object raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match if_generation_match {
    Some(v) => qp.push(("ifGenerationMatch", url_encode(v)))
    None => ()
  }
  match if_generation_not_match {
    Some(v) => qp.push(("ifGenerationNotMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  match if_source_generation_match {
    Some(v) => qp.push(("ifSourceGenerationMatch", url_encode(v)))
    None => ()
  }
  match if_source_generation_not_match {
    Some(v) => qp.push(("ifSourceGenerationNotMatch", url_encode(v)))
    None => ()
  }
  match if_source_metageneration_match {
    Some(v) => qp.push(("ifSourceMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_source_metageneration_not_match {
    Some(v) => qp.push(("ifSourceMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  match projection {
    Some(v) => qp.push(("projection", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "o" +
    "/" +
    source_object +
    "/" +
    "moveTo" +
    "/" +
    "o" +
    "/" +
    destination_object
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

///| storage.objects.patch

///|
/// Patches an object's metadata.
pub async fn StorageService::objects_patch(
  self : StorageService,
  bucket : String,
  object : String,
  generation? : String? = None,
  if_generation_match? : String? = None,
  if_generation_not_match? : String? = None,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
  override_unlocked_retention? : Bool? = None,
  predefined_acl? : String? = None,
  projection? : String? = None,
  user_project? : String? = None,
) -> Object raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match generation {
    Some(v) => qp.push(("generation", url_encode(v)))
    None => ()
  }
  match if_generation_match {
    Some(v) => qp.push(("ifGenerationMatch", url_encode(v)))
    None => ()
  }
  match if_generation_not_match {
    Some(v) => qp.push(("ifGenerationNotMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  match override_unlocked_retention {
    Some(v) =>
      qp.push(("overrideUnlockedRetention", if v { "true" } else { "false" }))
    None => ()
  }
  match predefined_acl {
    Some(v) => qp.push(("predefinedAcl", url_encode(v)))
    None => ()
  }
  match projection {
    Some(v) => qp.push(("projection", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "o" + "/" + object
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

///| storage.objects.restore

///|
/// Restores a soft-deleted object.
pub async fn StorageService::objects_restore(
  self : StorageService,
  bucket : String,
  object : String,
  copy_source_acl? : Bool? = None,
  generation? : String? = None,
  if_generation_match? : String? = None,
  if_generation_not_match? : String? = None,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
  projection? : String? = None,
  restore_token? : String? = None,
  user_project? : String? = None,
) -> Object raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match copy_source_acl {
    Some(v) => qp.push(("copySourceAcl", if v { "true" } else { "false" }))
    None => ()
  }
  match generation {
    Some(v) => qp.push(("generation", url_encode(v)))
    None => ()
  }
  match if_generation_match {
    Some(v) => qp.push(("ifGenerationMatch", url_encode(v)))
    None => ()
  }
  match if_generation_not_match {
    Some(v) => qp.push(("ifGenerationNotMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  match projection {
    Some(v) => qp.push(("projection", url_encode(v)))
    None => ()
  }
  match restore_token {
    Some(v) => qp.push(("restoreToken", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "o" +
    "/" +
    object +
    "/" +
    "restore"
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

///| storage.objects.rewrite

///|
/// Rewrites a source object to a destination object. Optionally overrides metadata.
pub async fn StorageService::objects_rewrite(
  self : StorageService,
  source_bucket : String,
  source_object : String,
  destination_bucket : String,
  destination_object : String,
  destination_kms_key_name? : String? = None,
  destination_predefined_acl? : String? = None,
  drop_context_groups? : String? = None,
  if_generation_match? : String? = None,
  if_generation_not_match? : String? = None,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
  if_source_generation_match? : String? = None,
  if_source_generation_not_match? : String? = None,
  if_source_metageneration_match? : String? = None,
  if_source_metageneration_not_match? : String? = None,
  max_bytes_rewritten_per_call? : String? = None,
  projection? : String? = None,
  rewrite_token? : String? = None,
  source_generation? : String? = None,
  user_project? : String? = None,
) -> RewriteResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match destination_kms_key_name {
    Some(v) => qp.push(("destinationKmsKeyName", url_encode(v)))
    None => ()
  }
  match destination_predefined_acl {
    Some(v) => qp.push(("destinationPredefinedAcl", url_encode(v)))
    None => ()
  }
  match drop_context_groups {
    Some(v) => qp.push(("dropContextGroups", url_encode(v)))
    None => ()
  }
  match if_generation_match {
    Some(v) => qp.push(("ifGenerationMatch", url_encode(v)))
    None => ()
  }
  match if_generation_not_match {
    Some(v) => qp.push(("ifGenerationNotMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  match if_source_generation_match {
    Some(v) => qp.push(("ifSourceGenerationMatch", url_encode(v)))
    None => ()
  }
  match if_source_generation_not_match {
    Some(v) => qp.push(("ifSourceGenerationNotMatch", url_encode(v)))
    None => ()
  }
  match if_source_metageneration_match {
    Some(v) => qp.push(("ifSourceMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_source_metageneration_not_match {
    Some(v) => qp.push(("ifSourceMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  match max_bytes_rewritten_per_call {
    Some(v) => qp.push(("maxBytesRewrittenPerCall", url_encode(v)))
    None => ()
  }
  match projection {
    Some(v) => qp.push(("projection", url_encode(v)))
    None => ()
  }
  match rewrite_token {
    Some(v) => qp.push(("rewriteToken", url_encode(v)))
    None => ()
  }
  match source_generation {
    Some(v) => qp.push(("sourceGeneration", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "b" +
    "/" +
    source_bucket +
    "/" +
    "o" +
    "/" +
    source_object +
    "/" +
    "rewriteTo" +
    "/" +
    "b" +
    "/" +
    destination_bucket +
    "/" +
    "o" +
    "/" +
    destination_object
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

///| storage.objects.setIamPolicy

///|
/// Updates an IAM policy for the specified object.
pub async fn StorageService::objects_set_iam_policy(
  self : StorageService,
  bucket : String,
  object : String,
  generation? : String? = None,
  user_project? : String? = None,
) -> Policy raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match generation {
    Some(v) => qp.push(("generation", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "o" + "/" + object + "/" + "iam"
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

///| storage.objects.testIamPermissions

///|
/// Tests a set of permissions on the given object to see which, if any, are held by the caller.
pub async fn StorageService::objects_test_iam_permissions(
  self : StorageService,
  bucket : String,
  object : String,
  generation? : String? = None,
  permissions? : String? = None,
  user_project? : String? = None,
) -> TestIamPermissionsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match generation {
    Some(v) => qp.push(("generation", url_encode(v)))
    None => ()
  }
  match permissions {
    Some(v) => qp.push(("permissions", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "o" +
    "/" +
    object +
    "/" +
    "iam" +
    "/" +
    "testPermissions"
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

///| storage.objects.update

///|
/// Updates an object's metadata.
pub async fn StorageService::objects_update(
  self : StorageService,
  bucket : String,
  object : String,
  generation? : String? = None,
  if_generation_match? : String? = None,
  if_generation_not_match? : String? = None,
  if_metageneration_match? : String? = None,
  if_metageneration_not_match? : String? = None,
  override_unlocked_retention? : Bool? = None,
  predefined_acl? : String? = None,
  projection? : String? = None,
  user_project? : String? = None,
) -> Object raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match generation {
    Some(v) => qp.push(("generation", url_encode(v)))
    None => ()
  }
  match if_generation_match {
    Some(v) => qp.push(("ifGenerationMatch", url_encode(v)))
    None => ()
  }
  match if_generation_not_match {
    Some(v) => qp.push(("ifGenerationNotMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_match {
    Some(v) => qp.push(("ifMetagenerationMatch", url_encode(v)))
    None => ()
  }
  match if_metageneration_not_match {
    Some(v) => qp.push(("ifMetagenerationNotMatch", url_encode(v)))
    None => ()
  }
  match override_unlocked_retention {
    Some(v) =>
      qp.push(("overrideUnlockedRetention", if v { "true" } else { "false" }))
    None => ()
  }
  match predefined_acl {
    Some(v) => qp.push(("predefinedAcl", url_encode(v)))
    None => ()
  }
  match projection {
    Some(v) => qp.push(("projection", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "o" + "/" + object
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

///| storage.objects.watchAll

///|
/// Watch for changes on all objects in a bucket.
pub async fn StorageService::objects_watch_all(
  self : StorageService,
  bucket : String,
  delimiter? : String? = None,
  end_offset? : String? = None,
  include_trailing_delimiter? : Bool? = None,
  max_results? : Int? = None,
  page_token? : String? = None,
  prefix? : String? = None,
  projection? : String? = None,
  start_offset? : String? = None,
  user_project? : String? = None,
  versions? : Bool? = None,
) -> Channel raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match delimiter {
    Some(v) => qp.push(("delimiter", url_encode(v)))
    None => ()
  }
  match end_offset {
    Some(v) => qp.push(("endOffset", url_encode(v)))
    None => ()
  }
  match include_trailing_delimiter {
    Some(v) =>
      qp.push(("includeTrailingDelimiter", if v { "true" } else { "false" }))
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
  match prefix {
    Some(v) => qp.push(("prefix", url_encode(v)))
    None => ()
  }
  match projection {
    Some(v) => qp.push(("projection", url_encode(v)))
    None => ()
  }
  match start_offset {
    Some(v) => qp.push(("startOffset", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  match versions {
    Some(v) => qp.push(("versions", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "b" + "/" + bucket + "/" + "o" + "/" + "watch"
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

///| storage.buckets.operations.advanceRelocateBucket

///|
/// Starts asynchronous advancement of the relocate bucket operation in the case of required write downtime, to allow it to lock the bucket at the source location, and proceed with the bucket location swap. The server makes a best effort to advance the relocate bucket operation, but success is not guaranteed.
pub async fn StorageService::operations_advance_relocate_bucket(
  self : StorageService,
  bucket : String,
  operation_id : String,
) -> @http.HttpResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "operations" +
    "/" +
    operation_id +
    "/" +
    "advanceRelocateBucket"
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

///| storage.buckets.operations.cancel

///|
/// Starts asynchronous cancellation on a long-running operation. The server makes a best effort to cancel the operation, but success is not guaranteed.
pub async fn StorageService::operations_cancel(
  self : StorageService,
  bucket : String,
  operation_id : String,
) -> @http.HttpResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" +
    "b" +
    "/" +
    bucket +
    "/" +
    "operations" +
    "/" +
    operation_id +
    "/" +
    "cancel"
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

///| storage.buckets.operations.get

///|
/// Gets the latest state of a long-running operation.
pub async fn StorageService::operations_get(
  self : StorageService,
  bucket : String,
  operation_id : String,
) -> GoogleLongrunningOperation raise @http.HttpError {
  let path = "/" + "b" + "/" + bucket + "/" + "operations" + "/" + operation_id
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

///| storage.buckets.operations.list

///|
/// Lists operations that match the specified filter in the request.
pub async fn StorageService::operations_list(
  self : StorageService,
  bucket : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> GoogleLongrunningListOperationsResponse raise @http.HttpError {
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
  let path = "/" + "b" + "/" + bucket + "/" + "operations"
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

///| storage.projects.hmacKeys.create

///|
/// Creates a new HMAC key for the specified service account.
pub async fn StorageService::projects_hmac_keys_create(
  self : StorageService,
  project_id : String,
  service_account_email? : String? = None,
  user_project? : String? = None,
) -> HmacKey raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match service_account_email {
    Some(v) => qp.push(("serviceAccountEmail", url_encode(v)))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "projects" + "/" + project_id + "/" + "hmacKeys"
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

///| storage.projects.hmacKeys.delete

///|
/// Deletes an HMAC key.
pub async fn StorageService::projects_hmac_keys_delete(
  self : StorageService,
  project_id : String,
  access_id : String,
  user_project? : String? = None,
) -> @http.HttpResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "hmacKeys" +
    "/" +
    access_id
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

///| storage.projects.hmacKeys.get

///|
/// Retrieves an HMAC key's metadata
pub async fn StorageService::projects_hmac_keys_get(
  self : StorageService,
  project_id : String,
  access_id : String,
  user_project? : String? = None,
) -> HmacKeyMetadata raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "projects" +
    "/" +
    project_id +
    "/" +
    "hmacKeys" +
    "/" +
    access_id
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

///| storage.projects.hmacKeys.list

///|
/// Retrieves a list of HMAC keys matching the criteria.
pub async fn StorageService::projects_hmac_keys_list(
  self : StorageService,
  project_id : String,
  max_results? : Int? = None,
  page_token? : String? = None,
  service_account_email? : String? = None,
  show_deleted_keys? : Bool? = None,
  user_project? : String? = None,
) -> HmacKeysMetadata raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match max_results {
    Some(v) => qp.push(("maxResults", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match service_account_email {
    Some(v) => qp.push(("serviceAccountEmail", url_encode(v)))
    None => ()
  }
  match show_deleted_keys {
    Some(v) => qp.push(("showDeletedKeys", if v { "true" } else { "false" }))
    None => ()
  }
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "projects" + "/" + project_id + "/" + "hmacKeys"
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

///| storage.projects.hmacKeys.update

///|
/// Updates the state of an HMAC key. See the [HMAC Key resource descriptor](https://cloud.google.com/storage/docs/json_api/v1/projects/hmacKeys/update#request-body) for valid states.
pub async fn StorageService::projects_hmac_keys_update(
  self : StorageService,
  project_id : String,
  access_id : String,
  user_project? : String? = None,
) -> HmacKeyMetadata raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
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
    "hmacKeys" +
    "/" +
    access_id
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

///| storage.projects.serviceAccount.get

///|
/// Get the email address of this project's Google Cloud Storage service account.
pub async fn StorageService::projects_service_account_get(
  self : StorageService,
  project_id : String,
  user_project? : String? = None,
) -> ServiceAccount raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_project {
    Some(v) => qp.push(("userProject", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "projects" + "/" + project_id + "/" + "serviceAccount"
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
