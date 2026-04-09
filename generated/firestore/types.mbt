///|
/// Schema Function
pub(all) struct Function {
  args : Array[Value]?
  options : Json?
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RollbackRequest
pub(all) struct RollbackRequest {
  transaction : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ExecutionStats
pub(all) struct ExecutionStats {
  results_returned : String?
  execution_duration : String?
  debug_stats : Json?
  read_operations : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1TtlConfigDelta
pub(all) struct GoogleFirestoreAdminV1TtlConfigDelta {
  change_type : String?
  expiration_offset : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1BulkDeleteDocumentsRequest
pub(all) struct GoogleFirestoreAdminV1BulkDeleteDocumentsRequest {
  collection_ids : Array[String]?
  namespace_ids : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Order
pub(all) struct Order {
  field : FieldReference?
  direction : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UnaryFilter
pub(all) struct UnaryFilter {
  op : String?
  field : FieldReference?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1UserCreds
pub(all) struct GoogleFirestoreAdminV1UserCreds {
  name : String?
  update_time : String?
  resource_identity : GoogleFirestoreAdminV1ResourceIdentity?
  secure_password : String?
  state : String?
  create_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleLongrunningCancelOperationRequest
pub(all) struct GoogleLongrunningCancelOperationRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema WriteResult
pub(all) struct WriteResult {
  transform_results : Array[Value]?
  update_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ExplainOptions
pub(all) struct ExplainOptions {
  analyze : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Avg
pub(all) struct Avg {
  field : FieldReference?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BloomFilter
pub(all) struct BloomFilter {
  bits : BitSequence?
  hash_count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Stage
pub(all) struct Stage {
  name : String?
  args : Array[Value]?
  options : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1SearchTextIndexSpec
pub(all) struct GoogleFirestoreAdminV1SearchTextIndexSpec {
  index_type : String?
  match_type : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema StructuredAggregationQuery
pub(all) struct StructuredAggregationQuery {
  aggregations : Array[Aggregation]?
  structured_query : StructuredQuery?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1Database
pub(all) struct GoogleFirestoreAdminV1Database {
  create_time : String?
  free_tier : Bool?
  earliest_version_time : String?
  database_edition : String?
  cmek_config : GoogleFirestoreAdminV1CmekConfig?
  realtime_updates_mode : String?
  delete_protection_state : String?
  version_retention_period : String?
  concurrency_mode : String?
  name : String?
  update_time : String?
  location_id : String?
  mongodb_compatible_data_access_mode : String?
  uid : String?
  point_in_time_recovery_enablement : String?
  tags : Json?
  firestore_data_access_mode : String?
  type_ : String?
  key_prefix : String?
  delete_time : String?
  previous_id : String?
  app_engine_integration_mode : String?
  source_info : GoogleFirestoreAdminV1SourceInfo?
  etag : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema ListCollectionIdsResponse
pub(all) struct ListCollectionIdsResponse {
  collection_ids : Array[String]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MapValue
pub(all) struct MapValue {
  fields : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TransactionOptions
pub(all) struct TransactionOptions {
  read_only : ReadOnly?
  read_write : ReadWrite?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1Backup
pub(all) struct GoogleFirestoreAdminV1Backup {
  snapshot_time : String?
  name : String?
  expire_time : String?
  stats : GoogleFirestoreAdminV1Stats?
  state : String?
  database : String?
  database_uid : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DocumentMask
pub(all) struct DocumentMask {
  field_paths : Array[String]?
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
  unreachable_ : Array[String]?
  operations : Array[GoogleLongrunningOperation]?
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
/// Schema Pipeline
pub(all) struct Pipeline {
  stages : Array[Stage]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LatLng
pub(all) struct LatLng {
  latitude : Double?
  longitude : Double?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1BulkDeleteDocumentsMetadata
pub(all) struct GoogleFirestoreAdminV1BulkDeleteDocumentsMetadata {
  end_time : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
  operation_state : String?
  namespace_ids : Array[String]?
  start_time : String?
  progress_bytes : GoogleFirestoreAdminV1Progress?
  snapshot_time : String?
  collection_ids : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FieldReference
pub(all) struct FieldReference {
  field_path : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1ListIndexesResponse
pub(all) struct GoogleFirestoreAdminV1ListIndexesResponse {
  indexes : Array[GoogleFirestoreAdminV1Index]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DocumentRemove
pub(all) struct DocumentRemove {
  document : String?
  removed_target_ids : Array[Int]?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1FieldOperationMetadata
pub(all) struct GoogleFirestoreAdminV1FieldOperationMetadata {
  start_time : String?
  index_config_deltas : Array[GoogleFirestoreAdminV1IndexConfigDelta]?
  progress_bytes : GoogleFirestoreAdminV1Progress?
  ttl_config_delta : GoogleFirestoreAdminV1TtlConfigDelta?
  field : String?
  end_time : String?
  state : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1CustomerManagedEncryptionOptions
pub(all) struct GoogleFirestoreAdminV1CustomerManagedEncryptionOptions {
  kms_key_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ReadOnly
pub(all) struct ReadOnly {
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1BackupSchedule
pub(all) struct GoogleFirestoreAdminV1BackupSchedule {
  name : String?
  update_time : String?
  create_time : String?
  retention : String?
  daily_recurrence : GoogleFirestoreAdminV1DailyRecurrence?
  weekly_recurrence : GoogleFirestoreAdminV1WeeklyRecurrence?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CollectionSelector
pub(all) struct CollectionSelector {
  all_descendants : Bool?
  collection_id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Cursor
pub(all) struct Cursor {
  values : Array[Value]?
  before : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Location
pub(all) struct Location {
  location_id : String?
  display_name : String?
  metadata : Json?
  name : String?
  labels : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1GoogleDefaultEncryptionOptions
pub(all) struct GoogleFirestoreAdminV1GoogleDefaultEncryptionOptions {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Write
pub(all) struct Write {
  update_mask : DocumentMask?
  current_document : Precondition?
  update_transforms : Array[FieldTransform]?
  update : Document?
  transform : DocumentTransform?
  delete : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1Index
pub(all) struct GoogleFirestoreAdminV1Index {
  query_scope : String?
  unique : Bool?
  shard_count : Int?
  api_scope : String?
  state : String?
  name : String?
  fields : Array[GoogleFirestoreAdminV1IndexField]?
  density : String?
  multikey : Bool?
  search_index_options : GoogleFirestoreAdminV1SearchIndexOptions?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Projection
pub(all) struct Projection {
  fields : Array[FieldReference]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DocumentTransform
pub(all) struct DocumentTransform {
  document : String?
  field_transforms : Array[FieldTransform]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ExplainMetrics
pub(all) struct ExplainMetrics {
  plan_summary : PlanSummary?
  execution_stats : ExecutionStats?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BatchWriteRequest
pub(all) struct BatchWriteRequest {
  writes : Array[Write]?
  labels : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1RestoreDatabaseMetadata
pub(all) struct GoogleFirestoreAdminV1RestoreDatabaseMetadata {
  end_time : String?
  backup : String?
  database : String?
  operation_state : String?
  progress_percentage : GoogleFirestoreAdminV1Progress?
  start_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DocumentChange
pub(all) struct DocumentChange {
  document : Document?
  removed_target_ids : Array[Int]?
  target_ids : Array[Int]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1ListBackupSchedulesResponse
pub(all) struct GoogleFirestoreAdminV1ListBackupSchedulesResponse {
  backup_schedules : Array[GoogleFirestoreAdminV1BackupSchedule]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BeginTransactionRequest
pub(all) struct BeginTransactionRequest {
  options : TransactionOptions?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Document
pub(all) struct Document {
  create_time : String?
  name : String?
  fields : Json?
  update_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1ExportDocumentsRequest
pub(all) struct GoogleFirestoreAdminV1ExportDocumentsRequest {
  snapshot_time : String?
  output_uri_prefix : String?
  collection_ids : Array[String]?
  namespace_ids : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListDocumentsResponse
pub(all) struct ListDocumentsResponse {
  documents : Array[Document]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1SourceInfo
pub(all) struct GoogleFirestoreAdminV1SourceInfo {
  backup : GoogleFirestoreAdminV1BackupSource?
  operation : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1WeeklyRecurrence
pub(all) struct GoogleFirestoreAdminV1WeeklyRecurrence {
  day : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ExplainStats
pub(all) struct ExplainStats {
  data : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Status
pub(all) struct Status {
  details : Array[Json]?
  code : Int?
  message : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Sum
pub(all) struct Sum {
  field : FieldReference?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1IndexConfigDelta
pub(all) struct GoogleFirestoreAdminV1IndexConfigDelta {
  change_type : String?
  index : GoogleFirestoreAdminV1Index?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BatchWriteResponse
pub(all) struct BatchWriteResponse {
  write_results : Array[WriteResult]?
  status : Array[Status]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1CloneDatabaseMetadata
pub(all) struct GoogleFirestoreAdminV1CloneDatabaseMetadata {
  start_time : String?
  end_time : String?
  operation_state : String?
  progress_percentage : GoogleFirestoreAdminV1Progress?
  database : String?
  pitr_snapshot : GoogleFirestoreAdminV1PitrSnapshot?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Target
pub(all) struct Target {
  read_time : String?
  expected_count : Int?
  target_id : Int?
  query : QueryTarget?
  documents : DocumentsTarget?
  resume_token : String?
  once : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ExistenceFilter
pub(all) struct ExistenceFilter {
  target_id : Int?
  count : Int?
  unchanged_names : BloomFilter?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FindNearest
pub(all) struct FindNearest {
  vector_field : FieldReference?
  query_vector : Value?
  distance_threshold : Double?
  distance_measure : String?
  distance_result_field : String?
  limit : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Count
pub(all) struct Count {
  up_to : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema WriteRequest
pub(all) struct WriteRequest {
  stream_id : String?
  labels : Json?
  stream_token : String?
  writes : Array[Write]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListenRequest
pub(all) struct ListenRequest {
  labels : Json?
  add_target : Target?
  remove_target : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema StructuredPipeline
pub(all) struct StructuredPipeline {
  pipeline : Pipeline?
  options : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1ResetUserPasswordRequest
pub(all) struct GoogleFirestoreAdminV1ResetUserPasswordRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1Field
pub(all) struct GoogleFirestoreAdminV1Field {
  ttl_config : GoogleFirestoreAdminV1TtlConfig?
  name : String?
  index_config : GoogleFirestoreAdminV1IndexConfig?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RunQueryRequest
pub(all) struct RunQueryRequest {
  transaction : String?
  structured_query : StructuredQuery?
  explain_options : ExplainOptions?
  new_transaction : TransactionOptions?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1ListFieldsResponse
pub(all) struct GoogleFirestoreAdminV1ListFieldsResponse {
  fields : Array[GoogleFirestoreAdminV1Field]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TargetChange
pub(all) struct TargetChange {
  resume_token : String?
  target_ids : Array[Int]?
  target_change_type : String?
  cause : Status?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1CmekConfig
pub(all) struct GoogleFirestoreAdminV1CmekConfig {
  kms_key_name : String?
  active_key_version : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleLongrunningOperation
pub(all) struct GoogleLongrunningOperation {
  name : String?
  done : Bool?
  response : Json?
  error : Status?
  metadata : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1BackupSource
pub(all) struct GoogleFirestoreAdminV1BackupSource {
  backup : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CommitRequest
pub(all) struct CommitRequest {
  writes : Array[Write]?
  transaction : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DocumentDelete
pub(all) struct DocumentDelete {
  document : String?
  removed_target_ids : Array[Int]?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1IndexConfig
pub(all) struct GoogleFirestoreAdminV1IndexConfig {
  ancestor_field : String?
  indexes : Array[GoogleFirestoreAdminV1Index]?
  uses_ancestor_config : Bool?
  reverting : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1TtlConfig
pub(all) struct GoogleFirestoreAdminV1TtlConfig {
  expiration_offset : String?
  state : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1ExportDocumentsMetadata
pub(all) struct GoogleFirestoreAdminV1ExportDocumentsMetadata {
  output_uri_prefix : String?
  progress_bytes : GoogleFirestoreAdminV1Progress?
  collection_ids : Array[String]?
  operation_state : String?
  namespace_ids : Array[String]?
  start_time : String?
  snapshot_time : String?
  end_time : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1ResourceIdentity
pub(all) struct GoogleFirestoreAdminV1ResourceIdentity {
  principal : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1UpdateDatabaseMetadata
pub(all) struct GoogleFirestoreAdminV1UpdateDatabaseMetadata {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1DisableUserCredsRequest
pub(all) struct GoogleFirestoreAdminV1DisableUserCredsRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Empty
pub(all) struct Empty {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1SearchGeoSpec
pub(all) struct GoogleFirestoreAdminV1SearchGeoSpec {
  geo_json_indexing_disabled : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1SearchConfig
pub(all) struct GoogleFirestoreAdminV1SearchConfig {
  text_spec : GoogleFirestoreAdminV1SearchTextSpec?
  geo_spec : GoogleFirestoreAdminV1SearchGeoSpec?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1SourceEncryptionOptions
pub(all) struct GoogleFirestoreAdminV1SourceEncryptionOptions {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema QueryTarget
pub(all) struct QueryTarget {
  parent : String?
  structured_query : StructuredQuery?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1ListBackupsResponse
pub(all) struct GoogleFirestoreAdminV1ListBackupsResponse {
  backups : Array[GoogleFirestoreAdminV1Backup]?
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
/// Schema GoogleFirestoreAdminV1ListDatabasesResponse
pub(all) struct GoogleFirestoreAdminV1ListDatabasesResponse {
  databases : Array[GoogleFirestoreAdminV1Database]?
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
/// Schema GoogleFirestoreAdminV1EnableUserCredsRequest
pub(all) struct GoogleFirestoreAdminV1EnableUserCredsRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FieldTransform
pub(all) struct FieldTransform {
  field_path : String?
  maximum : Value?
  increment : Value?
  remove_all_from_array : ArrayValue?
  set_to_server_value : String?
  append_missing_elements : ArrayValue?
  minimum : Value?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Precondition
pub(all) struct Precondition {
  exists : Bool?
  update_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RunQueryResponse
pub(all) struct RunQueryResponse {
  transaction : String?
  document : Document?
  done : Bool?
  read_time : String?
  skipped_results : Int?
  explain_metrics : ExplainMetrics?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1IndexField
pub(all) struct GoogleFirestoreAdminV1IndexField {
  array_config : String?
  vector_config : GoogleFirestoreAdminV1VectorConfig?
  search_config : GoogleFirestoreAdminV1SearchConfig?
  field_path : String?
  order : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BatchGetDocumentsResponse
pub(all) struct BatchGetDocumentsResponse {
  missing : String?
  transaction : String?
  found : Document?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListCollectionIdsRequest
pub(all) struct ListCollectionIdsRequest {
  page_size : Int?
  page_token : String?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Value
pub(all) struct Value {
  map_value : MapValue?
  reference_value : String?
  integer_value : String?
  double_value : Double?
  string_value : String?
  pipeline_value : Pipeline?
  array_value : ArrayValue?
  null_value : String?
  geo_point_value : LatLng?
  field_reference_value : String?
  boolean_value : Bool?
  timestamp_value : String?
  variable_reference_value : String?
  bytes_value : String?
  function_value : Function?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CompositeFilter
pub(all) struct CompositeFilter {
  filters : Array[Filter]?
  op : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1Stats
pub(all) struct GoogleFirestoreAdminV1Stats {
  document_count : String?
  index_count : String?
  size_bytes : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1DailyRecurrence
pub(all) struct GoogleFirestoreAdminV1DailyRecurrence {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BeginTransactionResponse
pub(all) struct BeginTransactionResponse {
  transaction : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PartitionQueryRequest
pub(all) struct PartitionQueryRequest {
  structured_query : StructuredQuery?
  partition_count : String?
  page_token : String?
  read_time : String?
  page_size : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ArrayValue
pub(all) struct ArrayValue {
  values : Array[Value]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1FlatIndex
pub(all) struct GoogleFirestoreAdminV1FlatIndex {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ExecutePipelineResponse
pub(all) struct ExecutePipelineResponse {
  results : Array[Document]?
  transaction : String?
  explain_stats : ExplainStats?
  execution_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1ExportDocumentsResponse
pub(all) struct GoogleFirestoreAdminV1ExportDocumentsResponse {
  output_uri_prefix : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema StructuredQuery
pub(all) struct StructuredQuery {
  where_ : Filter?
  limit : Int?
  find_nearest : FindNearest?
  start_at : Cursor?
  offset : Int?
  select : Projection?
  from : Array[CollectionSelector]?
  order_by : Array[Order]?
  end_at : Cursor?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(where_(rename="where"))),
  ToJson(rename_fields="camelCase", fields(where_(rename="where"))),
)

///|
/// Schema GoogleFirestoreAdminV1LocationMetadata
pub(all) struct GoogleFirestoreAdminV1LocationMetadata {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1SearchIndexOptions
pub(all) struct GoogleFirestoreAdminV1SearchIndexOptions {
  text_language : String?
  text_language_override_field_path : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Filter
pub(all) struct Filter {
  field_filter : FieldFilter?
  unary_filter : UnaryFilter?
  composite_filter : CompositeFilter?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1RestoreDatabaseRequest
pub(all) struct GoogleFirestoreAdminV1RestoreDatabaseRequest {
  encryption_config : GoogleFirestoreAdminV1EncryptionConfig?
  tags : Json?
  database_id : String?
  backup : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1VectorConfig
pub(all) struct GoogleFirestoreAdminV1VectorConfig {
  flat : GoogleFirestoreAdminV1FlatIndex?
  dimension : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PartitionQueryResponse
pub(all) struct PartitionQueryResponse {
  partitions : Array[Cursor]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema WriteResponse
pub(all) struct WriteResponse {
  stream_token : String?
  write_results : Array[WriteResult]?
  commit_time : String?
  stream_id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1PitrSnapshot
pub(all) struct GoogleFirestoreAdminV1PitrSnapshot {
  database_uid : String?
  database : String?
  snapshot_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1ImportDocumentsMetadata
pub(all) struct GoogleFirestoreAdminV1ImportDocumentsMetadata {
  collection_ids : Array[String]?
  start_time : String?
  progress_bytes : GoogleFirestoreAdminV1Progress?
  input_uri_prefix : String?
  operation_state : String?
  namespace_ids : Array[String]?
  end_time : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1ImportDocumentsRequest
pub(all) struct GoogleFirestoreAdminV1ImportDocumentsRequest {
  input_uri_prefix : String?
  collection_ids : Array[String]?
  namespace_ids : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ReadWrite
pub(all) struct ReadWrite {
  retry_transaction : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListenResponse
pub(all) struct ListenResponse {
  document_delete : DocumentDelete?
  document_remove : DocumentRemove?
  target_change : TargetChange?
  filter : ExistenceFilter?
  document_change : DocumentChange?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Aggregation
pub(all) struct Aggregation {
  count : Count?
  alias_ : String?
  sum : Sum?
  avg : Avg?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(alias_(rename="alias"))),
  ToJson(rename_fields="camelCase", fields(alias_(rename="alias"))),
)

///|
/// Schema AggregationResult
pub(all) struct AggregationResult {
  aggregate_fields : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PlanSummary
pub(all) struct PlanSummary {
  indexes_used : Array[Json]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ExecutePipelineRequest
pub(all) struct ExecutePipelineRequest {
  transaction : String?
  new_transaction : TransactionOptions?
  read_time : String?
  structured_pipeline : StructuredPipeline?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1EncryptionConfig
pub(all) struct GoogleFirestoreAdminV1EncryptionConfig {
  google_default_encryption : GoogleFirestoreAdminV1GoogleDefaultEncryptionOptions?
  use_source_encryption : GoogleFirestoreAdminV1SourceEncryptionOptions?
  customer_managed_encryption : GoogleFirestoreAdminV1CustomerManagedEncryptionOptions?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RunAggregationQueryRequest
pub(all) struct RunAggregationQueryRequest {
  structured_aggregation_query : StructuredAggregationQuery?
  transaction : String?
  explain_options : ExplainOptions?
  new_transaction : TransactionOptions?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1Progress
pub(all) struct GoogleFirestoreAdminV1Progress {
  estimated_work : String?
  completed_work : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1ListUserCredsResponse
pub(all) struct GoogleFirestoreAdminV1ListUserCredsResponse {
  user_creds : Array[GoogleFirestoreAdminV1UserCreds]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1DeleteDatabaseMetadata
pub(all) struct GoogleFirestoreAdminV1DeleteDatabaseMetadata {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DocumentsTarget
pub(all) struct DocumentsTarget {
  documents : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListLocationsResponse
pub(all) struct ListLocationsResponse {
  locations : Array[Location]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1SearchTextSpec
pub(all) struct GoogleFirestoreAdminV1SearchTextSpec {
  index_specs : Array[GoogleFirestoreAdminV1SearchTextIndexSpec]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BitSequence
pub(all) struct BitSequence {
  bitmap : String?
  padding : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1IndexOperationMetadata
pub(all) struct GoogleFirestoreAdminV1IndexOperationMetadata {
  start_time : String?
  progress_bytes : GoogleFirestoreAdminV1Progress?
  index : String?
  end_time : String?
  state : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BatchGetDocumentsRequest
pub(all) struct BatchGetDocumentsRequest {
  mask : DocumentMask?
  new_transaction : TransactionOptions?
  read_time : String?
  documents : Array[String]?
  transaction : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CommitResponse
pub(all) struct CommitResponse {
  write_results : Array[WriteResult]?
  commit_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RunAggregationQueryResponse
pub(all) struct RunAggregationQueryResponse {
  explain_metrics : ExplainMetrics?
  transaction : String?
  result : AggregationResult?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FieldFilter
pub(all) struct FieldFilter {
  value : Value?
  field : FieldReference?
  op : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1CloneDatabaseRequest
pub(all) struct GoogleFirestoreAdminV1CloneDatabaseRequest {
  tags : Json?
  database_id : String?
  pitr_snapshot : GoogleFirestoreAdminV1PitrSnapshot?
  encryption_config : GoogleFirestoreAdminV1EncryptionConfig?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1CreateDatabaseMetadata
pub(all) struct GoogleFirestoreAdminV1CreateDatabaseMetadata {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)
