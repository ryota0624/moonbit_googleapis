///|
test "build_auth_headers sets Bearer token" {
  let h = @core.build_auth_headers("mytoken")
  assert_eq(h.get("Authorization").unwrap(), "Bearer mytoken")
}

///|
test "merge_headers copies base then overrides with extra" {
  let base : Map[String, String] = {
    "Authorization": "Bearer a",
    "Accept": "application/json",
  }
  let extra : Map[String, String] = { "X-Goog-Test": "1", "Accept": "*/*" }
  let m = @core.merge_headers(base, extra)
  assert_eq(m.get("Authorization").unwrap(), "Bearer a")
  assert_eq(m.get("X-Goog-Test").unwrap(), "1")
  assert_eq(m.get("Accept").unwrap(), "*/*")
}
