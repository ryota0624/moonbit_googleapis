///|
async fn main {
  let args = @sys.get_cli_args()
  if args.length() < 2 {
    println("usage: moon run discovery -- <discovery.json>")
    @sys.exit(1)
  }
  let path = args[1]
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
  println(generate_types(desc))
  println(generate_client(desc))
}
