///|
fn schemas_or_empty(m : Map[String, JsonSchema]?) -> Map[String, JsonSchema] {
  match m {
    None => Map::new()
    Some(x) => x
  }
}

///|
fn resources_or_empty(
  m : Map[String, RestResource]?,
) -> Map[String, RestResource] {
  match m {
    None => Map::new()
    Some(x) => x
  }
}

///|
fn methods_or_empty(m : Map[String, RestMethod]?) -> Map[String, RestMethod] {
  match m {
    None => Map::new()
    Some(x) => x
  }
}

///|
fn parameters_or_empty(
  m : Map[String, MethodParameter]?,
) -> Map[String, MethodParameter] {
  match m {
    None => Map::new()
    Some(x) => x
  }
}

///|
pub fn capitalize_first(s : String) -> String {
  if s.is_empty() {
    return ""
  }
  let b = StringBuilder::new()
  let mut first = true
  for c in s.iter() {
    if first {
      b.write_char(c.to_ascii_uppercase())
      first = false
    } else {
      b.write_char(c)
    }
  }
  b.to_string()
}

///|
pub fn param_type_to_moonbit(type_str : String?) -> String {
  match type_str {
    Some("string") => "String"
    Some("integer") => "Int"
    Some("number") => "Double"
    Some("boolean") => "Bool"
    Some("array") => "Array[String]"
    Some(_) => "Json"
    None => "String"
  }
}

///|
fn strip_trailing_slashes(url : String) -> String {
  let mut r = url
  while r.has_suffix("/") {
    match r.strip_suffix("/") {
      Some(v) => r = v.to_string()
      None => break
    }
  }
  r
}

///|
fn escape_moonbit_string_lit(s : String) -> String {
  let b = StringBuilder::new()
  for c in s.iter() {
    if c == '\\' {
      b.write_string("\\\\")
    } else if c == '"' {
      b.write_string("\\\"")
    } else if c == '\n' {
      b.write_string("\\n")
    } else if c == '\r' {
      b.write_string("\\r")
    } else if c == '\t' {
      b.write_string("\\t")
    } else {
      b.write_char(c)
    }
  }
  b.to_string()
}

///|
/// Normalizes a Discovery parameter or path placeholder name so it can become a MoonBit
/// identifier: strips leading `+` from `{+name}` URL templates, replaces `.` and `-` and
/// other non-alphanumeric characters (except `_`) with `_`. The original string must still
/// be used for query keys and JSON property names.
fn normalize_param_name_for_ident(raw : String) -> String {
  let chars = raw.to_array()
  let n = chars.length()
  let mut i = 0
  while i < n && chars[i] == '+' {
    i = i + 1
  }
  let b = StringBuilder::new()
  while i < n {
    let c = chars[i]
    if c == '.' || c == '-' {
      b.write_char('_')
    } else if c.is_ascii_alphabetic() || c.is_ascii_digit() || c == '_' {
      b.write_char(c)
    } else {
      b.write_char('_')
    }
    i = i + 1
  }
  b.to_string()
}

///|
/// Path segments: `(text, is_variable)` where `is_variable` means placeholder name.
fn path_parse_segments(template : String) -> Array[(String, Bool)] {
  let out : Array[(String, Bool)] = Array::new()
  let chars = template.to_array()
  let n = chars.length()
  let mut i = 0
  let mut lit = StringBuilder::new()
  while i < n {
    if chars[i] == '{' {
      if !lit.is_empty() {
        out.push((lit.to_string(), false))
        lit = StringBuilder::new()
      }
      i = i + 1
      let nb = StringBuilder::new()
      while i < n && chars[i] != '}' {
        nb.write_char(chars[i])
        i = i + 1
      }
      out.push((nb.to_string(), true))
      if i < n && chars[i] == '}' {
        i = i + 1
      }
    } else {
      lit.write_char(chars[i])
      i = i + 1
    }
  }
  if !lit.is_empty() {
    out.push((lit.to_string(), false))
  }
  out
}

///|
fn path_param_names_ordered(template : String) -> Array[String] {
  let out : Array[String] = Array::new()
  for seg in path_parse_segments(template) {
    if seg.1 {
      out.push(normalize_param_name_for_ident(seg.0))
    }
  }
  out
}

