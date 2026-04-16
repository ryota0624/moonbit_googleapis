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
/// Schema Location
pub(all) struct Location {
  name : String?
  location_id : String?
  display_name : String?
  labels : Json?
  metadata : Json?
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
/// Schema Queue
pub(all) struct Queue {
  name : String?
  app_engine_routing_override : AppEngineRouting?
  http_target : HttpTarget?
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
/// Schema HttpTarget
pub(all) struct HttpTarget {
  uri_override : UriOverride?
  http_method : String?
  header_overrides : Array[HeaderOverride]?
  oauth_token : OAuthToken?
  oidc_token : OidcToken?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UriOverride
pub(all) struct UriOverride {
  scheme : String?
  host : String?
  port : String?
  path_override : PathOverride?
  query_override : QueryOverride?
  uri_override_enforce_mode : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PathOverride
pub(all) struct PathOverride {
  path : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema QueryOverride
pub(all) struct QueryOverride {
  query_params : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema HeaderOverride
pub(all) struct HeaderOverride {
  header : Header?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Header
pub(all) struct Header {
  key : String?
  value : String?
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
/// Schema Empty
pub(all) struct Empty {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PurgeQueueRequest
pub(all) struct PurgeQueueRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PauseQueueRequest
pub(all) struct PauseQueueRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ResumeQueueRequest
pub(all) struct ResumeQueueRequest {} derive (
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
/// Schema Policy
pub(all) struct Policy {
  version : Int?
  bindings : Array[Binding]?
  etag : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Binding
pub(all) struct Binding {
  role : String?
  members : Array[String]?
  condition : Expr?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Expr
pub(all) struct Expr {
  expression : String?
  title : String?
  description : String?
  location : String?
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
/// Schema AppEngineHttpRequest
pub(all) struct AppEngineHttpRequest {
  http_method : String?
  app_engine_routing : AppEngineRouting?
  relative_uri : String?
  headers : Json?
  body : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema HttpRequest
pub(all) struct HttpRequest {
  url : String?
  http_method : String?
  headers : Json?
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
/// Schema Attempt
pub(all) struct Attempt {
  schedule_time : String?
  dispatch_time : String?
  response_time : String?
  response_status : Status?
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
/// Schema CreateTaskRequest
pub(all) struct CreateTaskRequest {
  task : Task?
  response_view : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RunTaskRequest
pub(all) struct RunTaskRequest {
  response_view : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CmekConfig
pub(all) struct CmekConfig {
  name : String?
  kms_key : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BufferTaskRequest
pub(all) struct BufferTaskRequest {
  body : HttpBody?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema HttpBody
pub(all) struct HttpBody {
  content_type : String?
  data : String?
  extensions : Array[Json]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BufferTaskResponse
pub(all) struct BufferTaskResponse {
  task : Task?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)
