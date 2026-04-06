///| API client for firestore v1

///| Base URL: https://firestore.googleapis.com/

///|
pub struct FirestoreService {
  base_url : String
  access_token : String
  client : &@http.HttpClient
}

///|
pub fn FirestoreService::new(
  client : &@http.HttpClient,
  access_token : String,
) -> FirestoreService {
  FirestoreService::{
    base_url: "https://firestore.googleapis.com",
    access_token,
    client,
  }
}

///|
fn FirestoreService::auth_headers(
  self : FirestoreService,
) -> Map[String, String] {
  {
    "Authorization": "Bearer " + self.access_token,
    "Accept": "application/json",
  }
}

///| firestore.projects.databases.bulkDeleteDocuments

///|
/// Bulk deletes a subset of documents from Google Cloud Firestore. Documents created or updated after the underlying system starts to process the request will not be deleted. The bulk delete occurs in the background and its progress can be monitored and managed via the Operation resource that is created. For more details on bulk delete behavior, refer to: https://cloud.google.com/firestore/docs/manage-data/bulk-delete
pub async fn FirestoreService::projects_databases_bulk_delete_documents(
  self : FirestoreService,
  name : String,
) -> GoogleLongrunningOperation raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + name + "/" + ":bulkDeleteDocuments"
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

///| firestore.projects.databases.clone

///|
/// Creates a new database by cloning an existing one. The new database must be in the same cloud region or multi-region location as the existing database. This behaves similar to FirestoreAdmin.CreateDatabase except instead of creating a new empty database, a new database is created with the database type, index configuration, and documents from an existing database. The long-running operation can be used to track the progress of the clone, with the Operation's metadata field type being the CloneDatabaseMetadata. The response type is the Database if the clone was successful. The new database is not readable or writeable until the LRO has completed.
pub async fn FirestoreService::projects_databases_clone(
  self : FirestoreService,
  parent : String,
) -> GoogleLongrunningOperation raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + parent + "/" + "databases:clone"
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

///| firestore.projects.databases.create

