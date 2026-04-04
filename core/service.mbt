///|
fn strip_trailing_slashes(s : String) -> String {
  let mut r = s
  while r.length() > 0 {
    let n = r.length()
    if r[n - 1] == '/' {
      r = r[:n - 1].to_string()
    } else {
      break
    }
  }
  r
}

///|
fn join_base_url_path(base_url : String, path : String) -> String {
  let base = strip_trailing_slashes(base_url)
  let path_norm = if path.is_empty() {
    "/"
  } else if path.has_prefix("/") {
    path
  } else {
    "/" + path
  }
  base + path_norm
}

///|
pub struct GoogleService {
  base_url : String
  access_token : String
}

///|
pub fn GoogleService::new(
  access_token : String,
  base_url? : String? = None,
) -> GoogleService {
  let base = match base_url {
    Some(u) => u
    None => "https://www.googleapis.com"
  }
  GoogleService::{ base_url: base, access_token }
}

///|
pub fn GoogleService::execute(
  self : GoogleService,
  path : String,
  method_ : @http.HttpMethod,
  body? : String? = None,
  extra_headers? : Map[String, String]? = None,
) -> @http.HttpResponse raise GoogleApiError {
  let url = join_base_url_path(self.base_url, path)
  let auth = build_auth_headers(self.access_token)
  let headers = match extra_headers {
    Some(eh) => merge_headers(auth, eh)
    None => auth
  }
  let req = @http.HttpRequest::new(url, method_, headers, body~)
  let client = @http.DefaultHttpClient::new()
  let resp = client.request(req) catch {
    e => raise GoogleApiError::HttpError(e)
  }
  if resp.status_code >= 400 {
    match parse_error_response(resp.body) {
      Some(d) => raise GoogleApiError::ApiError(d)
      None =>
        raise GoogleApiError::ParseError(
          "failed to parse Google API error response",
        )
    }
  }
  resp
}