///|
fn append_lit_path_operands(lit : String, operands : Array[String]) -> Unit {
  if lit.is_empty() {
    return
  }
  let trimmed = lit.trim(chars="/")
  if trimmed.is_empty() {
    return
  }
  for part in trimmed.split("/") {
    if !part.is_empty() {
      operands.push("\"" + escape_moonbit_string_lit(part.to_string()) + "\"")
    }
  }
}

///|
fn path_expr_from_template(template : String) -> String {
  let segs = path_parse_segments(template)
  let operands : Array[String] = Array::new()
  for seg in segs {
    if seg.1 {
      operands.push(safe_field_name(seg.0))
    } else {
      append_lit_path_operands(seg.0, operands)
    }
  }
  if operands.is_empty() {
    return "\"/\""
  }
  let mut expr = operands[0]
  for k in 1..<operands.length() {
    expr = expr + " + \"/\" + " + operands[k]
  }
  "\"/\" + " + expr
}

///|
fn synthetic_path_param() -> MethodParameter {
  MethodParameter::{
    type_: Some("string"),
    description: None,
    required: Some(true),
    location: Some("path"),
  }
}

///|
fn lookup_or_synthetic_path_param(
  params : Map[String, MethodParameter],
  pname : String,
) -> MethodParameter {
  match params.get(pname) {
    Some(p) => p
    None => synthetic_path_param()
  }
}

///|
fn path_bindings_ordered(
  template : String,
  params : Map[String, MethodParameter],
) -> Array[(String, MethodParameter)] {
  let out : Array[(String, MethodParameter)] = Array::new()
  for pname in path_param_names_ordered(template) {
    out.push((pname, lookup_or_synthetic_path_param(params, pname)))
  }
  out
}

///|
fn path_name_set(names : Array[String]) -> Map[String, Unit] {
  let m : Map[String, Unit] = Map::new()
  for n in names {
    m.set(n, ())
  }
  m
}

///|

///|
/// Prefer API key `name` first (common Google body pattern), then lexicographic.
fn compare_body_required_api_key(a : String, b : String) -> Int {
  let ra = if a == "name" { 0 } else { 1 }
  let rb = if b == "name" { 0 } else { 1 }
  if ra != rb {
    return ra - rb
  }
  a.lexical_compare(b)
}

///|
fn sorted_body_required_pairs(
  src : Array[(String, MethodParameter)],
) -> Array[(String, MethodParameter)] {
  let pairs : Array[(String, MethodParameter)] = Array::new()
  for p in src {
    pairs.push(p)
  }
  let n = pairs.length()
  for i in 0..<n {
    for j in 0..<(n - 1 - i) {
      if compare_body_required_api_key(pairs[j].0, pairs[j + 1].0) > 0 {
        let t = pairs[j]
        pairs[j] = pairs[j + 1]
        pairs[j + 1] = t
      }
    }
  }
  pairs
}

///|
fn sorted_param_pairs(
  src : Array[(String, MethodParameter)],
) -> Array[(String, MethodParameter)] {
  let pairs : Array[(String, MethodParameter)] = Array::new()
  for p in src {
    pairs.push(p)
  }
  let n = pairs.length()
  for i in 0..<n {
    for j in 0..<(n - 1 - i) {
      if pairs[j].0.lexical_compare(pairs[j + 1].0) > 0 {
        let t = pairs[j]
        pairs[j] = pairs[j + 1]
        pairs[j + 1] = t
      }
    }
  }
  pairs
}

///|
fn sorted_strings(src : Array[String]) -> Array[String] {
  let arr : Array[String] = Array::new()
  for s in src {
    arr.push(s)
  }
  let n = arr.length()
  for i in 0..<n {
    for j in 0..<(n - 1 - i) {
      if arr[j].lexical_compare(arr[j + 1]) > 0 {
        let t = arr[j]
        arr[j] = arr[j + 1]
        arr[j + 1] = t
      }
    }
  }
  arr
}

///|
fn collect_sorted_resource_keys(m : Map[String, RestResource]) -> Array[String] {
  let keys : Array[String] = Array::new()
  m.each((k, _v) => keys.push(k))
  sorted_strings(keys)
}

///|
fn collect_sorted_method_keys(m : Map[String, RestMethod]) -> Array[String] {
  let keys : Array[String] = Array::new()
  m.each((k, _v) => keys.push(k))
  sorted_strings(keys)
}

