///|
test "extract_next_page_token reads camelCase field" {
  let body =
    #|{"nextPageToken": "abc123", "files": []}
  assert_eq(@core.extract_next_page_token(body), Some("abc123"))
}

///|
test "extract_next_page_token returns None when absent" {
  let body =
    #|{"files": []}
  assert_true(@core.extract_next_page_token(body) is None)
}

///|
test "extract_next_page_token returns None for invalid JSON" {
  assert_true(@core.extract_next_page_token("{") is None)
}
