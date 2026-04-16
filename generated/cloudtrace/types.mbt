///|
/// Schema Links
pub(all) struct Links {
  link : Array[Link]?
  dropped_links_count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Span
pub(all) struct Span {
  parent_span_id : String?
  span_kind : String?
  name : String?
  time_events : TimeEvents?
  attributes : Attributes?
  end_time : String?
  same_process_as_parent_span : Bool?
  span_id : String?
  links : Links?
  display_name : TruncatableString?
  start_time : String?
  child_span_count : Int?
  stack_trace : StackTrace?
  status : Status?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema StackTrace
pub(all) struct StackTrace {
  stack_frames : StackFrames?
  stack_trace_hash_id : String?
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
/// Schema TruncatableString
pub(all) struct TruncatableString {
  truncated_byte_count : Int?
  value : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema StackFrames
pub(all) struct StackFrames {
  frame : Array[StackFrame]?
  dropped_frames_count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Annotation
pub(all) struct Annotation {
  description : TruncatableString?
  attributes : Attributes?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AttributeValue
pub(all) struct AttributeValue {
  string_value : TruncatableString?
  int_value : String?
  bool_value : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema BatchWriteSpansRequest
pub(all) struct BatchWriteSpansRequest {
  spans : Array[Span]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema StackFrame
pub(all) struct StackFrame {
  function_name : TruncatableString?
  file_name : TruncatableString?
  line_number : String?
  source_version : TruncatableString?
  original_function_name : TruncatableString?
  column_number : String?
  load_module : Module?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Attributes
pub(all) struct Attributes {
  attribute_map : Json?
  dropped_attributes_count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Module
pub(all) struct Module {
  module_ : TruncatableString?
  build_id : TruncatableString?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(module_(rename="module"))),
  ToJson(rename_fields="camelCase", fields(module_(rename="module"))),
)

///|
/// Schema TimeEvent
pub(all) struct TimeEvent {
  time : String?
  message_event : MessageEvent?
  annotation : Annotation?
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
/// Schema TimeEvents
pub(all) struct TimeEvents {
  dropped_message_events_count : Int?
  time_event : Array[TimeEvent]?
  dropped_annotations_count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema MessageEvent
pub(all) struct MessageEvent {
  id : String?
  uncompressed_size_bytes : String?
  compressed_size_bytes : String?
  type_ : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema Link
pub(all) struct Link {
  span_id : String?
  type_ : String?
  attributes : Attributes?
  trace_id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)
