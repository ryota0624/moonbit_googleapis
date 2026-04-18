///|
/// Schema Document
pub(all) struct Document {
  name : String?
  fields : Map[String, Value]?
  create_time : String?
  update_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Value
pub(all) struct Value {
  null_value : Json?
  boolean_value : Bool?
  integer_value : String?
  double_value : Double?
  timestamp_value : String?
  string_value : String?
  bytes_value : String?
  reference_value : String?
  geo_point_value : Json?
  array_value : ArrayValue?
  map_value : MapValue?
  field_reference_value : String?
  variable_reference_value : String?
  function_value : Function?
  pipeline_value : Pipeline?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ArrayValue
pub(all) struct ArrayValue {
  values : Array[Value]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MapValue
pub(all) struct MapValue {
  fields : Map[String, Value]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Function
pub(all) struct Function {
  name : String?
  args : Array[Value]?
  options : Map[String, Value]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Pipeline
pub(all) struct Pipeline {
  stages : Array[Stage]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Stage
pub(all) struct Stage {
  name : String?
  args : Array[Value]?
  options : Map[String, Value]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AggregationResult
pub(all) struct AggregationResult {
  aggregate_fields : Map[String, Value]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BitSequence
pub(all) struct BitSequence {
  bitmap : String?
  padding : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BloomFilter
pub(all) struct BloomFilter {
  bits : BitSequence?
  hash_count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DocumentMask
pub(all) struct DocumentMask {
  field_paths : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Precondition
pub(all) struct Precondition {
  exists : Bool?
  update_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TransactionOptions
pub(all) struct TransactionOptions {
  read_only : ReadOnly?
  read_write : ReadWrite?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ReadWrite
pub(all) struct ReadWrite {
  retry_transaction : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ReadOnly
pub(all) struct ReadOnly {
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ExplainStats
pub(all) struct ExplainStats {
  data : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema StructuredPipeline
pub(all) struct StructuredPipeline {
  pipeline : Pipeline?
  options : Map[String, Value]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema StructuredQuery
pub(all) struct StructuredQuery {
  select : Projection?
  from : Array[CollectionSelector]?
  where_ : Filter?
  order_by : Array[Order]?
  start_at : Cursor?
  end_at : Cursor?
  offset : Int?
  limit : Int?
  find_nearest : FindNearest?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(where_(rename="where"))),
  ToJson(rename_fields="camelCase", fields(where_(rename="where"))),
)

///|
/// Schema CollectionSelector
pub(all) struct CollectionSelector {
  collection_id : String?
  all_descendants : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Filter
pub(all) struct Filter {
  composite_filter : CompositeFilter?
  field_filter : FieldFilter?
  unary_filter : UnaryFilter?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CompositeFilter
pub(all) struct CompositeFilter {
  op : String?
  filters : Array[Filter]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FieldFilter
pub(all) struct FieldFilter {
  field : FieldReference?
  op : String?
  value : Value?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UnaryFilter
pub(all) struct UnaryFilter {
  op : String?
  field : FieldReference?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Order
pub(all) struct Order {
  field : FieldReference?
  direction : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FieldReference
pub(all) struct FieldReference {
  field_path : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Projection
pub(all) struct Projection {
  fields : Array[FieldReference]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FindNearest
pub(all) struct FindNearest {
  vector_field : FieldReference?
  query_vector : Value?
  distance_measure : String?
  limit : Int?
  distance_result_field : String?
  distance_threshold : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema StructuredAggregationQuery
pub(all) struct StructuredAggregationQuery {
  structured_query : StructuredQuery?
  aggregations : Array[Aggregation]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Aggregation
pub(all) struct Aggregation {
  count : Count?
  sum : Sum?
  avg : Avg?
  alias_ : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(alias_(rename="alias"))),
  ToJson(rename_fields="camelCase", fields(alias_(rename="alias"))),
)

///|
/// Schema Count
pub(all) struct Count {
  up_to : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Sum
pub(all) struct Sum {
  field : FieldReference?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Avg
pub(all) struct Avg {
  field : FieldReference?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Cursor
pub(all) struct Cursor {
  values : Array[Value]?
  before : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ExplainOptions
pub(all) struct ExplainOptions {
  analyze : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ExplainMetrics
pub(all) struct ExplainMetrics {
  plan_summary : PlanSummary?
  execution_stats : ExecutionStats?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PlanSummary
pub(all) struct PlanSummary {
  indexes_used : Array[Json]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ExecutionStats
pub(all) struct ExecutionStats {
  results_returned : String?
  execution_duration : String?
  read_operations : String?
  debug_stats : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Write
pub(all) struct Write {
  update : Document?
  delete : String?
  transform : DocumentTransform?
  update_mask : DocumentMask?
  update_transforms : Array[FieldTransform]?
  current_document : Precondition?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DocumentTransform
pub(all) struct DocumentTransform {
  document : String?
  field_transforms : Array[FieldTransform]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FieldTransform
pub(all) struct FieldTransform {
  field_path : String?
  set_to_server_value : String?
  increment : Value?
  maximum : Value?
  minimum : Value?
  append_missing_elements : ArrayValue?
  remove_all_from_array : ArrayValue?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema WriteResult
pub(all) struct WriteResult {
  update_time : String?
  transform_results : Array[Value]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DocumentChange
pub(all) struct DocumentChange {
  document : Document?
  target_ids : Array[Int]?
  removed_target_ids : Array[Int]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DocumentDelete
pub(all) struct DocumentDelete {
  document : String?
  removed_target_ids : Array[Int]?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DocumentRemove
pub(all) struct DocumentRemove {
  document : String?
  removed_target_ids : Array[Int]?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ExistenceFilter
pub(all) struct ExistenceFilter {
  target_id : Int?
  count : Int?
  unchanged_names : BloomFilter?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetDocumentRequest
pub(all) struct GetDocumentRequest {
  name : String?
  mask : DocumentMask?
  transaction : String?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListDocumentsRequest
pub(all) struct ListDocumentsRequest {
  parent : String?
  collection_id : String?
  page_size : Int?
  page_token : String?
  order_by : String?
  mask : DocumentMask?
  transaction : String?
  read_time : String?
  show_missing : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListDocumentsResponse
pub(all) struct ListDocumentsResponse {
  documents : Array[Document]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateDocumentRequest
pub(all) struct CreateDocumentRequest {
  parent : String?
  collection_id : String?
  document_id : String?
  document : Document?
  mask : DocumentMask?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema UpdateDocumentRequest
pub(all) struct UpdateDocumentRequest {
  document : Document?
  update_mask : DocumentMask?
  mask : DocumentMask?
  current_document : Precondition?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DeleteDocumentRequest
pub(all) struct DeleteDocumentRequest {
  name : String?
  current_document : Precondition?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BatchGetDocumentsRequest
pub(all) struct BatchGetDocumentsRequest {
  database : String?
  documents : Array[String]?
  mask : DocumentMask?
  transaction : String?
  new_transaction : TransactionOptions?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BatchGetDocumentsResponse
pub(all) struct BatchGetDocumentsResponse {
  found : Document?
  missing : String?
  transaction : String?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BeginTransactionRequest
pub(all) struct BeginTransactionRequest {
  database : String?
  options : TransactionOptions?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BeginTransactionResponse
pub(all) struct BeginTransactionResponse {
  transaction : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CommitRequest
pub(all) struct CommitRequest {
  database : String?
  writes : Array[Write]?
  transaction : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CommitResponse
pub(all) struct CommitResponse {
  write_results : Array[WriteResult]?
  commit_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RollbackRequest
pub(all) struct RollbackRequest {
  database : String?
  transaction : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RunQueryRequest
pub(all) struct RunQueryRequest {
  parent : String?
  structured_query : StructuredQuery?
  transaction : String?
  new_transaction : TransactionOptions?
  read_time : String?
  explain_options : ExplainOptions?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RunQueryResponse
pub(all) struct RunQueryResponse {
  transaction : String?
  document : Document?
  read_time : String?
  skipped_results : Int?
  done : Bool?
  explain_metrics : ExplainMetrics?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ExecutePipelineRequest
pub(all) struct ExecutePipelineRequest {
  database : String?
  structured_pipeline : StructuredPipeline?
  transaction : String?
  new_transaction : TransactionOptions?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ExecutePipelineResponse
pub(all) struct ExecutePipelineResponse {
  transaction : String?
  results : Array[Document]?
  execution_time : String?
  explain_stats : ExplainStats?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RunAggregationQueryRequest
pub(all) struct RunAggregationQueryRequest {
  parent : String?
  structured_aggregation_query : StructuredAggregationQuery?
  transaction : String?
  new_transaction : TransactionOptions?
  read_time : String?
  explain_options : ExplainOptions?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RunAggregationQueryResponse
pub(all) struct RunAggregationQueryResponse {
  result : AggregationResult?
  transaction : String?
  read_time : String?
  explain_metrics : ExplainMetrics?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PartitionQueryRequest
pub(all) struct PartitionQueryRequest {
  parent : String?
  structured_query : StructuredQuery?
  partition_count : String?
  page_token : String?
  page_size : Int?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PartitionQueryResponse
pub(all) struct PartitionQueryResponse {
  partitions : Array[Cursor]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema WriteRequest
pub(all) struct WriteRequest {
  database : String?
  stream_id : String?
  writes : Array[Write]?
  stream_token : String?
  labels : Map[String, String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema WriteResponse
pub(all) struct WriteResponse {
  stream_id : String?
  stream_token : String?
  write_results : Array[WriteResult]?
  commit_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListenRequest
pub(all) struct ListenRequest {
  database : String?
  add_target : Target?
  remove_target : Int?
  labels : Map[String, String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListenResponse
pub(all) struct ListenResponse {
  target_change : TargetChange?
  document_change : DocumentChange?
  document_delete : DocumentDelete?
  document_remove : DocumentRemove?
  filter : ExistenceFilter?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Target
pub(all) struct Target {
  query : QueryTarget?
  documents : DocumentsTarget?
  resume_token : String?
  read_time : String?
  target_id : Int?
  once : Bool?
  expected_count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DocumentsTarget
pub(all) struct DocumentsTarget {
  documents : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema QueryTarget
pub(all) struct QueryTarget {
  parent : String?
  structured_query : StructuredQuery?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TargetChange
pub(all) struct TargetChange {
  target_change_type : String?
  target_ids : Array[Int]?
  cause : Json?
  resume_token : String?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListCollectionIdsRequest
pub(all) struct ListCollectionIdsRequest {
  parent : String?
  page_size : Int?
  page_token : String?
  read_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListCollectionIdsResponse
pub(all) struct ListCollectionIdsResponse {
  collection_ids : Array[String]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BatchWriteRequest
pub(all) struct BatchWriteRequest {
  database : String?
  writes : Array[Write]?
  labels : Map[String, String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BatchWriteResponse
pub(all) struct BatchWriteResponse {
  write_results : Array[WriteResult]?
  status : Array[Json]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)
