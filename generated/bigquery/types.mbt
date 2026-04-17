///|
/// Schema ArrowSchema
pub(all) struct ArrowSchema {
  serialized_schema : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ArrowRecordBatch
pub(all) struct ArrowRecordBatch {
  serialized_record_batch : String?
  row_count : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ArrowSerializationOptions
pub(all) struct ArrowSerializationOptions {
  buffer_compression : String?
  picos_timestamp_precision : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AvroSchema
pub(all) struct AvroSchema {
  schema : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AvroRows
pub(all) struct AvroRows {
  serialized_binary_rows : String?
  row_count : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AvroSerializationOptions
pub(all) struct AvroSerializationOptions {
  enable_display_name_attribute : Bool?
  picos_timestamp_precision : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ProtoSchema
pub(all) struct ProtoSchema {
  proto_descriptor : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ProtoRows
pub(all) struct ProtoRows {
  serialized_rows : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TableSchema
pub(all) struct TableSchema {
  fields : Array[TableFieldSchema]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TableFieldSchema
pub(all) struct TableFieldSchema {
  name : String?
  type_ : String?
  mode : String?
  fields : Array[TableFieldSchema]?
  description : String?
  max_length : String?
  precision : String?
  scale : String?
  default_value_expression : String?
  timestamp_precision : Json?
  range_element_type : FieldElementType?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema FieldElementType
pub(all) struct FieldElementType {
  type_ : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema ReadSession
pub(all) struct ReadSession {
  name : String?
  expire_time : String?
  data_format : String?
  avro_schema : AvroSchema?
  arrow_schema : ArrowSchema?
  table : String?
  table_modifiers : TableModifiers?
  read_options : TableReadOptions?
  streams : Array[ReadStream]?
  estimated_total_bytes_scanned : String?
  estimated_total_physical_file_size : String?
  estimated_row_count : String?
  trace_id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TableModifiers
pub(all) struct TableModifiers {
  snapshot_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TableReadOptions
pub(all) struct TableReadOptions {
  selected_fields : Array[String]?
  row_restriction : String?
  arrow_serialization_options : ArrowSerializationOptions?
  avro_serialization_options : AvroSerializationOptions?
  sample_percentage : Double?
  response_compression_codec : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ReadStream
pub(all) struct ReadStream {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema WriteStream
pub(all) struct WriteStream {
  name : String?
  type_ : String?
  create_time : String?
  commit_time : String?
  table_schema : TableSchema?
  write_mode : String?
  location : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema CreateReadSessionRequest
pub(all) struct CreateReadSessionRequest {
  parent : String?
  read_session : ReadSession?
  max_stream_count : Int?
  preferred_min_stream_count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ReadRowsRequest
pub(all) struct ReadRowsRequest {
  read_stream : String?
  offset : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ThrottleState
pub(all) struct ThrottleState {
  throttle_percent : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema StreamStats
pub(all) struct StreamStats {
  progress : Progress?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Progress
pub(all) struct Progress {
  at_response_start : Double?
  at_response_end : Double?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ReadRowsResponse
pub(all) struct ReadRowsResponse {
  avro_rows : AvroRows?
  arrow_record_batch : ArrowRecordBatch?
  row_count : String?
  stats : StreamStats?
  throttle_state : ThrottleState?
  avro_schema : AvroSchema?
  arrow_schema : ArrowSchema?
  uncompressed_byte_size : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema SplitReadStreamRequest
pub(all) struct SplitReadStreamRequest {
  name : String?
  fraction : Double?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema SplitReadStreamResponse
pub(all) struct SplitReadStreamResponse {
  primary_stream : ReadStream?
  remainder_stream : ReadStream?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CreateWriteStreamRequest
pub(all) struct CreateWriteStreamRequest {
  parent : String?
  write_stream : WriteStream?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AppendRowsRequest
pub(all) struct AppendRowsRequest {
  write_stream : String?
  offset : Json?
  proto_rows : ProtoData?
  arrow_rows : ArrowData?
  trace_id : String?
  missing_value_interpretations : Array[MissingValueInterpretationsEntry]?
  default_missing_value_interpretation : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ArrowData
pub(all) struct ArrowData {
  writer_schema : ArrowSchema?
  rows : ArrowRecordBatch?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ProtoData
pub(all) struct ProtoData {
  writer_schema : ProtoSchema?
  rows : ProtoRows?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MissingValueInterpretationsEntry
pub(all) struct MissingValueInterpretationsEntry {
  key : String?
  value : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AppendRowsResponse
pub(all) struct AppendRowsResponse {
  append_result : AppendResult?
  error : Json?
  updated_schema : TableSchema?
  row_errors : Array[RowError]?
  write_stream : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AppendResult
pub(all) struct AppendResult {
  offset : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GetWriteStreamRequest
pub(all) struct GetWriteStreamRequest {
  name : String?
  view : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BatchCommitWriteStreamsRequest
pub(all) struct BatchCommitWriteStreamsRequest {
  parent : String?
  write_streams : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BatchCommitWriteStreamsResponse
pub(all) struct BatchCommitWriteStreamsResponse {
  commit_time : String?
  stream_errors : Array[StorageError]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FinalizeWriteStreamRequest
pub(all) struct FinalizeWriteStreamRequest {
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FinalizeWriteStreamResponse
pub(all) struct FinalizeWriteStreamResponse {
  row_count : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FlushRowsRequest
pub(all) struct FlushRowsRequest {
  write_stream : String?
  offset : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FlushRowsResponse
pub(all) struct FlushRowsResponse {
  offset : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema StorageError
pub(all) struct StorageError {
  code : String?
  entity : String?
  error_message : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RowError
pub(all) struct RowError {
  index : String?
  code : String?
  message : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)
