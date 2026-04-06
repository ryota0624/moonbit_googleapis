///|
pub struct GoogleClient {
  http : &@http.HttpClient
  get_token : async () -> String
}

///|
pub fn GoogleClient::new(
  get_token : async () -> String,
  http? : &@http.HttpClient? = None,
) -> GoogleClient {
  let http_client = match http {
    Some(c) => c
    None => @http.DefaultHttpClient::new() as &@http.HttpClient
  }
  GoogleClient::{ http: http_client, get_token }
}

///|
pub async fn GoogleClient::request(
  self : GoogleClient,
  req : @http.HttpRequest,
) -> @http.HttpResponse raise @http.HttpError {
  let token = (self.get_token)() catch {
    e => raise @http.HttpError::NetworkError(e.to_string())
  }
  let auth_layer : Map[String, String] = {
    "Authorization": "Bearer " + token,
    "Accept": "application/json",
  }
  let headers = merge_headers(req.headers, auth_layer)
  let req2 = @http.HttpRequest::{
    url: req.url,
    method_: req.method_,
    headers,
    body: req.body,
  }
  self.http.request(req2) catch {
    e => raise e
  }
}