///|
fn http_method_upper(m : String) -> String {
  m.to_upper()
}

///|
fn is_mutating_http(http_u : String) -> Bool {
  http_u == "POST" || http_u == "PUT" || http_u == "PATCH"
}

///|
fn classify_non_path_params(
  rest_m : RestMethod,
  http_u : String,
  path_keys : Map[String, Unit],
) -> (Array[(String, MethodParameter)], Array[(String, MethodParameter)]) {
  let query : Array[(String, MethodParameter)] = Array::new()
  let body : Array[(String, MethodParameter)] = Array::new()
  let params = parameters_or_empty(rest_m.parameters)
  params.each((k, p) => {
    if path_keys.contains(k) {
      return
    }
    match p.location {
      Some("query") => query.push((k, p))
      Some("body") => body.push((k, p))
      Some("path") => ()
      Some(_) =>
        if is_mutating_http(http_u) {
          body.push((k, p))
        } else {
          query.push((k, p))
        }
      None =>
        if is_mutating_http(http_u) {
          body.push((k, p))
        } else {
          query.push((k, p))
        }
    }
  })
  (sorted_param_pairs(query), sorted_param_pairs(body))
}

///|
fn param_is_required(p : MethodParameter) -> Bool {
  match p.required {
    Some(true) => true
    _ => false
  }
}

///|
fn write_query_push_string(
  b : StringBuilder,
  moonbit_arg : String,
  query_key : String,
  encode : Bool,
) -> Unit {
  let qk = escape_moonbit_string_lit(query_key)
  if encode {
    b.write_string(
      "  match \{moonbit_arg} {\n    Some(v) => qp.push((\"\{qk}\", url_encode(v)))\n    None => ()\n  }\n",
    )
  } else {
    b.write_string(
      "  match \{moonbit_arg} {\n    Some(v) => qp.push((\"\{qk}\", v.to_string()))\n    None => ()\n  }\n",
    )
  }
}

///|
fn write_query_push_int(
  b : StringBuilder,
  moonbit_arg : String,
  query_key : String,
) -> Unit {
  let qk = escape_moonbit_string_lit(query_key)
  b.write_string(
    "  match \{moonbit_arg} {\n    Some(v) => qp.push((\"\{qk}\", v.to_string()))\n    None => ()\n  }\n",
  )
}

///|
fn write_query_push_double(
  b : StringBuilder,
  moonbit_arg : String,
  query_key : String,
) -> Unit {
  let qk = escape_moonbit_string_lit(query_key)
  b.write_string(
    "  match \{moonbit_arg} {\n    Some(v) => qp.push((\"\{qk}\", v.to_string()))\n    None => ()\n  }\n",
  )
}

///|
fn write_query_push_bool(
  b : StringBuilder,
  moonbit_arg : String,
  query_key : String,
) -> Unit {
  let qk = escape_moonbit_string_lit(query_key)
  b.write_string(
    "  match \{moonbit_arg} {\n    Some(v) => qp.push((\"\{qk}\", if v { \"true\" } else { \"false\" }))\n    None => ()\n  }\n",
  )
}

///|
fn write_query_param_push(
  b : StringBuilder,
  api_key : String,
  p : MethodParameter,
  moonbit_arg : String,
) -> Unit {
  let ty = param_type_to_moonbit(p.type_)
  match ty {
    "String" => write_query_push_string(b, moonbit_arg, api_key, true)
    "Int" => write_query_push_int(b, moonbit_arg, api_key)
    "Double" => write_query_push_double(b, moonbit_arg, api_key)
    "Bool" => write_query_push_bool(b, moonbit_arg, api_key)
    _ => write_query_push_string(b, moonbit_arg, api_key, true)
  }
}

///|
fn write_json_value_for_param(
  b : StringBuilder,
  p : MethodParameter,
  value_expr : String,
) -> Unit {
  let ty = param_type_to_moonbit(p.type_)
  match ty {
    "String" => b.write_string("Json::string(\{value_expr})")
    "Int" => b.write_string("Json::number(\{value_expr}.to_double())")
    "Double" => b.write_string("Json::number(\{value_expr})")
    "Bool" => b.write_string("Json::boolean(\{value_expr})")
    _ => b.write_string("\{value_expr}")
  }
}

