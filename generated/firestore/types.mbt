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
/// Schema GoogleFirestoreAdminV1TtlConfig
pub(all) struct GoogleFirestoreAdminV1TtlConfig {
  state : String?
  expiration_offset : String?
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
  writes : Array[Write]?
  stream_token : String?
  labels : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1ListIndexesResponse
pub(all) struct GoogleFirestoreAdminV1ListIndexesResponse {
  next_page_token : String?
  indexes : Array[GoogleFirestoreAdminV1Index]?
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
/// Schema FieldTransform
pub(all) struct FieldTransform {
  append_missing_elements : ArrayValue?
  remove_all_from_array : ArrayValue?
  field_path : String?
  maximum : Value?
  set_to_server_value : String?
  increment : Value?
  minimum : Value?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1BulkDeleteDocumentsMetadata
pub(all) struct GoogleFirestoreAdminV1BulkDeleteDocumentsMetadata {
  collection_ids : Array[String]?
  start_time : String?
  end_time : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
  operation_state : String?
  namespace_ids : Array[String]?
  snapshot_time : String?
  progress_bytes : GoogleFirestoreAdminV1Progress?
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
  order : String?
  search_config : GoogleFirestoreAdminV1SearchConfig?
  field_path : String?
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
/// Schema GoogleFirestoreAdminV1ImportDocumentsRequest
pub(all) struct GoogleFirestoreAdminV1ImportDocumentsRequest {
  collection_ids : Array[String]?
  input_uri_prefix : String?
  namespace_ids : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RunAggregationQueryResponse
pub(all) struct RunAggregationQueryResponse {
  read_time : String?
  result : AggregationResult?
  explain_metrics : ExplainMetrics?
  transaction : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Function
pub(all) struct Function {
  options : Json?
  name : String?
  args : Array[Value]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BatchGetDocumentsRequest
pub(all) struct BatchGetDocumentsRequest {
  documents : Array[String]?
  mask : DocumentMask?
  transaction : String?
  read_time : String?
  new_transaction : TransactionOptions?
} derive (
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
/// Schema GoogleFirestoreAdminV1SourceEncryptionOptions
pub(all) struct GoogleFirestoreAdminV1SourceEncryptionOptions {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CommitResponse
pub(all) struct CommitResponse {
  commit_time : String?
  write_results : Array[WriteResult]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TargetChange
pub(all) struct TargetChange {
  target_change_type : String?
  target_ids : Array[Int]?
  cause : Status?
  resume_token : String?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ExistenceFilter
pub(all) struct ExistenceFilter {
  unchanged_names : BloomFilter?
  target_id : Int?
  count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BatchGetDocumentsResponse
pub(all) struct BatchGetDocumentsResponse {
  found : Document?
  missing : String?
  transaction : String?
  read_time : String?
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
/// Schema GoogleFirestoreAdminV1RestoreDatabaseRequest
pub(all) struct GoogleFirestoreAdminV1RestoreDatabaseRequest {
  database_id : String?
  backup : String?
  encryption_config : GoogleFirestoreAdminV1EncryptionConfig?
  tags : Json?
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
/// Schema GoogleFirestoreAdminV1CloneDatabaseMetadata
pub(all) struct GoogleFirestoreAdminV1CloneDatabaseMetadata {
  pitr_snapshot : GoogleFirestoreAdminV1PitrSnapshot?
  operation_state : String?
  start_time : String?
  end_time : String?
  progress_percentage : GoogleFirestoreAdminV1Progress?
  database : String?
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
/// Schema GoogleFirestoreAdminV1BackupSchedule
pub(all) struct GoogleFirestoreAdminV1BackupSchedule {
  name : String?
  retention : String?
  update_time : String?
  daily_recurrence : GoogleFirestoreAdminV1DailyRecurrence?
  weekly_recurrence : GoogleFirestoreAdminV1WeeklyRecurrence?
  create_time : String?
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
  database : String?
  stats : GoogleFirestoreAdminV1Stats?
  name : String?
  database_uid : String?
  expire_time : String?
  state : String?
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
/// Schema GoogleFirestoreAdminV1ListDatabasesResponse
pub(all) struct GoogleFirestoreAdminV1ListDatabasesResponse {
  unreachable_ : Array[String]?
  databases : Array[GoogleFirestoreAdminV1Database]?
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
/// Schema ExecutionStats
pub(all) struct ExecutionStats {
  debug_stats : Json?
  results_returned : String?
  execution_duration : String?
  read_operations : String?
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
/// Schema Empty
pub(all) struct Empty {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1IndexOperationMetadata
pub(all) struct GoogleFirestoreAdminV1IndexOperationMetadata {
  index : String?
  start_time : String?
  state : String?
  end_time : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
  progress_bytes : GoogleFirestoreAdminV1Progress?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
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
/// Schema ListDocumentsResponse
pub(all) struct ListDocumentsResponse {
  next_page_token : String?
  documents : Array[Document]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1FieldOperationMetadata
pub(all) struct GoogleFirestoreAdminV1FieldOperationMetadata {
  progress_bytes : GoogleFirestoreAdminV1Progress?
  progress_documents : GoogleFirestoreAdminV1Progress?
  end_time : String?
  index_config_deltas : Array[GoogleFirestoreAdminV1IndexConfigDelta]?
  start_time : String?
  state : String?
  field : String?
  ttl_config_delta : GoogleFirestoreAdminV1TtlConfigDelta?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1ExportDocumentsMetadata
pub(all) struct GoogleFirestoreAdminV1ExportDocumentsMetadata {
  collection_ids : Array[String]?
  end_time : String?
  output_uri_prefix : String?
  operation_state : String?
  progress_bytes : GoogleFirestoreAdminV1Progress?
  start_time : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
  namespace_ids : Array[String]?
  snapshot_time : String?
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
/// Schema Location
pub(all) struct Location {
  metadata : Json?
  name : String?
  labels : Json?
  location_id : String?
  display_name : String?
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
/// Schema GoogleFirestoreAdminV1UserCreds
pub(all) struct GoogleFirestoreAdminV1UserCreds {
  create_time : String?
  resource_identity : GoogleFirestoreAdminV1ResourceIdentity?
  name : String?
  update_time : String?
  state : String?
  secure_password : String?
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
/// Schema GoogleFirestoreAdminV1ExportDocumentsRequest
pub(all) struct GoogleFirestoreAdminV1ExportDocumentsRequest {
  namespace_ids : Array[String]?
  snapshot_time : String?
  collection_ids : Array[String]?
  output_uri_prefix : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1Field
pub(all) struct GoogleFirestoreAdminV1Field {
  name : String?
  index_config : GoogleFirestoreAdminV1IndexConfig?
  ttl_config : GoogleFirestoreAdminV1TtlConfig?
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
/// Schema GoogleFirestoreAdminV1ListBackupsResponse
pub(all) struct GoogleFirestoreAdminV1ListBackupsResponse {
  unreachable_ : Array[String]?
  backups : Array[GoogleFirestoreAdminV1Backup]?
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
/// Schema GoogleFirestoreAdminV1CreateDatabaseMetadata
pub(all) struct GoogleFirestoreAdminV1CreateDatabaseMetadata {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
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
/// Schema GoogleFirestoreAdminV1ImportDocumentsMetadata
pub(all) struct GoogleFirestoreAdminV1ImportDocumentsMetadata {
  progress_documents : GoogleFirestoreAdminV1Progress?
  input_uri_prefix : String?
  operation_state : String?
  namespace_ids : Array[String]?
  progress_bytes : GoogleFirestoreAdminV1Progress?
  collection_ids : Array[String]?
  start_time : String?
  end_time : String?
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
/// Schema GoogleLongrunningListOperationsResponse
pub(all) struct GoogleLongrunningListOperationsResponse {
  operations : Array[GoogleLongrunningOperation]?
  unreachable_ : Array[String]?
  next_page_token : String?
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
/// Schema StructuredAggregationQuery
pub(all) struct StructuredAggregationQuery {
  structured_query : StructuredQuery?
  aggregations : Array[Aggregation]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CollectionSelector
pub(all) struct CollectionSelector {
  collection_id : String?
  all_descendants : Bool?
} derive (
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
/// Schema DocumentRemove
pub(all) struct DocumentRemove {
  removed_target_ids : Array[Int]?
  document : String?
  read_time : String?
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
/// Schema Target
pub(all) struct Target {
  target_id : Int?
  once : Bool?
  documents : DocumentsTarget?
  expected_count : Int?
  resume_token : String?
  query : QueryTarget?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1SearchConfig
pub(all) struct GoogleFirestoreAdminV1SearchConfig {
  geo_spec : GoogleFirestoreAdminV1SearchGeoSpec?
  text_spec : GoogleFirestoreAdminV1SearchTextSpec?
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
/// Schema GoogleFirestoreAdminV1Index
pub(all) struct GoogleFirestoreAdminV1Index {
  density : String?
  shard_count : Int?
  api_scope : String?
  fields : Array[GoogleFirestoreAdminV1IndexField]?
  state : String?
  name : String?
  unique : Bool?
  search_index_options : GoogleFirestoreAdminV1SearchIndexOptions?
  query_scope : String?
  multikey : Bool?
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
/// Schema GoogleFirestoreAdminV1Stats
pub(all) struct GoogleFirestoreAdminV1Stats {
  index_count : String?
  size_bytes : String?
  document_count : String?
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
/// Schema GoogleLongrunningCancelOperationRequest
pub(all) struct GoogleLongrunningCancelOperationRequest {} derive (
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
/// Schema GoogleFirestoreAdminV1PitrSnapshot
pub(all) struct GoogleFirestoreAdminV1PitrSnapshot {
  database : String?
  snapshot_time : String?
  database_uid : String?
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
/// Schema GoogleFirestoreAdminV1GoogleDefaultEncryptionOptions
pub(all) struct GoogleFirestoreAdminV1GoogleDefaultEncryptionOptions {} derive (
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
/// Schema RunQueryResponse
pub(all) struct RunQueryResponse {
  skipped_results : Int?
  explain_metrics : ExplainMetrics?
  transaction : String?
  document : Document?
  read_time : String?
  done : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1VectorConfig
pub(all) struct GoogleFirestoreAdminV1VectorConfig {
  dimension : Int?
  flat : GoogleFirestoreAdminV1FlatIndex?
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
/// Schema GoogleFirestoreAdminV1EncryptionConfig
pub(all) struct GoogleFirestoreAdminV1EncryptionConfig {
  use_source_encryption : GoogleFirestoreAdminV1SourceEncryptionOptions?
  google_default_encryption : GoogleFirestoreAdminV1GoogleDefaultEncryptionOptions?
  customer_managed_encryption : GoogleFirestoreAdminV1CustomerManagedEncryptionOptions?
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
  read_time : String?
  removed_target_ids : Array[Int]?
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
/// Schema Filter
pub(all) struct Filter {
  field_filter : FieldFilter?
  composite_filter : CompositeFilter?
  unary_filter : UnaryFilter?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BatchWriteResponse
pub(all) struct BatchWriteResponse {
  status : Array[Status]?
  write_results : Array[WriteResult]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1IndexConfig
pub(all) struct GoogleFirestoreAdminV1IndexConfig {
  reverting : Bool?
  ancestor_field : String?
  indexes : Array[GoogleFirestoreAdminV1Index]?
  uses_ancestor_config : Bool?
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
/// Schema StructuredQuery
pub(all) struct StructuredQuery {
  start_at : Cursor?
  where_ : Filter?
  order_by : Array[Order]?
  end_at : Cursor?
  select : Projection?
  offset : Int?
  from : Array[CollectionSelector]?
  limit : Int?
  find_nearest : FindNearest?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(where_(rename="where"))),
  ToJson(rename_fields="camelCase", fields(where_(rename="where"))),
)

///|
/// Schema GoogleFirestoreAdminV1CloneDatabaseRequest
pub(all) struct GoogleFirestoreAdminV1CloneDatabaseRequest {
  pitr_snapshot : GoogleFirestoreAdminV1PitrSnapshot?
  encryption_config : GoogleFirestoreAdminV1EncryptionConfig?
  tags : Json?
  database_id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Aggregation
pub(all) struct Aggregation {
  alias_ : String?
  count : Count?
  avg : Avg?
  sum : Sum?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(alias_(rename="alias"))),
  ToJson(rename_fields="camelCase", fields(alias_(rename="alias"))),
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
/// Schema ExecutePipelineRequest
pub(all) struct ExecutePipelineRequest {
  structured_pipeline : StructuredPipeline?
  transaction : String?
  new_transaction : TransactionOptions?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListenResponse
pub(all) struct ListenResponse {
  document_change : DocumentChange?
  document_delete : DocumentDelete?
  document_remove : DocumentRemove?
  target_change : TargetChange?
  filter : ExistenceFilter?
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
/// Schema ExecutePipelineResponse
pub(all) struct ExecutePipelineResponse {
  results : Array[Document]?
  explain_stats : ExplainStats?
  transaction : String?
  execution_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
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
/// Schema StructuredPipeline
pub(all) struct StructuredPipeline {
  options : Json?
  pipeline : Pipeline?
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
/// Schema GoogleFirestoreAdminV1DailyRecurrence
pub(all) struct GoogleFirestoreAdminV1DailyRecurrence {} derive (
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
/// Schema ListenRequest
pub(all) struct ListenRequest {
  add_target : Target?
  remove_target : Int?
  labels : Json?
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
/// Schema GoogleFirestoreAdminV1RestoreDatabaseMetadata
pub(all) struct GoogleFirestoreAdminV1RestoreDatabaseMetadata {
  operation_state : String?
  database : String?
  end_time : String?
  backup : String?
  progress_percentage : GoogleFirestoreAdminV1Progress?
  start_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RunAggregationQueryRequest
pub(all) struct RunAggregationQueryRequest {
  read_time : String?
  new_transaction : TransactionOptions?
  structured_aggregation_query : StructuredAggregationQuery?
  transaction : String?
  explain_options : ExplainOptions?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Value
pub(all) struct Value {
  pipeline_value : Pipeline?
  variable_reference_value : String?
  string_value : String?
  double_value : Double?
  array_value : ArrayValue?
  null_value : String?
  bytes_value : String?
  integer_value : String?
  reference_value : String?
  boolean_value : Bool?
  function_value : Function?
  geo_point_value : LatLng?
  timestamp_value : String?
  map_value : MapValue?
  field_reference_value : String?
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
  read_time : String?
  page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Document
pub(all) struct Document {
  fields : Json?
  create_time : String?
  update_time : String?
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DocumentTransform
pub(all) struct DocumentTransform {
  field_transforms : Array[FieldTransform]?
  document : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FindNearest
pub(all) struct FindNearest {
  distance_threshold : Double?
  vector_field : FieldReference?
  limit : Int?
  distance_result_field : String?
  query_vector : Value?
  distance_measure : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
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
/// Schema GoogleFirestoreAdminV1ResetUserPasswordRequest
pub(all) struct GoogleFirestoreAdminV1ResetUserPasswordRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Cursor
pub(all) struct Cursor {
  before : Bool?
  values : Array[Value]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
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
/// Schema GoogleFirestoreAdminV1Database
pub(all) struct GoogleFirestoreAdminV1Database {
  database_edition : String?
  app_engine_integration_mode : String?
  etag : String?
  uid : String?
  location_id : String?
  source_info : GoogleFirestoreAdminV1SourceInfo?
  previous_id : String?
  tags : Json?
  free_tier : Bool?
  delete_protection_state : String?
  type_ : String?
  earliest_version_time : String?
  point_in_time_recovery_enablement : String?
  mongodb_compatible_data_access_mode : String?
  firestore_data_access_mode : String?
  update_time : String?
  delete_time : String?
  cmek_config : GoogleFirestoreAdminV1CmekConfig?
  realtime_updates_mode : String?
  name : String?
  concurrency_mode : String?
  create_time : String?
  version_retention_period : String?
  key_prefix : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
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
/// Schema GoogleLongrunningOperation
pub(all) struct GoogleLongrunningOperation {
  done : Bool?
  error : Status?
  response : Json?
  name : String?
  metadata : Json?
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
/// Schema PartitionQueryRequest
pub(all) struct PartitionQueryRequest {
  partition_count : String?
  read_time : String?
  page_size : Int?
  structured_query : StructuredQuery?
  page_token : String?
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
  explain_options : ExplainOptions?
  structured_query : StructuredQuery?
  new_transaction : TransactionOptions?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Write
pub(all) struct Write {
  update : Document?
  delete : String?
  update_mask : DocumentMask?
  update_transforms : Array[FieldTransform]?
  transform : DocumentTransform?
  current_document : Precondition?
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
/// Schema BatchWriteRequest
pub(all) struct BatchWriteRequest {
  labels : Json?
  writes : Array[Write]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema WriteResult
pub(all) struct WriteResult {
  update_time : String?
  transform_results : Array[Value]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema WriteResponse
pub(all) struct WriteResponse {
  stream_id : String?
  write_results : Array[WriteResult]?
  commit_time : String?
  stream_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DocumentChange
pub(all) struct DocumentChange {
  removed_target_ids : Array[Int]?
  target_ids : Array[Int]?
  document : Document?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)
