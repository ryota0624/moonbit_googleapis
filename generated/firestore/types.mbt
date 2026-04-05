///|
/// Schema ListLocationsResponse
pub(all) struct ListLocationsResponse {
  locations : Array[Location]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Location
pub(all) struct Location {
  name : String?
  location_id : String?
  display_name : String?
  labels : Json?
  metadata : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleLongrunningListOperationsResponse
pub(all) struct GoogleLongrunningListOperationsResponse {
  operations : Array[GoogleLongrunningOperation]?
  next_page_token : String?
  unreachable_ : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(
    rename_fields="camelCase",
    fields(unreachable_(rename="unreachable")),
  ),
)

///|
/// Schema GoogleLongrunningOperation
pub(all) struct GoogleLongrunningOperation {
  name : String?
  metadata : Json?
  done : Bool?
  error : Status?
  response : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Status
pub(all) struct Status {
  code : Int?
  message : String?
  details : Array[Json]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Empty
pub(all) struct Empty {} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleLongrunningCancelOperationRequest
pub(all) struct GoogleLongrunningCancelOperationRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1Index
pub(all) struct GoogleFirestoreAdminV1Index {
  name : String?
  query_scope : String?
  api_scope : String?
  fields : Array[GoogleFirestoreAdminV1IndexField]?
  state : String?
  density : String?
  multikey : Bool?
  shard_count : Int?
  unique : Bool?
  search_index_options : GoogleFirestoreAdminV1SearchIndexOptions?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1IndexField
pub(all) struct GoogleFirestoreAdminV1IndexField {
  field_path : String?
  order : String?
  array_config : String?
  vector_config : GoogleFirestoreAdminV1VectorConfig?
  search_config : GoogleFirestoreAdminV1SearchConfig?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1VectorConfig
pub(all) struct GoogleFirestoreAdminV1VectorConfig {
  dimension : Int?
  flat : GoogleFirestoreAdminV1FlatIndex?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1FlatIndex
pub(all) struct GoogleFirestoreAdminV1FlatIndex {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1SearchConfig
pub(all) struct GoogleFirestoreAdminV1SearchConfig {
  text_spec : GoogleFirestoreAdminV1SearchTextSpec?
  geo_spec : GoogleFirestoreAdminV1SearchGeoSpec?
  number_spec : GoogleFirestoreAdminV1SearchNumberSpec?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1SearchTextSpec
pub(all) struct GoogleFirestoreAdminV1SearchTextSpec {
  index_specs : Array[GoogleFirestoreAdminV1SearchTextIndexSpec]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1SearchTextIndexSpec
pub(all) struct GoogleFirestoreAdminV1SearchTextIndexSpec {
  index_type : String?
  match_type : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1SearchGeoSpec
pub(all) struct GoogleFirestoreAdminV1SearchGeoSpec {
  geo_json_indexing_disabled : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1SearchNumberSpec
pub(all) struct GoogleFirestoreAdminV1SearchNumberSpec {
  index_type : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1SearchIndexOptions
pub(all) struct GoogleFirestoreAdminV1SearchIndexOptions {
  text_language : String?
  text_language_override_field_path : String?
  custom_partition_field_paths : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1ListIndexesResponse
pub(all) struct GoogleFirestoreAdminV1ListIndexesResponse {
  indexes : Array[GoogleFirestoreAdminV1Index]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1Field
pub(all) struct GoogleFirestoreAdminV1Field {
  name : String?
  index_config : GoogleFirestoreAdminV1IndexConfig?
  ttl_config : GoogleFirestoreAdminV1TtlConfig?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1IndexConfig
pub(all) struct GoogleFirestoreAdminV1IndexConfig {
  indexes : Array[GoogleFirestoreAdminV1Index]?
  uses_ancestor_config : Bool?
  ancestor_field : String?
  reverting : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1TtlConfig
pub(all) struct GoogleFirestoreAdminV1TtlConfig {
  state : String?
  expiration_offset : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1ListFieldsResponse
pub(all) struct GoogleFirestoreAdminV1ListFieldsResponse {
  fields : Array[GoogleFirestoreAdminV1Field]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1ExportDocumentsRequest
pub(all) struct GoogleFirestoreAdminV1ExportDocumentsRequest {
  collection_ids : Array[String]?
  output_uri_prefix : String?
  namespace_ids : Array[String]?
  snapshot_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1ImportDocumentsRequest
pub(all) struct GoogleFirestoreAdminV1ImportDocumentsRequest {
  collection_ids : Array[String]?
  input_uri_prefix : String?
  namespace_ids : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1BulkDeleteDocumentsRequest
pub(all) struct GoogleFirestoreAdminV1BulkDeleteDocumentsRequest {
  collection_ids : Array[String]?
  namespace_ids : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1Database
pub(all) struct GoogleFirestoreAdminV1Database {
  name : String?
  uid : String?
  create_time : String?
  update_time : String?
  delete_time : String?
  location_id : String?
  type_ : String?
  concurrency_mode : String?
  version_retention_period : String?
  earliest_version_time : String?
  point_in_time_recovery_enablement : String?
  app_engine_integration_mode : String?
  key_prefix : String?
  delete_protection_state : String?
  cmek_config : GoogleFirestoreAdminV1CmekConfig?
  previous_id : String?
  source_info : GoogleFirestoreAdminV1SourceInfo?
  tags : Json?
  free_tier : Bool?
  etag : String?
  database_edition : String?
  realtime_updates_mode : String?
  firestore_data_access_mode : String?
  mongodb_compatible_data_access_mode : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema GoogleFirestoreAdminV1CmekConfig
pub(all) struct GoogleFirestoreAdminV1CmekConfig {
  kms_key_name : String?
  active_key_version : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1SourceInfo
pub(all) struct GoogleFirestoreAdminV1SourceInfo {
  backup : GoogleFirestoreAdminV1BackupSource?
  operation : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1BackupSource
pub(all) struct GoogleFirestoreAdminV1BackupSource {
  backup : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

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
)

///|
/// Schema GoogleFirestoreAdminV1UserCreds
pub(all) struct GoogleFirestoreAdminV1UserCreds {
  name : String?
  create_time : String?
  update_time : String?
  state : String?
  secure_password : String?
  resource_identity : GoogleFirestoreAdminV1ResourceIdentity?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1ResourceIdentity
pub(all) struct GoogleFirestoreAdminV1ResourceIdentity {
  principal : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1ListUserCredsResponse
pub(all) struct GoogleFirestoreAdminV1ListUserCredsResponse {
  user_creds : Array[GoogleFirestoreAdminV1UserCreds]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1EnableUserCredsRequest
pub(all) struct GoogleFirestoreAdminV1EnableUserCredsRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1DisableUserCredsRequest
pub(all) struct GoogleFirestoreAdminV1DisableUserCredsRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1ResetUserPasswordRequest
pub(all) struct GoogleFirestoreAdminV1ResetUserPasswordRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1Backup
pub(all) struct GoogleFirestoreAdminV1Backup {
  name : String?
  database : String?
  database_uid : String?
  snapshot_time : String?
  expire_time : String?
  stats : GoogleFirestoreAdminV1Stats?
  state : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1Stats
pub(all) struct GoogleFirestoreAdminV1Stats {
  size_bytes : String?
  document_count : String?
  index_count : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

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
)

///|
/// Schema GoogleFirestoreAdminV1RestoreDatabaseRequest
pub(all) struct GoogleFirestoreAdminV1RestoreDatabaseRequest {
  database_id : String?
  backup : String?
  encryption_config : GoogleFirestoreAdminV1EncryptionConfig?
  tags : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1EncryptionConfig
pub(all) struct GoogleFirestoreAdminV1EncryptionConfig {
  google_default_encryption : GoogleFirestoreAdminV1GoogleDefaultEncryptionOptions?
  use_source_encryption : GoogleFirestoreAdminV1SourceEncryptionOptions?
  customer_managed_encryption : GoogleFirestoreAdminV1CustomerManagedEncryptionOptions?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1GoogleDefaultEncryptionOptions
pub(all) struct GoogleFirestoreAdminV1GoogleDefaultEncryptionOptions {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1SourceEncryptionOptions
pub(all) struct GoogleFirestoreAdminV1SourceEncryptionOptions {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1CustomerManagedEncryptionOptions
pub(all) struct GoogleFirestoreAdminV1CustomerManagedEncryptionOptions {
  kms_key_name : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1BackupSchedule
pub(all) struct GoogleFirestoreAdminV1BackupSchedule {
  name : String?
  create_time : String?
  update_time : String?
  retention : String?
  daily_recurrence : GoogleFirestoreAdminV1DailyRecurrence?
  weekly_recurrence : GoogleFirestoreAdminV1WeeklyRecurrence?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1DailyRecurrence
pub(all) struct GoogleFirestoreAdminV1DailyRecurrence {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1WeeklyRecurrence
pub(all) struct GoogleFirestoreAdminV1WeeklyRecurrence {
  day : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1ListBackupSchedulesResponse
pub(all) struct GoogleFirestoreAdminV1ListBackupSchedulesResponse {
  backup_schedules : Array[GoogleFirestoreAdminV1BackupSchedule]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1CloneDatabaseRequest
pub(all) struct GoogleFirestoreAdminV1CloneDatabaseRequest {
  database_id : String?
  pitr_snapshot : GoogleFirestoreAdminV1PitrSnapshot?
  encryption_config : GoogleFirestoreAdminV1EncryptionConfig?
  tags : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1PitrSnapshot
pub(all) struct GoogleFirestoreAdminV1PitrSnapshot {
  database : String?
  database_uid : String?
  snapshot_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Document
pub(all) struct Document {
  name : String?
  fields : Json?
  create_time : String?
  update_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Value
pub(all) struct Value {
  null_value : String?
  boolean_value : Bool?
  integer_value : String?
  double_value : Double?
  timestamp_value : String?
  string_value : String?
  bytes_value : String?
  reference_value : String?
  geo_point_value : LatLng?
  array_value : ArrayValue?
  map_value : MapValue?
  field_reference_value : String?
  variable_reference_value : String?
  function_value : Function?
  pipeline_value : Pipeline?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LatLng
pub(all) struct LatLng {
  latitude : Double?
  longitude : Double?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ArrayValue
pub(all) struct ArrayValue {
  values : Array[Value]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema MapValue
pub(all) struct MapValue {
  fields : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Function
pub(all) struct Function {
  name : String?
  args : Array[Value]?
  options : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Pipeline
pub(all) struct Pipeline {
  stages : Array[Stage]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Stage
pub(all) struct Stage {
  name : String?
  args : Array[Value]?
  options : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListDocumentsResponse
pub(all) struct ListDocumentsResponse {
  documents : Array[Document]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BatchGetDocumentsRequest
pub(all) struct BatchGetDocumentsRequest {
  documents : Array[String]?
  mask : DocumentMask?
  transaction : String?
  new_transaction : TransactionOptions?
  read_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema DocumentMask
pub(all) struct DocumentMask {
  field_paths : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TransactionOptions
pub(all) struct TransactionOptions {
  read_only : ReadOnly?
  read_write : ReadWrite?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ReadOnly
pub(all) struct ReadOnly {
  read_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ReadWrite
pub(all) struct ReadWrite {
  retry_transaction : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BatchGetDocumentsResponse
pub(all) struct BatchGetDocumentsResponse {
  found : Document?
  missing : String?
  transaction : String?
  read_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BeginTransactionRequest
pub(all) struct BeginTransactionRequest {
  options : TransactionOptions?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BeginTransactionResponse
pub(all) struct BeginTransactionResponse {
  transaction : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CommitRequest
pub(all) struct CommitRequest {
  writes : Array[Write]?
  transaction : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Write
pub(all) struct Write {
  update : Document?
  delete : String?
  transform : DocumentTransform?
  update_mask : DocumentMask?
  update_transforms : Array[FieldTransform]?
  current_document : Precondition?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema DocumentTransform
pub(all) struct DocumentTransform {
  document : String?
  field_transforms : Array[FieldTransform]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema FieldTransform
pub(all) struct FieldTransform {
  field_path : String?
  set_to_server_value : String?
  increment : Value?
  maximum : Value?
  minimum : Value?
  append_missing_elements : ArrayValue?
  remove_all_from_array : ArrayValue?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Precondition
pub(all) struct Precondition {
  exists : Bool?
  update_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CommitResponse
pub(all) struct CommitResponse {
  write_results : Array[WriteResult]?
  commit_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema WriteResult
pub(all) struct WriteResult {
  update_time : String?
  transform_results : Array[Value]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema RollbackRequest
pub(all) struct RollbackRequest {
  transaction : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema RunQueryRequest
pub(all) struct RunQueryRequest {
  structured_query : StructuredQuery?
  transaction : String?
  new_transaction : TransactionOptions?
  read_time : String?
  explain_options : ExplainOptions?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema StructuredQuery
pub(all) struct StructuredQuery {
  select : Projection?
  from : Array[CollectionSelector]?
  where_ : Filter?
  order_by : Array[Order]?
  start_at : Cursor?
  end_at : Cursor?
  offset : Int?
  limit : Int?
  find_nearest : FindNearest?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(where_(rename="where"))),
)

///|
/// Schema Projection
pub(all) struct Projection {
  fields : Array[FieldReference]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema FieldReference
pub(all) struct FieldReference {
  field_path : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CollectionSelector
pub(all) struct CollectionSelector {
  collection_id : String?
  all_descendants : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Filter
pub(all) struct Filter {
  composite_filter : CompositeFilter?
  field_filter : FieldFilter?
  unary_filter : UnaryFilter?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CompositeFilter
pub(all) struct CompositeFilter {
  op : String?
  filters : Array[Filter]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema FieldFilter
pub(all) struct FieldFilter {
  field : FieldReference?
  op : String?
  value : Value?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema UnaryFilter
pub(all) struct UnaryFilter {
  op : String?
  field : FieldReference?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Order
pub(all) struct Order {
  field : FieldReference?
  direction : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Cursor
pub(all) struct Cursor {
  values : Array[Value]?
  before : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema FindNearest
pub(all) struct FindNearest {
  vector_field : FieldReference?
  query_vector : Value?
  distance_measure : String?
  limit : Int?
  distance_result_field : String?
  distance_threshold : Double?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ExplainOptions
pub(all) struct ExplainOptions {
  analyze : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema RunQueryResponse
pub(all) struct RunQueryResponse {
  transaction : String?
  document : Document?
  read_time : String?
  skipped_results : Int?
  done : Bool?
  explain_metrics : ExplainMetrics?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ExplainMetrics
pub(all) struct ExplainMetrics {
  plan_summary : PlanSummary?
  execution_stats : ExecutionStats?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PlanSummary
pub(all) struct PlanSummary {
  indexes_used : Array[Json]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ExecutionStats
pub(all) struct ExecutionStats {
  results_returned : String?
  execution_duration : String?
  read_operations : String?
  debug_stats : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ExecutePipelineRequest
pub(all) struct ExecutePipelineRequest {
  structured_pipeline : StructuredPipeline?
  transaction : String?
  new_transaction : TransactionOptions?
  read_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema StructuredPipeline
pub(all) struct StructuredPipeline {
  pipeline : Pipeline?
  options : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ExecutePipelineResponse
pub(all) struct ExecutePipelineResponse {
  transaction : String?
  results : Array[Document]?
  execution_time : String?
  explain_stats : ExplainStats?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ExplainStats
pub(all) struct ExplainStats {
  data : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema RunAggregationQueryRequest
pub(all) struct RunAggregationQueryRequest {
  structured_aggregation_query : StructuredAggregationQuery?
  transaction : String?
  new_transaction : TransactionOptions?
  read_time : String?
  explain_options : ExplainOptions?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema StructuredAggregationQuery
pub(all) struct StructuredAggregationQuery {
  structured_query : StructuredQuery?
  aggregations : Array[Aggregation]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Aggregation
pub(all) struct Aggregation {
  count : Count?
  sum : Sum?
  avg : Avg?
  alias : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Count
pub(all) struct Count {
  up_to : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Sum
pub(all) struct Sum {
  field : FieldReference?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Avg
pub(all) struct Avg {
  field : FieldReference?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema RunAggregationQueryResponse
pub(all) struct RunAggregationQueryResponse {
  result : AggregationResult?
  transaction : String?
  read_time : String?
  explain_metrics : ExplainMetrics?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AggregationResult
pub(all) struct AggregationResult {
  aggregate_fields : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PartitionQueryRequest
pub(all) struct PartitionQueryRequest {
  structured_query : StructuredQuery?
  partition_count : String?
  page_token : String?
  page_size : Int?
  read_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PartitionQueryResponse
pub(all) struct PartitionQueryResponse {
  partitions : Array[Cursor]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema WriteRequest
pub(all) struct WriteRequest {
  stream_id : String?
  writes : Array[Write]?
  stream_token : String?
  labels : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema WriteResponse
pub(all) struct WriteResponse {
  stream_id : String?
  stream_token : String?
  write_results : Array[WriteResult]?
  commit_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListenRequest
pub(all) struct ListenRequest {
  add_target : Target?
  remove_target : Int?
  labels : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Target
pub(all) struct Target {
  query : QueryTarget?
  documents : DocumentsTarget?
  resume_token : String?
  read_time : String?
  target_id : Int?
  once : Bool?
  expected_count : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema QueryTarget
pub(all) struct QueryTarget {
  parent : String?
  structured_query : StructuredQuery?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema DocumentsTarget
pub(all) struct DocumentsTarget {
  documents : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListenResponse
pub(all) struct ListenResponse {
  target_change : TargetChange?
  document_change : DocumentChange?
  document_delete : DocumentDelete?
  document_remove : DocumentRemove?
  filter : ExistenceFilter?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TargetChange
pub(all) struct TargetChange {
  target_change_type : String?
  target_ids : Array[Int]?
  cause : Status?
  resume_token : String?
  read_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema DocumentChange
pub(all) struct DocumentChange {
  document : Document?
  target_ids : Array[Int]?
  removed_target_ids : Array[Int]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema DocumentDelete
pub(all) struct DocumentDelete {
  document : String?
  removed_target_ids : Array[Int]?
  read_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema DocumentRemove
pub(all) struct DocumentRemove {
  document : String?
  removed_target_ids : Array[Int]?
  read_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ExistenceFilter
pub(all) struct ExistenceFilter {
  target_id : Int?
  count : Int?
  unchanged_names : BloomFilter?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BloomFilter
pub(all) struct BloomFilter {
  bits : BitSequence?
  hash_count : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BitSequence
pub(all) struct BitSequence {
  bitmap : String?
  padding : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListCollectionIdsRequest
pub(all) struct ListCollectionIdsRequest {
  page_size : Int?
  page_token : String?
  read_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListCollectionIdsResponse
pub(all) struct ListCollectionIdsResponse {
  collection_ids : Array[String]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BatchWriteRequest
pub(all) struct BatchWriteRequest {
  writes : Array[Write]?
  labels : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BatchWriteResponse
pub(all) struct BatchWriteResponse {
  write_results : Array[WriteResult]?
  status : Array[Status]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1FieldOperationMetadata
pub(all) struct GoogleFirestoreAdminV1FieldOperationMetadata {
  start_time : String?
  end_time : String?
  field : String?
  index_config_deltas : Array[GoogleFirestoreAdminV1IndexConfigDelta]?
  state : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
  progress_bytes : GoogleFirestoreAdminV1Progress?
  ttl_config_delta : GoogleFirestoreAdminV1TtlConfigDelta?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1IndexConfigDelta
pub(all) struct GoogleFirestoreAdminV1IndexConfigDelta {
  change_type : String?
  index : GoogleFirestoreAdminV1Index?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1Progress
pub(all) struct GoogleFirestoreAdminV1Progress {
  estimated_work : String?
  completed_work : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1TtlConfigDelta
pub(all) struct GoogleFirestoreAdminV1TtlConfigDelta {
  change_type : String?
  expiration_offset : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1IndexOperationMetadata
pub(all) struct GoogleFirestoreAdminV1IndexOperationMetadata {
  start_time : String?
  end_time : String?
  index : String?
  state : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
  progress_bytes : GoogleFirestoreAdminV1Progress?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1LocationMetadata
pub(all) struct GoogleFirestoreAdminV1LocationMetadata {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1ExportDocumentsMetadata
pub(all) struct GoogleFirestoreAdminV1ExportDocumentsMetadata {
  start_time : String?
  end_time : String?
  operation_state : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
  progress_bytes : GoogleFirestoreAdminV1Progress?
  collection_ids : Array[String]?
  output_uri_prefix : String?
  namespace_ids : Array[String]?
  snapshot_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1BulkDeleteDocumentsMetadata
pub(all) struct GoogleFirestoreAdminV1BulkDeleteDocumentsMetadata {
  start_time : String?
  end_time : String?
  operation_state : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
  progress_bytes : GoogleFirestoreAdminV1Progress?
  collection_ids : Array[String]?
  namespace_ids : Array[String]?
  snapshot_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1ImportDocumentsMetadata
pub(all) struct GoogleFirestoreAdminV1ImportDocumentsMetadata {
  start_time : String?
  end_time : String?
  operation_state : String?
  progress_documents : GoogleFirestoreAdminV1Progress?
  progress_bytes : GoogleFirestoreAdminV1Progress?
  collection_ids : Array[String]?
  input_uri_prefix : String?
  namespace_ids : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1ExportDocumentsResponse
pub(all) struct GoogleFirestoreAdminV1ExportDocumentsResponse {
  output_uri_prefix : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1CreateDatabaseMetadata
pub(all) struct GoogleFirestoreAdminV1CreateDatabaseMetadata {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1DeleteDatabaseMetadata
pub(all) struct GoogleFirestoreAdminV1DeleteDatabaseMetadata {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1UpdateDatabaseMetadata
pub(all) struct GoogleFirestoreAdminV1UpdateDatabaseMetadata {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleFirestoreAdminV1RestoreDatabaseMetadata
pub(all) struct GoogleFirestoreAdminV1RestoreDatabaseMetadata {
  start_time : String?
  end_time : String?
  operation_state : String?
  database : String?
  backup : String?
  progress_percentage : GoogleFirestoreAdminV1Progress?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleFirestoreAdminV1CloneDatabaseMetadata
pub(all) struct GoogleFirestoreAdminV1CloneDatabaseMetadata {
  start_time : String?
  end_time : String?
  operation_state : String?
  database : String?
  pitr_snapshot : GoogleFirestoreAdminV1PitrSnapshot?
  progress_percentage : GoogleFirestoreAdminV1Progress?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))