///|
fn write_body_field_match(
  b : StringBuilder,
  api_key : String,
  p : MethodParameter,
  moonbit_arg : String,
) -> Unit {
  let json_key = escape_moonbit_string_lit(api_key)
  if param_type_to_moonbit(p.type_) == "Array[String]" {
    b.write_string("  match \{moonbit_arg} {\n    Some(v) => {\n")
    b.write_string("      let ja : Array[Json] = Array::new()\n")
    b.write_string(
      "      for x in v {\n        ja.push(Json::string(x))\n      }\n",
    )
    b.write_string(
      "      meta.set(\"\{json_key}\", Json::array(ja))\n    }\n    None => ()\n  }\n",
    )
  } else {
    b.write_string("  match \{moonbit_arg} {\n    Some(v) => {\n      ")
    b.write_string("meta.set(\"\{json_key}\", ")
    write_json_value_for_param(b, p, "v")
    b.write_string(")\n    }\n    None => ()\n  }\n")
  }
}

///|
fn write_body_field_required(
  b : StringBuilder,
  api_key : String,
  p : MethodParameter,
  moonbit_arg : String,
) -> Unit {
  let json_key = escape_moonbit_string_lit(api_key)
  if param_type_to_moonbit(p.type_) == "Array[String]" {
    b.write_string("  {\n    let ja : Array[Json] = Array::new()\n")
    b.write_string(
      "    for x in \{moonbit_arg} {\n      ja.push(Json::string(x))\n    }\n",
    )
    b.write_string("    meta.set(\"\{json_key}\", Json::array(ja))\n  }\n")
  } else {
    b.write_string("  meta.set(\"\{json_key}\", ")
    write_json_value_for_param(b, p, moonbit_arg)
    b.write_string(")\n")
  }
}

///|
/// Returns `(moonbit_return_type, parse_json_body)`.
fn method_return_type(rest_m : RestMethod) -> (String, Bool) {
  match rest_m.response {
    Some(media) =>
      match media.ref_ {
        Some(r) => (ref_to_type_name(r), true)
        None => ("@http.HttpResponse", false)
      }
    None => ("@http.HttpResponse", false)
  }
}

