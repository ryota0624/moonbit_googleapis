///|
/// Schema TypedValue
pub(all) struct TypedValue {
  bool_value : Bool?
  int64_value : String?
  double_value : Double?
  string_value : String?
  distribution_value : Json?
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
/// Schema Aggregation
pub(all) struct Aggregation {
  alignment_period : String?
  per_series_aligner : String?
  cross_series_reducer : String?
  group_by_fields : Array[String]?
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
/// Schema AlertPolicy
pub(all) struct AlertPolicy {
  name : String?
  display_name : String?
  documentation : Documentation?
  user_labels : Array[UserLabelsEntry]?
  conditions : Array[Condition]?
  combiner : String?
  enabled : Bool?
  validity : Json?
  notification_channels : Array[String]?
  creation_record : MutationRecord?
  mutation_record : MutationRecord?
  alert_strategy : AlertStrategy?
  severity : String?
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
/// Schema Link
pub(all) struct Link {
  display_name : String?
  url : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

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
/// Schema LogMatch
pub(all) struct LogMatch {
  filter : String?
  label_extractors : Array[LabelExtractorsEntry]?
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
/// Schema MonitoringQueryLanguageCondition
pub(all) struct MonitoringQueryLanguageCondition {
  query : String?
  duration : String?
  trigger : Trigger?
  evaluation_missing_data : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PrometheusQueryLanguageCondition
pub(all) struct PrometheusQueryLanguageCondition {
  query : String?
  duration : String?
  evaluation_interval : String?
  labels : Array[LabelsEntry]?
  rule_group : String?
  alert_rule : String?
  disable_metric_validation : Bool?
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
/// Schema SqlCondition
pub(all) struct SqlCondition {
  query : String?
  minutes : Minutes?
  hourly : Hourly?
  daily : Daily?
  row_count_test : RowCountTest?
  boolean_test : BooleanTest?
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
/// Schema Daily
pub(all) struct Daily {
  periodicity : Int?
  execution_time : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
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
/// Schema AlertStrategy
pub(all) struct AlertStrategy {
  notification_rate_limit : NotificationRateLimit?
  notification_prompts : Array[String]?
  auto_close : String?
  notification_channel_strategy : Array[NotificationChannelStrategy]?
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
/// Schema UserLabelsEntry
pub(all) struct UserLabelsEntry {
  key : String?
  value : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateAlertPolicyRequest
pub(all) struct CreateAlertPolicyRequest {
  name : String?
  alert_policy : AlertPolicy?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetAlertPolicyRequest
pub(all) struct GetAlertPolicyRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListAlertPoliciesRequest
pub(all) struct ListAlertPoliciesRequest {
  name : String?
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
/// Schema UpdateAlertPolicyRequest
pub(all) struct UpdateAlertPolicyRequest {
  update_mask : String?
  alert_policy : AlertPolicy?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteAlertPolicyRequest
pub(all) struct DeleteAlertPolicyRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DroppedLabels
pub(all) struct DroppedLabels {
  label : Array[LabelEntry]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LabelEntry
pub(all) struct LabelEntry {
  key : String?
  value : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Group
pub(all) struct Group {
  name : String?
  display_name : String?
  parent_name : String?
  filter : String?
  is_cluster : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListGroupsRequest
pub(all) struct ListGroupsRequest {
  name : String?
  children_of_group : String?
  ancestors_of_group : String?
  descendants_of_group : String?
  page_size : Int?
  page_token : String?
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
/// Schema GetGroupRequest
pub(all) struct GetGroupRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateGroupRequest
pub(all) struct CreateGroupRequest {
  name : String?
  group : Group?
  validate_only : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UpdateGroupRequest
pub(all) struct UpdateGroupRequest {
  group : Group?
  validate_only : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteGroupRequest
pub(all) struct DeleteGroupRequest {
  name : String?
  recursive : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListGroupMembersRequest
pub(all) struct ListGroupMembersRequest {
  name : String?
  page_size : Int?
  page_token : String?
  filter : String?
  interval : TimeInterval?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListGroupMembersResponse
pub(all) struct ListGroupMembersResponse {
  members : Array[Json]?
  next_page_token : String?
  total_size : Int?
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
/// Schema TimeSeries
pub(all) struct TimeSeries {
  metric : Json?
  resource : Json?
  metadata : Json?
  metric_kind : String?
  value_type : String?
  points : Array[Point]?
  unit : String?
  description : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TimeSeriesDescriptor
pub(all) struct TimeSeriesDescriptor {
  label_descriptors : Array[Json]?
  point_descriptors : Array[ValueDescriptor]?
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
  metric_kind : String?
  unit : String?
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
/// Schema QueryError
pub(all) struct QueryError {
  locator : TextLocator?
  message : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TextLocator
pub(all) struct TextLocator {
  source : String?
  start_position : Position?
  end_position : Position?
  nested_locator : TextLocator?
  nesting_reason : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Position
pub(all) struct Position {
  line : Int?
  column : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListMonitoredResourceDescriptorsRequest
pub(all) struct ListMonitoredResourceDescriptorsRequest {
  name : String?
  filter : String?
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
/// Schema GetMonitoredResourceDescriptorRequest
pub(all) struct GetMonitoredResourceDescriptorRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListMetricDescriptorsRequest
pub(all) struct ListMetricDescriptorsRequest {
  name : String?
  filter : String?
  page_size : Int?
  page_token : String?
  active_only : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListMetricDescriptorsResponse
pub(all) struct ListMetricDescriptorsResponse {
  metric_descriptors : Array[Json]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetMetricDescriptorRequest
pub(all) struct GetMetricDescriptorRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateMetricDescriptorRequest
pub(all) struct CreateMetricDescriptorRequest {
  name : String?
  metric_descriptor : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteMetricDescriptorRequest
pub(all) struct DeleteMetricDescriptorRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListTimeSeriesRequest
pub(all) struct ListTimeSeriesRequest {
  name : String?
  filter : String?
  interval : TimeInterval?
  aggregation : Aggregation?
  secondary_aggregation : Aggregation?
  order_by : String?
  view : String?
  page_size : Int?
  page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListTimeSeriesResponse
pub(all) struct ListTimeSeriesResponse {
  time_series : Array[TimeSeries]?
  next_page_token : String?
  execution_errors : Array[Json]?
  unit : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateTimeSeriesRequest
pub(all) struct CreateTimeSeriesRequest {
  name : String?
  time_series : Array[TimeSeries]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateTimeSeriesError
pub(all) struct CreateTimeSeriesError {
  time_series : TimeSeries?
  status : Json?
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
  success_point_count : Int?
  errors : Array[Error_]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Error
pub(all) struct Error_ {
  status : Json?
  point_count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema QueryTimeSeriesRequest
pub(all) struct QueryTimeSeriesRequest {
  name : String?
  query : String?
  page_size : Int?
  page_token : String?
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
  next_page_token : String?
  partial_errors : Array[Json]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema QueryErrorList
pub(all) struct QueryErrorList {
  errors : Array[QueryError]?
  error_summary : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema NotificationChannelDescriptor
pub(all) struct NotificationChannelDescriptor {
  name : String?
  type_ : String?
  display_name : String?
  description : String?
  labels : Array[Json]?
  supported_tiers : Array[String]?
  launch_stage : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema NotificationChannel
pub(all) struct NotificationChannel {
  type_ : String?
  name : String?
  display_name : String?
  description : String?
  labels : Array[LabelsEntry]?
  user_labels : Array[UserLabelsEntry]?
  verification_status : String?
  enabled : Bool?
  creation_record : MutationRecord?
  mutation_records : Array[MutationRecord]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema ListNotificationChannelDescriptorsRequest
pub(all) struct ListNotificationChannelDescriptorsRequest {
  name : String?
  page_size : Int?
  page_token : String?
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
/// Schema GetNotificationChannelDescriptorRequest
pub(all) struct GetNotificationChannelDescriptorRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateNotificationChannelRequest
pub(all) struct CreateNotificationChannelRequest {
  name : String?
  notification_channel : NotificationChannel?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListNotificationChannelsRequest
pub(all) struct ListNotificationChannelsRequest {
  name : String?
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
/// Schema GetNotificationChannelRequest
pub(all) struct GetNotificationChannelRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UpdateNotificationChannelRequest
pub(all) struct UpdateNotificationChannelRequest {
  update_mask : String?
  notification_channel : NotificationChannel?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteNotificationChannelRequest
pub(all) struct DeleteNotificationChannelRequest {
  name : String?
  force : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema SendNotificationChannelVerificationCodeRequest
pub(all) struct SendNotificationChannelVerificationCodeRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetNotificationChannelVerificationCodeRequest
pub(all) struct GetNotificationChannelVerificationCodeRequest {
  name : String?
  expire_time : String?
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
/// Schema VerifyNotificationChannelRequest
pub(all) struct VerifyNotificationChannelRequest {
  name : String?
  code : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

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
  user_labels : Array[UserLabelsEntry]?
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
/// Schema IstioCanonicalService
pub(all) struct IstioCanonicalService {
  mesh_uid : String?
  canonical_service_namespace : String?
  canonical_service : String?
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
/// Schema BasicService
pub(all) struct BasicService {
  service_type : String?
  service_labels : Array[ServiceLabelsEntry]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ServiceLabelsEntry
pub(all) struct ServiceLabelsEntry {
  key : String?
  value : String?
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
/// Schema ServiceLevelObjective
pub(all) struct ServiceLevelObjective {
  name : String?
  display_name : String?
  service_level_indicator : ServiceLevelIndicator?
  goal : Double?
  rolling_period : String?
  calendar_period : String?
  user_labels : Array[UserLabelsEntry]?
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
  ToJson(rename_fields="camelCase", fields(method_(rename="method"))),
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
/// Schema DistributionCut
pub(all) struct DistributionCut {
  distribution_filter : String?
  range : Range?
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
  good_total_ratio_threshold : PerformanceThreshold?
  metric_mean_in_range : MetricRange?
  metric_sum_in_range : MetricRange?
  window_period : String?
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
  basic_sli_performance : BasicSli?
  threshold : Double?
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
  range : Range?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateServiceRequest
pub(all) struct CreateServiceRequest {
  parent : String?
  service_id : String?
  service : Service?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetServiceRequest
pub(all) struct GetServiceRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListServicesRequest
pub(all) struct ListServicesRequest {
  parent : String?
  filter : String?
  page_size : Int?
  page_token : String?
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
/// Schema UpdateServiceRequest
pub(all) struct UpdateServiceRequest {
  service : Service?
  update_mask : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteServiceRequest
pub(all) struct DeleteServiceRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateServiceLevelObjectiveRequest
pub(all) struct CreateServiceLevelObjectiveRequest {
  parent : String?
  service_level_objective_id : String?
  service_level_objective : ServiceLevelObjective?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetServiceLevelObjectiveRequest
pub(all) struct GetServiceLevelObjectiveRequest {
  name : String?
  view : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListServiceLevelObjectivesRequest
pub(all) struct ListServiceLevelObjectivesRequest {
  parent : String?
  filter : String?
  page_size : Int?
  page_token : String?
  view : String?
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
/// Schema UpdateServiceLevelObjectiveRequest
pub(all) struct UpdateServiceLevelObjectiveRequest {
  service_level_objective : ServiceLevelObjective?
  update_mask : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteServiceLevelObjectiveRequest
pub(all) struct DeleteServiceLevelObjectiveRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Snooze
pub(all) struct Snooze {
  name : String?
  criteria : Criteria?
  interval : TimeInterval?
  display_name : String?
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
/// Schema CreateSnoozeRequest
pub(all) struct CreateSnoozeRequest {
  parent : String?
  snooze : Snooze?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListSnoozesRequest
pub(all) struct ListSnoozesRequest {
  parent : String?
  filter : String?
  page_size : Int?
  page_token : String?
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
/// Schema GetSnoozeRequest
pub(all) struct GetSnoozeRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UpdateSnoozeRequest
pub(all) struct UpdateSnoozeRequest {
  snooze : Snooze?
  update_mask : String?
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
/// Schema InternalChecker
pub(all) struct InternalChecker {
  name : String?
  display_name : String?
  network : String?
  gcp_zone : String?
  peer_project_id : String?
  state : String?
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
/// Schema CloudFunctionV2Target
pub(all) struct CloudFunctionV2Target {
  name : String?
  cloud_run_revision : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UptimeCheckConfig
pub(all) struct UptimeCheckConfig {
  name : String?
  display_name : String?
  monitored_resource : Json?
  resource_group : ResourceGroup?
  synthetic_monitor : SyntheticMonitorTarget?
  http_check : HttpCheck?
  tcp_check : TcpCheck?
  period : String?
  timeout : String?
  content_matchers : Array[ContentMatcher]?
  checker_type : String?
  selected_regions : Array[String]?
  is_internal : Bool?
  internal_checkers : Array[InternalChecker]?
  user_labels : Array[UserLabelsEntry]?
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
/// Schema HttpCheck
pub(all) struct HttpCheck {
  request_method : String?
  use_ssl : Bool?
  path : String?
  port : Int?
  auth_info : BasicAuthentication?
  mask_headers : Bool?
  headers : Array[HeadersEntry]?
  content_type : String?
  custom_content_type : String?
  validate_ssl : Bool?
  body : String?
  accepted_response_status_codes : Array[ResponseStatusCode]?
  ping_config : PingConfig?
  service_agent_authentication : ServiceAgentAuthentication?
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
/// Schema HeadersEntry
pub(all) struct HeadersEntry {
  key : String?
  value : String?
} derive (
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
/// Schema ContentMatcher
pub(all) struct ContentMatcher {
  content : String?
  matcher : String?
  json_path_matcher : JsonPathMatcher?
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
/// Schema UptimeCheckIp
pub(all) struct UptimeCheckIp {
  region : String?
  location : String?
  ip_address : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListUptimeCheckConfigsRequest
pub(all) struct ListUptimeCheckConfigsRequest {
  parent : String?
  filter : String?
  page_size : Int?
  page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListUptimeCheckConfigsResponse
pub(all) struct ListUptimeCheckConfigsResponse {
  uptime_check_configs : Array[UptimeCheckConfig]?
  next_page_token : String?
  total_size : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetUptimeCheckConfigRequest
pub(all) struct GetUptimeCheckConfigRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateUptimeCheckConfigRequest
pub(all) struct CreateUptimeCheckConfigRequest {
  parent : String?
  uptime_check_config : UptimeCheckConfig?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UpdateUptimeCheckConfigRequest
pub(all) struct UpdateUptimeCheckConfigRequest {
  update_mask : String?
  uptime_check_config : UptimeCheckConfig?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteUptimeCheckConfigRequest
pub(all) struct DeleteUptimeCheckConfigRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListUptimeCheckIpsRequest
pub(all) struct ListUptimeCheckIpsRequest {
  page_size : Int?
  page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListUptimeCheckIpsResponse
pub(all) struct ListUptimeCheckIpsResponse {
  uptime_check_ips : Array[UptimeCheckIp]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)
