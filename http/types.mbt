///|
pub(all) enum HttpMethod {
  GET
  POST
  PUT
  DELETE
  PATCH
} derive(Show, Eq)

///|
pub(all) struct HttpRequest {
  url : String
  method_ : HttpMethod
  headers : Map[String, String]
  body : String?
}

///|
pub(all) struct HttpResponse {
  status_code : Int
  headers : Map[String, String]
  body : String
}

///|
pub(all) suberror HttpError {
  NetworkError(String)
  TimeoutError(String)
  InvalidUrl(String)
}

///|
/// Constructs [`NetworkError`] for callers outside this package (suberror
/// payloads cannot be built with `@http.HttpError::NetworkError(...)` elsewhere).
pub fn HttpError::network_message(msg : String) -> HttpError {
  HttpError::NetworkError(msg)
}

///|
pub fn parse_http_method(s : String) -> HttpMethod? {
  match s.to_upper() {
    "GET" => Some(GET)
    "POST" => Some(POST)
    "PUT" => Some(PUT)
    "DELETE" => Some(DELETE)
    "PATCH" => Some(PATCH)
    _ => None
  }
}

///|
pub fn HttpRequest::new(
  url : String,
  method_ : HttpMethod,
  headers : Map[String, String],
  body? : String? = None,
) -> HttpRequest {
  HttpRequest::{ url, method_, headers, body }
}

///|
pub fn HttpResponse::new(
  status_code : Int,
  headers : Map[String, String],
  body : String,
) -> HttpResponse {
  HttpResponse::{ status_code, headers, body }
}
