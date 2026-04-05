///|
/// Schema SetIamPolicyRequest
pub(all) struct SetIamPolicyRequest {
  policy : Policy?
  update_mask : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Policy
pub(all) struct Policy {
  version : Int?
  bindings : Array[Binding]?
  etag : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Binding
pub(all) struct Binding {
  role : String?
  members : Array[String]?
  condition : Expr?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Expr
pub(all) struct Expr {
  expression : String?
  title : String?
  description : String?
  location : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GetIamPolicyRequest
pub(all) struct GetIamPolicyRequest {
  options : GetPolicyOptions?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GetPolicyOptions
pub(all) struct GetPolicyOptions {
  requested_policy_version : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TestIamPermissionsRequest
pub(all) struct TestIamPermissionsRequest {
  permissions : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TestIamPermissionsResponse
pub(all) struct TestIamPermissionsResponse {
  permissions : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListOperationsResponse
pub(all) struct ListOperationsResponse {
  operations : Array[Operation]?
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
/// Schema Operation
pub(all) struct Operation {
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
/// Schema CancelOperationRequest
pub(all) struct CancelOperationRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema Empty
pub(all) struct Empty {} derive(Eq, Show, FromJson(rename_fields="camelCase"))

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
/// Schema ListBucketsResponse
pub(all) struct ListBucketsResponse {
  buckets : Array[LogBucket]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LogBucket
pub(all) struct LogBucket {
  name : String?
  description : String?
  create_time : String?
  update_time : String?
  retention_days : Int?
  locked : Bool?
  lifecycle_state : String?
  analytics_enabled : Bool?
  restricted_fields : Array[String]?
  index_configs : Array[IndexConfig]?
  cmek_settings : CmekSettings?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema IndexConfig
pub(all) struct IndexConfig {
  field_path : String?
  type_ : String?
  create_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema CmekSettings
pub(all) struct CmekSettings {
  name : String?
  kms_key_name : String?
  kms_key_version_name : String?
  service_account_id : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema UndeleteBucketRequest
pub(all) struct UndeleteBucketRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema ListViewsResponse
pub(all) struct ListViewsResponse {
  views : Array[LogView]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LogView
pub(all) struct LogView {
  name : String?
  description : String?
  create_time : String?
  update_time : String?
  filter : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListLogScopesResponse
pub(all) struct ListLogScopesResponse {
  log_scopes : Array[LogScope]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LogScope
pub(all) struct LogScope {
  name : String?
  resource_names : Array[String]?
  description : String?
  create_time : String?
  update_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListExclusionsResponse
pub(all) struct ListExclusionsResponse {
  exclusions : Array[LogExclusion]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LogExclusion
pub(all) struct LogExclusion {
  name : String?
  description : String?
  filter : String?
  disabled : Bool?
  create_time : String?
  update_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListSinksResponse
pub(all) struct ListSinksResponse {
  sinks : Array[LogSink]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LogSink
pub(all) struct LogSink {
  name : String?
  resource_name : String?
  destination : String?
  filter : String?
  description : String?
  disabled : Bool?
  exclusions : Array[LogExclusion]?
  output_version_format : String?
  writer_identity : String?
  include_children : Bool?
  intercept_children : Bool?
  bigquery_options : BigQueryOptions?
  create_time : String?
  update_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BigQueryOptions
pub(all) struct BigQueryOptions {
  use_partitioned_tables : Bool?
  uses_timestamp_column_partitioning : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListLinksResponse
pub(all) struct ListLinksResponse {
  links : Array[Link]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Link
pub(all) struct Link {
  name : String?
  description : String?
  create_time : String?
  lifecycle_state : String?
  bigquery_dataset : BigQueryDataset?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BigQueryDataset
pub(all) struct BigQueryDataset {
  dataset_id : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Settings
pub(all) struct Settings {
  name : String?
  kms_key_name : String?
  kms_service_account_id : String?
  storage_location : String?
  disable_default_sink : Bool?
  default_sink_config : DefaultSinkConfig?
  logging_service_account_id : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema DefaultSinkConfig
pub(all) struct DefaultSinkConfig {
  filter : String?
  exclusions : Array[LogExclusion]?
  mode : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListSavedQueriesResponse
pub(all) struct ListSavedQueriesResponse {
  saved_queries : Array[SavedQuery]?
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
/// Schema SavedQuery
pub(all) struct SavedQuery {
  name : String?
  display_name : String?
  description : String?
  logging_query : LoggingQuery?
  ops_analytics_query : OpsAnalyticsQuery?
  create_time : String?
  update_time : String?
  visibility : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LoggingQuery
pub(all) struct LoggingQuery {
  filter : String?
  summary_fields : Array[SummaryField]?
  summary_field_start : Int?
  summary_field_end : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema SummaryField
pub(all) struct SummaryField {
  field : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema OpsAnalyticsQuery
pub(all) struct OpsAnalyticsQuery {
  sql_query_text : String?
  query_builder : QueryBuilderConfig?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema QueryBuilderConfig
pub(all) struct QueryBuilderConfig {
  resource_names : Array[String]?
  filter : FilterPredicate?
  field_sources : Array[FieldSource]?
  limit : String?
  order_bys : Array[SortOrderParameter]?
  search_term : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema FilterPredicate
pub(all) struct FilterPredicate {
  operator_type : String?
  leaf_predicate : FilterExpression?
  child_predicates : Array[FilterPredicate]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema FilterExpression
pub(all) struct FilterExpression {
  field_source : FieldSource?
  literal_value : Json?
  field_source_value : FieldSource?
  comparator : String?
  is_negation : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema FieldSource
pub(all) struct FieldSource {
  field : String?
  alias_ref : String?
  projected_field : ProjectedField?
  is_json : Bool?
  column_type : String?
  parent_path : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ProjectedField
pub(all) struct ProjectedField {
  field : String?
  operation : String?
  sql_aggregation_function : FunctionApplication?
  alias_ : String?
  cast : String?
  regex_extraction : String?
  truncation_granularity : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(alias_(rename="alias"))),
)

///|
/// Schema FunctionApplication
pub(all) struct FunctionApplication {
  type_ : String?
  parameters : Array[Json]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema SortOrderParameter
pub(all) struct SortOrderParameter {
  field_source : FieldSource?
  sort_order_direction : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListRecentQueriesResponse
pub(all) struct ListRecentQueriesResponse {
  recent_queries : Array[RecentQuery]?
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
/// Schema RecentQuery
pub(all) struct RecentQuery {
  name : String?
  logging_query : LoggingQuery?
  ops_analytics_query : OpsAnalyticsQuery?
  last_run_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CopyLogEntriesRequest
pub(all) struct CopyLogEntriesRequest {
  name : String?
  filter : String?
  destination : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema WriteLogEntriesRequest
pub(all) struct WriteLogEntriesRequest {
  log_name : String?
  resource : MonitoredResource?
  labels : Json?
  entries : Array[LogEntry]?
  partial_success : Bool?
  dry_run : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema MonitoredResource
pub(all) struct MonitoredResource {
  type_ : String?
  labels : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema LogEntry
pub(all) struct LogEntry {
  log_name : String?
  resource : MonitoredResource?
  proto_payload : Json?
  text_payload : String?
  json_payload : Json?
  timestamp : String?
  receive_timestamp : String?
  severity : String?
  insert_id : String?
  http_request : HttpRequest?
  labels : Json?
  metadata : MonitoredResourceMetadata?
  operation : LogEntryOperation?
  trace : String?
  span_id : String?
  trace_sampled : Bool?
  source_location : LogEntrySourceLocation?
  split : LogSplit?
  error_groups : Array[LogErrorGroup]?
  apphub : AppHub?
  apphub_destination : AppHub?
  apphub_source : AppHub?
  otel : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema HttpRequest
pub(all) struct HttpRequest {
  request_method : String?
  request_url : String?
  request_size : String?
  status : Int?
  response_size : String?
  user_agent : String?
  remote_ip : String?
  server_ip : String?
  referer : String?
  latency : String?
  cache_lookup : Bool?
  cache_hit : Bool?
  cache_validated_with_origin_server : Bool?
  cache_fill_bytes : String?
  protocol : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema MonitoredResourceMetadata
pub(all) struct MonitoredResourceMetadata {
  system_labels : Json?
  user_labels : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LogEntryOperation
pub(all) struct LogEntryOperation {
  id : String?
  producer : String?
  first : Bool?
  last : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LogEntrySourceLocation
pub(all) struct LogEntrySourceLocation {
  file : String?
  line : String?
  function : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LogSplit
pub(all) struct LogSplit {
  uid : String?
  index : Int?
  total_splits : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LogErrorGroup
pub(all) struct LogErrorGroup {
  id : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AppHub
pub(all) struct AppHub {
  application : AppHubApplication?
  service : AppHubService?
  workload : AppHubWorkload?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AppHubApplication
pub(all) struct AppHubApplication {
  container : String?
  location : String?
  id : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AppHubService
pub(all) struct AppHubService {
  id : String?
  environment_type : String?
  criticality_type : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AppHubWorkload
pub(all) struct AppHubWorkload {
  id : String?
  environment_type : String?
  criticality_type : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema WriteLogEntriesResponse
pub(all) struct WriteLogEntriesResponse {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema ListLogEntriesRequest
pub(all) struct ListLogEntriesRequest {
  project_ids : Array[String]?
  resource_names : Array[String]?
  filter : String?
  order_by : String?
  page_size : Int?
  page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListLogEntriesResponse
pub(all) struct ListLogEntriesResponse {
  entries : Array[LogEntry]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListMonitoredResourceDescriptorsResponse
pub(all) struct ListMonitoredResourceDescriptorsResponse {
  resource_descriptors : Array[MonitoredResourceDescriptor]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema MonitoredResourceDescriptor
pub(all) struct MonitoredResourceDescriptor {
  name : String?
  type_ : String?
  display_name : String?
  description : String?
  labels : Array[LabelDescriptor]?
  launch_stage : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema LabelDescriptor
pub(all) struct LabelDescriptor {
  key : String?
  value_type : String?
  description : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListLogsResponse
pub(all) struct ListLogsResponse {
  log_names : Array[String]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TailLogEntriesRequest
pub(all) struct TailLogEntriesRequest {
  resource_names : Array[String]?
  filter : String?
  buffer_window : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TailLogEntriesResponse
pub(all) struct TailLogEntriesResponse {
  entries : Array[LogEntry]?
  suppression_info : Array[SuppressionInfo]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema SuppressionInfo
pub(all) struct SuppressionInfo {
  reason : String?
  suppressed_count : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListLogMetricsResponse
pub(all) struct ListLogMetricsResponse {
  metrics : Array[LogMetric]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LogMetric
pub(all) struct LogMetric {
  name : String?
  resource_name : String?
  description : String?
  filter : String?
  bucket_name : String?
  disabled : Bool?
  metric_descriptor : MetricDescriptor?
  value_extractor : String?
  label_extractors : Json?
  bucket_options : BucketOptions?
  create_time : String?
  update_time : String?
  version : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema MetricDescriptor
pub(all) struct MetricDescriptor {
  name : String?
  type_ : String?
  labels : Array[LabelDescriptor]?
  metric_kind : String?
  value_type : String?
  unit : String?
  description : String?
  display_name : String?
  metadata : MetricDescriptorMetadata?
  launch_stage : String?
  monitored_resource_types : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema MetricDescriptorMetadata
pub(all) struct MetricDescriptorMetadata {
  launch_stage : String?
  sample_period : String?
  ingest_delay : String?
  time_series_resource_hierarchy_level : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BucketOptions
pub(all) struct BucketOptions {
  linear_buckets : Linear?
  exponential_buckets : Exponential?
  explicit_buckets : Explicit?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Linear
pub(all) struct Linear {
  num_finite_buckets : Int?
  width : Double?
  offset : Double?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Exponential
pub(all) struct Exponential {
  num_finite_buckets : Int?
  growth_factor : Double?
  scale : Double?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Explicit
pub(all) struct Explicit {
  bounds : Array[Double]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema RequestLog
pub(all) struct RequestLog {
  app_id : String?
  module_id : String?
  version_id : String?
  request_id : String?
  ip : String?
  start_time : String?
  end_time : String?
  latency : String?
  mega_cycles : String?
  method_ : String?
  resource : String?
  http_version : String?
  status : Int?
  response_size : String?
  referrer : String?
  user_agent : String?
  nickname : String?
  url_map_entry : String?
  host : String?
  cost : Double?
  task_queue_name : String?
  task_name : String?
  was_loading_request : Bool?
  pending_time : String?
  instance_index : Int?
  finished : Bool?
  first : Bool?
  instance_id : String?
  line : Array[LogLine]?
  app_engine_release : String?
  trace_id : String?
  span_id : String?
  trace_sampled : Bool?
  source_reference : Array[SourceReference]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(method_(rename="method"))),
)

///|
/// Schema LogLine
pub(all) struct LogLine {
  time : String?
  severity : String?
  log_message : String?
  source_location : SourceLocation?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema SourceLocation
pub(all) struct SourceLocation {
  file : String?
  line : String?
  function_name : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema SourceReference
pub(all) struct SourceReference {
  repository : String?
  revision_id : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CopyLogEntriesMetadata
pub(all) struct CopyLogEntriesMetadata {
  start_time : String?
  end_time : String?
  state : String?
  cancellation_requested : Bool?
  request : CopyLogEntriesRequest?
  progress : Int?
  writer_identity : String?
  source : String?
  destination : String?
  verb : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CopyLogEntriesResponse
pub(all) struct CopyLogEntriesResponse {
  log_entries_copied_count : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BucketMetadata
pub(all) struct BucketMetadata {
  start_time : String?
  end_time : String?
  state : String?
  create_bucket_request : CreateBucketRequest?
  update_bucket_request : UpdateBucketRequest?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CreateBucketRequest
pub(all) struct CreateBucketRequest {
  parent : String?
  bucket_id : String?
  bucket : LogBucket?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema UpdateBucketRequest
pub(all) struct UpdateBucketRequest {
  name : String?
  bucket : LogBucket?
  update_mask : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LinkMetadata
pub(all) struct LinkMetadata {
  start_time : String?
  end_time : String?
  state : String?
  create_link_request : CreateLinkRequest?
  delete_link_request : DeleteLinkRequest?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CreateLinkRequest
pub(all) struct CreateLinkRequest {
  parent : String?
  link : Link?
  link_id : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema DeleteLinkRequest
pub(all) struct DeleteLinkRequest {
  name : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LocationMetadata
pub(all) struct LocationMetadata {
  log_analytics_enabled : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))
