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
    let drive = @drive.DriveService::new(token)
    // 3. Build `GET https://www.googleapis.com/drive/v3/files?pageSize=10`.
    let req = drive.files_list(page_size=10)
    // 4. Run the HTTP request (blocking implementation behind the trait).
    let client = @http.DefaultHttpClient::new()
    let resp = client.request(req)
    if resp.status_code != 200 {
      println(
        "HTTP error: status=" +
        resp.status_code.to_string() +
        " body=" +
        resp.body,
      )
      @sys.exit(1)
      panic()
    }
    // 5. Parse the JSON body into `FileList` (field names use camelCase in JSON).
    let json = @json.parse(resp.body) catch {
      e => {
        println("JSON parse error: " + e.to_string())
        @sys.exit(1)
        panic()
      }
    }
    let file_list : @drive.FileList = @json.from_json(json) catch {
      e => {
        println("JSON decode error: " + e.to_string())
        @sys.exit(1)
        panic()
      }
    }
    // 6. Print file names and ids (`files` may be absent in the payload).
    println("Files:")
    match file_list.files {
      None => println("  (no files in response)")
      Some(files) =>
        if files.is_empty() {
          println("  (empty list)")
        } else {
          for file in files {
            println("  " + file.name + " (" + file.id + ")")
          }
        }
    }
  } catch {
    @http.HttpError::NetworkError(msg) => println("network error: " + msg)
    @http.HttpError::TimeoutError(msg) => println("timeout: " + msg)
    @http.HttpError::InvalidUrl(msg) => println("invalid URL: " + msg)
  }
}
