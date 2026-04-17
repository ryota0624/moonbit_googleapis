///|
fn normalize_proto_url(url : String) -> String {
  let chars = url.to_array()
  let n = chars.length()
  let b = StringBuilder::new()
  let mut i = 0
  while i < n {
    if chars[i] == '{' {
      b.write_char('{')
      i = i + 1
      let name_b = StringBuilder::new()
      while i < n && chars[i] != '=' && chars[i] != '}' {
        name_b.write_char(chars[i])
        i = i + 1
      }
      b.write_string(name_b.to_string())
      if i < n && chars[i] == '=' {
        while i < n && chars[i] != '}' {
          i = i + 1
        }
      }
      if i < n && chars[i] == '}' {
        b.write_char('}')
        i = i + 1
      }
    } else {
      b.write_char(chars[i])
      i = i + 1
    }
  }
  b.to_string()
}

///|
fn short_type_name(full_name : String) -> String {
  let parts = full_name.split(".").to_array()
  if parts.is_empty() {
    full_name
  } else {
    parts[parts.length() - 1].to_string()
  }
}

///|
fn is_well_known_type(type_name : String) -> Bool {
  type_name.has_prefix(".google.protobuf.")
}

///|
fn well_known_type_to_discovery(type_name : String) -> String? {
  match type_name {
    ".google.protobuf.Timestamp"
    | ".google.protobuf.Duration"
    | ".google.protobuf.FieldMask" => Some("string")
    ".google.protobuf.BoolValue" => Some("boolean")
    ".google.protobuf.Int32Value" | ".google.protobuf.UInt32Value" =>
      Some("integer")
    _ => None
  }
}

///|
fn proto_field_type_to_discovery(f : ProtoField) -> String {
  match f.type_ {
    Some("TYPE_STRING") | Some("TYPE_BYTES") | Some("TYPE_ENUM") => "string"
    Some("TYPE_INT64")
    | Some("TYPE_UINT64")
    | Some("TYPE_SINT64")
    | Some("TYPE_FIXED64")
    | Some("TYPE_SFIXED64") => "string"
    Some("TYPE_INT32")
    | Some("TYPE_UINT32")
    | Some("TYPE_SINT32")
    | Some("TYPE_FIXED32")
    | Some("TYPE_SFIXED32") => "integer"
    Some("TYPE_BOOL") => "boolean"
    Some("TYPE_FLOAT") | Some("TYPE_DOUBLE") => "number"
    _ => "string"
  }
}

///|
fn proto_field_to_schema(f : ProtoField, package_name : String) -> JsonSchema {
  let is_repeated = f.label == Some("LABEL_REPEATED")
  let base_schema = match f.type_ {
    Some("TYPE_MESSAGE") => {
      let type_name = f.type_name.unwrap_or("")
      match well_known_type_to_discovery(type_name) {
        Some(wk) =>
          JsonSchema::{
            id: None,
            type_: Some(wk),
            description: None,
            properties: None,
            items: None,
            ref_: None,
          }
        None =>
          if type_name.has_prefix("." + package_name + ".") ||
            !type_name.has_prefix(".") {
            JsonSchema::{
              id: None,
              type_: None,
              description: None,
              properties: None,
              items: None,
              ref_: Some(short_type_name(type_name)),
            }
          } else {
            JsonSchema::{
              id: None,
              type_: Some("object"),
              description: None,
              properties: None,
              items: None,
              ref_: None,
            }
          }
      }
    }
    _ => {
      let discovery_type = proto_field_type_to_discovery(f)
      JsonSchema::{
        id: None,
        type_: Some(discovery_type),
        description: None,
        properties: None,
        items: None,
        ref_: None,
      }
    }
  }
  if is_repeated {
    JsonSchema::{
      id: None,
      type_: Some("array"),
      description: None,
      properties: None,
      items: Some(base_schema),
      ref_: None,
    }
  } else {
    base_schema
  }
}

///|
fn proto_message_to_schema(
  msg : ProtoMessage,
  package_name : String,
) -> JsonSchema {
  let props : Map[String, JsonSchema] = Map::new()
  match msg.field {
    Some(fields) =>
      for f in fields {
        let key = f.json_name.unwrap_or(f.name.unwrap_or(""))
        if !key.is_empty() {
          props.set(key, proto_field_to_schema(f, package_name))
        }
      }
    None => ()
  }
  JsonSchema::{
    id: msg.name,
    type_: Some("object"),
    description: None,
    properties: Some(props),
    items: None,
    ref_: None,
  }
}

///|
fn collect_messages(
  msgs : Array[ProtoMessage],
  schemas : Map[String, JsonSchema],
  package_name : String,
) -> Unit {
  for msg in msgs {
    let name = msg.name.unwrap_or("")
    if !name.is_empty() && !is_well_known_type("." + name) {
      schemas.set(name, proto_message_to_schema(msg, package_name))
    }
    match msg.nested_type {
      Some(nested) => collect_messages(nested, schemas, package_name)
      None => ()
    }
  }
}

