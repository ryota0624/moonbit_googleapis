///|
struct NoAuthHttpClient {
  inner : @http.DefaultHttpClient
}

///|
pub impl @http.HttpClient for NoAuthHttpClient with request(self, req) {
  let headers : Map[String, String] = {}
  for k, v in req.headers {
    if k != "Authorization" {
      headers[k] = v
    }
  }
  let req2 = @http.HttpRequest::{
    url: req.url,
    method_: req.method_,
    headers,
    body: req.body,
  }
  self.inner.request(req2)
}

///|
fn make_bucket(name : String) -> @gstorage.Bucket {
  let meta : Map[String, Json] = {}
  meta.set("name", Json::string(name))
  let bucket : @gstorage.Bucket = @json.from_json(Json::object(meta)) catch {
    _ => abort("Failed to construct bucket request")
  }
  bucket
}

///|
async fn try_delete_bucket(
  svc : @gstorage.StorageService,
  bucket : String,
) -> Unit {
  try {
    let _ = svc.buckets_delete(bucket)
  } catch {
    _ => ()
  }
}

///|
async fn start_emulator() -> (@gstorage.StorageService, String, @tc.Container) {
  let result = @tc.ContainerImage::new("fsouza/fake-gcs-server", "latest")
    .with_exposed_port(4443)
    .with_cmd(["-scheme", "http", "-public-host", "0.0.0.0:4443"])
    .with_wait_for(@tc.WaitStrategy::HttpGet("/storage/v1/b", 200))
    .with_wait_timeout(60)
    .start()
  let c = match result {
    Ok(c) => c
    Err(e) => abort("Failed to start fake-gcs-server: \{e}")
  }
  let port = match c.get_host_port(4443) {
    Some(p) => p
    None => abort("No port mapping for fake-gcs-server port 4443")
  }
  let base_url = "http://127.0.0.1:" + port.to_string() + "/storage/v1"
  let no_auth : &@http.HttpClient = NoAuthHttpClient::{
    inner: @http.DefaultHttpClient::new(),
  }
  let client = @core.GoogleClient::new(fn() { "dummy" }, http=Some(no_auth))
  let svc = @gstorage.StorageService::new(client, base_url~)
  (svc, "test-project", c)
}

///|
async fn scenario_bucket_lifecycle(
  svc : @gstorage.StorageService,
  project : String,
) -> Unit {
  let bucket = "e2e-storage-bucket-lifecycle"
  try_delete_bucket(svc, bucket)

  let created = svc.buckets_insert(make_bucket(bucket), project=Some(project))
  assert_eq(created.name, Some(bucket))

  let fetched = svc.buckets_get(bucket)
  assert_eq(fetched.name, Some(bucket))

  let listed = svc.buckets_list(project=Some(project), max_results=Some(100))
  let items : Array[@gstorage.Bucket] = listed.items.unwrap_or([])
  let found = items
    .iter()
    .any(fn(b) {
      match b.name {
        Some(n) => n == bucket
        None => false
      }
    })
  assert_true(found)

  let _ : Result[Json, _] = Ok(svc.buckets_delete(bucket)) catch {
    _ => Err(())
  }
  let result : Result[@gstorage.Bucket, _] = Ok(svc.buckets_get(bucket)) catch {
    _ => Err(())
  }
  assert_true(result is Err(_))
}

///|
async fn scenario_bucket_prefix_list(
  svc : @gstorage.StorageService,
  project : String,
) -> Unit {
  let bucket1 = "e2e-storage-list-prefix-a"
  let bucket2 = "e2e-storage-list-prefix-b"
  let prefix = "e2e-storage-list-prefix-"

  try_delete_bucket(svc, bucket1)
  try_delete_bucket(svc, bucket2)

  let _ = svc.buckets_insert(make_bucket(bucket1), project=Some(project))
  let _ = svc.buckets_insert(make_bucket(bucket2), project=Some(project))

  let listed = svc.buckets_list(
    project=Some(project),
    prefix=Some(prefix),
    max_results=Some(100),
  )
  let items : Array[@gstorage.Bucket] = listed.items.unwrap_or([])
  let found1 = items
    .iter()
    .any(fn(b) {
      match b.name {
        Some(n) => n == bucket1
        None => false
      }
    })
  let found2 = items
    .iter()
    .any(fn(b) {
      match b.name {
        Some(n) => n == bucket2
        None => false
      }
    })
  assert_true(found1)
  assert_true(found2)

  let _ : Result[Json, _] = Ok(svc.buckets_delete(bucket1)) catch {
    _ => Err(())
  }
  let _ : Result[Json, _] = Ok(svc.buckets_delete(bucket2)) catch {
    _ => Err(())
  }
}

///|
async test "storage e2e" {
  let (svc, project, c) = start_emulator()
  scenario_bucket_lifecycle(svc, project)
  scenario_bucket_prefix_list(svc, project)
  let _ = c.cleanup()
}
