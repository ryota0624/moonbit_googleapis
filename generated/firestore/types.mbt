///|
/// Schema GoogleFirestoreAdminV1CreateDatabaseMetadata
pub(all) struct GoogleFirestoreAdminV1CreateDatabaseMetadata {} derive (
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
/// Schema TransactionOptions
pub(all) struct TransactionOptions {
  read_write : ReadWrite?
  read_only : ReadOnly?
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
  read_time : String?
  transaction : String?
  new_transaction : TransactionOptions?
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
  read_time : String?
  transaction : String?
  missing : String?
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
/// Schema GoogleLongrunningCancelOperationRequest
pub(all) struct GoogleLongrunningCancelOperationRequest {} derive (
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
/// Schema ListenResponse
pub(all) struct ListenResponse {
  document_delete : DocumentDelete?
  document_remove : DocumentRemove?
  filter : ExistenceFilter?
  target_change : TargetChange?
  document_change : DocumentChange?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Filter
pub(all) struct Filter {
  composite_filter : CompositeFilter?
  field_filter : FieldFilter?
  unary_filter : UnaryFilter?
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
/// Schema Function
pub(all) struct Function {
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
/// Schema FieldTransform
pub(all) struct FieldTransform {
  append_missing_elements : ArrayValue?
  field_path : String?
  maximum : Value?
  minimum : Value?
  remove_all_from_array : ArrayValue?
  set_to_server_value : String?
  increment : Value?
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
/// Schema Document
pub(all) struct Document {
  fields : Json?
  name : String?
  update_time : String?
  create_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TargetChange
pub(all) struct TargetChange {
  cause : Status?
  resume_token : String?
  target_ids : Array[Int]?
  target_change_type : String?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ExplainMetrics
pub(all) struct ExplainMetrics {
  execution_stats : ExecutionStats?
  plan_summary : PlanSummary?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PartitionQueryResponse
pub(all) struct PartitionQueryResponse {
  next_page_token : String?
  partitions : Array[Cursor]?
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
/// Schema GoogleFirestoreAdminV1Backup
pub(all) struct GoogleFirestoreAdminV1Backup {
  name : String?
  expire_time : String?
  database : String?
  database_uid : String?
  stats : GoogleFirestoreAdminV1Stats?
  snapshot_time : String?
  state : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1IndexOperationMetadata
pub(all) struct GoogleFirestoreAdminV1IndexOperationMetadata {
  state : String?
  index : String?
  end_time : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
  start_time : String?
  progress_bytes : GoogleFirestoreAdminV1Progress?
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
/// Schema GoogleFirestoreAdminV1LocationMetadata
pub(all) struct GoogleFirestoreAdminV1LocationMetadata {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1Stats
pub(all) struct GoogleFirestoreAdminV1Stats {
  size_bytes : String?
  index_count : String?
  document_count : String?
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
/// Schema GoogleFirestoreAdminV1IndexField
pub(all) struct GoogleFirestoreAdminV1IndexField {
  array_config : String?
  search_config : GoogleFirestoreAdminV1SearchConfig?
  vector_config : GoogleFirestoreAdminV1VectorConfig?
  order : String?
  field_path : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1Database
pub(all) struct GoogleFirestoreAdminV1Database {
  app_engine_integration_mode : String?
  etag : String?
  version_retention_period : String?
  point_in_time_recovery_enablement : String?
  database_edition : String?
  mongodb_compatible_data_access_mode : String?
  type_ : String?
  uid : String?
  tags : Json?
  earliest_version_time : String?
  cmek_config : GoogleFirestoreAdminV1CmekConfig?
  create_time : String?
  free_tier : Bool?
  source_info : GoogleFirestoreAdminV1SourceInfo?
  firestore_data_access_mode : String?
  update_time : String?
  delete_time : String?
  location_id : String?
  concurrency_mode : String?
  delete_protection_state : String?
  key_prefix : String?
  realtime_updates_mode : String?
  name : String?
  previous_id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema GoogleFirestoreAdminV1Index
pub(all) struct GoogleFirestoreAdminV1Index {
  multikey : Bool?
  search_index_options : GoogleFirestoreAdminV1SearchIndexOptions?
  fields : Array[GoogleFirestoreAdminV1IndexField]?
  density : String?
  name : String?
  api_scope : String?
  unique : Bool?
  query_scope : String?
  state : String?
  shard_count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1CloneDatabaseRequest
pub(all) struct GoogleFirestoreAdminV1CloneDatabaseRequest {
  pitr_snapshot : GoogleFirestoreAdminV1PitrSnapshot?
  encryption_config : GoogleFirestoreAdminV1EncryptionConfig?
  database_id : String?
  tags : Json?
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
/// Schema CompositeFilter
pub(all) struct CompositeFilter {
  op : String?
  filters : Array[Filter]?
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
/// Schema GoogleFirestoreAdminV1ExportDocumentsRequest
pub(all) struct GoogleFirestoreAdminV1ExportDocumentsRequest {
  collection_ids : Array[String]?
  snapshot_time : String?
  output_uri_prefix : String?
  namespace_ids : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RunQueryResponse
pub(all) struct RunQueryResponse {
  done : Bool?
  read_time : String?
  explain_metrics : ExplainMetrics?
  transaction : String?
  document : Document?
  skipped_results : Int?
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
/// Schema GoogleFirestoreAdminV1UpdateDatabaseMetadata
pub(all) struct GoogleFirestoreAdminV1UpdateDatabaseMetadata {} derive (
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
/// Schema Write
pub(all) struct Write {
  update_transforms : Array[FieldTransform]?
  current_document : Precondition?
  delete : String?
  transform : DocumentTransform?
  update : Document?
  update_mask : DocumentMask?
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
/// Schema RunQueryRequest
pub(all) struct RunQueryRequest {
  transaction : String?
  new_transaction : TransactionOptions?
  read_time : String?
  structured_query : StructuredQuery?
  explain_options : ExplainOptions?
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
  backup : String?
  end_time : String?
  database : String?
  start_time : String?
  progress_percentage : GoogleFirestoreAdminV1Progress?
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
/// Schema Location
pub(all) struct Location {
  display_name : String?
  name : String?
  metadata : Json?
  location_id : String?
  labels : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1RestoreDatabaseRequest
pub(all) struct GoogleFirestoreAdminV1RestoreDatabaseRequest {
  backup : String?
  encryption_config : GoogleFirestoreAdminV1EncryptionConfig?
  database_id : String?
  tags : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1CloneDatabaseMetadata
pub(all) struct GoogleFirestoreAdminV1CloneDatabaseMetadata {
  operation_state : String?
  end_time : String?
  database : String?
  pitr_snapshot : GoogleFirestoreAdminV1PitrSnapshot?
  start_time : String?
  progress_percentage : GoogleFirestoreAdminV1Progress?
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
/// Schema Status
pub(all) struct Status {
  message : String?
  code : Int?
  details : Array[Json]?
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
/// Schema DocumentChange
pub(all) struct DocumentChange {
  document : Document?
  target_ids : Array[Int]?
  removed_target_ids : Array[Int]?
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
/// Schema FieldFilter
pub(all) struct FieldFilter {
  op : String?
  value : Value?
  field : FieldReference?
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
/// Schema DocumentDelete
pub(all) struct DocumentDelete {
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
/// Schema GoogleFirestoreAdminV1SearchTextIndexSpec
pub(all) struct GoogleFirestoreAdminV1SearchTextIndexSpec {
  match_type : String?
  index_type : String?
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
/// Schema GoogleFirestoreAdminV1SearchIndexOptions
pub(all) struct GoogleFirestoreAdminV1SearchIndexOptions {
  text_language_override_field_path : String?
  text_language : String?
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
  namespace_ids : Array[String]?
  collection_ids : Array[String]?
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
/// Schema RunAggregationQueryRequest
pub(all) struct RunAggregationQueryRequest {
  explain_options : ExplainOptions?
  transaction : String?
  new_transaction : TransactionOptions?
  structured_aggregation_query : StructuredAggregationQuery?
  read_time : String?
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
  database_uid : String?
  snapshot_time : String?
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
/// Schema GoogleLongrunningOperation
pub(all) struct GoogleLongrunningOperation {
  response : Json?
  metadata : Json?
  done : Bool?
  error : Status?
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
/// Schema GoogleFirestoreAdminV1SourceEncryptionOptions
pub(all) struct GoogleFirestoreAdminV1SourceEncryptionOptions {} derive (
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
/// Schema GoogleFirestoreAdminV1BackupSchedule
pub(all) struct GoogleFirestoreAdminV1BackupSchedule {
  daily_recurrence : GoogleFirestoreAdminV1DailyRecurrence?
  name : String?
  update_time : String?
  weekly_recurrence : GoogleFirestoreAdminV1WeeklyRecurrence?
  create_time : String?
  retention : String?
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
/// Schema GoogleFirestoreAdminV1UserCreds
pub(all) struct GoogleFirestoreAdminV1UserCreds {
  create_time : String?
  state : String?
  resource_identity : GoogleFirestoreAdminV1ResourceIdentity?
  secure_password : String?
  name : String?
  update_time : String?
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
  structured_query : StructuredQuery?
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
/// Schema BatchGetDocumentsRequest
pub(all) struct BatchGetDocumentsRequest {
  mask : DocumentMask?
  documents : Array[String]?
  read_time : String?
  transaction : String?
  new_transaction : TransactionOptions?
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
/// Schema Aggregation
pub(all) struct Aggregation {
  count : Count?
  sum : Sum?
  avg : Avg?
  alias_ : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(alias_(rename="alias"))),
  ToJson(rename_fields="camelCase", fields(alias_(rename="alias"))),
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
/// Schema GoogleFirestoreAdminV1ExportDocumentsMetadata
pub(all) struct GoogleFirestoreAdminV1ExportDocumentsMetadata {
  operation_state : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
  output_uri_prefix : String?
  collection_ids : Array[String]?
  namespace_ids : Array[String]?
  progress_bytes : GoogleFirestoreAdminV1Progress?
  snapshot_time : String?
  end_time : String?
  start_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DocumentRemove
pub(all) struct DocumentRemove {
  read_time : String?
  removed_target_ids : Array[Int]?
  document : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1Progress
pub(all) struct GoogleFirestoreAdminV1Progress {
  completed_work : String?
  estimated_work : String?
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
/// Schema Value
pub(all) struct Value {
  integer_value : String?
  geo_point_value : LatLng?
  bytes_value : String?
  null_value : String?
  variable_reference_value : String?
  timestamp_value : String?
  reference_value : String?
  field_reference_value : String?
  boolean_value : Bool?
  array_value : ArrayValue?
  function_value : Function?
  pipeline_value : Pipeline?
  double_value : Double?
  string_value : String?
  map_value : MapValue?
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
/// Schema GoogleFirestoreAdminV1ResetUserPasswordRequest
pub(all) struct GoogleFirestoreAdminV1ResetUserPasswordRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Target
pub(all) struct Target {
  resume_token : String?
  once : Bool?
  target_id : Int?
  documents : DocumentsTarget?
  read_time : String?
  expected_count : Int?
  query : QueryTarget?
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
/// Schema StructuredQuery
pub(all) struct StructuredQuery {
  find_nearest : FindNearest?
  select : Projection?
  offset : Int?
  from : Array[CollectionSelector]?
  where_ : Filter?
  order_by : Array[Order]?
  end_at : Cursor?
  start_at : Cursor?
  limit : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(where_(rename="where"))),
  ToJson(rename_fields="camelCase", fields(where_(rename="where"))),
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
/// Schema ListCollectionIdsRequest
pub(all) struct ListCollectionIdsRequest {
  read_time : String?
  page_size : Int?
  page_token : String?
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
/// Schema WriteResponse
pub(all) struct WriteResponse {
  stream_id : String?
  stream_token : String?
  write_results : Array[WriteResult]?
  commit_time : String?
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
  uses_ancestor_config : Bool?
  indexes : Array[GoogleFirestoreAdminV1Index]?
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
  execution_time : String?
  transaction : String?
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
/// Schema GoogleFirestoreAdminV1FieldOperationMetadata
pub(all) struct GoogleFirestoreAdminV1FieldOperationMetadata {
  start_time : String?
  progress_bytes : GoogleFirestoreAdminV1Progress?
  field : String?
  index_config_deltas : Array[GoogleFirestoreAdminV1IndexConfigDelta]?
  end_time : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
  ttl_config_delta : GoogleFirestoreAdminV1TtlConfigDelta?
  state : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ExecutionStats
pub(all) struct ExecutionStats {
  execution_duration : String?
  debug_stats : Json?
  read_operations : String?
  results_returned : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FindNearest
pub(all) struct FindNearest {
  distance_measure : String?
  query_vector : Value?
  vector_field : FieldReference?
  limit : Int?
  distance_result_field : String?
  distance_threshold : Double?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RunAggregationQueryResponse
pub(all) struct RunAggregationQueryResponse {
  transaction : String?
  read_time : String?
  explain_metrics : ExplainMetrics?
  result : AggregationResult?
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
/// Schema GoogleFirestoreAdminV1BulkDeleteDocumentsMetadata
pub(all) struct GoogleFirestoreAdminV1BulkDeleteDocumentsMetadata {
  collection_ids : Array[String]?
  start_time : String?
  progress_bytes : GoogleFirestoreAdminV1Progress?
  namespace_ids : Array[String]?
  snapshot_time : String?
  operation_state : String?
  end_time : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
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
/// Schema BitSequence
pub(all) struct BitSequence {
  padding : Int?
  bitmap : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema QueryTarget
pub(all) struct QueryTarget {
  structured_query : StructuredQuery?
  parent : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1ImportDocumentsMetadata
pub(all) struct GoogleFirestoreAdminV1ImportDocumentsMetadata {
  namespace_ids : Array[String]?
  start_time : String?
  progress_bytes : GoogleFirestoreAdminV1Progress?
  collection_ids : Array[String]?
  input_uri_prefix : String?
  end_time : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
  operation_state : String?
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
/// Schema Order
pub(all) struct Order {
  direction : String?
  field : FieldReference?
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
/// Schema BloomFilter
pub(all) struct BloomFilter {
  hash_count : Int?
  bits : BitSequence?
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
/// Schema Pipeline
pub(all) struct Pipeline {
  stages : Array[Stage]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)
