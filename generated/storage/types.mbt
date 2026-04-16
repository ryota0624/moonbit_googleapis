///|
/// Schema Bucket
pub(all) struct Bucket {
  acl : Array[BucketAccessControl]?
  billing : Json?
  cors : Array[Json]?
  custom_placement_config : Json?
  default_event_based_hold : Bool?
  default_object_acl : Array[ObjectAccessControl]?
  encryption : Json?
  etag : String?
  hierarchical_namespace : Json?
  iam_configuration : Json?
  id : String?
  ip_filter : Json?
  kind : String?
  labels : Json?
  lifecycle : Json?
  autoclass : Json?
  location : String?
  location_type : String?
  logging : Json?
  generation : String?
  metageneration : String?
  name : String?
  owner : Json?
  project_number : String?
  retention_policy : Json?
  object_retention : Json?
  rpo : String?
  self_link : String?
  soft_delete_policy : Json?
  storage_class : String?
  time_created : String?
  updated : String?
  soft_delete_time : String?
  hard_delete_time : String?
  versioning : Json?
  website : Json?
  satisfies_p_z_s : Bool?
  satisfies_p_z_i : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AdvanceRelocateBucketOperationRequest
pub(all) struct AdvanceRelocateBucketOperationRequest {
  ttl : String?
  expire_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AnywhereCache
pub(all) struct AnywhereCache {
  kind : String?
  id : String?
  self_link : String?
  bucket : String?
  anywhere_cache_id : String?
  zone : String?
  state : String?
  create_time : String?
  update_time : String?
  ttl : String?
  admission_policy : String?
  pending_update : Bool?
  ingest_on_write : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AnywhereCaches
pub(all) struct AnywhereCaches {
  kind : String?
  next_page_token : String?
  items : Array[AnywhereCache]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BucketAccessControl
pub(all) struct BucketAccessControl {
  bucket : String?
  domain : String?
  email : String?
  entity : String?
  entity_id : String?
  etag : String?
  id : String?
  kind : String?
  project_team : Json?
  role : String?
  self_link : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BucketAccessControls
pub(all) struct BucketAccessControls {
  items : Array[BucketAccessControl]?
  kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BucketStorageLayout
pub(all) struct BucketStorageLayout {
  bucket : String?
  custom_placement_config : Json?
  hierarchical_namespace : Json?
  kind : String?
  location : String?
  location_type : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Buckets
pub(all) struct Buckets {
  items : Array[Bucket]?
  kind : String?
  next_page_token : String?
  unreachable_ : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(
    rename_fields="camelCase",
    fields(unreachable_(rename="unreachable")),
  ),
  ToJson(rename_fields="camelCase", fields(unreachable_(rename="unreachable"))),
)

///|
/// Schema Channel
pub(all) struct Channel {
  address : String?
  expiration : String?
  id : String?
  kind : String?
  params : Json?
  payload : Bool?
  resource_id : String?
  resource_uri : String?
  token : String?
  type_ : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema ComposeRequest
pub(all) struct ComposeRequest {
  destination : Object?
  kind : String?
  source_objects : Array[Json]?
  delete_source_objects : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Folder
pub(all) struct Folder {
  bucket : String?
  id : String?
  kind : String?
  metageneration : String?
  name : String?
  self_link : String?
  create_time : String?
  update_time : String?
  pending_rename_info : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Folders
pub(all) struct Folders {
  items : Array[Folder]?
  kind : String?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Expr
pub(all) struct Expr {
  description : String?
  expression : String?
  location : String?
  title : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleLongrunningOperation
pub(all) struct GoogleLongrunningOperation {
  done : Bool?
  error : GoogleRpcStatus?
  metadata : Json?
  name : String?
  response : Json?
  self_link : String?
  kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleLongrunningListOperationsResponse
pub(all) struct GoogleLongrunningListOperationsResponse {
  next_page_token : String?
  operations : Array[GoogleLongrunningOperation]?
  kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleRpcStatus
pub(all) struct GoogleRpcStatus {
  code : Int?
  details : Array[Json]?
  message : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema HmacKey
pub(all) struct HmacKey {
  kind : String?
  metadata : HmacKeyMetadata?
  secret : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema HmacKeyMetadata
pub(all) struct HmacKeyMetadata {
  access_id : String?
  etag : String?
  id : String?
  kind : String?
  project_id : String?
  self_link : String?
  service_account_email : String?
  state : String?
  time_created : String?
  updated : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema HmacKeysMetadata
pub(all) struct HmacKeysMetadata {
  items : Array[HmacKeyMetadata]?
  kind : String?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ManagedFolder
pub(all) struct ManagedFolder {
  bucket : String?
  id : String?
  kind : String?
  metageneration : String?
  name : String?
  self_link : String?
  create_time : String?
  update_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ManagedFolders
pub(all) struct ManagedFolders {
  items : Array[ManagedFolder]?
  kind : String?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Notification
pub(all) struct Notification {
  custom_attributes : Json?
  etag : String?
  event_types : Array[String]?
  id : String?
  kind : String?
  object_name_prefix : String?
  payload_format : String?
  self_link : String?
  topic : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Notifications
pub(all) struct Notifications {
  items : Array[Notification]?
  kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Object
pub(all) struct Object {
  acl : Array[ObjectAccessControl]?
  bucket : String?
  cache_control : String?
  component_count : Int?
  content_disposition : String?
  content_encoding : String?
  content_language : String?
  content_type : String?
  crc32c : String?
  custom_time : String?
  customer_encryption : Json?
  etag : String?
  event_based_hold : Bool?
  generation : String?
  id : String?
  kind : String?
  kms_key_name : String?
  md5_hash : String?
  media_link : String?
  metadata : Json?
  contexts : Json?
  restore_token : String?
  metageneration : String?
  name : String?
  owner : Json?
  retention_expiration_time : String?
  retention : Json?
  self_link : String?
  size : String?
  storage_class : String?
  temporary_hold : Bool?
  time_created : String?
  time_deleted : String?
  time_finalized : String?
  soft_delete_time : String?
  hard_delete_time : String?
  time_storage_class_updated : String?
  updated : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ObjectAccessControl
pub(all) struct ObjectAccessControl {
  bucket : String?
  domain : String?
  email : String?
  entity : String?
  entity_id : String?
  etag : String?
  generation : String?
  id : String?
  kind : String?
  object : String?
  project_team : Json?
  role : String?
  self_link : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ObjectAccessControls
pub(all) struct ObjectAccessControls {
  items : Array[ObjectAccessControl]?
  kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ObjectCustomContextPayload
pub(all) struct ObjectCustomContextPayload {
  value : String?
  create_time : String?
  update_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Objects
pub(all) struct Objects {
  items : Array[Object]?
  kind : String?
  next_page_token : String?
  prefixes : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Policy
pub(all) struct Policy {
  bindings : Array[Json]?
  etag : String?
  kind : String?
  resource_id : String?
  version : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RelocateBucketRequest
pub(all) struct RelocateBucketRequest {
  destination_location : String?
  destination_custom_placement_config : Json?
  validate_only : Bool?
  destination_kms_key_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RewriteResponse
pub(all) struct RewriteResponse {
  done : Bool?
  kind : String?
  object_size : String?
  resource : Object?
  rewrite_token : String?
  total_bytes_rewritten : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ServiceAccount
pub(all) struct ServiceAccount {
  email_address : String?
  kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TestIamPermissionsResponse
pub(all) struct TestIamPermissionsResponse {
  kind : String?
  permissions : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BulkRestoreObjectsRequest
pub(all) struct BulkRestoreObjectsRequest {
  allow_overwrite : Bool?
  soft_deleted_after_time : String?
  soft_deleted_before_time : String?
  match_globs : Array[String]?
  copy_source_acl : Bool?
  created_after_time : String?
  created_before_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)
