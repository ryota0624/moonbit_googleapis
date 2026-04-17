///|
fn usage_and_exit() -> Unit {
  println(
    "usage: moon run codegen -- [<proto_package>] [--image <path>] [--output <dir>]",
  )
  println(
    "  proto_package: required when --image points to a buf proto image (e.g. google.firestore.v1).",
  )
  println(
    "                 Omit when --image is a Google Discovery document (kind=discovery#restDescription).",
  )
  println(
    "  --image: path to input JSON (buf Image or Discovery document). Default: /tmp/googleapis-image.json",
  )
  println("  --output: output directory")
  @sys.exit(1)
  panic()
}

///|
fn parse_args(args : Array[String]) -> (String?, String, String?) {
  let mut image_path = "/tmp/googleapis-image.json"
  let mut out_dir : String? = None
  let positionals : Array[String] = Array::new()
  let mut i = 1
  while i < args.length() {
    if args[i] == "--image" {
      if i + 1 >= args.length() {
        usage_and_exit()
      }
      image_path = args[i + 1]
      i = i + 2
    } else if args[i] == "--output" {
      if i + 1 >= args.length() {
        usage_and_exit()
      }
      out_dir = Some(args[i + 1])
      i = i + 2
    } else {
      positionals.push(args[i])
      i = i + 1
    }
  }
  let pkg = if positionals.is_empty() { None } else { Some(positionals[0]) }
  (pkg, image_path, out_dir)
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
  let (package_name, image_path, output_dir) = parse_args(args)
  let json_str = read_text_or_exit(image_path)
  let format = detect_input_format(json_str) catch {
    e => {
      println("Failed to detect input format: " + e.to_string())
      @sys.exit(1)
      panic()
    }
  }
  let desc = match format {
    InputFormat::Discovery =>
      parse_discovery_rest_description(json_str) catch {
        e => {
          println("Failed to parse Discovery document: " + e.to_string())
          @sys.exit(1)
          panic()
        }
      }
    InputFormat::Proto => {
      let pkg = match package_name {
        Some(p) => p
        None => {
          println(
            "proto_package argument is required when --image is a buf proto image.",
          )
          usage_and_exit()
          panic()
        }
      }
      let image = parse_proto_image(json_str) catch {
        e => {
          println("Failed to parse proto image: " + e.to_string())
          @sys.exit(1)
          panic()
        }
      }
      proto_package_to_rest_description(image, pkg) catch {
        e => {
          println(
            "Failed to convert proto to RestDescription: " + e.to_string(),
          )
          @sys.exit(1)
          panic()
        }
      }
    }
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
