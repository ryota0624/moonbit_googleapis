///|
/// Schema CopyLogEntriesMetadata
pub(all) struct CopyLogEntriesMetadata {
  end_time : String?
  writer_identity : String?
  cancellation_requested : Bool?
  source : String?
  destination : String?
  state : String?
  start_time : String?
  request : CopyLogEntriesRequest?
  progress : Int?
  verb : String?
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
/// Schema Policy
pub(all) struct Policy {
  version : Int?
  etag : String?
  bindings : Array[Binding]?
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
  bucket : LogBucket?
  update_mask : String?
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
/// Schema LogMetric
pub(all) struct LogMetric {
  update_time : String?
  version : String?
  metric_descriptor : MetricDescriptor?
  value_extractor : String?
  bucket_options : BucketOptions?
  name : String?
  label_extractors : Json?
  description : String?
  filter : String?
  create_time : String?
  resource_name : String?
  bucket_name : String?
  disabled : Bool?
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
/// Schema WriteLogEntriesRequest
pub(all) struct WriteLogEntriesRequest {
  labels : Json?
  resource : MonitoredResource?
  entries : Array[LogEntry]?
  dry_run : Bool?
  partial_success : Bool?
  log_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FilterExpression
pub(all) struct FilterExpression {
  literal_value : Json?
  field_source_value : FieldSource?
  comparator : String?
  field_source : FieldSource?
  is_negation : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CmekSettings
pub(all) struct CmekSettings {
  kms_key_version_name : String?
  kms_key_name : String?
  service_account_id : String?
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
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
/// Schema LogLine
pub(all) struct LogLine {
  severity : String?
  time : String?
  log_message : String?
  source_location : SourceLocation?
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
/// Schema ListMonitoredResourceDescriptorsResponse
pub(all) struct ListMonitoredResourceDescriptorsResponse {
  next_page_token : String?
  resource_descriptors : Array[MonitoredResourceDescriptor]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AppHub
pub(all) struct AppHub {
  application : AppHubApplication?
  service : AppHubService?
  workload : AppHubWorkload?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Exponential
pub(all) struct Exponential {
  scale : Double?
  num_finite_buckets : Int?
  growth_factor : Double?
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
/// Schema Settings
pub(all) struct Settings {
  disable_default_sink : Bool?
  kms_key_name : String?
  storage_location : String?
  logging_service_account_id : String?
  default_sink_config : DefaultSinkConfig?
  name : String?
  kms_service_account_id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema IndexConfig
pub(all) struct IndexConfig {
  type_ : String?
  field_path : String?
  create_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
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
/// Schema Linear
pub(all) struct Linear {
  num_finite_buckets : Int?
  width : Double?
  offset : Double?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RequestLog
pub(all) struct RequestLog {
  task_queue_name : String?
  instance_index : Int?
  line : Array[LogLine]?
  first : Bool?
  module_id : String?
  nickname : String?
  app_id : String?
  was_loading_request : Bool?
  mega_cycles : String?
  pending_time : String?
  status : Int?
  app_engine_release : String?
  ip : String?
  http_version : String?
  trace_sampled : Bool?
  latency : String?
  user_agent : String?
  start_time : String?
  version_id : String?
  referrer : String?
  host : String?
  instance_id : String?
  cost : Double?
  trace_id : String?
  finished : Bool?
  span_id : String?
  request_id : String?
  resource : String?
  response_size : String?
  end_time : String?
  method_ : String?
  source_reference : Array[SourceReference]?
  url_map_entry : String?
  task_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(method_(rename="method"))),
  ToJson(rename_fields="camelCase", fields(method_(rename="method"))),
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
/// Schema SuppressionInfo
pub(all) struct SuppressionInfo {
  reason : String?
  suppressed_count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LabelDescriptor
pub(all) struct LabelDescriptor {
  description : String?
  value_type : String?
  key : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
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
/// Schema WriteLogEntriesResponse
pub(all) struct WriteLogEntriesResponse {} derive (
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
/// Schema Empty
pub(all) struct Empty {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MonitoredResourceDescriptor
pub(all) struct MonitoredResourceDescriptor {
  display_name : String?
  launch_stage : String?
  name : String?
  type_ : String?
  description : String?
  labels : Array[LabelDescriptor]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
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
/// Schema CreateLinkRequest
pub(all) struct CreateLinkRequest {
  parent : String?
  link : Link?
  link_id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogEntryOperation
pub(all) struct LogEntryOperation {
  id : String?
  producer : String?
  last : Bool?
  first : Bool?
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
/// Schema SourceLocation
pub(all) struct SourceLocation {
  function_name : String?
  line : String?
  file : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DefaultSinkConfig
pub(all) struct DefaultSinkConfig {
  filter : String?
  exclusions : Array[LogExclusion]?
  mode : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FilterPredicate
pub(all) struct FilterPredicate {
  child_predicates : Array[FilterPredicate]?
  operator_type : String?
  leaf_predicate : FilterExpression?
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
/// Schema RecentQuery
pub(all) struct RecentQuery {
  logging_query : LoggingQuery?
  last_run_time : String?
  name : String?
  ops_analytics_query : OpsAnalyticsQuery?
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
/// Schema TailLogEntriesRequest
pub(all) struct TailLogEntriesRequest {
  resource_names : Array[String]?
  filter : String?
  buffer_window : String?
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
  location_id : String?
  labels : Json?
  display_name : String?
  metadata : Json?
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
/// Schema HttpRequest
pub(all) struct HttpRequest {
  protocol : String?
  response_size : String?
  cache_hit : Bool?
  cache_lookup : Bool?
  request_url : String?
  request_method : String?
  status : Int?
  request_size : String?
  user_agent : String?
  latency : String?
  server_ip : String?
  referer : String?
  cache_fill_bytes : String?
  cache_validated_with_origin_server : Bool?
  remote_ip : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
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
/// Schema LogSink
pub(all) struct LogSink {
  disabled : Bool?
  resource_name : String?
  create_time : String?
  destination : String?
  intercept_children : Bool?
  filter : String?
  writer_identity : String?
  description : String?
  name : String?
  output_version_format : String?
  include_children : Bool?
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
/// Schema ProjectedField
pub(all) struct ProjectedField {
  field : String?
  truncation_granularity : String?
  cast : String?
  regex_extraction : String?
  sql_aggregation_function : FunctionApplication?
  operation : String?
  alias_ : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(alias_(rename="alias"))),
  ToJson(rename_fields="camelCase", fields(alias_(rename="alias"))),
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
/// Schema Link
pub(all) struct Link {
  name : String?
  lifecycle_state : String?
  bigquery_dataset : BigQueryDataset?
  description : String?
  create_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema OpsAnalyticsQuery
pub(all) struct OpsAnalyticsQuery {
  sql_query_text : String?
  query_builder : QueryBuilderConfig?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateBucketRequest
pub(all) struct CreateBucketRequest {
  parent : String?
  bucket_id : String?
  bucket : LogBucket?
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
/// Schema LogView
pub(all) struct LogView {
  update_time : String?
  create_time : String?
  filter : String?
  description : String?
  name : String?
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
/// Schema ListRecentQueriesResponse
pub(all) struct ListRecentQueriesResponse {
  next_page_token : String?
  recent_queries : Array[RecentQuery]?
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
/// Schema LogExclusion
pub(all) struct LogExclusion {
  disabled : Bool?
  description : String?
  name : String?
  update_time : String?
  create_time : String?
  filter : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FieldSource
pub(all) struct FieldSource {
  is_json : Bool?
  parent_path : String?
  projected_field : ProjectedField?
  field : String?
  column_type : String?
  alias_ref : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

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
  ToJson(rename_fields="camelCase", fields(unreachable_(rename="unreachable"))),
)

///|
/// Schema LogScope
pub(all) struct LogScope {
  name : String?
  resource_names : Array[String]?
  description : String?
  create_time : String?
  update_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BigQueryOptions
pub(all) struct BigQueryOptions {
  uses_timestamp_column_partitioning : Bool?
  use_partitioned_tables : Bool?
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
/// Schema ListLogsResponse
pub(all) struct ListLogsResponse {
  log_names : Array[String]?
  next_page_token : String?
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
/// Schema Operation
pub(all) struct Operation {
  name : String?
  done : Bool?
  metadata : Json?
  error : Status?
  response : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema SavedQuery
pub(all) struct SavedQuery {
  create_time : String?
  visibility : String?
  display_name : String?
  ops_analytics_query : OpsAnalyticsQuery?
  update_time : String?
  logging_query : LoggingQuery?
  name : String?
  description : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MetricDescriptor
pub(all) struct MetricDescriptor {
  metric_kind : String?
  value_type : String?
  metadata : MetricDescriptorMetadata?
  name : String?
  monitored_resource_types : Array[String]?
  labels : Array[LabelDescriptor]?
  description : String?
  type_ : String?
  display_name : String?
  launch_stage : String?
  unit : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema Binding
pub(all) struct Binding {
  condition : Expr?
  role : String?
  members : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema QueryBuilderConfig
pub(all) struct QueryBuilderConfig {
  filter : FilterPredicate?
  field_sources : Array[FieldSource]?
  order_bys : Array[SortOrderParameter]?
  resource_names : Array[String]?
  limit : String?
  search_term : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Expr
pub(all) struct Expr {
  location : String?
  expression : String?
  title : String?
  description : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LoggingQuery
pub(all) struct LoggingQuery {
  summary_fields : Array[SummaryField]?
  summary_field_end : Int?
  filter : String?
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
  destination : String?
  name : String?
  filter : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogEntry
pub(all) struct LogEntry {
  http_request : HttpRequest?
  source_location : LogEntrySourceLocation?
  severity : String?
  operation : LogEntryOperation?
  json_payload : Json?
  text_payload : String?
  timestamp : String?
  metadata : MonitoredResourceMetadata?
  apphub : AppHub?
  labels : Json?
  split : LogSplit?
  apphub_destination : AppHub?
  insert_id : String?
  log_name : String?
  span_id : String?
  resource : MonitoredResource?
  apphub_source : AppHub?
  trace : String?
  otel : Json?
  receive_timestamp : String?
  trace_sampled : Bool?
  proto_payload : Json?
  error_groups : Array[LogErrorGroup]?
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
/// Schema LogBucket
pub(all) struct LogBucket {
  name : String?
  retention_days : Int?
  description : String?
  create_time : String?
  restricted_fields : Array[String]?
  lifecycle_state : String?
  index_configs : Array[IndexConfig]?
  cmek_settings : CmekSettings?
  locked : Bool?
  analytics_enabled : Bool?
  update_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

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
/// Schema AppHubWorkload
pub(all) struct AppHubWorkload {
  id : String?
  environment_type : String?
  criticality_type : String?
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
/// Schema UndeleteBucketRequest
pub(all) struct UndeleteBucketRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BucketMetadata
pub(all) struct BucketMetadata {
  end_time : String?
  update_bucket_request : UpdateBucketRequest?
  state : String?
  create_bucket_request : CreateBucketRequest?
  start_time : String?
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
  time_series_resource_hierarchy_level : Array[String]?
  ingest_delay : String?
  sample_period : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
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
/// Schema ListSinksResponse
pub(all) struct ListSinksResponse {
  sinks : Array[LogSink]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)
