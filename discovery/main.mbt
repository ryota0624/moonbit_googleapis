///|
fn usage_and_exit() -> Unit {
  println(
    "usage: moon run discovery -- <discovery.json> [--output <dir>] [--server-streaming <file>]",
  )
  @sys.exit(1)
  panic()
}

///|
fn discovery_json_path_and_output(
  args : Array[String],
) -> (String, String?, String?) {
  let mut out_dir : String? = None
  let mut server_streaming_file : String? = None
  let positionals : Array[String] = Array::new()
  let mut i = 1
  while i < args.length() {
    if args[i] == "--output" {
      if i + 1 >= args.length() {
        usage_and_exit()
      }
      out_dir = Some(args[i + 1])
      i = i + 2
    } else if args[i] == "--server-streaming" {
      if i + 1 >= args.length() {
        usage_and_exit()
      }
      server_streaming_file = Some(args[i + 1])
      i = i + 2
    } else {
      positionals.push(args[i])
      i = i + 1
    }
  }
  if positionals.is_empty() {
    usage_and_exit()
  }
  (positionals[0], out_dir, server_streaming_file)
}

///|
fn parse_string_array_json(json_str : String) -> Array[String] raise ParseError {
  let root = @json.parse(json_str) catch {
    e => raise ParseError::JsonSyntax(e.to_string())
  }
  @json.from_json(root) catch {
    e => raise ParseError::WrongJsonType(e.to_string())
  }
}

///|
fn last_dot_segment(s : String) -> String {
  let parts = s.split(".").to_array()
  if parts.is_empty() {
    s
  } else {
    parts[parts.length() - 1].to_string()
  }
}

///|
fn streaming_name_set(names : Array[String]) -> Map[String, Bool] {
  let set : Map[String, Bool] = Map::new()
  for name in names {
    set.set(name, true)
  }
  set
}

///|
fn camel_prefix_match(
  rpc_name : String,
  streamings : Map[String, Bool],
) -> Bool {
  let mut found = false
  streamings.each((k, _) => {
    if !found && k.has_prefix(rpc_name) {
      let suffix_len = k.length() - rpc_name.length()
      if suffix_len == 0 {
        found = true
      } else {
        let code = k[rpc_name.length()].to_int()
        if code >= 65 && code <= 90 {
          found = true
        }
      }
    }
  })
  found
}

///|
fn annotate_method_streaming(
  rest_m : RestMethod,
  streamings : Map[String, Bool],
) -> RestMethod {
  let rpc_name = capitalize_first(last_dot_segment(rest_m.id))
  let is_streaming = match streamings.get(rpc_name) {
    Some(v) => v
    None => camel_prefix_match(rpc_name, streamings)
  }
  RestMethod::{
    id: rest_m.id,
    path: rest_m.path,
    http_method: rest_m.http_method,
    description: rest_m.description,
    parameters: rest_m.parameters,
    request: rest_m.request,
    response: rest_m.response,
    server_streaming: Some(is_streaming),
  }
}

///|
fn annotate_methods(
  methods : Map[String, RestMethod]?,
  streamings : Map[String, Bool],
) -> Map[String, RestMethod]? {
  match methods {
    None => None
    Some(ms) => {
      let out : Map[String, RestMethod] = Map::new()
      ms.each((k, m) => out.set(k, annotate_method_streaming(m, streamings)))
      Some(out)
    }
  }
}

///|
fn annotate_resources(
  resources : Map[String, RestResource]?,
  streamings : Map[String, Bool],
) -> Map[String, RestResource]? {
  match resources {
    None => None
    Some(rs) => {
      let out : Map[String, RestResource] = Map::new()
      rs.each((k, res) => out.set(k, annotate_resource(res, streamings)))
      Some(out)
    }
  }
}

///|
fn annotate_resource(
  resource : RestResource,
  streamings : Map[String, Bool],
) -> RestResource {
  RestResource::{
    methods: annotate_methods(resource.methods, streamings),
    resources: annotate_resources(resource.resources, streamings),
  }
}

///|
fn apply_server_streaming(
  desc : RestDescription,
  streaming_names : Array[String],
) -> RestDescription {
  let streamings = streaming_name_set(streaming_names)
  RestDescription::{
    name: desc.name,
    version: desc.version,
    title: desc.title,
    description: desc.description,
    base_url: desc.base_url,
    schemas: desc.schemas,
    resources: annotate_resources(desc.resources, streamings),
  }
}

///|
async fn read_text_or_exit(path : String) -> String {
  @fs.read_file(path).text() catch {
    e => {
      println(e.to_string())
      @sys.exit(1)
      panic()
    }
  }
}

///|
async fn main {
  let args = @sys.get_cli_args()
  if args.length() < 2 {
    usage_and_exit()
  }
  let (path, output_dir, server_streaming_path) = discovery_json_path_and_output(
    args,
  )
  let json_str = read_text_or_exit(path)
  let desc = parse_discovery(json_str) catch {
    e => {
      println(e.to_string())
      @sys.exit(1)
      panic()
    }
  }
  let desc = match server_streaming_path {
    Some(streaming_path) => {
      let streaming_json = read_text_or_exit(streaming_path)
      let streaming_names = parse_string_array_json(streaming_json) catch {
        e => {
          println(e.to_string())
          @sys.exit(1)
          panic()
        }
      }
      apply_server_streaming(desc, streaming_names)
    }
    None => desc
  }
  match output_dir {
    Some(dir) => {
      if !@fs.exists(dir) {
        @fs.mkdir(dir, permission=0o755, recursive=true) catch {
          e => {
            let msg = match e {
              @fs.IOError::IOError(s) => s
            }
            println(msg)
            @sys.exit(1)
            panic()
          }
        }
      }
      let types_content = generate_types(desc)
      let client_content = generate_client(desc)
      let helpers_content = generate_helpers()
      let api_name = desc.name
      let pkg_content = generate_moon_pkg("ryota0624/googleapis", api_name)
      let sep = "/"
      @fs.write_file(dir + sep + "types.mbt", types_content) catch {
        e => {
          let msg = match e {
            @fs.IOError::IOError(s) => s
          }
          println(msg)
          @sys.exit(1)
          panic()
        }
      }
      @fs.write_file(dir + sep + "client.mbt", client_content) catch {
        e => {
          let msg = match e {
            @fs.IOError::IOError(s) => s
          }
          println(msg)
          @sys.exit(1)
          panic()
        }
      }
      @fs.write_file(dir + sep + "helpers.mbt", helpers_content) catch {
        e => {
          let msg = match e {
            @fs.IOError::IOError(s) => s
          }
          println(msg)
          @sys.exit(1)
          panic()
        }
      }
      @fs.write_file(dir + sep + "moon.pkg", pkg_content) catch {
        e => {
          let msg = match e {
            @fs.IOError::IOError(s) => s
          }
          println(msg)
          @sys.exit(1)
          panic()
        }
      }
      println(
        "Wrote types.mbt, client.mbt, helpers.mbt, and moon.pkg to \{dir}",
      )
    }
    None => {
      println(generate_types(desc))
      println(generate_client(desc))
    }
  }
}
