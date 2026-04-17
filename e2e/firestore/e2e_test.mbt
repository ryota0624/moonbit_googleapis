///|
fn sv(s : String) -> @gfs.Value {
  @gfs.Value::{
    null_value: None,
    boolean_value: None,
    integer_value: None,
    double_value: None,
    timestamp_value: None,
    string_value: Some(s),
    bytes_value: None,
    reference_value: None,
    geo_point_value: None,
    array_value: None,
    map_value: None,
    field_reference_value: None,
    variable_reference_value: None,
    function_value: None,
    pipeline_value: None,
  }
}

///|
fn iv(n : Int) -> @gfs.Value {
  @gfs.Value::{
    null_value: None,
    boolean_value: None,
    integer_value: Some(n.to_string()),
    double_value: None,
    timestamp_value: None,
    string_value: None,
    bytes_value: None,
    reference_value: None,
    geo_point_value: None,
    array_value: None,
    map_value: None,
    field_reference_value: None,
    variable_reference_value: None,
    function_value: None,
    pipeline_value: None,
  }
}

///|
fn make_doc(fields : Map[String, @gfs.Value]) -> @gfs.Document {
  @gfs.Document::{
    name: None,
    fields: Some(fields),
    create_time: None,
    update_time: None,
  }
}

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
async fn try_delete(svc : @gfs.FirestoreService, doc_name : String) -> Unit {
  try {
    let _ = svc.delete_document(doc_name)
  } catch {
    _ => ()
  }
}

///|
async fn start_emulator() -> (
  @gfs.FirestoreService,
  String,
  String,
  @tc.Container,
) {
  let result = @tc.ContainerImage::new("google/cloud-sdk", "emulators")
    .with_exposed_port(8081)
    .with_cmd([
      "gcloud", "beta", "emulators", "firestore", "start", "--host-port=0.0.0.0:8081",
      "--project=test-project",
    ])
    .with_wait_for(@tc.WaitStrategy::HttpGet("/", 200))
    .with_wait_timeout(60)
    .start()
  let c = match result {
    Ok(c) => c
    Err(e) => abort("Failed to start Firestore emulator: \{e}")
  }
  let port = match c.get_host_port(8081) {
    Some(p) => p
    None => abort("No port mapping for Firestore emulator port 8081")
  }
  let base_url = "http://127.0.0.1:" + port.to_string()
  let no_auth : &@http.HttpClient = NoAuthHttpClient::{
    inner: @http.DefaultHttpClient::new(),
  }
  let client = @core.GoogleClient::new(fn() { "dummy" }, http=Some(no_auth))
  let svc = @gfs.FirestoreService::new(client, base_url~)
  let database = "projects/test-project/databases/(default)"
  let parent = database + "/documents"
  (svc, database, parent, c)
}

///|
async fn scenario_create_get(
  svc : @gfs.FirestoreService,
  parent : String,
) -> Unit {
  let collection = "e2e_googleapis"
  let doc_id = "create_get"
  let doc_name = parent + "/" + collection + "/" + doc_id
  try_delete(svc, doc_name)
  let doc = make_doc({ "name": sv("Alice"), "age": iv(25) })
  let created = svc.create_document(
    parent,
    collection,
    doc,
    document_id=Some(doc_id),
  )
  assert_true(created.name is Some(_))
  let fetched = svc.get_document(doc_name)
  let fields = fetched.fields.unwrap()
  let name_val = fields.get("name")
  assert_true(name_val is Some(_))
  assert_eq(name_val.unwrap().string_value, Some("Alice"))
  try_delete(svc, doc_name)
}

///|
async fn scenario_list(svc : @gfs.FirestoreService, parent : String) -> Unit {
  let collection = "e2e_googleapis"
  let doc_id = "list_test"
  let doc_name = parent + "/" + collection + "/" + doc_id
  try_delete(svc, doc_name)
  let _ = svc.create_document(
    parent,
    collection,
    make_doc({ "tag": sv("list") }),
    document_id=Some(doc_id),
  )
  let resp = svc.list_documents(parent, collection, page_size=Some(100))
  let documents : Array[@gfs.Document] = resp.documents.unwrap_or([])
  let found = documents
    .iter()
    .any(fn(d) {
      match d.name {
        Some(n) => n.contains(doc_id)
        None => false
      }
    })
  assert_true(found)
  try_delete(svc, doc_name)
}

