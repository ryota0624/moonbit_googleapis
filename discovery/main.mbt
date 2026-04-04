///|
fn discovery_json_path_and_output(args : Array[String]) -> (String, String?) {
  let mut out_dir : String? = None
  let positionals : Array[String] = Array::new()
  let mut i = 1
  while i < args.length() {
    if args[i] == "--output" {
      if i + 1 >= args.length() {
        println(
          "usage: moon run discovery -- <discovery.json> [--output <dir>]",
        )
        @sys.exit(1)
        panic()
      }
      out_dir = Some(args[i + 1])
      i = i + 2
    } else {
      positionals.push(args[i])
      i = i + 1
    }
  }
  if positionals.is_empty() {
    println("usage: moon run discovery -- <discovery.json> [--output <dir>]")
    @sys.exit(1)
    panic()
  }
  (positionals[0], out_dir)
}

///|
async fn main {
  let args = @sys.get_cli_args()
  if args.length() < 2 {
    println("usage: moon run discovery -- <discovery.json> [--output <dir>]")
    @sys.exit(1)
  }
  let (path, output_dir) = discovery_json_path_and_output(args)
  let json_str = @fs.read_file(path).text() catch {
    e => {
      println(e.to_string())
      @sys.exit(1)
      panic()
    }
  }
  let desc = parse_discovery(json_str) catch {
    e => {
      println(e.to_string())
      @sys.exit(1)
      panic()
    }
  }
  match output_dir {
    Some(dir) => {
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
