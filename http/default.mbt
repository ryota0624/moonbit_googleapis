///|
fn extract_host_url(url : String) -> String {
  let start = if url.has_prefix("https://") {
    8
  } else if url.has_prefix("http://") {
    7
  } else {
    0
  }
  let mut path_start = -1
  for i = start; i < url.length(); i = i + 1 {
    if url[i].to_int() == '/'.to_int() {
      path_start = i
      break
    }
  }
  if path_start == -1 {
    url
  } else {
    url[:path_start].to_string()
  }
}

///|
fn extract_path_from_url(url : String) -> String {
  let start = if url.has_prefix("https://") {
    8
  } else if url.has_prefix("http://") {
    7
  } else {
    0
  }
  let mut path_start = -1
  for i = start; i < url.length(); i = i + 1 {
    if url[i].to_int() == '/'.to_int() {
      path_start = i
      break
    }
  }
  if path_start == -1 {
    "/"
  } else {
    url[path_start:].to_string()
  }
}

///|
fn headers_with_patch_override(
  headers : Map[String, String],
) -> Map[String, String] {
  let out : Map[String, String] = {}
  for k, v in headers {
    out[k] = v
  }
  out["x-http-method-override"] = "PATCH"
  out
}

///|
fn to_xhttp_method(m : HttpMethod) -> @xhttp.RequestMethod {
  match m {
    GET => @xhttp.RequestMethod::Get
    POST => @xhttp.RequestMethod::Post
    PUT => @xhttp.RequestMethod::Put
    DELETE => @xhttp.RequestMethod::Delete
    PATCH => @xhttp.RequestMethod::Patch
  }
}

///|
fn response_from_xhttp(resp : @xhttp.Response, body : String) -> HttpResponse {
  HttpResponse::{ status_code: resp.code, headers: resp.headers, body }
}

///|
fn read_text_response(
  resp : @xhttp.Response,
  data : &@io.Data,
) -> HttpResponse raise HttpError {
  let body = data.text() catch {
    _ => raise HttpError::NetworkError("invalid response body encoding")
  }
  response_from_xhttp(resp, body)
}

///|
async fn client_request_skip_body(
  req : HttpRequest,
  meth : HttpMethod,
) -> HttpResponse raise HttpError {
  let host = extract_host_url(req.url)
  let path = extract_path_from_url(req.url)
  let client = @xhttp.Client::new(host, headers=req.headers) catch {
    e => raise HttpError::NetworkError(e.to_string())
  }
  client.request(to_xhttp_method(meth), path, extra_headers={}) catch {
    e => {
      client.close()
      raise HttpError::NetworkError(e.to_string())
    }
  }
  client.flush() catch {
    e => {
      client.close()
      raise HttpError::NetworkError(e.to_string())
    }
  }
  let resp = client.end_request() catch {
    e => {
      client.close()
      raise HttpError::NetworkError(e.to_string())
    }
  }
  client.skip_response_body() catch {
    e => {
      client.close()
      raise HttpError::NetworkError(e.to_string())
    }
  }
  client.close()
  response_from_xhttp(resp, "")
}

///|
pub async fn default_http_request(
  req : HttpRequest,
) -> HttpResponse raise HttpError {
  match req.method_ {
    GET => {
      let (resp, data) = @xhttp.get(req.url, headers=req.headers) catch {
        e => raise HttpError::NetworkError(e.to_string())
      }
      read_text_response(resp, data)
    }
    POST => {
      let payload : String = match req.body {
        Some(s) => s
        None => ""
      }
      let (resp, data) = @xhttp.post(req.url, payload, headers=req.headers) catch {
        e => raise HttpError::NetworkError(e.to_string())
      }
      read_text_response(resp, data)
    }
    PUT => {
      let payload : String = match req.body {
        Some(s) => s
        None => ""
      }
      let (resp, data) = @xhttp.put(req.url, payload, headers=req.headers) catch {
        e => raise HttpError::NetworkError(e.to_string())
      }
      read_text_response(resp, data)
    }
    DELETE => client_request_skip_body(req, DELETE)
    PATCH =>
      match req.body {
        Some(payload) => {
          let headers = headers_with_patch_override(req.headers)
          let (resp, data) = @xhttp.post(req.url, payload, headers~) catch {
            e => raise HttpError::NetworkError(e.to_string())
          }
          read_text_response(resp, data)
        }
        None => client_request_skip_body(req, PATCH)
      }
  }
}

///|
pub struct DefaultHttpClient {}

///|
pub fn DefaultHttpClient::new() -> DefaultHttpClient {
  DefaultHttpClient::{  }
}

///|
pub impl HttpClient for DefaultHttpClient with request(_self, req) {
  default_http_request(req)
}
