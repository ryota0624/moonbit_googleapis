///|
/// Schema ListBucketsResponse
pub(all) struct ListBucketsResponse {
  buckets : Array[LogBucket]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema WriteLogEntriesRequest
pub(all) struct WriteLogEntriesRequest {
  resource : MonitoredResource?
  entries : Array[LogEntry]?
  partial_success : Bool?
  log_name : String?
  labels : Json?
  dry_run : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TestIamPermissionsResponse
pub(all) struct TestIamPermissionsResponse {
  permissions : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AppHubService
pub(all) struct AppHubService {
  id : String?
  criticality_type : String?
  environment_type : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema SavedQuery
pub(all) struct SavedQuery {
  ops_analytics_query : OpsAnalyticsQuery?
  visibility : String?
  logging_query : LoggingQuery?
  create_time : String?
  name : String?
  description : String?
  display_name : String?
  update_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Exponential
pub(all) struct Exponential {
  num_finite_buckets : Int?
  growth_factor : Double?
  scale : Double?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListLogEntriesResponse
pub(all) struct ListLogEntriesResponse {
  entries : Array[LogEntry]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListOperationsResponse
pub(all) struct ListOperationsResponse {
  unreachable_ : Array[String]?
  operations : Array[Operation]?
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
/// Schema LogExclusion
pub(all) struct LogExclusion {
  filter : String?
  create_time : String?
  name : String?
  description : String?
  update_time : String?
  disabled : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema QueryBuilderConfig
pub(all) struct QueryBuilderConfig {
  search_term : String?
  filter : FilterPredicate?
  order_bys : Array[SortOrderParameter]?
  resource_names : Array[String]?
  limit : String?
  field_sources : Array[FieldSource]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListLogMetricsResponse
pub(all) struct ListLogMetricsResponse {
  metrics : Array[LogMetric]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogErrorGroup
pub(all) struct LogErrorGroup {
  id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CancelOperationRequest
pub(all) struct CancelOperationRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FilterPredicate
pub(all) struct FilterPredicate {
  leaf_predicate : FilterExpression?
  operator_type : String?
  child_predicates : Array[FilterPredicate]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Linear
pub(all) struct Linear {
  width : Double?
  offset : Double?
  num_finite_buckets : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MonitoredResource
pub(all) struct MonitoredResource {
  type_ : String?
  labels : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema LogView
pub(all) struct LogView {
  create_time : String?
  filter : String?
  update_time : String?
  name : String?
  description : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UpdateBucketRequest
pub(all) struct UpdateBucketRequest {
  name : String?
  update_mask : String?
  bucket : LogBucket?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema SourceReference
pub(all) struct SourceReference {
  repository : String?
  revision_id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CmekSettings
pub(all) struct CmekSettings {
  service_account_id : String?
  kms_key_name : String?
  name : String?
  kms_key_version_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListExclusionsResponse
pub(all) struct ListExclusionsResponse {
  exclusions : Array[LogExclusion]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FieldSource
pub(all) struct FieldSource {
  field : String?
  is_json : Bool?
  projected_field : ProjectedField?
  column_type : String?
  parent_path : String?
  alias_ref : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AppHubApplication
pub(all) struct AppHubApplication {
  container : String?
  location : String?
  id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RecentQuery
pub(all) struct RecentQuery {
  logging_query : LoggingQuery?
  name : String?
  last_run_time : String?
  ops_analytics_query : OpsAnalyticsQuery?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetIamPolicyRequest
pub(all) struct GetIamPolicyRequest {
  options : GetPolicyOptions?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema SortOrderParameter
pub(all) struct SortOrderParameter {
  field_source : FieldSource?
  sort_order_direction : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LoggingQuery
pub(all) struct LoggingQuery {
  summary_field_end : Int?
  filter : String?
  summary_fields : Array[SummaryField]?
  summary_field_start : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
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
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema CopyLogEntriesRequest
pub(all) struct CopyLogEntriesRequest {
  filter : String?
  name : String?
  destination : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListSavedQueriesResponse
pub(all) struct ListSavedQueriesResponse {
  next_page_token : String?
  saved_queries : Array[SavedQuery]?
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
/// Schema DefaultSinkConfig
pub(all) struct DefaultSinkConfig {
  exclusions : Array[LogExclusion]?
  filter : String?
  mode : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateLinkRequest
pub(all) struct CreateLinkRequest {
  parent : String?
  link_id : String?
  link : Link?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MonitoredResourceDescriptor
pub(all) struct MonitoredResourceDescriptor {
  type_ : String?
  display_name : String?
  name : String?
  description : String?
  labels : Array[LabelDescriptor]?
  launch_stage : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema CopyLogEntriesResponse
pub(all) struct CopyLogEntriesResponse {
  log_entries_copied_count : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListMonitoredResourceDescriptorsResponse
pub(all) struct ListMonitoredResourceDescriptorsResponse {
  resource_descriptors : Array[MonitoredResourceDescriptor]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema SummaryField
pub(all) struct SummaryField {
  field : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MetricDescriptorMetadata
pub(all) struct MetricDescriptorMetadata {
  launch_stage : String?
  ingest_delay : String?
  sample_period : String?
  time_series_resource_hierarchy_level : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TailLogEntriesRequest
pub(all) struct TailLogEntriesRequest {
  buffer_window : String?
  resource_names : Array[String]?
  filter : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Operation
pub(all) struct Operation {
  response : Json?
  name : String?
  done : Bool?
  metadata : Json?
  error : Status?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Location
pub(all) struct Location {
  name : String?
  display_name : String?
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
/// Schema FilterExpression
pub(all) struct FilterExpression {
  field_source : FieldSource?
  comparator : String?
  is_negation : Bool?
  literal_value : Json?
  field_source_value : FieldSource?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogEntrySourceLocation
pub(all) struct LogEntrySourceLocation {
  file : String?
  line : String?
  function : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema OpsAnalyticsQuery
pub(all) struct OpsAnalyticsQuery {
  query_builder : QueryBuilderConfig?
  sql_query_text : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AppHub
pub(all) struct AppHub {
  service : AppHubService?
  workload : AppHubWorkload?
  application : AppHubApplication?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Binding
pub(all) struct Binding {
  members : Array[String]?
  condition : Expr?
  role : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ProjectedField
pub(all) struct ProjectedField {
  operation : String?
  cast : String?
  truncation_granularity : String?
  alias_ : String?
  regex_extraction : String?
  sql_aggregation_function : FunctionApplication?
  field : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(alias_(rename="alias"))),
  ToJson(rename_fields="camelCase", fields(alias_(rename="alias"))),
)

///|
/// Schema LabelDescriptor
pub(all) struct LabelDescriptor {
  value_type : String?
  description : String?
  key : String?
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
/// Schema ListLinksResponse
pub(all) struct ListLinksResponse {
  links : Array[Link]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListSinksResponse
pub(all) struct ListSinksResponse {
  next_page_token : String?
  sinks : Array[LogSink]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TailLogEntriesResponse
pub(all) struct TailLogEntriesResponse {
  entries : Array[LogEntry]?
  suppression_info : Array[SuppressionInfo]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CopyLogEntriesMetadata
pub(all) struct CopyLogEntriesMetadata {
  progress : Int?
  writer_identity : String?
  request : CopyLogEntriesRequest?
  end_time : String?
  source : String?
  destination : String?
  verb : String?
  state : String?
  cancellation_requested : Bool?
  start_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TestIamPermissionsRequest
pub(all) struct TestIamPermissionsRequest {
  permissions : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogScope
pub(all) struct LogScope {
  resource_names : Array[String]?
  create_time : String?
  name : String?
  description : String?
  update_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MonitoredResourceMetadata
pub(all) struct MonitoredResourceMetadata {
  system_labels : Json?
  user_labels : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MetricDescriptor
pub(all) struct MetricDescriptor {
  name : String?
  value_type : String?
  description : String?
  type_ : String?
  display_name : String?
  launch_stage : String?
  metric_kind : String?
  monitored_resource_types : Array[String]?
  unit : String?
  metadata : MetricDescriptorMetadata?
  labels : Array[LabelDescriptor]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema Link
pub(all) struct Link {
  name : String?
  description : String?
  create_time : String?
  lifecycle_state : String?
  bigquery_dataset : BigQueryDataset?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BigQueryDataset
pub(all) struct BigQueryDataset {
  dataset_id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BigQueryOptions
pub(all) struct BigQueryOptions {
  use_partitioned_tables : Bool?
  uses_timestamp_column_partitioning : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogSink
pub(all) struct LogSink {
  destination : String?
  writer_identity : String?
  resource_name : String?
  filter : String?
  create_time : String?
  name : String?
  description : String?
  output_version_format : String?
  disabled : Bool?
  include_children : Bool?
  intercept_children : Bool?
  bigquery_options : BigQueryOptions?
  exclusions : Array[LogExclusion]?
  update_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Expr
pub(all) struct Expr {
  title : String?
  expression : String?
  location : String?
  description : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteLinkRequest
pub(all) struct DeleteLinkRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema HttpRequest
pub(all) struct HttpRequest {
  server_ip : String?
  cache_lookup : Bool?
  request_size : String?
  response_size : String?
  referer : String?
  user_agent : String?
  request_url : String?
  latency : String?
  status : Int?
  cache_hit : Bool?
  request_method : String?
  cache_validated_with_origin_server : Bool?
  remote_ip : String?
  protocol : String?
  cache_fill_bytes : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LinkMetadata
pub(all) struct LinkMetadata {
  end_time : String?
  state : String?
  delete_link_request : DeleteLinkRequest?
  start_time : String?
  create_link_request : CreateLinkRequest?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateBucketRequest
pub(all) struct CreateBucketRequest {
  bucket_id : String?
  bucket : LogBucket?
  parent : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogSplit
pub(all) struct LogSplit {
  index : Int?
  uid : String?
  total_splits : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema SuppressionInfo
pub(all) struct SuppressionInfo {
  suppressed_count : Int?
  reason : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LocationMetadata
pub(all) struct LocationMetadata {
  log_analytics_enabled : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogBucket
pub(all) struct LogBucket {
  restricted_fields : Array[String]?
  cmek_settings : CmekSettings?
  retention_days : Int?
  lifecycle_state : String?
  locked : Bool?
  update_time : String?
  name : String?
  description : String?
  create_time : String?
  analytics_enabled : Bool?
  index_configs : Array[IndexConfig]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogMetric
pub(all) struct LogMetric {
  bucket_name : String?
  value_extractor : String?
  metric_descriptor : MetricDescriptor?
  bucket_options : BucketOptions?
  label_extractors : Json?
  name : String?
  description : String?
  filter : String?
  create_time : String?
  resource_name : String?
  version : String?
  disabled : Bool?
  update_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Policy
pub(all) struct Policy {
  etag : String?
  version : Int?
  bindings : Array[Binding]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BucketOptions
pub(all) struct BucketOptions {
  exponential_buckets : Exponential?
  linear_buckets : Linear?
  explicit_buckets : Explicit?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema SourceLocation
pub(all) struct SourceLocation {
  function_name : String?
  file : String?
  line : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogEntry
pub(all) struct LogEntry {
  apphub_destination : AppHub?
  split : LogSplit?
  resource : MonitoredResource?
  json_payload : Json?
  receive_timestamp : String?
  span_id : String?
  apphub : AppHub?
  insert_id : String?
  metadata : MonitoredResourceMetadata?
  operation : LogEntryOperation?
  apphub_source : AppHub?
  error_groups : Array[LogErrorGroup]?
  otel : Json?
  text_payload : String?
  severity : String?
  trace_sampled : Bool?
  source_location : LogEntrySourceLocation?
  timestamp : String?
  log_name : String?
  proto_payload : Json?
  labels : Json?
  trace : String?
  http_request : HttpRequest?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListRecentQueriesResponse
pub(all) struct ListRecentQueriesResponse {
  unreachable_ : Array[String]?
  recent_queries : Array[RecentQuery]?
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
/// Schema ListLogScopesResponse
pub(all) struct ListLogScopesResponse {
  log_scopes : Array[LogScope]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogEntryOperation
pub(all) struct LogEntryOperation {
  first : Bool?
  last : Bool?
  id : String?
  producer : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AppHubWorkload
pub(all) struct AppHubWorkload {
  criticality_type : String?
  environment_type : String?
  id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema WriteLogEntriesResponse
pub(all) struct WriteLogEntriesResponse {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Settings
pub(all) struct Settings {
  storage_location : String?
  name : String?
  kms_key_name : String?
  disable_default_sink : Bool?
  logging_service_account_id : String?
  kms_service_account_id : String?
  default_sink_config : DefaultSinkConfig?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListLogsResponse
pub(all) struct ListLogsResponse {
  next_page_token : String?
  log_names : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

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
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema Explicit
pub(all) struct Explicit {
  bounds : Array[Double]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RequestLog
pub(all) struct RequestLog {
  version_id : String?
  request_id : String?
  app_id : String?
  resource : String?
  instance_index : Int?
  span_id : String?
  app_engine_release : String?
  was_loading_request : Bool?
  host : String?
  end_time : String?
  line : Array[LogLine]?
  nickname : String?
  response_size : String?
  instance_id : String?
  first : Bool?
  task_name : String?
  finished : Bool?
  task_queue_name : String?
  cost : Double?
  referrer : String?
  status : Int?
  trace_id : String?
  start_time : String?
  http_version : String?
  method_ : String?
  url_map_entry : String?
  pending_time : String?
  trace_sampled : Bool?
  source_reference : Array[SourceReference]?
  user_agent : String?
  module_id : String?
  latency : String?
  ip : String?
  mega_cycles : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(method_(rename="method"))),
  ToJson(rename_fields="camelCase", fields(method_(rename="method"))),
)

///|
/// Schema GetPolicyOptions
pub(all) struct GetPolicyOptions {
  requested_policy_version : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListLogEntriesRequest
pub(all) struct ListLogEntriesRequest {
  filter : String?
  order_by : String?
  project_ids : Array[String]?
  resource_names : Array[String]?
  page_size : Int?
  page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListViewsResponse
pub(all) struct ListViewsResponse {
  views : Array[LogView]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BucketMetadata
pub(all) struct BucketMetadata {
  create_bucket_request : CreateBucketRequest?
  update_bucket_request : UpdateBucketRequest?
  state : String?
  start_time : String?
  end_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogLine
pub(all) struct LogLine {
  time : String?
  log_message : String?
  source_location : SourceLocation?
  severity : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema SetIamPolicyRequest
pub(all) struct SetIamPolicyRequest {
  policy : Policy?
  update_mask : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Status
pub(all) struct Status {
  code : Int?
  message : String?
  details : Array[Json]?
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
/// Schema UndeleteBucketRequest
pub(all) struct UndeleteBucketRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)
