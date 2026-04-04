///|
pub(all) struct PagedResponse[T] {
  items : Array[T]
  next_page_token : String?
}

///|
pub fn extract_next_page_token(json_body : String) -> String? {
  let j = @json.parse(json_body) catch { _ => return None }
  let root = match j {
    Json::Object(m) => m
    _ => return None
  }
  match root.get("nextPageToken") {
    Some(Json::String(s)) => Some(s)
    Some(Json::Null) | None => None
    Some(_) => None
  }
}
