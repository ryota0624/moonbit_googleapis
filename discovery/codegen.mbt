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
  sanitize_type_identifier(name)
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
fn write_schema_struct(
  b : StringBuilder,
  schema_name : String,
  schema : JsonSchema,
) -> Unit {
  let type_name = sanitize_type_identifier(schema_name)
  b.write_string("///| Schema \{schema_name}\n")
  b.write_string("pub struct \{type_name} {\n")
  match schema.properties {
    Some(props) =>
      props.each((field_name, prop) => {
        let field = to_snake_case(field_name)
        let ty = schema_to_field_type(prop)
        b.write_string("  \{field} : \{ty}\n")
      })
    None => b.write_string("  // no properties\n")
  }
  b.write_string("}\n\n")
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
fn walk_resources(
  b : StringBuilder,
  base_url : String,
  prefix : String,
  resources : Map[String, RestResource],
) -> Unit {
  resources.each((res_name, res) => {
    let path_prefix = if prefix.is_empty() {
      res_name
    } else {
      "\{prefix}_\{res_name}"
    }
    methods_or_empty(res.methods).each((method_key, rest_m) => {
      let fn_name = to_snake_case("\{path_prefix}_\{method_key}")
      b.write_string("///| \{rest_m.id}\n")
      match rest_m.description {
        Some(d) => b.write_string("///| \{d}\n")
        None => ()
      }
      b.write_string("pub fn \{fn_name}() -> Unit {\n")
      b.write_string("  // \{rest_m.http_method} \{base_url}\{rest_m.path}\n")
      b.write_string("}\n\n")
    })
    walk_resources(b, base_url, path_prefix, resources_or_empty(res.resources))
  })
}

///|
pub fn generate_client(desc : RestDescription) -> String {
  let b = StringBuilder::new()
  b.write_string("///| API client stubs for \{desc.name} \{desc.version}\n")
  b.write_string("///| Base URL: \{desc.base_url}\n\n")
  walk_resources(b, desc.base_url, "", resources_or_empty(desc.resources))
  b.to_string()
}
