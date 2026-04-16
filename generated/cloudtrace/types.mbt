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
/// Schema TruncatableString
pub(all) struct TruncatableString {
  value : String?
  truncated_byte_count : Int?
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
/// Schema Span
pub(all) struct Span {
  child_span_count : Int?
  start_time : String?
  stack_trace : StackTrace?
  attributes : Attributes?
  name : String?
  same_process_as_parent_span : Bool?
  parent_span_id : String?
  display_name : TruncatableString?
  links : Links?
  span_id : String?
  span_kind : String?
  status : Status?
  time_events : TimeEvents?
  end_time : String?
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
/// Schema Link
pub(all) struct Link {
  span_id : String?
  type_ : String?
  trace_id : String?
  attributes : Attributes?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
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
  column_number : String?
  line_number : String?
  function_name : TruncatableString?
  file_name : TruncatableString?
  original_function_name : TruncatableString?
  load_module : Module?
  source_version : TruncatableString?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TimeEvents
pub(all) struct TimeEvents {
  time_event : Array[TimeEvent]?
  dropped_annotations_count : Int?
  dropped_message_events_count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Status
pub(all) struct Status {
  message : String?
  code : Int?
  details : Array[Json]?
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
/// Schema StackTrace
pub(all) struct StackTrace {
  stack_trace_hash_id : String?
  stack_frames : StackFrames?
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
/// Schema TimeEvent
pub(all) struct TimeEvent {
  time : String?
  annotation : Annotation?
  message_event : MessageEvent?
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
/// Schema MessageEvent
pub(all) struct MessageEvent {
  compressed_size_bytes : String?
  uncompressed_size_bytes : String?
  type_ : String?
  id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)
