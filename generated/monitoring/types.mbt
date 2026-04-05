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
/// Schema ListMetricDescriptorsResponse
pub(all) struct ListMetricDescriptorsResponse {
  metric_descriptors : Array[MetricDescriptor]?
  next_page_token : String?
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
/// Schema Empty
pub(all) struct Empty {} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListTimeSeriesResponse
pub(all) struct ListTimeSeriesResponse {
  time_series : Array[TimeSeries]?
  next_page_token : String?
  execution_errors : Array[Status]?
  unit : String?
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
/// Schema TimeSeries
pub(all) struct TimeSeries {
  metric : Metric?
  resource : MonitoredResource?
  metadata : MonitoredResourceMetadata?
  metric_kind : String?
  value_type : String?
  points : Array[Point]?
  unit : String?
  description : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Metric
pub(all) struct Metric {
  type_ : String?
  labels : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
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
)

///|
/// Schema MonitoredResourceMetadata
pub(all) struct MonitoredResourceMetadata {
  system_labels : Json?
  user_labels : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Point
pub(all) struct Point {
  interval : TimeInterval?
  value : TypedValue?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TimeInterval
pub(all) struct TimeInterval {
  end_time : String?
  start_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TypedValue
pub(all) struct TypedValue {
  bool_value : Bool?
  int64_value : String?
  double_value : Double?
  string_value : String?
  distribution_value : Distribution?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Distribution
pub(all) struct Distribution {
  count : String?
  mean : Double?
  sum_of_squared_deviation : Double?
  range : Range?
  bucket_options : BucketOptions?
  bucket_counts : Array[String]?
  exemplars : Array[Exemplar]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Range
pub(all) struct Range {
  min : Double?
  max : Double?
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
/// Schema Exemplar
pub(all) struct Exemplar {
  value : Double?
  timestamp : String?
  attachments : Array[Json]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Status
pub(all) struct Status {
  code : Int?
  message : String?
  details : Array[Json]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CreateTimeSeriesRequest
pub(all) struct CreateTimeSeriesRequest {
  time_series : Array[TimeSeries]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CreateCollectdTimeSeriesRequest
pub(all) struct CreateCollectdTimeSeriesRequest {
  resource : MonitoredResource?
  collectd_version : String?
  collectd_payloads : Array[CollectdPayload]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CollectdPayload
pub(all) struct CollectdPayload {
  values : Array[CollectdValue]?
  start_time : String?
  end_time : String?
  plugin : String?
  plugin_instance : String?
  type_ : String?
  type_instance : String?
  metadata : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema CollectdValue
pub(all) struct CollectdValue {
  data_source_name : String?
  data_source_type : String?
  value : TypedValue?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CreateCollectdTimeSeriesResponse
pub(all) struct CreateCollectdTimeSeriesResponse {
  payload_errors : Array[CollectdPayloadError]?
  summary : CreateTimeSeriesSummary?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CollectdPayloadError
pub(all) struct CollectdPayloadError {
  index : Int?
  error : Status?
  value_errors : Array[CollectdValueError]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CollectdValueError
pub(all) struct CollectdValueError {
  index : Int?
  error : Status?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CreateTimeSeriesSummary
pub(all) struct CreateTimeSeriesSummary {
  total_point_count : Int?
  success_point_count : Int?
  errors : Array[Error_]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Error
pub(all) struct Error_ {
  status : Status?
  point_count : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListAlertPoliciesResponse
pub(all) struct ListAlertPoliciesResponse {
  alert_policies : Array[AlertPolicy]?
  next_page_token : String?
  total_size : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AlertPolicy
pub(all) struct AlertPolicy {
  name : String?
  display_name : String?
  documentation : Documentation?
  user_labels : Json?
  conditions : Array[Condition]?
  combiner : String?
  enabled : Bool?
  validity : Status?
  notification_channels : Array[String]?
  creation_record : MutationRecord?
  mutation_record : MutationRecord?
  alert_strategy : AlertStrategy?
  severity : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Documentation
pub(all) struct Documentation {
  content : String?
  mime_type : String?
  subject : String?
  links : Array[Link]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Link
pub(all) struct Link {
  display_name : String?
  url : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Condition
pub(all) struct Condition {
  name : String?
  display_name : String?
  condition_threshold : MetricThreshold?
  condition_absent : MetricAbsence?
  condition_matched_log : LogMatch?
  condition_monitoring_query_language : MonitoringQueryLanguageCondition?
  condition_prometheus_query_language : PrometheusQueryLanguageCondition?
  condition_sql : SqlCondition?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema MetricThreshold
pub(all) struct MetricThreshold {
  filter : String?
  aggregations : Array[Aggregation]?
  denominator_filter : String?
  denominator_aggregations : Array[Aggregation]?
  forecast_options : ForecastOptions?
  comparison : String?
  threshold_value : Double?
  duration : String?
  trigger : Trigger?
  evaluation_missing_data : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Aggregation
pub(all) struct Aggregation {
  alignment_period : String?
  per_series_aligner : String?
  cross_series_reducer : String?
  group_by_fields : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ForecastOptions
pub(all) struct ForecastOptions {
  forecast_horizon : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Trigger
pub(all) struct Trigger {
  count : Int?
  percent : Double?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema MetricAbsence
pub(all) struct MetricAbsence {
  filter : String?
  aggregations : Array[Aggregation]?
  duration : String?
  trigger : Trigger?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LogMatch
pub(all) struct LogMatch {
  filter : String?
  label_extractors : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema MonitoringQueryLanguageCondition
pub(all) struct MonitoringQueryLanguageCondition {
  query : String?
  duration : String?
  trigger : Trigger?
  evaluation_missing_data : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PrometheusQueryLanguageCondition
pub(all) struct PrometheusQueryLanguageCondition {
  query : String?
  duration : String?
  evaluation_interval : String?
  labels : Json?
  rule_group : String?
  alert_rule : String?
  disable_metric_validation : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema SqlCondition
pub(all) struct SqlCondition {
  query : String?
  minutes : Minutes?
  hourly : Hourly?
  daily : Daily?
  row_count_test : RowCountTest?
  boolean_test : BooleanTest?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Minutes
pub(all) struct Minutes {
  periodicity : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Hourly
pub(all) struct Hourly {
  periodicity : Int?
  minute_offset : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Daily
pub(all) struct Daily {
  periodicity : Int?
  execution_time : TimeOfDay?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TimeOfDay
pub(all) struct TimeOfDay {
  hours : Int?
  minutes : Int?
  seconds : Int?
  nanos : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema RowCountTest
pub(all) struct RowCountTest {
  comparison : String?
  threshold : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BooleanTest
pub(all) struct BooleanTest {
  column : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema MutationRecord
pub(all) struct MutationRecord {
  mutate_time : String?
  mutated_by : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AlertStrategy
pub(all) struct AlertStrategy {
  notification_rate_limit : NotificationRateLimit?
  notification_prompts : Array[String]?
  auto_close : String?
  notification_channel_strategy : Array[NotificationChannelStrategy]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema NotificationRateLimit
pub(all) struct NotificationRateLimit {
  period : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema NotificationChannelStrategy
pub(all) struct NotificationChannelStrategy {
  notification_channel_names : Array[String]?
  renotify_interval : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListGroupsResponse
pub(all) struct ListGroupsResponse {
  group : Array[Group]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Group
pub(all) struct Group {
  name : String?
  display_name : String?
  parent_name : String?
  filter : String?
  is_cluster : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListGroupMembersResponse
pub(all) struct ListGroupMembersResponse {
  members : Array[MonitoredResource]?
  next_page_token : String?
  total_size : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListAlertsResponse
pub(all) struct ListAlertsResponse {
  alerts : Array[Alert]?
  next_page_token : String?
  total_size : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Alert
pub(all) struct Alert {
  name : String?
  state : String?
  open_time : String?
  close_time : String?
  resource : MonitoredResource?
  metadata : MonitoredResourceMetadata?
  metric : Metric?
  log : LogMetadata?
  policy : PolicySnapshot?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LogMetadata
pub(all) struct LogMetadata {
  extracted_labels : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PolicySnapshot
pub(all) struct PolicySnapshot {
  name : String?
  display_name : String?
  severity : String?
  user_labels : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListNotificationChannelDescriptorsResponse
pub(all) struct ListNotificationChannelDescriptorsResponse {
  channel_descriptors : Array[NotificationChannelDescriptor]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema NotificationChannelDescriptor
pub(all) struct NotificationChannelDescriptor {
  name : String?
  type_ : String?
  display_name : String?
  description : String?
  labels : Array[LabelDescriptor]?
  supported_tiers : Array[String]?
  launch_stage : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema ListNotificationChannelsResponse
pub(all) struct ListNotificationChannelsResponse {
  notification_channels : Array[NotificationChannel]?
  next_page_token : String?
  total_size : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema NotificationChannel
pub(all) struct NotificationChannel {
  type_ : String?
  name : String?
  display_name : String?
  description : String?
  labels : Json?
  user_labels : Json?
  verification_status : String?
  enabled : Bool?
  creation_record : MutationRecord?
  mutation_records : Array[MutationRecord]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema SendNotificationChannelVerificationCodeRequest
pub(all) struct SendNotificationChannelVerificationCodeRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema GetNotificationChannelVerificationCodeRequest
pub(all) struct GetNotificationChannelVerificationCodeRequest {
  expire_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GetNotificationChannelVerificationCodeResponse
pub(all) struct GetNotificationChannelVerificationCodeResponse {
  code : String?
  expire_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema VerifyNotificationChannelRequest
pub(all) struct VerifyNotificationChannelRequest {
  code : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema QueryTimeSeriesRequest
pub(all) struct QueryTimeSeriesRequest {
  query : String?
  page_size : Int?
  page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema QueryTimeSeriesResponse
pub(all) struct QueryTimeSeriesResponse {
  time_series_descriptor : TimeSeriesDescriptor?
  time_series_data : Array[TimeSeriesData]?
  next_page_token : String?
  partial_errors : Array[Status]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TimeSeriesDescriptor
pub(all) struct TimeSeriesDescriptor {
  label_descriptors : Array[LabelDescriptor]?
  point_descriptors : Array[ValueDescriptor]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ValueDescriptor
pub(all) struct ValueDescriptor {
  key : String?
  value_type : String?
  metric_kind : String?
  unit : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TimeSeriesData
pub(all) struct TimeSeriesData {
  label_values : Array[LabelValue]?
  point_data : Array[PointData]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LabelValue
pub(all) struct LabelValue {
  bool_value : Bool?
  int64_value : String?
  string_value : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PointData
pub(all) struct PointData {
  values : Array[TypedValue]?
  time_interval : TimeInterval?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Service
pub(all) struct Service {
  name : String?
  display_name : String?
  custom : Custom?
  app_engine : AppEngine?
  cloud_endpoints : CloudEndpoints?
  cluster_istio : ClusterIstio?
  mesh_istio : MeshIstio?
  istio_canonical_service : IstioCanonicalService?
  cloud_run : CloudRun?
  gke_namespace : GkeNamespace?
  gke_workload : GkeWorkload?
  gke_service : GkeService?
  basic_service : BasicService?
  telemetry : Telemetry?
  user_labels : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Custom
pub(all) struct Custom {} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AppEngine
pub(all) struct AppEngine {
  module_id : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CloudEndpoints
pub(all) struct CloudEndpoints {
  service : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ClusterIstio
pub(all) struct ClusterIstio {
  location : String?
  cluster_name : String?
  service_namespace : String?
  service_name : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema MeshIstio
pub(all) struct MeshIstio {
  mesh_uid : String?
  service_namespace : String?
  service_name : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema IstioCanonicalService
pub(all) struct IstioCanonicalService {
  mesh_uid : String?
  canonical_service_namespace : String?
  canonical_service : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CloudRun
pub(all) struct CloudRun {
  service_name : String?
  location : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GkeNamespace
pub(all) struct GkeNamespace {
  project_id : String?
  location : String?
  cluster_name : String?
  namespace_name : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GkeWorkload
pub(all) struct GkeWorkload {
  project_id : String?
  location : String?
  cluster_name : String?
  namespace_name : String?
  top_level_controller_type : String?
  top_level_controller_name : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GkeService
pub(all) struct GkeService {
  project_id : String?
  location : String?
  cluster_name : String?
  namespace_name : String?
  service_name : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BasicService
pub(all) struct BasicService {
  service_type : String?
  service_labels : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Telemetry
pub(all) struct Telemetry {
  resource_name : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListServicesResponse
pub(all) struct ListServicesResponse {
  services : Array[Service]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ServiceLevelObjective
pub(all) struct ServiceLevelObjective {
  name : String?
  display_name : String?
  service_level_indicator : ServiceLevelIndicator?
  goal : Double?
  rolling_period : String?
  calendar_period : String?
  user_labels : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ServiceLevelIndicator
pub(all) struct ServiceLevelIndicator {
  basic_sli : BasicSli?
  request_based : RequestBasedSli?
  windows_based : WindowsBasedSli?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BasicSli
pub(all) struct BasicSli {
  method_ : Array[String]?
  location : Array[String]?
  version : Array[String]?
  availability : AvailabilityCriteria?
  latency : LatencyCriteria?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(method_(rename="method"))),
)

///|
/// Schema AvailabilityCriteria
pub(all) struct AvailabilityCriteria {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema LatencyCriteria
pub(all) struct LatencyCriteria {
  threshold : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema RequestBasedSli
pub(all) struct RequestBasedSli {
  good_total_ratio : TimeSeriesRatio?
  distribution_cut : DistributionCut?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TimeSeriesRatio
pub(all) struct TimeSeriesRatio {
  good_service_filter : String?
  bad_service_filter : String?
  total_service_filter : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema DistributionCut
pub(all) struct DistributionCut {
  distribution_filter : String?
  range : GoogleMonitoringV3Range?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GoogleMonitoringV3Range
pub(all) struct GoogleMonitoringV3Range {
  min : Double?
  max : Double?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema WindowsBasedSli
pub(all) struct WindowsBasedSli {
  good_bad_metric_filter : String?
  good_total_ratio_threshold : PerformanceThreshold?
  metric_mean_in_range : MetricRange?
  metric_sum_in_range : MetricRange?
  window_period : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PerformanceThreshold
pub(all) struct PerformanceThreshold {
  performance : RequestBasedSli?
  basic_sli_performance : BasicSli?
  threshold : Double?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema MetricRange
pub(all) struct MetricRange {
  time_series : String?
  range : GoogleMonitoringV3Range?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListServiceLevelObjectivesResponse
pub(all) struct ListServiceLevelObjectivesResponse {
  service_level_objectives : Array[ServiceLevelObjective]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Snooze
pub(all) struct Snooze {
  name : String?
  criteria : Criteria?
  interval : TimeInterval?
  display_name : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Criteria
pub(all) struct Criteria {
  policies : Array[String]?
  filter : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListSnoozesResponse
pub(all) struct ListSnoozesResponse {
  snoozes : Array[Snooze]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListUptimeCheckConfigsResponse
pub(all) struct ListUptimeCheckConfigsResponse {
  uptime_check_configs : Array[UptimeCheckConfig]?
  next_page_token : String?
  total_size : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema UptimeCheckConfig
pub(all) struct UptimeCheckConfig {
  name : String?
  display_name : String?
  monitored_resource : MonitoredResource?
  resource_group : ResourceGroup?
  synthetic_monitor : SyntheticMonitorTarget?
  http_check : HttpCheck?
  tcp_check : TcpCheck?
  period : String?
  timeout : String?
  content_matchers : Array[ContentMatcher]?
  checker_type : String?
  disabled : Bool?
  selected_regions : Array[String]?
  log_check_failures : Bool?
  is_internal : Bool?
  internal_checkers : Array[InternalChecker]?
  user_labels : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ResourceGroup
pub(all) struct ResourceGroup {
  group_id : String?
  resource_type : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema SyntheticMonitorTarget
pub(all) struct SyntheticMonitorTarget {
  cloud_function_v2 : CloudFunctionV2Target?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CloudFunctionV2Target
pub(all) struct CloudFunctionV2Target {
  name : String?
  cloud_run_revision : MonitoredResource?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema HttpCheck
pub(all) struct HttpCheck {
  request_method : String?
  use_ssl : Bool?
  path : String?
  port : Int?
  auth_info : BasicAuthentication?
  mask_headers : Bool?
  headers : Json?
  content_type : String?
  custom_content_type : String?
  validate_ssl : Bool?
  body : String?
  accepted_response_status_codes : Array[ResponseStatusCode]?
  ping_config : PingConfig?
  service_agent_authentication : ServiceAgentAuthentication?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BasicAuthentication
pub(all) struct BasicAuthentication {
  username : String?
  password : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ResponseStatusCode
pub(all) struct ResponseStatusCode {
  status_value : Int?
  status_class : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PingConfig
pub(all) struct PingConfig {
  pings_count : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ServiceAgentAuthentication
pub(all) struct ServiceAgentAuthentication {
  type_ : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema TcpCheck
pub(all) struct TcpCheck {
  port : Int?
  ping_config : PingConfig?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ContentMatcher
pub(all) struct ContentMatcher {
  content : String?
  matcher : String?
  json_path_matcher : JsonPathMatcher?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema JsonPathMatcher
pub(all) struct JsonPathMatcher {
  json_path : String?
  json_matcher : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema InternalChecker
pub(all) struct InternalChecker {
  name : String?
  display_name : String?
  network : String?
  gcp_zone : String?
  peer_project_id : String?
  state : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListUptimeCheckIpsResponse
pub(all) struct ListUptimeCheckIpsResponse {
  uptime_check_ips : Array[UptimeCheckIp]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema UptimeCheckIp
pub(all) struct UptimeCheckIp {
  region : String?
  location : String?
  ip_address : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Type
pub(all) struct Type {
  name : String?
  fields : Array[Field]?
  oneofs : Array[String]?
  options : Array[Option]?
  source_context : SourceContext?
  syntax : String?
  edition : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Field
pub(all) struct Field {
  kind : String?
  cardinality : String?
  number : Int?
  name : String?
  type_url : String?
  oneof_index : Int?
  packed : Bool?
  options : Array[Option]?
  json_name : String?
  default_value : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Option
pub(all) struct Option {
  name : String?
  value : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema SourceContext
pub(all) struct SourceContext {
  file_name : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema DroppedLabels
pub(all) struct DroppedLabels {
  label : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema SpanContext
pub(all) struct SpanContext {
  span_name : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema OperationMetadata
pub(all) struct OperationMetadata {
  state : String?
  create_time : String?
  update_time : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))
