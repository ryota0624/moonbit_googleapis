///|
/// Lists documents in a Firestore collection.
///
/// Prerequisites:
///   export GOOGLE_ACCESS_TOKEN="$(gcloud auth print-access-token)"
///   export GCP_PROJECT="your-project-id"
///   export FIRESTORE_COLLECTION="your-collection-name"

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
  let collection = match @sys.get_env_var("FIRESTORE_COLLECTION") {
    None => {
      println("error: FIRESTORE_COLLECTION is not set.")
      @sys.exit(1)
      panic()
    }
    Some(c) => c
  }
  try {
    let client = @core.GoogleClient::new(fn() { token })
    let firestore = @gfs.FirestoreService::new(client)
    let parent = "projects/" + project + "/databases/(default)/documents"
    let result = firestore.list_documents(
      parent,
      collection,
      page_size=Some(10),
    )
    println("Documents in " + collection + ":")
    match result.documents {
      None => println("  (no documents)")
      Some(docs) =>
        if docs.is_empty() {
          println("  (empty collection)")
        } else {
          for doc in docs {
            let name = match doc.name {
              Some(n) => n
              None => "(unnamed)"
            }
            println("  " + name)
          }
        }
    }
  } catch {
    @http.HttpError::NetworkError(msg) => println("network error: " + msg)
    @http.HttpError::TimeoutError(msg) => println("timeout: " + msg)
    @http.HttpError::InvalidUrl(msg) => println("invalid URL: " + msg)
  }
}
