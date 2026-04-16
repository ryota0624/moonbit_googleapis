///|
/// Schema SendNotificationChannelVerificationCodeRequest
pub(all) struct SendNotificationChannelVerificationCodeRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TcpCheck
pub(all) struct TcpCheck {
  port : Int?
  ping_config : PingConfig?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Field
pub(all) struct Field {
  packed : Bool?
  oneof_index : Int?
  json_name : String?
  default_value : String?
  number : Int?
  options : Array[Option]?
  name : String?
  cardinality : String?
  type_url : String?
  kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema SqlCondition
pub(all) struct SqlCondition {
  hourly : Hourly?
  boolean_test : BooleanTest?
  minutes : Minutes?
  daily : Daily?
  query : String?
  row_count_test : RowCountTest?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Criteria
pub(all) struct Criteria {
  filter : String?
  policies : Array[String]?
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
/// Schema GetNotificationChannelVerificationCodeResponse
pub(all) struct GetNotificationChannelVerificationCodeResponse {
  expire_time : String?
  code : String?
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
  key : String?
  value_type : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MonitoringQueryLanguageCondition
pub(all) struct MonitoringQueryLanguageCondition {
  evaluation_missing_data : String?
  trigger : Trigger?
  query : String?
  duration : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Linear
pub(all) struct Linear {
  offset : Double?
  num_finite_buckets : Int?
  width : Double?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ContentMatcher
pub(all) struct ContentMatcher {
  json_path_matcher : JsonPathMatcher?
  content : String?
  matcher : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Point
pub(all) struct Point {
  value : TypedValue?
  interval : TimeInterval?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MeshIstio
pub(all) struct MeshIstio {
  mesh_uid : String?
  service_name : String?
  service_namespace : String?
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
/// Schema CollectdValueError
pub(all) struct CollectdValueError {
  error : Status?
  index : Int?
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
/// Schema RowCountTest
pub(all) struct RowCountTest {
  threshold : String?
  comparison : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema QueryTimeSeriesRequest
pub(all) struct QueryTimeSeriesRequest {
  page_token : String?
  query : String?
  page_size : Int?
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
/// Schema Exponential
pub(all) struct Exponential {
  growth_factor : Double?
  scale : Double?
  num_finite_buckets : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
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
/// Schema PrometheusQueryLanguageCondition
pub(all) struct PrometheusQueryLanguageCondition {
  rule_group : String?
  disable_metric_validation : Bool?
  query : String?
  duration : String?
  labels : Json?
  evaluation_interval : String?
  alert_rule : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema HttpCheck
pub(all) struct HttpCheck {
  accepted_response_status_codes : Array[ResponseStatusCode]?
  mask_headers : Bool?
  use_ssl : Bool?
  validate_ssl : Bool?
  port : Int?
  body : String?
  content_type : String?
  headers : Json?
  service_agent_authentication : ServiceAgentAuthentication?
  path : String?
  request_method : String?
  custom_content_type : String?
  ping_config : PingConfig?
  auth_info : BasicAuthentication?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Error
pub(all) struct Error_ {
  point_count : Int?
  status : Status?
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
/// Schema ListNotificationChannelDescriptorsResponse
pub(all) struct ListNotificationChannelDescriptorsResponse {
  next_page_token : String?
  channel_descriptors : Array[NotificationChannelDescriptor]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BasicAuthentication
pub(all) struct BasicAuthentication {
  username : String?
  password : String?
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
/// Schema ServiceLevelObjective
pub(all) struct ServiceLevelObjective {
  name : String?
  goal : Double?
  rolling_period : String?
  calendar_period : String?
  user_labels : Json?
  service_level_indicator : ServiceLevelIndicator?
  display_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MetricRange
pub(all) struct MetricRange {
  time_series : String?
  range : GoogleMonitoringV3Range?
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
/// Schema Snooze
pub(all) struct Snooze {
  interval : TimeInterval?
  criteria : Criteria?
  display_name : String?
  name : String?
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
/// Schema CreateCollectdTimeSeriesResponse
pub(all) struct CreateCollectdTimeSeriesResponse {
  payload_errors : Array[CollectdPayloadError]?
  summary : CreateTimeSeriesSummary?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BasicService
pub(all) struct BasicService {
  service_labels : Json?
  service_type : String?
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
/// Schema Alert
pub(all) struct Alert {
  resource : MonitoredResource?
  state : String?
  close_time : String?
  open_time : String?
  policy : PolicySnapshot?
  name : String?
  metric : Metric?
  log : LogMetadata?
  metadata : MonitoredResourceMetadata?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Service
pub(all) struct Service {
  display_name : String?
  mesh_istio : MeshIstio?
  istio_canonical_service : IstioCanonicalService?
  gke_namespace : GkeNamespace?
  user_labels : Json?
  gke_service : GkeService?
  telemetry : Telemetry?
  app_engine : AppEngine?
  cluster_istio : ClusterIstio?
  gke_workload : GkeWorkload?
  cloud_endpoints : CloudEndpoints?
  name : String?
  custom : Custom?
  basic_service : BasicService?
  cloud_run : CloudRun?
} derive (
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
/// Schema TimeInterval
pub(all) struct TimeInterval {
  start_time : String?
  end_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema WindowsBasedSli
pub(all) struct WindowsBasedSli {
  good_total_ratio_threshold : PerformanceThreshold?
  window_period : String?
  metric_mean_in_range : MetricRange?
  metric_sum_in_range : MetricRange?
  good_bad_metric_filter : String?
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
  notification_prompts : Array[String]?
  notification_channel_strategy : Array[NotificationChannelStrategy]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
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
/// Schema Group
pub(all) struct Group {
  is_cluster : Bool?
  name : String?
  filter : String?
  parent_name : String?
  display_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListNotificationChannelsResponse
pub(all) struct ListNotificationChannelsResponse {
  notification_channels : Array[NotificationChannel]?
  next_page_token : String?
  total_size : Int?
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
/// Schema CollectdPayloadError
pub(all) struct CollectdPayloadError {
  value_errors : Array[CollectdValueError]?
  index : Int?
  error : Status?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema NotificationChannel
pub(all) struct NotificationChannel {
  description : String?
  labels : Json?
  user_labels : Json?
  type_ : String?
  name : String?
  mutation_records : Array[MutationRecord]?
  creation_record : MutationRecord?
  display_name : String?
  enabled : Bool?
  verification_status : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
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
/// Schema ListMetricDescriptorsResponse
pub(all) struct ListMetricDescriptorsResponse {
  metric_descriptors : Array[MetricDescriptor]?
  next_page_token : String?
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
/// Schema CreateTimeSeriesSummary
pub(all) struct CreateTimeSeriesSummary {
  errors : Array[Error_]?
  total_point_count : Int?
  success_point_count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GoogleMonitoringV3Range
pub(all) struct GoogleMonitoringV3Range {
  max : Double?
  min : Double?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ClusterIstio
pub(all) struct ClusterIstio {
  service_name : String?
  cluster_name : String?
  location : String?
  service_namespace : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ServiceLevelIndicator
pub(all) struct ServiceLevelIndicator {
  windows_based : WindowsBasedSli?
  request_based : RequestBasedSli?
  basic_sli : BasicSli?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MetricAbsence
pub(all) struct MetricAbsence {
  trigger : Trigger?
  duration : String?
  aggregations : Array[Aggregation]?
  filter : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Aggregation
pub(all) struct Aggregation {
  group_by_fields : Array[String]?
  alignment_period : String?
  per_series_aligner : String?
  cross_series_reducer : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Type
pub(all) struct Type {
  name : String?
  options : Array[Option]?
  syntax : String?
  fields : Array[Field]?
  edition : String?
  oneofs : Array[String]?
  source_context : SourceContext?
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
/// Schema GkeService
pub(all) struct GkeService {
  service_name : String?
  location : String?
  project_id : String?
  namespace_name : String?
  cluster_name : String?
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
  sample_period : String?
  ingest_delay : String?
  time_series_resource_hierarchy_level : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GkeWorkload
pub(all) struct GkeWorkload {
  cluster_name : String?
  top_level_controller_name : String?
  namespace_name : String?
  project_id : String?
  location : String?
  top_level_controller_type : String?
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
/// Schema Metric
pub(all) struct Metric {
  type_ : String?
  labels : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
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
/// Schema TimeSeriesData
pub(all) struct TimeSeriesData {
  label_values : Array[LabelValue]?
  point_data : Array[PointData]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListAlertPoliciesResponse
pub(all) struct ListAlertPoliciesResponse {
  next_page_token : String?
  total_size : Int?
  alert_policies : Array[AlertPolicy]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PerformanceThreshold
pub(all) struct PerformanceThreshold {
  performance : RequestBasedSli?
  threshold : Double?
  basic_sli_performance : BasicSli?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TimeSeries
pub(all) struct TimeSeries {
  metric : Metric?
  resource : MonitoredResource?
  description : String?
  value_type : String?
  unit : String?
  points : Array[Point]?
  metadata : MonitoredResourceMetadata?
  metric_kind : String?
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
/// Schema Status
pub(all) struct Status {
  code : Int?
  details : Array[Json]?
  message : String?
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
/// Schema Daily
pub(all) struct Daily {
  periodicity : Int?
  execution_time : TimeOfDay?
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
/// Schema Custom
pub(all) struct Custom {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GkeNamespace
pub(all) struct GkeNamespace {
  location : String?
  namespace_name : String?
  cluster_name : String?
  project_id : String?
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
/// Schema LabelValue
pub(all) struct LabelValue {
  bool_value : Bool?
  int64_value : String?
  string_value : String?
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
/// Schema Exemplar
pub(all) struct Exemplar {
  value : Double?
  timestamp : String?
  attachments : Array[Json]?
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
/// Schema MetricDescriptor
pub(all) struct MetricDescriptor {
  name : String?
  type_ : String?
  value_type : String?
  labels : Array[LabelDescriptor]?
  description : String?
  metric_kind : String?
  monitored_resource_types : Array[String]?
  metadata : MetricDescriptorMetadata?
  unit : String?
  launch_stage : String?
  display_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema MetricThreshold
pub(all) struct MetricThreshold {
  filter : String?
  comparison : String?
  duration : String?
  forecast_options : ForecastOptions?
  evaluation_missing_data : String?
  trigger : Trigger?
  denominator_aggregations : Array[Aggregation]?
  aggregations : Array[Aggregation]?
  denominator_filter : String?
  threshold_value : Double?
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
/// Schema BasicSli
pub(all) struct BasicSli {
  method_ : Array[String]?
  availability : AvailabilityCriteria?
  latency : LatencyCriteria?
  location : Array[String]?
  version : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(method_(rename="method"))),
  ToJson(rename_fields="camelCase", fields(method_(rename="method"))),
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
/// Schema TypedValue
pub(all) struct TypedValue {
  double_value : Double?
  distribution_value : Distribution?
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
/// Schema PolicySnapshot
pub(all) struct PolicySnapshot {
  name : String?
  display_name : String?
  user_labels : Json?
  severity : String?
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
/// Schema AvailabilityCriteria
pub(all) struct AvailabilityCriteria {} derive (
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
/// Schema CloudRun
pub(all) struct CloudRun {
  location : String?
  service_name : String?
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
/// Schema TimeOfDay
pub(all) struct TimeOfDay {
  seconds : Int?
  nanos : Int?
  hours : Int?
  minutes : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Documentation
pub(all) struct Documentation {
  links : Array[Link]?
  content : String?
  mime_type : String?
  subject : String?
} derive (
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
/// Schema Condition
pub(all) struct Condition {
  condition_sql : SqlCondition?
  condition_matched_log : LogMatch?
  name : String?
  condition_absent : MetricAbsence?
  condition_prometheus_query_language : PrometheusQueryLanguageCondition?
  display_name : String?
  condition_threshold : MetricThreshold?
  condition_monitoring_query_language : MonitoringQueryLanguageCondition?
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
/// Schema AlertPolicy
pub(all) struct AlertPolicy {
  name : String?
  documentation : Documentation?
  conditions : Array[Condition]?
  creation_record : MutationRecord?
  notification_channels : Array[String]?
  combiner : String?
  enabled : Bool?
  validity : Status?
  user_labels : Json?
  alert_strategy : AlertStrategy?
  severity : String?
  mutation_record : MutationRecord?
  display_name : String?
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
/// Schema TimeSeriesRatio
pub(all) struct TimeSeriesRatio {
  total_service_filter : String?
  good_service_filter : String?
  bad_service_filter : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ValueDescriptor
pub(all) struct ValueDescriptor {
  value_type : String?
  metric_kind : String?
  unit : String?
  key : String?
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
/// Schema ListTimeSeriesResponse
pub(all) struct ListTimeSeriesResponse {
  unit : String?
  unreachable_ : Array[String]?
  next_page_token : String?
  execution_errors : Array[Status]?
  time_series : Array[TimeSeries]?
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
/// Schema NotificationChannelDescriptor
pub(all) struct NotificationChannelDescriptor {
  display_name : String?
  labels : Array[LabelDescriptor]?
  description : String?
  name : String?
  type_ : String?
  supported_tiers : Array[String]?
  launch_stage : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema UptimeCheckConfig
pub(all) struct UptimeCheckConfig {
  internal_checkers : Array[InternalChecker]?
  name : String?
  tcp_check : TcpCheck?
  log_check_failures : Bool?
  period : String?
  disabled : Bool?
  synthetic_monitor : SyntheticMonitorTarget?
  timeout : String?
  monitored_resource : MonitoredResource?
  http_check : HttpCheck?
  selected_regions : Array[String]?
  content_matchers : Array[ContentMatcher]?
  user_labels : Json?
  is_internal : Bool?
  resource_group : ResourceGroup?
  checker_type : String?
  display_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Distribution
pub(all) struct Distribution {
  mean : Double?
  bucket_options : BucketOptions?
  exemplars : Array[Exemplar]?
  sum_of_squared_deviation : Double?
  range : Range?
  count : String?
  bucket_counts : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema InternalChecker
pub(all) struct InternalChecker {
  state : String?
  display_name : String?
  gcp_zone : String?
  network : String?
  peer_project_id : String?
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema OperationMetadata
pub(all) struct OperationMetadata {
  state : String?
  create_time : String?
  update_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TimeSeriesDescriptor
pub(all) struct TimeSeriesDescriptor {
  label_descriptors : Array[LabelDescriptor]?
  point_descriptors : Array[ValueDescriptor]?
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
/// Schema CollectdPayload
pub(all) struct CollectdPayload {
  values : Array[CollectdValue]?
  type_ : String?
  end_time : String?
  plugin_instance : String?
  start_time : String?
  type_instance : String?
  plugin : String?
  metadata : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
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