///|
fn is_map_entry_schema(name : String, schema : JsonSchema) -> Bool {
  if !name.has_suffix("Entry") {
    return false
  }
  match schema.properties {
    Some(props) =>
      match props.get("key") {
        Some(k) if k.type_ == Some("string") => props.get("value") is Some(_)
        _ => false
      }
    None => false
  }
}

///|
fn post_process_map_schemas(schemas : Map[String, JsonSchema]) -> Unit {
  let entry_schemas : Map[String, JsonSchema] = Map::new()
  schemas.each((name, sch) => {
    if is_map_entry_schema(name, sch) {
      entry_schemas.set(name, sch)
    }
  })
  if entry_schemas.is_empty() {
    return
  }
  schemas.each((_name, sch) => {
    match sch.properties {
      Some(props) => {
        let replacements : Array[(String, JsonSchema)] = Array::new()
        props.each((field_name, field_schema) => {
          if field_schema.type_ == Some("array") {
            match field_schema.items {
              Some(items) =>
                match items.ref_ {
                  Some(ref_name) =>
                    match entry_schemas.get(ref_name) {
                      Some(entry_sch) =>
                        match entry_sch.properties {
                          Some(entry_props) =>
                            match entry_props.get("value") {
                              Some(value_schema) =>
                                replacements.push(
                                  (
                                    field_name,
                                    JsonSchema::{
                                      id: None,
                                      type_: Some("map"),
                                      description: None,
                                      properties: None,
                                      items: Some(value_schema),
                                      ref_: None,
                                    },
                                  ),
                                )
                              None => ()
                            }
                          None => ()
                        }
                      None => ()
                    }
                  None => ()
                }
              None => ()
            }
          }
        })
        for pair in replacements {
          props.set(pair.0, pair.1)
        }
      }
      None => ()
    }
  })
  entry_schemas.each((name, _) => schemas.remove(name))
}

///|
fn option_get(options : Map[String, Json], key : String) -> Json? {
  match options.get("[" + key + "]") {
    Some(v) => Some(v)
    None => options.get(key)
  }
}

///|
fn extract_http_rule(options : Map[String, Json]) -> HttpRule? {
  match option_get(options, "google.api.http") {
    Some(j) => Some((@json.from_json(j) : HttpRule)) catch { _ => None }
    None => None
  }
}

///|
fn http_rule_to_method_and_url(rule : HttpRule) -> (String, String)? {
  match rule.get {
    Some(url) => Some(("GET", url))
    None =>
      match rule.post {
        Some(url) => Some(("POST", url))
        None =>
          match rule.patch {
            Some(url) => Some(("PATCH", url))
            None =>
              match rule.put {
                Some(url) => Some(("PUT", url))
                None =>
                  match rule.delete {
                    Some(url) => Some(("DELETE", url))
                    None => None
                  }
              }
          }
      }
  }
}

///|
fn build_rest_method(
  m : ProtoRpcMethod,
  all_schemas : Map[String, JsonSchema],
  package_name : String,
) -> RestMethod? {
  let method_name = m.name.unwrap_or("")
  let options = match m.options {
    Some(o) => o
    None => return None
  }
  let http_rule = match extract_http_rule(options) {
    Some(r) => r
    None => return None
  }
  let (http_method, url_raw) = match http_rule_to_method_and_url(http_rule) {
    Some(pair) => pair
    None => return None
  }
  let url = normalize_proto_url(url_raw)
  let input_type_name = short_type_name(m.input_type.unwrap_or(""))
  let output_type_name = short_type_name(m.output_type.unwrap_or(""))
  let input_in_pkg = m.input_type
    .unwrap_or("")
    .has_prefix("." + package_name + ".")
  let output_in_pkg = m.output_type
    .unwrap_or("")
    .has_prefix("." + package_name + ".")
  let path_names = path_param_names_ordered(url)
  let path_name_set_ : Map[String, Unit] = Map::new()
  for p in path_names {
    path_name_set_.set(p, ())
  }
  let params : Map[String, MethodParameter] = Map::new()
  for p in path_names {
    params.set(p, MethodParameter::{
      type_: Some("string"),
      description: None,
      required: Some(true),
      location: Some("path"),
      repeated: None,
    })
  }

  let body_spec = http_rule.body
  let is_body_star = body_spec == Some("*")
  let body_field_name = match body_spec {
    Some("*") | None => None
    Some(f) => Some(f)
  }

  if !is_body_star {
    match all_schemas.get(input_type_name) {
      Some(sch) =>
        match sch.properties {
          Some(props) =>
            props.each((field_key, field_schema) => {
              let snake_name = to_snake_case(
                normalize_param_name_for_ident(field_key),
              )
              if path_name_set_.contains(snake_name) {
                return
              }
              match body_field_name {
                Some(bf) if to_snake_case(bf) == snake_name => return
                _ => ()
              }
              match field_schema.type_ {
                Some("object") | None => ()
                Some(t) =>
                  params.set(field_key, MethodParameter::{
                    type_: Some(t),
                    description: None,
                    required: Some(false),
                    location: Some("query"),
                    repeated: match field_schema.type_ {
                      Some("array") => Some(true)
                      _ => Some(false)
                    },
                  })
              }
            })
          None => ()
        }
      None => ()
    }
  }

  let request = if http_method == "GET" || http_method == "DELETE" {
    None
  } else if !input_in_pkg {
    None
  } else {
    match body_field_name {
      Some(bf) =>
        match all_schemas.get(input_type_name) {
          Some(sch) =>
            match sch.properties {
              Some(props) =>
                match props.get(bf) {
                  Some(field_sch) =>
                    match field_sch.ref_ {
                      Some(r) => Some(MethodMedia::{ ref_: Some(r) })
                      None => Some(MethodMedia::{ ref_: Some(input_type_name) })
                    }
                  None => Some(MethodMedia::{ ref_: Some(input_type_name) })
                }
              None => Some(MethodMedia::{ ref_: Some(input_type_name) })
            }
          None => Some(MethodMedia::{ ref_: Some(input_type_name) })
        }
      None => Some(MethodMedia::{ ref_: Some(input_type_name) })
    }
  }

  let response = if output_type_name == "Empty" ||
    output_type_name.is_empty() ||
    !output_in_pkg {
    None
  } else {
    Some(MethodMedia::{ ref_: Some(output_type_name) })
  }

  Some(RestMethod::{
    id: method_name,
    path: url,
    http_method,
    description: None,
    parameters: Some(params),
    request,
    response,
    server_streaming: m.server_streaming,
  })
}

