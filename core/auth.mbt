///|
pub fn build_auth_headers(access_token : String) -> Map[String, String] {
  { "Authorization": "Bearer " + access_token }
}

///|
pub fn merge_headers(
  base : Map[String, String],
  extra : Map[String, String],
) -> Map[String, String] {
  let out : Map[String, String] = {}
  for k, v in base {
    out[k] = v
  }
  for k, v in extra {
    out[k] = v
  }
  out
}