///|
fn write_rest_method(
  b : StringBuilder,
  service_ty : String,
  fn_name : String,
  rest_m : RestMethod,
) -> Unit {
  let http_u = http_method_upper(rest_m.http_method)
  let params_map = parameters_or_empty(rest_m.parameters)
  let path_bindings = path_bindings_ordered(rest_m.path, params_map)
  let path_names = path_param_names_ordered(rest_m.path)
  let path_keys = path_name_set(path_names)
  let (query_pairs, body_pairs_mixed) = classify_non_path_params(
    rest_m, http_u, path_keys,
  )
  let body_req : Array[(String, MethodParameter)] = Array::new()
  let body_opt : Array[(String, MethodParameter)] = Array::new()
  for bp in body_pairs_mixed {
    if param_is_required(bp.1) {
      body_req.push(bp)
    } else {
      body_opt.push(bp)
    }
  }
  let body_req = sorted_body_required_pairs(body_req)
  let body_opt = sorted_param_pairs(body_opt)
  let (ret_ty, parse_json) = method_return_type(rest_m)
  b.write_string("///| \{rest_m.id}\n")
  match rest_m.description {
    Some(d) => b.write_string("///| \{d}\n")
    None => ()
  }
  b.write_string(
    "pub async fn \{service_ty}::\{fn_name}(\n  self : \{service_ty},\n  client : &@http.HttpClient,\n",
  )
  for pb in path_bindings {
    let arg = safe_field_name(pb.0)
    let ty = param_type_to_moonbit(pb.1.type_)
    b.write_string("  \{arg} : \{ty},\n")
  }
  for qp in query_pairs {
    let arg = safe_field_name(qp.0)
    let ty = param_type_to_moonbit(qp.1.type_)
    b.write_string("  \{arg}? : \{ty}? = None,\n")
  }
  for bp in body_req {
    let arg = safe_field_name(bp.0)
    let ty = param_type_to_moonbit(bp.1.type_)
    b.write_string("  \{arg} : \{ty},\n")
  }
  for bp in body_opt {
    let arg = safe_field_name(bp.0)
    let ty = param_type_to_moonbit(bp.1.type_)
    b.write_string("  \{arg}? : \{ty}? = None,\n")
  }
  b.write_string(") -> \{ret_ty} raise @http.HttpError {\n")
  let path_expr = path_expr_from_template(rest_m.path)
  let use_query = query_pairs.length() > 0
  let use_body = is_mutating_http(http_u)
  if use_query {
    b.write_string("  let qp : Array[(String, String)] = Array::new()\n")
    for qp in query_pairs {
      let arg = safe_field_name(qp.0)
      write_query_param_push(b, qp.0, qp.1, arg)
    }
    b.write_string("  let qs = build_query_string(qp)\n")
  }
  if use_body {
    b.write_string("  let meta : Map[String, Json] = Map::new()\n")
    for bp in body_req {
      let arg = safe_field_name(bp.0)
      write_body_field_required(b, bp.0, bp.1, arg)
    }
    for bp in body_opt {
      let arg = safe_field_name(bp.0)
      write_body_field_match(b, bp.0, bp.1, arg)
    }
    b.write_string("  let body = Json::object(meta).stringify()\n")
    b.write_string("  let h = self.auth_headers()\n")
    b.write_string("  h.set(\"Content-Type\", \"application/json\")\n")
  }
  b.write_string("  let path = \{path_expr}\n")
  if use_query {
    b.write_string(
      "  let url = if qs.is_empty() {\n    self.base_url + path\n  } else {\n    self.base_url + path + \"?\" + qs\n  }\n",
    )
  } else {
    b.write_string("  let url = self.base_url + path\n")
  }
  let meth = match http_u {
    "POST" => "@http.HttpMethod::POST"
    "PUT" => "@http.HttpMethod::PUT"
    "PATCH" => "@http.HttpMethod::PATCH"
    "DELETE" => "@http.HttpMethod::DELETE"
    _ => "@http.HttpMethod::GET"
  }
  if use_body {
    b.write_string(
      "  let req = @http.HttpRequest::new(url, \{meth}, h, body=Some(body))\n",
    )
  } else if use_query {
    b.write_string(
      "  let req = @http.HttpRequest::new(url, \{meth}, self.auth_headers())\n",
    )
  } else {
    b.write_string(
      "  let req = @http.HttpRequest::new(url, \{meth}, self.auth_headers())\n",
    )
  }
  b.write_string(
    "  let resp = client.request(req) catch {\n    e => raise e\n  }\n",
  )
  b.write_string(
    "  if resp.status_code >= 400 {\n    raise @http.HttpError::network_message(\n      \"HTTP \" + resp.status_code.to_string() + \": \" + resp.body,\n    )\n  }\n",
  )
  if parse_json {
    b.write_string("  let json = @json.parse(resp.body) catch {\n")
    b.write_string(
      "    e => raise @http.HttpError::network_message(e.to_string())\n  }\n",
    )
    b.write_string("  @json.from_json(json) catch {\n")
    b.write_string(
      "    e => raise @http.HttpError::network_message(e.to_string())\n  }\n",
    )
  } else {
    b.write_string("  resp\n")
  }
  b.write_string("}\n\n")
}

///|
fn walk_resources_for_client(
  b : StringBuilder,
  service_ty : String,
  prefix : String,
  resources : Map[String, RestResource],
) -> Unit {
  for res_name in collect_sorted_resource_keys(resources) {
    let res = resources.get(res_name).unwrap()
    let path_prefix = if prefix.is_empty() {
      res_name
    } else {
      "\{prefix}_\{res_name}"
    }
    for method_key in collect_sorted_method_keys(methods_or_empty(res.methods)) {
      let rest_m = methods_or_empty(res.methods).get(method_key).unwrap()
      let fn_name = to_snake_case("\{path_prefix}_\{method_key}")
      write_rest_method(b, service_ty, fn_name, rest_m)
    }
    walk_resources_for_client(
      b,
      service_ty,
      path_prefix,
      resources_or_empty(res.resources),
    )
  }
}

///|
pub fn to_snake_case(s : String) -> String {
  if s.is_empty() {
    return s
  }
  let b = StringBuilder::new()
  let mut first = true
  for c in s.iter() {
    if first {
      b.write_char(c.to_ascii_lowercase())
      first = false
    } else if c.is_ascii_uppercase() {
      b.write_char('_')
      b.write_char(c.to_ascii_lowercase())
    } else {
      b.write_char(c)
    }
  }
  b.to_string()
}

