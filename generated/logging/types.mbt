///|
/// Schema LogEntry
pub(all) struct LogEntry {
  log_name : String?
  resource : Json?
  proto_payload : Json?
  text_payload : String?
  json_payload : Json?
  timestamp : String?
  receive_timestamp : String?
  severity : String?
  insert_id : String?
  http_request : Json?
  labels : Array[LabelsEntry]?
  operation : LogEntryOperation?
  trace : String?
  span_id : String?
  trace_sampled : Bool?
  source_location : LogEntrySourceLocation?
  split : LogSplit?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LabelsEntry
pub(all) struct LabelsEntry {
  key : String?
  value : String?
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
  first : Bool?
  last : Bool?
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
/// Schema LogSplit
pub(all) struct LogSplit {
  uid : String?
  index : Int?
  total_splits : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteLogRequest
pub(all) struct DeleteLogRequest {
  log_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema WriteLogEntriesRequest
pub(all) struct WriteLogEntriesRequest {
  log_name : String?
  resource : Json?
  labels : Array[LabelsEntry]?
  entries : Array[LogEntry]?
  partial_success : Bool?
  dry_run : Bool?
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
/// Schema WriteLogEntriesPartialErrors
pub(all) struct WriteLogEntriesPartialErrors {
  log_entry_errors : Array[LogEntryErrorsEntry]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogEntryErrorsEntry
pub(all) struct LogEntryErrorsEntry {
  key : Int?
  value : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListLogEntriesRequest
pub(all) struct ListLogEntriesRequest {
  resource_names : Array[String]?
  filter : String?
  order_by : String?
  page_size : Int?
  page_token : String?
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
/// Schema ListMonitoredResourceDescriptorsRequest
pub(all) struct ListMonitoredResourceDescriptorsRequest {
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
  resource_descriptors : Array[Json]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListLogsRequest
pub(all) struct ListLogsRequest {
  parent : String?
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
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogView
pub(all) struct LogView {
  name : String?
  description : String?
  create_time : String?
  update_time : String?
  filter : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogSink
pub(all) struct LogSink {
  name : String?
  destination : String?
  filter : String?
  description : String?
  disabled : Bool?
  exclusions : Array[LogExclusion]?
  output_version_format : String?
  writer_identity : String?
  include_children : Bool?
  bigquery_options : BigQueryOptions?
  create_time : String?
  update_time : String?
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
/// Schema ListBucketsRequest
pub(all) struct ListBucketsRequest {
  parent : String?
  page_token : String?
  page_size : Int?
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
/// Schema GetBucketRequest
pub(all) struct GetBucketRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteBucketRequest
pub(all) struct DeleteBucketRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UndeleteBucketRequest
pub(all) struct UndeleteBucketRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListViewsRequest
pub(all) struct ListViewsRequest {
  parent : String?
  page_token : String?
  page_size : Int?
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
/// Schema CreateViewRequest
pub(all) struct CreateViewRequest {
  parent : String?
  view_id : String?
  view : LogView?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UpdateViewRequest
pub(all) struct UpdateViewRequest {
  name : String?
  view : LogView?
  update_mask : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetViewRequest
pub(all) struct GetViewRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteViewRequest
pub(all) struct DeleteViewRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListSinksRequest
pub(all) struct ListSinksRequest {
  parent : String?
  page_token : String?
  page_size : Int?
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

///|
/// Schema GetSinkRequest
pub(all) struct GetSinkRequest {
  sink_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateSinkRequest
pub(all) struct CreateSinkRequest {
  parent : String?
  sink : LogSink?
  unique_writer_identity : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UpdateSinkRequest
pub(all) struct UpdateSinkRequest {
  sink_name : String?
  sink : LogSink?
  unique_writer_identity : Bool?
  update_mask : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteSinkRequest
pub(all) struct DeleteSinkRequest {
  sink_name : String?
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
/// Schema ListLinksRequest
pub(all) struct ListLinksRequest {
  parent : String?
  page_token : String?
  page_size : Int?
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
/// Schema GetLinkRequest
pub(all) struct GetLinkRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogExclusion
pub(all) struct LogExclusion {
  name : String?
  description : String?
  filter : String?
  disabled : Bool?
  create_time : String?
  update_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListExclusionsRequest
pub(all) struct ListExclusionsRequest {
  parent : String?
  page_token : String?
  page_size : Int?
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
/// Schema GetExclusionRequest
pub(all) struct GetExclusionRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateExclusionRequest
pub(all) struct CreateExclusionRequest {
  parent : String?
  exclusion : LogExclusion?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UpdateExclusionRequest
pub(all) struct UpdateExclusionRequest {
  name : String?
  exclusion : LogExclusion?
  update_mask : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteExclusionRequest
pub(all) struct DeleteExclusionRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetCmekSettingsRequest
pub(all) struct GetCmekSettingsRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UpdateCmekSettingsRequest
pub(all) struct UpdateCmekSettingsRequest {
  name : String?
  cmek_settings : CmekSettings?
  update_mask : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CmekSettings
pub(all) struct CmekSettings {
  name : String?
  kms_key_name : String?
  kms_key_version_name : String?
  service_account_id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetSettingsRequest
pub(all) struct GetSettingsRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UpdateSettingsRequest
pub(all) struct UpdateSettingsRequest {
  name : String?
  settings : Settings?
  update_mask : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Settings
pub(all) struct Settings {
  name : String?
  kms_key_name : String?
  kms_service_account_id : String?
  storage_location : String?
  disable_default_sink : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CopyLogEntriesRequest
pub(all) struct CopyLogEntriesRequest {
  name : String?
  filter : String?
  destination : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

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
/// Schema BucketMetadata
pub(all) struct BucketMetadata {
  start_time : String?
  end_time : String?
  state : String?
  create_bucket_request : CreateBucketRequest?
  update_bucket_request : UpdateBucketRequest?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LinkMetadata
pub(all) struct LinkMetadata {
  start_time : String?
  end_time : String?
  state : String?
  create_link_request : CreateLinkRequest?
  delete_link_request : DeleteLinkRequest?
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
/// Schema LogMetric
pub(all) struct LogMetric {
  name : String?
  description : String?
  filter : String?
  bucket_name : String?
  disabled : Bool?
  metric_descriptor : Json?
  value_extractor : String?
  label_extractors : Array[LabelExtractorsEntry]?
  bucket_options : Json?
  create_time : String?
  update_time : String?
  version : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LabelExtractorsEntry
pub(all) struct LabelExtractorsEntry {
  key : String?
  value : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListLogMetricsRequest
pub(all) struct ListLogMetricsRequest {
  parent : String?
  page_token : String?
  page_size : Int?
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
/// Schema GetLogMetricRequest
pub(all) struct GetLogMetricRequest {
  metric_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateLogMetricRequest
pub(all) struct CreateLogMetricRequest {
  parent : String?
  metric : LogMetric?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UpdateLogMetricRequest
pub(all) struct UpdateLogMetricRequest {
  metric_name : String?
  metric : LogMetric?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteLogMetricRequest
pub(all) struct DeleteLogMetricRequest {
  metric_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)
