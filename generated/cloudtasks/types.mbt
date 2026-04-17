///|
/// Schema HttpRequest
pub(all) struct HttpRequest {
  url : String?
  http_method : String?
  headers : Array[HeadersEntry]?
  body : String?
  oauth_token : OAuthToken?
  oidc_token : OidcToken?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
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
/// Schema AppEngineHttpRequest
pub(all) struct AppEngineHttpRequest {
  http_method : String?
  app_engine_routing : AppEngineRouting?
  relative_uri : String?
  headers : Array[HeadersEntry]?
  body : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AppEngineRouting
pub(all) struct AppEngineRouting {
  service : String?
  version : String?
  instance : String?
  host : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema OAuthToken
pub(all) struct OAuthToken {
  service_account_email : String?
  scope : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema OidcToken
pub(all) struct OidcToken {
  service_account_email : String?
  audience : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Queue
pub(all) struct Queue {
  name : String?
  app_engine_routing_override : AppEngineRouting?
  rate_limits : RateLimits?
  retry_config : RetryConfig?
  state : String?
  purge_time : String?
  stackdriver_logging_config : StackdriverLoggingConfig?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RateLimits
pub(all) struct RateLimits {
  max_dispatches_per_second : Double?
  max_burst_size : Int?
  max_concurrent_dispatches : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RetryConfig
pub(all) struct RetryConfig {
  max_attempts : Int?
  max_retry_duration : String?
  min_backoff : String?
  max_backoff : String?
  max_doublings : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema StackdriverLoggingConfig
pub(all) struct StackdriverLoggingConfig {
  sampling_ratio : Double?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Task
pub(all) struct Task {
  name : String?
  app_engine_http_request : AppEngineHttpRequest?
  http_request : HttpRequest?
  schedule_time : String?
  create_time : String?
  dispatch_deadline : String?
  dispatch_count : Int?
  response_count : Int?
  first_attempt : Attempt?
  last_attempt : Attempt?
  view : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Attempt
pub(all) struct Attempt {
  schedule_time : String?
  dispatch_time : String?
  response_time : String?
  response_status : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListQueuesRequest
pub(all) struct ListQueuesRequest {
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
/// Schema ListQueuesResponse
pub(all) struct ListQueuesResponse {
  queues : Array[Queue]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetQueueRequest
pub(all) struct GetQueueRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateQueueRequest
pub(all) struct CreateQueueRequest {
  parent : String?
  queue : Queue?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UpdateQueueRequest
pub(all) struct UpdateQueueRequest {
  queue : Queue?
  update_mask : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteQueueRequest
pub(all) struct DeleteQueueRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PurgeQueueRequest
pub(all) struct PurgeQueueRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PauseQueueRequest
pub(all) struct PauseQueueRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ResumeQueueRequest
pub(all) struct ResumeQueueRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListTasksRequest
pub(all) struct ListTasksRequest {
  parent : String?
  response_view : String?
  page_size : Int?
  page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListTasksResponse
pub(all) struct ListTasksResponse {
  tasks : Array[Task]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetTaskRequest
pub(all) struct GetTaskRequest {
  name : String?
  response_view : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateTaskRequest
pub(all) struct CreateTaskRequest {
  parent : String?
  task : Task?
  response_view : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteTaskRequest
pub(all) struct DeleteTaskRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RunTaskRequest
pub(all) struct RunTaskRequest {
  name : String?
  response_view : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)
