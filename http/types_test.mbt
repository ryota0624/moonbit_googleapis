///|
test "HttpMethod show" {
  inspect(@http.parse_http_method("GET").unwrap().to_string(), content="GET")
  inspect(@http.parse_http_method("POST").unwrap().to_string(), content="POST")
  inspect(@http.parse_http_method("PUT").unwrap().to_string(), content="PUT")
  inspect(
    @http.parse_http_method("DELETE").unwrap().to_string(),
    content="DELETE",
  )
  inspect(
    @http.parse_http_method("PATCH").unwrap().to_string(),
    content="PATCH",
  )
}

///|
test "HttpRequest construction" {
  let h : Map[String, String] = { "Accept": "application/json" }
  let post = @http.parse_http_method("POST").unwrap()
  let req = @http.HttpRequest::new(
    "https://example.com/api",
    post,
    h,
    body=Some("{}"),
  )
  inspect(req.url, content="https://example.com/api")
  inspect(req.method_, content="POST")
  inspect(req.body, content="Some(\"{}\")")
}

///|
test "HttpResponse construction" {
  let h : Map[String, String] = { "content-type": "application/json" }
  let resp = @http.HttpResponse::new(200, h, "{\"ok\":true}")
  inspect(resp.status_code, content="200")
  inspect(resp.body, content="{\"ok\":true}")
}

///|
test "DefaultHttpClient is constructible" {
  let _c = @http.DefaultHttpClient::new()
  ignore(_c)
}
