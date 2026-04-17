///|
/// Schema Span
pub(all) struct Span {
  name : String?
  span_id : String?
  parent_span_id : String?
  display_name : TruncatableString?
  start_time : String?
  end_time : String?
  attributes : Attributes?
  stack_trace : StackTrace?
  time_events : TimeEvents?
  links : Links?
  status : Json?
  same_process_as_parent_span : Bool?
  child_span_count : Int?
  span_kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Attributes
pub(all) struct Attributes {
  attribute_map : Array[AttributeMapEntry]?
  dropped_attributes_count : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AttributeMapEntry
pub(all) struct AttributeMapEntry {
  key : String?
  value : AttributeValue?
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
  type_ : String?
  id : String?
  uncompressed_size_bytes : String?
  compressed_size_bytes : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
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
/// Schema Link
pub(all) struct Link {
  trace_id : String?
  span_id : String?
  type_ : String?
  attributes : Attributes?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
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
/// Schema StackFrame
pub(all) struct StackFrame {
  function_name : TruncatableString?
  original_function_name : TruncatableString?
  file_name : TruncatableString?
  line_number : String?
  column_number : String?
  load_module : Module?
  source_version : TruncatableString?
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
/// Schema BatchWriteSpansRequest
pub(all) struct BatchWriteSpansRequest {
  name : String?
  spans : Array[Span]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)
