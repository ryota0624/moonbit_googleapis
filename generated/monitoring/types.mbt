///|
/// Schema MeshIstio
pub(all) struct MeshIstio {
  mesh_uid : String?
  service_namespace : String?
  service_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ServiceLevelIndicator
pub(all) struct ServiceLevelIndicator {
  basic_sli : BasicSli?
  request_based : RequestBasedSli?
  windows_based : WindowsBasedSli?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateCollectdTimeSeriesRequest
pub(all) struct CreateCollectdTimeSeriesRequest {
  resource : MonitoredResource?
  collectd_version : String?
  collectd_payloads : Array[CollectdPayload]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListServiceLevelObjectivesResponse
pub(all) struct ListServiceLevelObjectivesResponse {
  service_level_objectives : Array[ServiceLevelObjective]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TimeInterval
pub(all) struct TimeInterval {
  end_time : String?
  start_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListNotificationChannelsResponse
pub(all) struct ListNotificationChannelsResponse {
  next_page_token : String?
  total_size : Int?
  notification_channels : Array[NotificationChannel]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CollectdValueError
pub(all) struct CollectdValueError {
  index : Int?
  error : Status?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema SendNotificationChannelVerificationCodeRequest
pub(all) struct SendNotificationChannelVerificationCodeRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AvailabilityCriteria
pub(all) struct AvailabilityCriteria {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RequestBasedSli
pub(all) struct RequestBasedSli {
  good_total_ratio : TimeSeriesRatio?
  distribution_cut : DistributionCut?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CollectdPayloadError
pub(all) struct CollectdPayloadError {
  error : Status?
  value_errors : Array[CollectdValueError]?
  index : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleMonitoringV3Range
pub(all) struct GoogleMonitoringV3Range {
  min : Double?
  max : Double?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Group
pub(all) struct Group {
  is_cluster : Bool?
  display_name : String?
  filter : String?
  name : String?
  parent_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BooleanTest
pub(all) struct BooleanTest {
  column : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema SpanContext
pub(all) struct SpanContext {
  span_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema QueryTimeSeriesRequest
pub(all) struct QueryTimeSeriesRequest {
  page_size : Int?
  query : String?
  page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MonitoredResource
pub(all) struct MonitoredResource {
  labels : Json?
  type_ : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema VerifyNotificationChannelRequest
pub(all) struct VerifyNotificationChannelRequest {
  code : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema IstioCanonicalService
pub(all) struct IstioCanonicalService {
  canonical_service_namespace : String?
  mesh_uid : String?
  canonical_service : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListAlertsResponse
pub(all) struct ListAlertsResponse {
  alerts : Array[Alert]?
  next_page_token : String?
  total_size : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Range
pub(all) struct Range {
  min : Double?
  max : Double?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema NotificationChannelDescriptor
pub(all) struct NotificationChannelDescriptor {
  supported_tiers : Array[String]?
  type_ : String?
  display_name : String?
  labels : Array[LabelDescriptor]?
  launch_stage : String?
  name : String?
  description : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema TimeSeriesDescriptor
pub(all) struct TimeSeriesDescriptor {
  point_descriptors : Array[ValueDescriptor]?
  label_descriptors : Array[LabelDescriptor]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ForecastOptions
pub(all) struct ForecastOptions {
  forecast_horizon : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Error
pub(all) struct Error_ {
  status : Status?
  point_count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Telemetry
pub(all) struct Telemetry {
  resource_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListTimeSeriesResponse
pub(all) struct ListTimeSeriesResponse {
  unit : String?
  unreachable_ : Array[String]?
  time_series : Array[TimeSeries]?
  next_page_token : String?
  execution_errors : Array[Status]?
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
/// Schema CollectdValue
pub(all) struct CollectdValue {
  data_source_name : String?
  value : TypedValue?
  data_source_type : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AlertPolicy
pub(all) struct AlertPolicy {
  validity : Status?
  enabled : Bool?
  documentation : Documentation?
  name : String?
  user_labels : Json?
  combiner : String?
  mutation_record : MutationRecord?
  creation_record : MutationRecord?
  display_name : String?
  conditions : Array[Condition]?
  severity : String?
  notification_channels : Array[String]?
  alert_strategy : AlertStrategy?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ValueDescriptor
pub(all) struct ValueDescriptor {
  key : String?
  value_type : String?
  unit : String?
  metric_kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BasicService
pub(all) struct BasicService {
  service_type : String?
  service_labels : Json?
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
/// Schema ClusterIstio
pub(all) struct ClusterIstio {
  location : String?
  cluster_name : String?
  service_namespace : String?
  service_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Point
pub(all) struct Point {
  interval : TimeInterval?
  value : TypedValue?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LabelDescriptor
pub(all) struct LabelDescriptor {
  value_type : String?
  key : String?
  description : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ContentMatcher
pub(all) struct ContentMatcher {
  matcher : String?
  json_path_matcher : JsonPathMatcher?
  content : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ServiceAgentAuthentication
pub(all) struct ServiceAgentAuthentication {
  type_ : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema ListGroupsResponse
pub(all) struct ListGroupsResponse {
  group : Array[Group]?
  next_page_token : String?
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
  labels : Array[LabelDescriptor]?
  launch_stage : String?
  type_ : String?
  display_name : String?
  name : String?
  description : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema AppEngine
pub(all) struct AppEngine {
  module_id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CollectdPayload
pub(all) struct CollectdPayload {
  start_time : String?
  plugin_instance : String?
  metadata : Json?
  end_time : String?
  values : Array[CollectdValue]?
  plugin : String?
  type_ : String?
  type_instance : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema LabelValue
pub(all) struct LabelValue {
  bool_value : Bool?
  string_value : String?
  int64_value : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UptimeCheckConfig
pub(all) struct UptimeCheckConfig {
  content_matchers : Array[ContentMatcher]?
  disabled : Bool?
  timeout : String?
  log_check_failures : Bool?
  http_check : HttpCheck?
  display_name : String?
  tcp_check : TcpCheck?
  internal_checkers : Array[InternalChecker]?
  checker_type : String?
  synthetic_monitor : SyntheticMonitorTarget?
  is_internal : Bool?
  resource_group : ResourceGroup?
  user_labels : Json?
  monitored_resource : MonitoredResource?
  name : String?
  selected_regions : Array[String]?
  period : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TimeSeriesData
pub(all) struct TimeSeriesData {
  point_data : Array[PointData]?
  label_values : Array[LabelValue]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema WindowsBasedSli
pub(all) struct WindowsBasedSli {
  good_bad_metric_filter : String?
  metric_mean_in_range : MetricRange?
  window_period : String?
  good_total_ratio_threshold : PerformanceThreshold?
  metric_sum_in_range : MetricRange?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListServicesResponse
pub(all) struct ListServicesResponse {
  services : Array[Service]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Exemplar
pub(all) struct Exemplar {
  timestamp : String?
  value : Double?
  attachments : Array[Json]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListUptimeCheckIpsResponse
pub(all) struct ListUptimeCheckIpsResponse {
  next_page_token : String?
  uptime_check_ips : Array[UptimeCheckIp]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PerformanceThreshold
pub(all) struct PerformanceThreshold {
  threshold : Double?
  performance : RequestBasedSli?
  basic_sli_performance : BasicSli?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BasicSli
pub(all) struct BasicSli {
  method_ : Array[String]?
  location : Array[String]?
  latency : LatencyCriteria?
  availability : AvailabilityCriteria?
  version : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(method_(rename="method"))),
  ToJson(rename_fields="camelCase", fields(method_(rename="method"))),
)

///|
/// Schema Custom
pub(all) struct Custom {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema OperationMetadata
pub(all) struct OperationMetadata {
  update_time : String?
  create_time : String?
  state : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CloudFunctionV2Target
pub(all) struct CloudFunctionV2Target {
  name : String?
  cloud_run_revision : MonitoredResource?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Distribution
pub(all) struct Distribution {
  range : Range?
  bucket_options : BucketOptions?
  count : String?
  sum_of_squared_deviation : Double?
  bucket_counts : Array[String]?
  exemplars : Array[Exemplar]?
  mean : Double?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema NotificationChannelStrategy
pub(all) struct NotificationChannelStrategy {
  notification_channel_names : Array[String]?
  renotify_interval : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LatencyCriteria
pub(all) struct LatencyCriteria {
  threshold : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Trigger
pub(all) struct Trigger {
  count : Int?
  percent : Double?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Daily
pub(all) struct Daily {
  execution_time : TimeOfDay?
  periodicity : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UptimeCheckIp
pub(all) struct UptimeCheckIp {
  location : String?
  ip_address : String?
  region : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MetricThreshold
pub(all) struct MetricThreshold {
  threshold_value : Double?
  denominator_filter : String?
  comparison : String?
  duration : String?
  aggregations : Array[Aggregation]?
  denominator_aggregations : Array[Aggregation]?
  evaluation_missing_data : String?
  trigger : Trigger?
  filter : String?
  forecast_options : ForecastOptions?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MonitoringQueryLanguageCondition
pub(all) struct MonitoringQueryLanguageCondition {
  duration : String?
  trigger : Trigger?
  query : String?
  evaluation_missing_data : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BucketOptions
pub(all) struct BucketOptions {
  explicit_buckets : Explicit?
  linear_buckets : Linear?
  exponential_buckets : Exponential?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PolicySnapshot
pub(all) struct PolicySnapshot {
  display_name : String?
  user_labels : Json?
  severity : String?
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetNotificationChannelVerificationCodeResponse
pub(all) struct GetNotificationChannelVerificationCodeResponse {
  code : String?
  expire_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListUptimeCheckConfigsResponse
pub(all) struct ListUptimeCheckConfigsResponse {
  next_page_token : String?
  total_size : Int?
  uptime_check_configs : Array[UptimeCheckConfig]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Documentation
pub(all) struct Documentation {
  content : String?
  mime_type : String?
  subject : String?
  links : Array[Link]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateCollectdTimeSeriesResponse
pub(all) struct CreateCollectdTimeSeriesResponse {
  summary : CreateTimeSeriesSummary?
  payload_errors : Array[CollectdPayloadError]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Metric
pub(all) struct Metric {
  labels : Json?
  type_ : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema Field
pub(all) struct Field {
  number : Int?
  packed : Bool?
  type_url : String?
  oneof_index : Int?
  options : Array[Option]?
  default_value : String?
  json_name : String?
  name : String?
  cardinality : String?
  kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DistributionCut
pub(all) struct DistributionCut {
  distribution_filter : String?
  range : GoogleMonitoringV3Range?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PingConfig
pub(all) struct PingConfig {
  pings_count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListAlertPoliciesResponse
pub(all) struct ListAlertPoliciesResponse {
  alert_policies : Array[AlertPolicy]?
  next_page_token : String?
  total_size : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema QueryTimeSeriesResponse
pub(all) struct QueryTimeSeriesResponse {
  time_series_descriptor : TimeSeriesDescriptor?
  time_series_data : Array[TimeSeriesData]?
  partial_errors : Array[Status]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CloudRun
pub(all) struct CloudRun {
  service_name : String?
  location : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GkeWorkload
pub(all) struct GkeWorkload {
  project_id : String?
  location : String?
  cluster_name : String?
  namespace_name : String?
  top_level_controller_type : String?
  top_level_controller_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Hourly
pub(all) struct Hourly {
  periodicity : Int?
  minute_offset : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Criteria
pub(all) struct Criteria {
  policies : Array[String]?
  filter : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Minutes
pub(all) struct Minutes {
  periodicity : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GkeNamespace
pub(all) struct GkeNamespace {
  project_id : String?
  location : String?
  cluster_name : String?
  namespace_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PrometheusQueryLanguageCondition
pub(all) struct PrometheusQueryLanguageCondition {
  duration : String?
  rule_group : String?
  alert_rule : String?
  disable_metric_validation : Bool?
  evaluation_interval : String?
  labels : Json?
  query : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ResourceGroup
pub(all) struct ResourceGroup {
  group_id : String?
  resource_type : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TypedValue
pub(all) struct TypedValue {
  bool_value : Bool?
  string_value : String?
  int64_value : String?
  double_value : Double?
  distribution_value : Distribution?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Link
pub(all) struct Link {
  url : String?
  display_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema SourceContext
pub(all) struct SourceContext {
  file_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListGroupMembersResponse
pub(all) struct ListGroupMembersResponse {
  members : Array[MonitoredResource]?
  next_page_token : String?
  total_size : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TimeSeries
pub(all) struct TimeSeries {
  resource : MonitoredResource?
  metadata : MonitoredResourceMetadata?
  points : Array[Point]?
  description : String?
  metric : Metric?
  metric_kind : String?
  value_type : String?
  unit : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema NotificationRateLimit
pub(all) struct NotificationRateLimit {
  period : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateTimeSeriesRequest
pub(all) struct CreateTimeSeriesRequest {
  time_series : Array[TimeSeries]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema SqlCondition
pub(all) struct SqlCondition {
  row_count_test : RowCountTest?
  hourly : Hourly?
  daily : Daily?
  boolean_test : BooleanTest?
  query : String?
  minutes : Minutes?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListSnoozesResponse
pub(all) struct ListSnoozesResponse {
  snoozes : Array[Snooze]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Option
pub(all) struct Option {
  name : String?
  value : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BasicAuthentication
pub(all) struct BasicAuthentication {
  password : String?
  username : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetNotificationChannelVerificationCodeRequest
pub(all) struct GetNotificationChannelVerificationCodeRequest {
  expire_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema InternalChecker
pub(all) struct InternalChecker {
  name : String?
  state : String?
  network : String?
  gcp_zone : String?
  display_name : String?
  peer_project_id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema HttpCheck
pub(all) struct HttpCheck {
  auth_info : BasicAuthentication?
  ping_config : PingConfig?
  body : String?
  service_agent_authentication : ServiceAgentAuthentication?
  request_method : String?
  use_ssl : Bool?
  validate_ssl : Bool?
  mask_headers : Bool?
  custom_content_type : String?
  port : Int?
  content_type : String?
  accepted_response_status_codes : Array[ResponseStatusCode]?
  headers : Json?
  path : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CloudEndpoints
pub(all) struct CloudEndpoints {
  service : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ResponseStatusCode
pub(all) struct ResponseStatusCode {
  status_value : Int?
  status_class : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Aggregation
pub(all) struct Aggregation {
  per_series_aligner : String?
  alignment_period : String?
  cross_series_reducer : String?
  group_by_fields : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TcpCheck
pub(all) struct TcpCheck {
  ping_config : PingConfig?
  port : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListMetricDescriptorsResponse
pub(all) struct ListMetricDescriptorsResponse {
  next_page_token : String?
  metric_descriptors : Array[MetricDescriptor]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListNotificationChannelDescriptorsResponse
pub(all) struct ListNotificationChannelDescriptorsResponse {
  channel_descriptors : Array[NotificationChannelDescriptor]?
  next_page_token : String?
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
/// Schema NotificationChannel
pub(all) struct NotificationChannel {
  name : String?
  mutation_records : Array[MutationRecord]?
  type_ : String?
  display_name : String?
  labels : Json?
  creation_record : MutationRecord?
  verification_status : String?
  enabled : Bool?
  description : String?
  user_labels : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema RowCountTest
pub(all) struct RowCountTest {
  comparison : String?
  threshold : String?
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
/// Schema TimeOfDay
pub(all) struct TimeOfDay {
  hours : Int?
  minutes : Int?
  seconds : Int?
  nanos : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TimeSeriesRatio
pub(all) struct TimeSeriesRatio {
  good_service_filter : String?
  bad_service_filter : String?
  total_service_filter : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Snooze
pub(all) struct Snooze {
  criteria : Criteria?
  interval : TimeInterval?
  display_name : String?
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MetricDescriptor
pub(all) struct MetricDescriptor {
  launch_stage : String?
  unit : String?
  description : String?
  labels : Array[LabelDescriptor]?
  metric_kind : String?
  type_ : String?
  display_name : String?
  monitored_resource_types : Array[String]?
  value_type : String?
  metadata : MetricDescriptorMetadata?
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema MetricDescriptorMetadata
pub(all) struct MetricDescriptorMetadata {
  sample_period : String?
  time_series_resource_hierarchy_level : Array[String]?
  ingest_delay : String?
  launch_stage : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogMatch
pub(all) struct LogMatch {
  filter : String?
  label_extractors : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LogMetadata
pub(all) struct LogMetadata {
  extracted_labels : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GkeService
pub(all) struct GkeService {
  project_id : String?
  location : String?
  cluster_name : String?
  namespace_name : String?
  service_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PointData
pub(all) struct PointData {
  values : Array[TypedValue]?
  time_interval : TimeInterval?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AlertStrategy
pub(all) struct AlertStrategy {
  notification_rate_limit : NotificationRateLimit?
  auto_close : String?
  notification_channel_strategy : Array[NotificationChannelStrategy]?
  notification_prompts : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DroppedLabels
pub(all) struct DroppedLabels {
  label : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Type
pub(all) struct Type {
  oneofs : Array[String]?
  syntax : String?
  source_context : SourceContext?
  options : Array[Option]?
  fields : Array[Field]?
  name : String?
  edition : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Alert
pub(all) struct Alert {
  open_time : String?
  resource : MonitoredResource?
  state : String?
  log : LogMetadata?
  policy : PolicySnapshot?
  metric : Metric?
  name : String?
  metadata : MonitoredResourceMetadata?
  close_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Service
pub(all) struct Service {
  cloud_run : CloudRun?
  app_engine : AppEngine?
  mesh_istio : MeshIstio?
  gke_workload : GkeWorkload?
  display_name : String?
  basic_service : BasicService?
  telemetry : Telemetry?
  cloud_endpoints : CloudEndpoints?
  custom : Custom?
  gke_service : GkeService?
  user_labels : Json?
  cluster_istio : ClusterIstio?
  name : String?
  gke_namespace : GkeNamespace?
  istio_canonical_service : IstioCanonicalService?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema SyntheticMonitorTarget
pub(all) struct SyntheticMonitorTarget {
  cloud_function_v2 : CloudFunctionV2Target?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ServiceLevelObjective
pub(all) struct ServiceLevelObjective {
  service_level_indicator : ServiceLevelIndicator?
  name : String?
  goal : Double?
  calendar_period : String?
  display_name : String?
  rolling_period : String?
  user_labels : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MonitoredResourceMetadata
pub(all) struct MonitoredResourceMetadata {
  user_labels : Json?
  system_labels : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateTimeSeriesSummary
pub(all) struct CreateTimeSeriesSummary {
  total_point_count : Int?
  errors : Array[Error_]?
  success_point_count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Condition
pub(all) struct Condition {
  display_name : String?
  condition_threshold : MetricThreshold?
  condition_absent : MetricAbsence?
  condition_monitoring_query_language : MonitoringQueryLanguageCondition?
  condition_sql : SqlCondition?
  condition_matched_log : LogMatch?
  condition_prometheus_query_language : PrometheusQueryLanguageCondition?
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MetricAbsence
pub(all) struct MetricAbsence {
  filter : String?
  aggregations : Array[Aggregation]?
  duration : String?
  trigger : Trigger?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema JsonPathMatcher
pub(all) struct JsonPathMatcher {
  json_path : String?
  json_matcher : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MutationRecord
pub(all) struct MutationRecord {
  mutate_time : String?
  mutated_by : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MetricRange
pub(all) struct MetricRange {
  range : GoogleMonitoringV3Range?
  time_series : String?
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