///|
/// Create a database.
pub async fn FirestoreService::projects_databases_create(
  self : FirestoreService,
  parent : String,
  database_id? : String? = None,
) -> GoogleLongrunningOperation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match database_id {
    Some(v) => qp.push(("databaseId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + parent + "/" + "databases"
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

///| firestore.projects.databases.delete

///|
/// Deletes a database.
pub async fn FirestoreService::projects_databases_delete(
  self : FirestoreService,
  name : String,
  etag? : String? = None,
) -> GoogleLongrunningOperation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match etag {
    Some(v) => qp.push(("etag", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v1" + "/" + name
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
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| firestore.projects.databases.exportDocuments

///|
/// Exports a copy of all or a subset of documents from Google Cloud Firestore to another storage system, such as Google Cloud Storage. Recent updates to documents may not be reflected in the export. The export occurs in the background and its progress can be monitored and managed via the Operation resource that is created. The output of an export may only be used once the associated operation is done. If an export operation is cancelled before completion it may leave partial data behind in Google Cloud Storage. For more details on export behavior and output format, refer to: https://cloud.google.com/firestore/docs/manage-data/export-import
pub async fn FirestoreService::projects_databases_export_documents(
  self : FirestoreService,
  name : String,
) -> GoogleLongrunningOperation raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + name + "/" + ":exportDocuments"
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

///| firestore.projects.databases.get

///|
/// Gets information about a database.
pub async fn FirestoreService::projects_databases_get(
  self : FirestoreService,
  name : String,
) -> GoogleFirestoreAdminV1Database raise @http.HttpError {
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

///| firestore.projects.databases.importDocuments

///|
/// Imports documents into Google Cloud Firestore. Existing documents with the same name are overwritten. The import occurs in the background and its progress can be monitored and managed via the Operation resource that is created. If an ImportDocuments operation is cancelled, it is possible that a subset of the data has already been imported to Cloud Firestore.
pub async fn FirestoreService::projects_databases_import_documents(
  self : FirestoreService,
  name : String,
) -> GoogleLongrunningOperation raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + name + "/" + ":importDocuments"
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

///| firestore.projects.databases.list

///|
/// List all the databases in the project.
pub async fn FirestoreService::projects_databases_list(
  self : FirestoreService,
  parent : String,
  show_deleted? : Bool? = None,
) -> GoogleFirestoreAdminV1ListDatabasesResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match show_deleted {
    Some(v) => qp.push(("showDeleted", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v1" + "/" + parent + "/" + "databases"
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

///| firestore.projects.databases.patch

///|
/// Updates a database.
pub async fn FirestoreService::projects_databases_patch(
  self : FirestoreService,
  name : String,
  update_mask? : String? = None,
) -> GoogleLongrunningOperation raise @http.HttpError {
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

///| firestore.projects.databases.restore

///|
/// Creates a new database by restoring from an existing backup. The new database must be in the same cloud region or multi-region location as the existing backup. This behaves similar to FirestoreAdmin.CreateDatabase except instead of creating a new empty database, a new database is created with the database type, index configuration, and documents from an existing backup. The long-running operation can be used to track the progress of the restore, with the Operation's metadata field type being the RestoreDatabaseMetadata. The response type is the Database if the restore was successful. The new database is not readable or writeable until the LRO has completed.
pub async fn FirestoreService::projects_databases_restore(
  self : FirestoreService,
  parent : String,
) -> GoogleLongrunningOperation raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + parent + "/" + "databases:restore"
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

///| firestore.projects.databases.backupSchedules.create

///|
/// Creates a backup schedule on a database. At most two backup schedules can be configured on a database, one daily backup schedule and one weekly backup schedule.
pub async fn FirestoreService::projects_databases_backup_schedules_create(
  self : FirestoreService,
  parent : String,
) -> GoogleFirestoreAdminV1BackupSchedule raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + parent + "/" + "backupSchedules"
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

///| firestore.projects.databases.backupSchedules.delete

///|
/// Deletes a backup schedule.
pub async fn FirestoreService::projects_databases_backup_schedules_delete(
  self : FirestoreService,
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

///| firestore.projects.databases.backupSchedules.get

///|
/// Gets information about a backup schedule.
pub async fn FirestoreService::projects_databases_backup_schedules_get(
  self : FirestoreService,
  name : String,
) -> GoogleFirestoreAdminV1BackupSchedule raise @http.HttpError {
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

///| firestore.projects.databases.backupSchedules.list

///|
/// List backup schedules.
pub async fn FirestoreService::projects_databases_backup_schedules_list(
  self : FirestoreService,
  parent : String,
) -> GoogleFirestoreAdminV1ListBackupSchedulesResponse raise @http.HttpError {
  let path = "/" + "v1" + "/" + parent + "/" + "backupSchedules"
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

///| firestore.projects.databases.backupSchedules.patch

///|
/// Updates a backup schedule.
pub async fn FirestoreService::projects_databases_backup_schedules_patch(
  self : FirestoreService,
  name : String,
  update_mask? : String? = None,
) -> GoogleFirestoreAdminV1BackupSchedule raise @http.HttpError {
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

///| firestore.projects.databases.collectionGroups.fields.get

///|
/// Gets the metadata and configuration for a Field.
pub async fn FirestoreService::projects_databases_collection_groups_fields_get(
  self : FirestoreService,
  name : String,
) -> GoogleFirestoreAdminV1Field raise @http.HttpError {
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

///| firestore.projects.databases.collectionGroups.fields.list

///|
/// Lists the field configuration and metadata for this database. Currently, FirestoreAdmin.ListFields only supports listing fields that have been explicitly overridden. To issue this query, call FirestoreAdmin.ListFields with the filter set to `indexConfig.usesAncestorConfig:false` or `ttlConfig:*`.
pub async fn FirestoreService::projects_databases_collection_groups_fields_list(
  self : FirestoreService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> GoogleFirestoreAdminV1ListFieldsResponse raise @http.HttpError {
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
  let path = "/" + "v1" + "/" + parent + "/" + "fields"
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

///| firestore.projects.databases.collectionGroups.fields.patch

///|
/// Updates a field configuration. Currently, field updates apply only to single field index configuration. However, calls to FirestoreAdmin.UpdateField should provide a field mask to avoid changing any configuration that the caller isn't aware of. The field mask should be specified as: `{ paths: "index_config" }`. This call returns a google.longrunning.Operation which may be used to track the status of the field update. The metadata for the operation will be the type FieldOperationMetadata. To configure the default field settings for the database, use the special `Field` with resource name: `projects/{project_id}/databases/{database_id}/collectionGroups/__default__/fields/*`.
pub async fn FirestoreService::projects_databases_collection_groups_fields_patch(
  self : FirestoreService,
  name : String,
  update_mask? : String? = None,
) -> GoogleLongrunningOperation raise @http.HttpError {
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

///| firestore.projects.databases.collectionGroups.indexes.create

///|
/// Creates a composite index. This returns a google.longrunning.Operation which may be used to track the status of the creation. The metadata for the operation will be the type IndexOperationMetadata.
pub async fn FirestoreService::projects_databases_collection_groups_indexes_create(
  self : FirestoreService,
  parent : String,
) -> GoogleLongrunningOperation raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + parent + "/" + "indexes"
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

///| firestore.projects.databases.collectionGroups.indexes.delete

///|
/// Deletes a composite index.
pub async fn FirestoreService::projects_databases_collection_groups_indexes_delete(
  self : FirestoreService,
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

///| firestore.projects.databases.collectionGroups.indexes.get

///|
/// Gets a composite index.
pub async fn FirestoreService::projects_databases_collection_groups_indexes_get(
  self : FirestoreService,
  name : String,
) -> GoogleFirestoreAdminV1Index raise @http.HttpError {
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

///| firestore.projects.databases.collectionGroups.indexes.list

///|
/// Lists composite indexes.
pub async fn FirestoreService::projects_databases_collection_groups_indexes_list(
  self : FirestoreService,
  parent : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> GoogleFirestoreAdminV1ListIndexesResponse raise @http.HttpError {
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
  let path = "/" + "v1" + "/" + parent + "/" + "indexes"
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

///| firestore.projects.databases.documents.batchGet

///|
/// Gets multiple documents. Documents returned by this method are not guaranteed to be returned in the same order that they were requested.
pub async fn FirestoreService::projects_databases_documents_batch_get(
  self : FirestoreService,
  database : String,
) -> BatchGetDocumentsResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + database + "/" + "documents:batchGet"
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

///| firestore.projects.databases.documents.batchWrite

///|
/// Applies a batch of write operations. The BatchWrite method does not apply the write operations atomically and can apply them out of order. Method does not allow more than one write per document. Each write succeeds or fails independently. See the BatchWriteResponse for the success status of each write. If you require an atomically applied set of writes, use Commit instead.
pub async fn FirestoreService::projects_databases_documents_batch_write(
  self : FirestoreService,
  database : String,
) -> BatchWriteResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + database + "/" + "documents:batchWrite"
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

///| firestore.projects.databases.documents.beginTransaction

///|
/// Starts a new transaction.
pub async fn FirestoreService::projects_databases_documents_begin_transaction(
  self : FirestoreService,
  database : String,
) -> BeginTransactionResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + database + "/" + "documents:beginTransaction"
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

///| firestore.projects.databases.documents.commit

///|
/// Commits a transaction, while optionally updating documents.
pub async fn FirestoreService::projects_databases_documents_commit(
  self : FirestoreService,
  database : String,
) -> CommitResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + database + "/" + "documents:commit"
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

///| firestore.projects.databases.documents.createDocument

///|
/// Creates a new document.
pub async fn FirestoreService::projects_databases_documents_create_document(
  self : FirestoreService,
  parent : String,
  collection_id : String,
  document_id? : String? = None,
  mask_field_paths? : String? = None,
) -> Document raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match document_id {
    Some(v) => qp.push(("documentId", url_encode(v)))
    None => ()
  }
  match mask_field_paths {
    Some(v) => qp.push(("mask.fieldPaths", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + parent + "/" + collection_id
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

///| firestore.projects.databases.documents.delete

///|
/// Deletes a document.
pub async fn FirestoreService::projects_databases_documents_delete(
  self : FirestoreService,
  name : String,
  current_document_exists? : Bool? = None,
  current_document_update_time? : String? = None,
) -> Empty raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match current_document_exists {
    Some(v) =>
      qp.push(("currentDocument.exists", if v { "true" } else { "false" }))
    None => ()
  }
  match current_document_update_time {
    Some(v) => qp.push(("currentDocument.updateTime", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v1" + "/" + name
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
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| firestore.projects.databases.documents.executePipeline

///|
/// Executes a pipeline query.
pub async fn FirestoreService::projects_databases_documents_execute_pipeline(
  self : FirestoreService,
  database : String,
) -> ExecutePipelineResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + database + "/" + "documents:executePipeline"
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

///| firestore.projects.databases.documents.get

///|
/// Gets a single document.
pub async fn FirestoreService::projects_databases_documents_get(
  self : FirestoreService,
  name : String,
  mask_field_paths? : String? = None,
  read_time? : String? = None,
  transaction? : String? = None,
) -> Document raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match mask_field_paths {
    Some(v) => qp.push(("mask.fieldPaths", url_encode(v)))
    None => ()
  }
  match read_time {
    Some(v) => qp.push(("readTime", url_encode(v)))
    None => ()
  }
  match transaction {
    Some(v) => qp.push(("transaction", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v1" + "/" + name
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

///| firestore.projects.databases.documents.list

///|
/// Lists documents.
pub async fn FirestoreService::projects_databases_documents_list(
  self : FirestoreService,
  parent : String,
  collection_id : String,
  mask_field_paths? : String? = None,
  order_by? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  read_time? : String? = None,
  show_missing? : Bool? = None,
  transaction? : String? = None,
) -> ListDocumentsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match mask_field_paths {
    Some(v) => qp.push(("mask.fieldPaths", url_encode(v)))
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
  match read_time {
    Some(v) => qp.push(("readTime", url_encode(v)))
    None => ()
  }
  match show_missing {
    Some(v) => qp.push(("showMissing", if v { "true" } else { "false" }))
    None => ()
  }
  match transaction {
    Some(v) => qp.push(("transaction", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v1" + "/" + parent + "/" + collection_id
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

///| firestore.projects.databases.documents.listCollectionIds

///|
/// Lists all the collection IDs underneath a document.
pub async fn FirestoreService::projects_databases_documents_list_collection_ids(
  self : FirestoreService,
  parent : String,
) -> ListCollectionIdsResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + parent + "/" + ":listCollectionIds"
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

///| firestore.projects.databases.documents.listDocuments

///|
/// Lists documents.
pub async fn FirestoreService::projects_databases_documents_list_documents(
  self : FirestoreService,
  parent : String,
  collection_id : String,
  mask_field_paths? : String? = None,
  order_by? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  read_time? : String? = None,
  show_missing? : Bool? = None,
  transaction? : String? = None,
) -> ListDocumentsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match mask_field_paths {
    Some(v) => qp.push(("mask.fieldPaths", url_encode(v)))
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
  match read_time {
    Some(v) => qp.push(("readTime", url_encode(v)))
    None => ()
  }
  match show_missing {
    Some(v) => qp.push(("showMissing", if v { "true" } else { "false" }))
    None => ()
  }
  match transaction {
    Some(v) => qp.push(("transaction", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v1" + "/" + parent + "/" + collection_id
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

///| firestore.projects.databases.documents.listen

///|
/// Listens to changes. This method is only available via gRPC or WebChannel (not REST).
pub async fn FirestoreService::projects_databases_documents_listen(
  self : FirestoreService,
  database : String,
) -> ListenResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + database + "/" + "documents:listen"
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

///| firestore.projects.databases.documents.partitionQuery

///|
/// Partitions a query by returning partition cursors that can be used to run the query in parallel. The returned partition cursors are split points that can be used by RunQuery as starting/end points for the query results.
pub async fn FirestoreService::projects_databases_documents_partition_query(
  self : FirestoreService,
  parent : String,
) -> PartitionQueryResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + parent + "/" + ":partitionQuery"
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

///| firestore.projects.databases.documents.patch

///|
/// Updates or inserts a document.
pub async fn FirestoreService::projects_databases_documents_patch(
  self : FirestoreService,
  name : String,
  current_document_exists? : Bool? = None,
  current_document_update_time? : String? = None,
  mask_field_paths? : String? = None,
  update_mask_field_paths? : String? = None,
) -> Document raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match current_document_exists {
    Some(v) =>
      qp.push(("currentDocument.exists", if v { "true" } else { "false" }))
    None => ()
  }
  match current_document_update_time {
    Some(v) => qp.push(("currentDocument.updateTime", url_encode(v)))
    None => ()
  }
  match mask_field_paths {
    Some(v) => qp.push(("mask.fieldPaths", url_encode(v)))
    None => ()
  }
  match update_mask_field_paths {
    Some(v) => qp.push(("updateMask.fieldPaths", url_encode(v)))
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

///| firestore.projects.databases.documents.rollback

///|
/// Rolls back a transaction.
pub async fn FirestoreService::projects_databases_documents_rollback(
  self : FirestoreService,
  database : String,
) -> Empty raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + database + "/" + "documents:rollback"
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

///| firestore.projects.databases.documents.runAggregationQuery

///|
/// Runs an aggregation query. Rather than producing Document results like Firestore.RunQuery, this API allows running an aggregation to produce a series of AggregationResult server-side. High-Level Example: ``` -- Return the number of documents in table given a filter. SELECT COUNT(*) FROM ( SELECT * FROM k where a = true ); ```
pub async fn FirestoreService::projects_databases_documents_run_aggregation_query(
  self : FirestoreService,
  parent : String,
) -> RunAggregationQueryResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + parent + "/" + ":runAggregationQuery"
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

///| firestore.projects.databases.documents.runQuery

///|
/// Runs a query.
pub async fn FirestoreService::projects_databases_documents_run_query(
  self : FirestoreService,
  parent : String,
) -> RunQueryResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + parent + "/" + ":runQuery"
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

///| firestore.projects.databases.documents.write

///|
/// Streams batches of document updates and deletes, in order. This method is only available via gRPC or WebChannel (not REST).
pub async fn FirestoreService::projects_databases_documents_write(
  self : FirestoreService,
  database : String,
) -> WriteResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + database + "/" + "documents:write"
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

///| firestore.projects.databases.operations.cancel

///|
/// Starts asynchronous cancellation on a long-running operation. The server makes a best effort to cancel the operation, but success is not guaranteed. If the server doesn't support this method, it returns `google.rpc.Code.UNIMPLEMENTED`. Clients can use Operations.GetOperation or other methods to check whether the cancellation succeeded or whether the operation completed despite cancellation. On successful cancellation, the operation is not deleted; instead, it becomes an operation with an Operation.error value with a google.rpc.Status.code of `1`, corresponding to `Code.CANCELLED`.
pub async fn FirestoreService::projects_databases_operations_cancel(
  self : FirestoreService,
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

///| firestore.projects.databases.operations.delete

///|
/// Deletes a long-running operation. This method indicates that the client is no longer interested in the operation result. It does not cancel the operation. If the server doesn't support this method, it returns `google.rpc.Code.UNIMPLEMENTED`.
pub async fn FirestoreService::projects_databases_operations_delete(
  self : FirestoreService,
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

///| firestore.projects.databases.operations.get

///|
/// Gets the latest state of a long-running operation. Clients can use this method to poll the operation result at intervals as recommended by the API service.
pub async fn FirestoreService::projects_databases_operations_get(
  self : FirestoreService,
  name : String,
) -> GoogleLongrunningOperation raise @http.HttpError {
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

///| firestore.projects.databases.operations.list

///|
/// Lists operations that match the specified filter in the request. If the server doesn't support this method, it returns `UNIMPLEMENTED`.
pub async fn FirestoreService::projects_databases_operations_list(
  self : FirestoreService,
  name : String,
  filter? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  return_partial_success? : Bool? = None,
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

///| firestore.projects.databases.userCreds.create

///|
/// Create a user creds.
pub async fn FirestoreService::projects_databases_user_creds_create(
  self : FirestoreService,
  parent : String,
  user_creds_id? : String? = None,
) -> GoogleFirestoreAdminV1UserCreds raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match user_creds_id {
    Some(v) => qp.push(("userCredsId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + parent + "/" + "userCreds"
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

///| firestore.projects.databases.userCreds.delete

///|
/// Deletes a user creds.
pub async fn FirestoreService::projects_databases_user_creds_delete(
  self : FirestoreService,
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

///| firestore.projects.databases.userCreds.disable

///|
/// Disables a user creds. No-op if the user creds are already disabled.
pub async fn FirestoreService::projects_databases_user_creds_disable(
  self : FirestoreService,
  name : String,
) -> GoogleFirestoreAdminV1UserCreds raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + name + "/" + ":disable"
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

///| firestore.projects.databases.userCreds.enable

///|
/// Enables a user creds. No-op if the user creds are already enabled.
pub async fn FirestoreService::projects_databases_user_creds_enable(
  self : FirestoreService,
  name : String,
) -> GoogleFirestoreAdminV1UserCreds raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + name + "/" + ":enable"
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

///| firestore.projects.databases.userCreds.get

///|
/// Gets a user creds resource. Note that the returned resource does not contain the secret value itself.
pub async fn FirestoreService::projects_databases_user_creds_get(
  self : FirestoreService,
  name : String,
) -> GoogleFirestoreAdminV1UserCreds raise @http.HttpError {
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

///| firestore.projects.databases.userCreds.list

///|
/// List all user creds in the database. Note that the returned resource does not contain the secret value itself.
pub async fn FirestoreService::projects_databases_user_creds_list(
  self : FirestoreService,
  parent : String,
) -> GoogleFirestoreAdminV1ListUserCredsResponse raise @http.HttpError {
  let path = "/" + "v1" + "/" + parent + "/" + "userCreds"
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

///| firestore.projects.databases.userCreds.resetPassword

///|
/// Resets the password of a user creds.
pub async fn FirestoreService::projects_databases_user_creds_reset_password(
  self : FirestoreService,
  name : String,
) -> GoogleFirestoreAdminV1UserCreds raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h = self.auth_headers()
  h.set("Content-Type", "application/json")
  let path = "/" + "v1" + "/" + name + "/" + ":resetPassword"
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

///| firestore.projects.locations.get

///|
/// Gets information about a location.
pub async fn FirestoreService::projects_locations_get(
  self : FirestoreService,
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

///| firestore.projects.locations.list

///|
/// Lists information about the supported locations for this service. This method lists locations based on the resource scope provided in the [ListLocationsRequest.name] field: * **Global locations**: If `name` is empty, the method lists the public locations available to all projects. * **Project-specific locations**: If `name` follows the format `projects/{project}`, the method lists locations visible to that specific project. This includes public, private, or other project-specific locations enabled for the project. For gRPC and client library implementations, the resource name is passed as the `name` field. For direct service calls, the resource name is incorporated into the request path based on the specific service implementation and version.
pub async fn FirestoreService::projects_locations_list(
  self : FirestoreService,
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

///| firestore.projects.locations.backups.delete

///|
/// Deletes a backup.
pub async fn FirestoreService::projects_locations_backups_delete(
  self : FirestoreService,
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

///| firestore.projects.locations.backups.get

///|
/// Gets information about a backup.
pub async fn FirestoreService::projects_locations_backups_get(
  self : FirestoreService,
  name : String,
) -> GoogleFirestoreAdminV1Backup raise @http.HttpError {
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

///| firestore.projects.locations.backups.list

///|
/// Lists all the backups.
pub async fn FirestoreService::projects_locations_backups_list(
  self : FirestoreService,
  parent : String,
  filter? : String? = None,
) -> GoogleFirestoreAdminV1ListBackupsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match filter {
    Some(v) => qp.push(("filter", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "v1" + "/" + parent + "/" + "backups"
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