///|
async fn scenario_update(svc : @gfs.FirestoreService, parent : String) -> Unit {
  let collection = "e2e_googleapis"
  let doc_id = "update_test"
  let doc_name = parent + "/" + collection + "/" + doc_id
  try_delete(svc, doc_name)
  let _ = svc.create_document(
    parent,
    collection,
    make_doc({ "name": sv("Alice"), "age": iv(25) }),
    document_id=Some(doc_id),
  )
  let updated_doc = @gfs.Document::{
    name: Some(doc_name),
    fields: Some({ "name": sv("Alice"), "age": iv(26) }),
    create_time: None,
    update_time: None,
  }
  let _ = svc.update_document(doc_name, updated_doc)
  let fetched = svc.get_document(doc_name)
  let fields = fetched.fields.unwrap()
  let age_val = fields.get("age")
  assert_eq(age_val.unwrap().integer_value, Some("26"))
  try_delete(svc, doc_name)
}

///|
async fn scenario_delete(svc : @gfs.FirestoreService, parent : String) -> Unit {
  let collection = "e2e_googleapis"
  let doc_id = "delete_test"
  let doc_name = parent + "/" + collection + "/" + doc_id
  let _ = svc.create_document(
    parent,
    collection,
    make_doc({ "x": sv("y") }),
    document_id=Some(doc_id),
  )
  let _ = svc.delete_document(doc_name)
  let result : Result[@gfs.Document, _] = Ok(svc.get_document(doc_name)) catch {
    _ => Err(())
  }
  assert_true(result is Err(_))
}

///|
async fn scenario_run_query(
  svc : @gfs.FirestoreService,
  parent : String,
) -> Unit {
  let collection = "e2e_googleapis"
  let active_id = "query_active"
  let inactive_id = "query_inactive"
  let active_name = parent + "/" + collection + "/" + active_id
  let inactive_name = parent + "/" + collection + "/" + inactive_id
  try_delete(svc, active_name)
  try_delete(svc, inactive_name)
  let _ = svc.create_document(
    parent,
    collection,
    make_doc({ "status": sv("active") }),
    document_id=Some(active_id),
  )
  let _ = svc.create_document(
    parent,
    collection,
    make_doc({ "status": sv("inactive") }),
    document_id=Some(inactive_id),
  )
  let query = @gfs.StructuredQuery::{
    select: None,
    from: Some([
      @gfs.CollectionSelector::{
        collection_id: Some(collection),
        all_descendants: None,
      },
    ]),
    where_: Some(@gfs.Filter::{
      composite_filter: None,
      field_filter: Some(@gfs.FieldFilter::{
        field: Some(@gfs.FieldReference::{ field_path: Some("status") }),
        op: Some("EQUAL"),
        value: Some(sv("active")),
      }),
      unary_filter: None,
    }),
    order_by: None,
    start_at: None,
    end_at: None,
    offset: None,
    limit: None,
    find_nearest: None,
  }
  let req = @gfs.RunQueryRequest::{
    parent: None,
    structured_query: Some(query),
    transaction: None,
    new_transaction: None,
    read_time: None,
    explain_options: None,
  }
  let responses : Array[@gfs.RunQueryResponse] = svc.run_query(parent, req)
  let found_active = responses
    .iter()
    .any(fn(r) {
      match r.document {
        Some(d) =>
          match d.name {
            Some(n) => n.contains(active_id)
            None => false
          }
        None => false
      }
    })
  let found_inactive = responses
    .iter()
    .any(fn(r) {
      match r.document {
        Some(d) =>
          match d.name {
            Some(n) => n.contains(inactive_id)
            None => false
          }
        None => false
      }
    })
  assert_true(found_active)
  assert_true(!found_inactive)
  try_delete(svc, active_name)
  try_delete(svc, inactive_name)
}

///|
async fn scenario_commit(
  svc : @gfs.FirestoreService,
  database : String,
  parent : String,
) -> Unit {
  let collection = "e2e_googleapis"
  let doc_id = "commit_test"
  let doc_name = parent + "/" + collection + "/" + doc_id
  try_delete(svc, doc_name)
  let write = @gfs.Write::{
    update: Some(@gfs.Document::{
      name: Some(doc_name),
      fields: Some({ "source": sv("commit") }),
      create_time: None,
      update_time: None,
    }),
    delete: None,
    transform: None,
    update_mask: None,
    update_transforms: None,
    current_document: None,
  }
  let _ = svc.commit(database, @gfs.CommitRequest::{
    database: None,
    writes: Some([write]),
    transaction: None,
  })
  let fetched = svc.get_document(doc_name)
  let fields = fetched.fields.unwrap()
  let src = fields.get("source")
  assert_eq(src.unwrap().string_value, Some("commit"))
  try_delete(svc, doc_name)
}

///|
async test "firestore e2e" {
  let (svc, database, parent, c) = start_emulator()
  scenario_create_get(svc, parent)
  scenario_list(svc, parent)
  scenario_update(svc, parent)
  scenario_delete(svc, parent)
  scenario_run_query(svc, parent)
  scenario_commit(svc, database, parent)
  let _ = c.cleanup()
}
