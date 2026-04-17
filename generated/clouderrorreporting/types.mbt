///|
/// Schema ErrorGroup
pub(all) struct ErrorGroup {
  name : String?
  group_id : String?
  tracking_issues : Array[TrackingIssue]?
  resolution_status : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TrackingIssue
pub(all) struct TrackingIssue {
  url : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ErrorEvent
pub(all) struct ErrorEvent {
  event_time : String?
  service_context : ServiceContext?
  message : String?
  context : ErrorContext?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ServiceContext
pub(all) struct ServiceContext {
  service : String?
  version : String?
  resource_type : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ErrorContext
pub(all) struct ErrorContext {
  http_request : HttpRequestContext?
  user : String?
  report_location : SourceLocation?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema HttpRequestContext
pub(all) struct HttpRequestContext {
  method_ : String?
  url : String?
  user_agent : String?
  referrer : String?
  response_status_code : Int?
  remote_ip : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(method_(rename="method"))),
  ToJson(rename_fields="camelCase", fields(method_(rename="method"))),
)

///|
/// Schema SourceLocation
pub(all) struct SourceLocation {
  file_path : String?
  line_number : Int?
  function_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetGroupRequest
pub(all) struct GetGroupRequest {
  group_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UpdateGroupRequest
pub(all) struct UpdateGroupRequest {
  group : ErrorGroup?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListGroupStatsRequest
pub(all) struct ListGroupStatsRequest {
  project_name : String?
  group_id : Array[String]?
  service_filter : ServiceContextFilter?
  time_range : QueryTimeRange?
  timed_count_duration : String?
  alignment : String?
  alignment_time : String?
  order : String?
  page_size : Int?
  page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListGroupStatsResponse
pub(all) struct ListGroupStatsResponse {
  error_group_stats : Array[ErrorGroupStats]?
  next_page_token : String?
  time_range_begin : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ErrorGroupStats
pub(all) struct ErrorGroupStats {
  group : ErrorGroup?
  count : String?
  affected_users_count : String?
  timed_counts : Array[TimedCount]?
  first_seen_time : String?
  last_seen_time : String?
  affected_services : Array[ServiceContext]?
  num_affected_services : Int?
  representative : ErrorEvent?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TimedCount
pub(all) struct TimedCount {
  count : String?
  start_time : String?
  end_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListEventsRequest
pub(all) struct ListEventsRequest {
  project_name : String?
  group_id : String?
  service_filter : ServiceContextFilter?
  time_range : QueryTimeRange?
  page_size : Int?
  page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListEventsResponse
pub(all) struct ListEventsResponse {
  error_events : Array[ErrorEvent]?
  next_page_token : String?
  time_range_begin : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema QueryTimeRange
pub(all) struct QueryTimeRange {
  period : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ServiceContextFilter
pub(all) struct ServiceContextFilter {
  service : String?
  version : String?
  resource_type : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteEventsRequest
pub(all) struct DeleteEventsRequest {
  project_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteEventsResponse
pub(all) struct DeleteEventsResponse {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ReportErrorEventRequest
pub(all) struct ReportErrorEventRequest {
  project_name : String?
  event : ReportedErrorEvent?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ReportErrorEventResponse
pub(all) struct ReportErrorEventResponse {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ReportedErrorEvent
pub(all) struct ReportedErrorEvent {
  event_time : String?
  service_context : ServiceContext?
  message : String?
  context : ErrorContext?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)
