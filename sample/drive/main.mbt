///|
/// Lists the first few files in Google Drive using Drive API v3.
///
/// Prerequisites: set `GOOGLE_ACCESS_TOKEN` to a valid OAuth 2.0 access token
/// (e.g. from `gcloud auth print-access-token` or your OAuth client flow).

///|
async fn main {
  // 1. OAuth access token from the environment.
  let token = match @sys.get_env_var("GOOGLE_ACCESS_TOKEN") {
    None => {
      println(
        "error: GOOGLE_ACCESS_TOKEN is not set. Export a valid OAuth access token first.",
      )
      @sys.exit(1)
      panic()
    }
    Some(t) => t
  }
  try {
    // 2. Client for Drive v3; each request gets `Authorization: Bearer …`.
    let http_client = @http.DefaultHttpClient::new() as &@http.HttpClient
    let drive = @gdrive.DriveService::new(http_client, fn() { token })
    // 3. List files (HTTP + JSON decode in one call).
    let file_list = drive.files_list(page_size=Some(10))
    // 4. Print file names and ids (`files` may be absent in the payload).
    println("Files:")
    match file_list.files {
      None => println("  (no files in response)")
      Some(files) =>
        if files.is_empty() {
          println("  (empty list)")
        } else {
          for file in files {
            let name = file.name.unwrap_or("(no name)")
            let id = file.id.unwrap_or("(no id)")
            println("  " + name + " (" + id + ")")
          }
        }
    }
  } catch {
    @http.HttpError::NetworkError(msg) => println("network error: " + msg)
    @http.HttpError::TimeoutError(msg) => println("timeout: " + msg)
    @http.HttpError::InvalidUrl(msg) => println("invalid URL: " + msg)
  }
}