///|
fn schema_to_field_type(schema : JsonSchema) -> String {
  match schema.ref_ {
    Some(r) => ref_to_type_name(r)
    None =>
      match schema.type_ {
        Some("string") => "String"
        Some("integer") => "Int"
        Some("number") => "Double"
        Some("boolean") => "Bool"
        Some("array") =>
          match schema.items {
            Some(it) => "Array[\{schema_to_field_type(it)}]"
            None => "Array[Json]"
          }
        Some("object") => "Json"
        Some(_) => "Json"
        None => "Json"
      }
  }
}

///|
fn ref_to_type_name(r : String) -> String {
  let base = match r.before("#") {
    Some(v) => v.to_string()
    None => r
  }
  let parts = base.split("/").to_array()
  let name = if parts.length() == 0 {
    base
  } else {
    parts[parts.length() - 1].to_string()
  }
  moonbit_schema_type_name(name)
}

///|
/// MoonBit reserves some names for built-in types; avoid clashes with generated structs.
fn is_reserved_type_name(s : String) -> Bool {
  s == "Error"
}

///|
fn moonbit_schema_type_name(raw_schema_segment : String) -> String {
  let id = sanitize_type_identifier(raw_schema_segment)
  if is_reserved_type_name(id) {
    id + "_"
  } else {
    id
  }
}

///|
fn sanitize_type_identifier(raw : String) -> String {
  if raw.is_empty() {
    return "Unknown"
  }
  let b = StringBuilder::new()
  let it = raw.iter()
  match it.next() {
    Some(head) =>
      if head.is_ascii_alphabetic() || head == '_' {
        b.write_char(head)
      } else {
        b.write_char('_')
        b.write_char(head)
      }
    None => ()
  }
  for c in it {
    if c.is_ascii_alphabetic() || c.is_ascii_digit() || c == '_' {
      b.write_char(c)
    } else {
      b.write_char('_')
    }
  }
  b.to_string()
}

///|
fn is_reserved_word(s : String) -> Bool {
  s == "type" ||
  s == "ref" ||
  s == "match" ||
  s == "if" ||
  s == "else" ||
  s == "for" ||
  s == "while" ||
  s == "break" ||
  s == "continue" ||
  s == "return" ||
  s == "fn" ||
  s == "let" ||
  s == "mut" ||
  s == "pub" ||
  s == "priv" ||
  s == "struct" ||
  s == "enum" ||
  s == "trait" ||
  s == "impl" ||
  s == "true" ||
  s == "false" ||
  s == "method" ||
  s == "unreachable" ||
  s == "where"
}

///|
fn safe_field_name(name : String) -> String {
  let snake = to_snake_case(normalize_param_name_for_ident(name))
  if is_reserved_word(snake) {
    snake + "_"
  } else {
    snake
  }
}

///|
fn collect_renamed_fields(
  props : Map[String, JsonSchema],
) -> Array[(String, String)] {
  let renamed : Array[(String, String)] = []
  props.each((field_name, _prop) => {
    let safe = safe_field_name(field_name)
    if safe != to_snake_case(field_name) {
      renamed.push((safe, field_name))
    }
  })
  renamed
}

///|
fn write_schema_struct(
  b : StringBuilder,
  schema_name : String,
  schema : JsonSchema,
) -> Unit {
  let type_name = moonbit_schema_type_name(schema_name)
  b.write_string("///| Schema \{schema_name}\n")
  let renamed = match schema.properties {
    Some(props) => collect_renamed_fields(props)
    None => []
  }
  b.write_string("pub(all) struct \{type_name} {\n")
  match schema.properties {
    Some(props) =>
      props.each((field_name, prop) => {
        let field = safe_field_name(field_name)
        let ty = schema_to_field_type(prop)
        b.write_string("  \{field} : \{ty}?\n")
      })
    None => b.write_string("  // no properties\n")
  }
  b.write_string("}")
  if renamed.is_empty() {
    b.write_string(
      " derive(Eq, Show, FromJson(rename_fields=\"camelCase\"))\n\n",
    )
  } else {
    b.write_string(
      " derive(Eq, Show, FromJson(rename_fields=\"camelCase\", fields(",
    )
    for i in 0..<renamed.length() {
      if i > 0 {
        b.write_string(", ")
      }
      let pair = renamed[i]
      let safe = pair.0
      let json_key = pair.1
      b.write_string("\{safe}(rename=\"\{json_key}\")")
    }
    b.write_string(")))\n\n")
  }
}

