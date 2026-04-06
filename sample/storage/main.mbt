///|
/// Lists buckets in a Google Cloud project using Cloud Storage API.
///
/// Prerequisites:
///   export GOOGLE_ACCESS_TOKEN="$(gcloud auth print-access-token)"
///   export GCP_PROJECT="your-project-id"

///|
async fn main {
  let token = match @sys.get_env_var("GOOGLE_ACCESS_TOKEN") {
    None => {
      println("error: GOOGLE_ACCESS_TOKEN is not set.")
      @sys.exit(1)
      panic()
    }
    Some(t) => t
  }
  let project = match @sys.get_env_var("GCP_PROJECT") {
    None => {
      println("error: GCP_PROJECT is not set.")
      @sys.exit(1)
      panic()
    }
    Some(p) => p
  }
  try {
    let client = @core.GoogleClient::new(fn() { token })
    let storage = @gcs.StorageService::new(client)
    let buckets = storage.buckets_list(
      project=Some(project),
      max_results=Some(20),
    )
    println("Buckets:")
    match buckets.items {
      None => println("  (no buckets)")
      Some(items) =>
        for bucket in items {
          let name = match bucket.name {
            Some(n) => n
            None => "(unnamed)"
          }
          let location = match bucket.location {
            Some(l) => l
            None => "?"
          }
          println("  " + name + " (" + location + ")")
        }
    }
  } catch {
    @http.HttpError::NetworkError(msg) => println("network error: " + msg)
    @http.HttpError::TimeoutError(msg) => println("timeout: " + msg)
    @http.HttpError::InvalidUrl(msg) => println("invalid URL: " + msg)
  }
}