///|
fn parse_package_name_version(package_name : String) -> (String, String) {
  let parts = package_name.split(".").to_array()
  let n = parts.length()
  if n == 0 {
    return ("api", "v1")
  }
  let last = parts[n - 1].to_string()
  let version = if last.has_prefix("v") &&
    last.length() > 1 &&
    last[1].to_int() >= 48 &&
    last[1].to_int() <= 57 {
    last
  } else {
    "v1"
  }
  let version_idx = if version == last { n - 1 } else { n }
  let skip = ["google", "cloud", "devtools", "apps"]
  let mut start = 0
  while start < version_idx {
    if skip.contains(parts[start].to_string()) {
      start = start + 1
    } else {
      break
    }
  }
  let name_parts : Array[String] = Array::new()
  for i in start..<version_idx {
    name_parts.push(parts[i].to_string())
  }
  let name = name_parts.join("_")
  (if name.is_empty() { "api" } else { name }, version)
}

///|
pub fn proto_package_to_rest_description(
  image : ProtoImage,
  package_name : String,
) -> RestDescription raise ParseError {
  let files = image.file.filter(f => f.package_ == Some(package_name))
  if files.is_empty() {
    raise ParseError::WrongJsonType(
      "No files found for package: " + package_name,
    )
  }

  let schemas : Map[String, JsonSchema] = Map::new()
  let mut default_host = "googleapis.com"
  let mut service_opt : ProtoService? = None

  for file in files {
    match file.message_type {
      Some(msgs) => collect_messages(msgs, schemas, package_name)
      None => ()
    }
    match file.service {
      Some(services) =>
        for svc in services {
          match svc.options {
            Some(opts) =>
              match option_get(opts, "google.api.default_host") {
                Some(Json::String(h)) => default_host = h
                _ => ()
              }
            None => ()
          }
          if service_opt is None {
            match svc.methods {
              Some(methods) => {
                let mut has_http = false
                for m in methods {
                  if !has_http {
                    match m.options {
                      Some(o) =>
                        if option_get(o, "google.api.http") is Some(_) {
                          has_http = true
                        }
                      None => ()
                    }
                  }
                }
                if has_http {
                  service_opt = Some(svc)
                }
              }
              None => ()
            }
          }
        }
      None => ()
    }
  }
  post_process_map_schemas(schemas)

  let service = match service_opt {
    Some(s) => s
    None =>
      raise ParseError::WrongJsonType(
        "No service with [google.api.http] annotations found in package: " +
        package_name,
      )
  }

  let methods : Map[String, RestMethod] = Map::new()
  match service.methods {
    Some(rpc_methods) =>
      for m in rpc_methods {
        match build_rest_method(m, schemas, package_name) {
          Some(rm) => {
            let method_name = m.name.unwrap_or("")
            if !method_name.is_empty() {
              methods.set(method_name, rm)
            }
          }
          None => ()
        }
      }
    None => ()
  }

  let resources : Map[String, RestResource] = Map::new()
  resources.set("", RestResource::{ methods: Some(methods), resources: None })

  let (api_name, api_version) = parse_package_name_version(package_name)
  RestDescription::{
    name: api_name,
    version: api_version,
    title: service.name.unwrap_or(api_name),
    description: None,
    base_url: "https://" + default_host,
    schemas: Some(schemas),
    resources: Some(resources),
  }
}