///|
pub fn generate_types(desc : RestDescription) -> String {
  let b = StringBuilder::new()
  schemas_or_empty(desc.schemas).each((name, sch) => {
    write_schema_struct(b, name, sch)
  })
  b.to_string()
}

///|
pub fn generate_client(desc : RestDescription) -> String {
  let api = if desc.name.is_empty() {
    "Api"
  } else {
    capitalize_first(desc.name)
  }
  let service_ty = "\{api}Service"
  let base_lit = escape_moonbit_string_lit(
    strip_trailing_slashes(desc.base_url),
  )
  let b = StringBuilder::new()
  b.write_string("///| API client for \{desc.name} \{desc.version}\n")
  b.write_string("///| Base URL: \{desc.base_url}\n\n")
  b.write_string("///|\n")
  b.write_string("pub(all) struct \{service_ty} {\n")
  b.write_string("  base_url : String\n")
  b.write_string("  access_token : String\n")
  b.write_string("}\n\n")
  b.write_string("///|\n")
  b.write_string(
    "pub fn \{service_ty}::new(access_token : String) -> \{service_ty} {\n",
  )
  b.write_string("  " + service_ty + "::{\n")
  b.write_string("    base_url: \"\{base_lit}\",\n")
  b.write_string("    access_token,\n")
  b.write_string("  }\n")
  b.write_string("}\n\n")
  b.write_string("///|\n")
  b.write_string(
    "fn \{service_ty}::auth_headers(self : \{service_ty}) -> Map[String, String] {\n",
  )
  b.write_string("  {\n")
  b.write_string("    \"Authorization\": \"Bearer \" + self.access_token,\n")
  b.write_string("    \"Accept\": \"application/json\",\n")
  b.write_string("  }\n")
  b.write_string("}\n\n")
  walk_resources_for_client(
    b,
    service_ty,
    "",
    resources_or_empty(desc.resources),
  )
  b.to_string()
}

///|
pub fn generate_helpers() -> String {
  let s =
    #|///|
    #|fn is_unreserved(c : Char) -> Bool {
    #|  c.is_ascii_alphabetic() ||
    #|  c.is_ascii_digit() ||
    #|  c == '-' ||
    #|  c == '_' ||
    #|  c == '.' ||
    #|  c == '~'
    #|}
    #|
    #|///|
    #|fn append_pct_byte(b : StringBuilder, byte : Byte) -> Unit {
    #|  b.write_char('%')
    #|  b.write_string(byte.to_hex())
    #|}
    #|
    #|///|
    #|fn url_encode(s : String) -> String {
    #|  let out = StringBuilder::new()
    #|  for c in s.iter() {
    #|    if is_unreserved(c) {
    #|      out.write_char(c)
    #|    } else if c.is_ascii() {
    #|      append_pct_byte(out, c.to_int().to_byte())
    #|    } else {
    #|      let buf = @buffer.new()
    #|      buf.write_char_utf8(c)
    #|      for byte in buf.to_bytes().iter() {
    #|        append_pct_byte(out, byte)
    #|      }
    #|    }
    #|  }
    #|  out.to_string()
    #|}
    #|
    #|///|
    #|fn build_query_string(params : Array[(String, String)]) -> String {
    #|  if params.is_empty() {
    #|    return ""
    #|  }
    #|  let b = StringBuilder::new()
    #|  for i in 0..<params.length() {
    #|    let (k, v) = params[i]
    #|    if i > 0 {
    #|      b.write_char('&')
    #|    }
    #|    b.write_string(k)
    #|    b.write_char('=')
    #|    b.write_string(v)
    #|  }
    #|  b.to_string()
    #|}

  if s.has_suffix("\n") {
    s
  } else {
    s + "\n"
  }
}

///|
pub fn generate_moon_pkg(module_name : String, api_name : String) -> String {
  let _ : String = api_name
  let b = StringBuilder::new()
  b.write_string("import {\n")
  b.write_string("  \"moonbitlang/core/buffer\" @buffer,\n")
  b.write_string("  \"moonbitlang/core/json\" @json,\n")
  b.write_string("  \"\{module_name}/http\" @http,\n")
  b.write_string("}\n")
  b.to_string()
}
