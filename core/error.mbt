///|
pub(all) struct GoogleApiErrorDetail {
  code : Int
  message : String
  status : String?
} derive(FromJson(rename_fields="camelCase"))

///|
pub suberror GoogleApiError {
  ApiError(GoogleApiErrorDetail)
  HttpError(@http.HttpError)
  ParseError(String)
}

///|
pub fn parse_error_response(body : String) -> GoogleApiErrorDetail? {
  let j = @json.parse(body) catch { _ => return None }
  let root = match j {
    Json::Object(m) => m
    _ => return None
  }
  let err_j = match root.get("error") {
    Some(v) => v
    None => return None
  }
  Some(@json.from_json(err_j)) catch {
    _ => None
  }
}
