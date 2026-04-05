///|
/// Schema SetIamPolicyRequest
pub(all) struct SetIamPolicyRequest {
  policy : Policy?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Policy
pub(all) struct Policy {
  version : Int?
  bindings : Array[Binding]?
  etag : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Binding
pub(all) struct Binding {
  role : String?
  members : Array[String]?
  condition : Expr?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Expr
pub(all) struct Expr {
  expression : String?
  title : String?
  description : String?
  location : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TestIamPermissionsRequest
pub(all) struct TestIamPermissionsRequest {
  permissions : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TestIamPermissionsResponse
pub(all) struct TestIamPermissionsResponse {
  permissions : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Schema
pub(all) struct Schema {
  name : String?
  type_ : String?
  definition : String?
  revision_id : String?
  revision_create_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema ListSchemasResponse
pub(all) struct ListSchemasResponse {
  schemas : Array[Schema]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListSchemaRevisionsResponse
pub(all) struct ListSchemaRevisionsResponse {
  schemas : Array[Schema]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CommitSchemaRequest
pub(all) struct CommitSchemaRequest {
  schema : Schema?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema RollbackSchemaRequest
pub(all) struct RollbackSchemaRequest {
  revision_id : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Empty
pub(all) struct Empty {} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ValidateSchemaRequest
pub(all) struct ValidateSchemaRequest {
  schema : Schema?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ValidateSchemaResponse
pub(all) struct ValidateSchemaResponse {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema ValidateMessageRequest
pub(all) struct ValidateMessageRequest {
  name : String?
  schema : Schema?
  message : String?
  encoding : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ValidateMessageResponse
pub(all) struct ValidateMessageResponse {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema Topic
pub(all) struct Topic {
  name : String?
  labels : Json?
  message_storage_policy : MessageStoragePolicy?
  kms_key_name : String?
  schema_settings : SchemaSettings?
  satisfies_pzs : Bool?
  message_retention_duration : String?
  state : String?
  ingestion_data_source_settings : IngestionDataSourceSettings?
  message_transforms : Array[MessageTransform]?
  tags : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema MessageStoragePolicy
pub(all) struct MessageStoragePolicy {
  allowed_persistence_regions : Array[String]?
  enforce_in_transit : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema SchemaSettings
pub(all) struct SchemaSettings {
  schema : String?
  encoding : String?
  first_revision_id : String?
  last_revision_id : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema IngestionDataSourceSettings
pub(all) struct IngestionDataSourceSettings {
  aws_kinesis : AwsKinesis?
  cloud_storage : CloudStorage?
  azure_event_hubs : AzureEventHubs?
  aws_msk : AwsMsk?
  confluent_cloud : ConfluentCloud?
  platform_logs_settings : PlatformLogsSettings?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AwsKinesis
pub(all) struct AwsKinesis {
  state : String?
  stream_arn : String?
  consumer_arn : String?
  aws_role_arn : String?
  gcp_service_account : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CloudStorage
pub(all) struct CloudStorage {
  state : String?
  bucket : String?
  text_format : TextFormat?
  avro_format : AvroFormat?
  pubsub_avro_format : PubSubAvroFormat?
  minimum_object_create_time : String?
  match_glob : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TextFormat
pub(all) struct TextFormat {
  delimiter : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AvroFormat
pub(all) struct AvroFormat {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema PubSubAvroFormat
pub(all) struct PubSubAvroFormat {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema AzureEventHubs
pub(all) struct AzureEventHubs {
  state : String?
  resource_group : String?
  namespace_ : String?
  event_hub : String?
  client_id : String?
  tenant_id : String?
  subscription_id : String?
  gcp_service_account : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(namespace_(rename="namespace"))),
)

///|
/// Schema AwsMsk
pub(all) struct AwsMsk {
  state : String?
  cluster_arn : String?
  topic : String?
  aws_role_arn : String?
  gcp_service_account : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ConfluentCloud
pub(all) struct ConfluentCloud {
  state : String?
  bootstrap_server : String?
  cluster_id : String?
  topic : String?
  identity_pool_id : String?
  gcp_service_account : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PlatformLogsSettings
pub(all) struct PlatformLogsSettings {
  severity : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema MessageTransform
pub(all) struct MessageTransform {
  javascript_udf : JavaScriptUDF?
  ai_inference : AIInference?
  enabled : Bool?
  disabled : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema JavaScriptUDF
pub(all) struct JavaScriptUDF {
  function_name : String?
  code : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AIInference
pub(all) struct AIInference {
  endpoint : String?
  unstructured_inference : UnstructuredInference?
  service_account_email : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema UnstructuredInference
pub(all) struct UnstructuredInference {
  parameters : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema UpdateTopicRequest
pub(all) struct UpdateTopicRequest {
  topic : Topic?
  update_mask : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PublishRequest
pub(all) struct PublishRequest {
  messages : Array[PubsubMessage]?
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
/// Schema PublishResponse
pub(all) struct PublishResponse {
  message_ids : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListTopicsResponse
pub(all) struct ListTopicsResponse {
  topics : Array[Topic]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListTopicSubscriptionsResponse
pub(all) struct ListTopicSubscriptionsResponse {
  subscriptions : Array[String]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListTopicSnapshotsResponse
pub(all) struct ListTopicSnapshotsResponse {
  snapshots : Array[String]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema DetachSubscriptionResponse
pub(all) struct DetachSubscriptionResponse {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema Subscription
pub(all) struct Subscription {
  name : String?
  topic : String?
  push_config : PushConfig?
  bigquery_config : BigQueryConfig?
  cloud_storage_config : CloudStorageConfig?
  bigtable_config : BigtableConfig?
  ack_deadline_seconds : Int?
  retain_acked_messages : Bool?
  message_retention_duration : String?
  labels : Json?
  enable_message_ordering : Bool?
  expiration_policy : ExpirationPolicy?
  filter : String?
  dead_letter_policy : DeadLetterPolicy?
  retry_policy : RetryPolicy?
  detached : Bool?
  enable_exactly_once_delivery : Bool?
  topic_message_retention_duration : String?
  state : String?
  analytics_hub_subscription_info : AnalyticsHubSubscriptionInfo?
  message_transforms : Array[MessageTransform]?
  tags : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PushConfig
pub(all) struct PushConfig {
  push_endpoint : String?
  attributes : Json?
  oidc_token : OidcToken?
  pubsub_wrapper : PubsubWrapper?
  no_wrapper : NoWrapper?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema OidcToken
pub(all) struct OidcToken {
  service_account_email : String?
  audience : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PubsubWrapper
pub(all) struct PubsubWrapper {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema NoWrapper
pub(all) struct NoWrapper {
  write_metadata : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BigQueryConfig
pub(all) struct BigQueryConfig {
  table : String?
  use_topic_schema : Bool?
  write_metadata : Bool?
  drop_unknown_fields : Bool?
  state : String?
  use_table_schema : Bool?
  service_account_email : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CloudStorageConfig
pub(all) struct CloudStorageConfig {
  bucket : String?
  filename_prefix : String?
  filename_suffix : String?
  filename_datetime_format : String?
  text_config : TextConfig?
  avro_config : AvroConfig?
  max_duration : String?
  max_bytes : String?
  max_messages : String?
  state : String?
  service_account_email : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TextConfig
pub(all) struct TextConfig {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)

///|
/// Schema AvroConfig
pub(all) struct AvroConfig {
  write_metadata : Bool?
  use_topic_schema : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema BigtableConfig
pub(all) struct BigtableConfig {
  table : String?
  app_profile_id : String?
  service_account_email : String?
  write_metadata : Bool?
  state : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ExpirationPolicy
pub(all) struct ExpirationPolicy {
  ttl : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema DeadLetterPolicy
pub(all) struct DeadLetterPolicy {
  dead_letter_topic : String?
  max_delivery_attempts : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema RetryPolicy
pub(all) struct RetryPolicy {
  minimum_backoff : String?
  maximum_backoff : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AnalyticsHubSubscriptionInfo
pub(all) struct AnalyticsHubSubscriptionInfo {
  listing : String?
  subscription : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema UpdateSubscriptionRequest
pub(all) struct UpdateSubscriptionRequest {
  subscription : Subscription?
  update_mask : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListSubscriptionsResponse
pub(all) struct ListSubscriptionsResponse {
  subscriptions : Array[Subscription]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ModifyAckDeadlineRequest
pub(all) struct ModifyAckDeadlineRequest {
  ack_ids : Array[String]?
  ack_deadline_seconds : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AcknowledgeRequest
pub(all) struct AcknowledgeRequest {
  ack_ids : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PullRequest
pub(all) struct PullRequest {
  return_immediately : Bool?
  max_messages : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PullResponse
pub(all) struct PullResponse {
  received_messages : Array[ReceivedMessage]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ReceivedMessage
pub(all) struct ReceivedMessage {
  ack_id : String?
  message : PubsubMessage?
  delivery_attempt : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ModifyPushConfigRequest
pub(all) struct ModifyPushConfigRequest {
  push_config : PushConfig?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Snapshot
pub(all) struct Snapshot {
  name : String?
  topic : String?
  expire_time : String?
  labels : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListSnapshotsResponse
pub(all) struct ListSnapshotsResponse {
  snapshots : Array[Snapshot]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CreateSnapshotRequest
pub(all) struct CreateSnapshotRequest {
  subscription : String?
  labels : Json?
  tags : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema UpdateSnapshotRequest
pub(all) struct UpdateSnapshotRequest {
  snapshot : Snapshot?
  update_mask : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema SeekRequest
pub(all) struct SeekRequest {
  time : String?
  snapshot : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema SeekResponse
pub(all) struct SeekResponse {} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
)
