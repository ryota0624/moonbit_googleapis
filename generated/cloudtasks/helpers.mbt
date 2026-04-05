///|
fn is_unreserved(c : Char) -> Bool {
  c.is_ascii_alphabetic() ||
  c.is_ascii_digit() ||
  c == '-' ||
  c == '_' ||
  c == '.' ||
  c == '~'
}

///|
fn append_pct_byte(b : StringBuilder, byte : Byte) -> Unit {
  b.write_char('%')
  b.write_string(byte.to_hex())
}

///|
fn url_encode(s : String) -> String {
  let out = StringBuilder::new()
  for c in s.iter() {
    if is_unreserved(c) {
      out.write_char(c)
    } else if c.is_ascii() {
      append_pct_byte(out, c.to_int().to_byte())
    } else {
      let buf = @buffer.new()
      buf.write_char_utf8(c)
      for byte in buf.to_bytes().iter() {
        append_pct_byte(out, byte)
      }
    }
  }
  out.to_string()
}

///|
fn build_query_string(params : Array[(String, String)]) -> String {
  if params.is_empty() {
    return ""
  }
  let b = StringBuilder::new()
  for i in 0..<params.length() {
    let (k, v) = params[i]
    if i > 0 {
      b.write_char('&')
    }
    b.write_string(k)
    b.write_char('=')
    b.write_string(v)
  }
  b.to_string()
}
