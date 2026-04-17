///|
/// Schema HttpTarget
pub(all) struct HttpTarget {
  uri : String?
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
/// Schema AppEngineHttpTarget
pub(all) struct AppEngineHttpTarget {
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
/// Schema PubsubTarget
pub(all) struct PubsubTarget {
  topic_name : String?
  data : String?
  attributes : Array[AttributesEntry]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AttributesEntry
pub(all) struct AttributesEntry {
  key : String?
  value : String?
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
/// Schema Job
pub(all) struct Job {
  name : String?
  description : String?
  pubsub_target : PubsubTarget?
  app_engine_http_target : AppEngineHttpTarget?
  http_target : HttpTarget?
  schedule : String?
  time_zone : String?
  user_update_time : String?
  state : String?
  status : Json?
  schedule_time : String?
  last_attempt_time : String?
  retry_config : RetryConfig?
  attempt_deadline : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RetryConfig
pub(all) struct RetryConfig {
  retry_count : Int?
  max_retry_duration : String?
  min_backoff_duration : String?
  max_backoff_duration : String?
  max_doublings : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListJobsRequest
pub(all) struct ListJobsRequest {
  parent : String?
  page_size : Int?
  page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListJobsResponse
pub(all) struct ListJobsResponse {
  jobs : Array[Job]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetJobRequest
pub(all) struct GetJobRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateJobRequest
pub(all) struct CreateJobRequest {
  parent : String?
  job : Job?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UpdateJobRequest
pub(all) struct UpdateJobRequest {
  job : Job?
  update_mask : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteJobRequest
pub(all) struct DeleteJobRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PauseJobRequest
pub(all) struct PauseJobRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ResumeJobRequest
pub(all) struct ResumeJobRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RunJobRequest
pub(all) struct RunJobRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)
