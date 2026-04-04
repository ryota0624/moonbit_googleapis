///|
test "parse_error_response parses Google error JSON" {
  let body =
    #|{
    #|  "error": {
    #|    "code": 403,
    #|    "message": "Permission denied",
    #|    "status": "PERMISSION_DENIED"
    #|  }
    #|}
  let d = @core.parse_error_response(body).unwrap()
  assert_eq(d.code, 403)
  assert_eq(d.message, "Permission denied")
  assert_eq(d.status, Some("PERMISSION_DENIED"))
}

///|
test "parse_error_response returns None for invalid JSON" {
  assert_true(@core.parse_error_response("not json") is None)
}

///|
test "parse_error_response returns None when error object missing fields" {
  let body =
    #|{"error": {"code": 400}}
  assert_true(@core.parse_error_response(body) is None)
}

///|
test "parse_error_response allows missing status field" {
  let body =
    #|{
    #|  "error": {
    #|    "code": 404,
    #|    "message": "Not found"
    #|  }
    #|}
  let d = @core.parse_error_response(body).unwrap()
  assert_eq(d.code, 404)
  assert_eq(d.message, "Not found")
  assert_eq(d.status, None)
}
