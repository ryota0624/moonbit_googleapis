///|
/// Schema ListLocationsResponse
pub(all) struct ListLocationsResponse {
  locations : Array[Location]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Location
pub(all) struct Location {
  name : String?
  location_id : String?
  display_name : String?
  labels : Json?
  metadata : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

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
)

///|
/// Schema Operation
pub(all) struct Operation {
  name : String?
  metadata : Json?
  done : Bool?
  error : Status?
  response : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Status
pub(all) struct Status {
  code : Int?
  message : String?
  details : Array[Json]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Empty
pub(all) struct Empty {} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CancelOperationRequest
pub(all) struct CancelOperationRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema ListJobsResponse
pub(all) struct ListJobsResponse {
  jobs : Array[Job]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

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
  status : Status?
  schedule_time : String?
  last_attempt_time : String?
  retry_config : RetryConfig?
  attempt_deadline : String?
  satisfies_pzs : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PubsubTarget
pub(all) struct PubsubTarget {
  topic_name : String?
  data : String?
  attributes : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AppEngineHttpTarget
pub(all) struct AppEngineHttpTarget {
  http_method : String?
  app_engine_routing : AppEngineRouting?
  relative_uri : String?
  headers : Json?
  body : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AppEngineRouting
pub(all) struct AppEngineRouting {
  service : String?
  version : String?
  instance : String?
  host : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema HttpTarget
pub(all) struct HttpTarget {
  uri : String?
  http_method : String?
  headers : Json?
  body : String?
  oauth_token : OAuthToken?
  oidc_token : OidcToken?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema OAuthToken
pub(all) struct OAuthToken {
  service_account_email : String?
  scope : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema OidcToken
pub(all) struct OidcToken {
  service_account_email : String?
  audience : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema RetryConfig
pub(all) struct RetryConfig {
  retry_count : Int?
  max_retry_duration : String?
  min_backoff_duration : String?
  max_backoff_duration : String?
  max_doublings : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PauseJobRequest
pub(all) struct PauseJobRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema ResumeJobRequest
pub(all) struct ResumeJobRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema RunJobRequest
pub(all) struct RunJobRequest {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema CmekConfig
pub(all) struct CmekConfig {
  name : String?
  kms_key_name : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PubsubMessage
pub(all) struct PubsubMessage {
  data : String?
  attributes : Json?
  message_id : String?
  publish_time : String?
  ordering_key : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema OperationMetadata
pub(all) struct OperationMetadata {
  create_time : String?
  end_time : String?
  target : String?
  verb : String?
  status_detail : String?
  cancel_requested : Bool?
  api_version : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))
