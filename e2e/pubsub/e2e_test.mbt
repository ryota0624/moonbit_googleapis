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
fn make_topic(name : String) -> @gps.Topic {
  let meta : Map[String, Json] = {}
  meta.set("name", Json::string(name))
  (@json.from_json(Json::object(meta)) : @gps.Topic) catch {
    _ => abort("Failed to construct topic request")
  }
}

///|
fn make_subscription(name : String, topic : String) -> @gps.Subscription {
  let meta : Map[String, Json] = {}
  meta.set("name", Json::string(name))
  meta.set("topic", Json::string(topic))
  (@json.from_json(Json::object(meta)) : @gps.Subscription) catch {
    _ => abort("Failed to construct subscription request")
  }
}

///|
async fn try_delete_topic(svc : @gps.PubsubService, topic : String) -> Unit {
  try {
    let _ = svc.delete_topic(topic)
  } catch {
    _ => ()
  }
}

///|
async fn try_delete_subscription(
  svc : @gps.PubsubService,
  subscription : String,
) -> Unit {
  try {
    let _ = svc.delete_subscription(subscription)
  } catch {
    _ => ()
  }
}

///|
async fn start_emulator() -> (@gps.PubsubService, String, @tc.Container) {
  let result = @tc.ContainerImage::new("google/cloud-sdk", "emulators")
    .with_exposed_port(8085)
    .with_cmd([
      "gcloud", "beta", "emulators", "pubsub", "start", "--host-port=0.0.0.0:8085",
      "--project=test-project",
    ])
    .with_wait_for(
      @tc.WaitStrategy::HttpGet("/v1/projects/test-project/topics", 200),
    )
    .with_wait_timeout(60)
    .start()
  let c = match result {
    Ok(c) => c
    Err(e) => abort("Failed to start Pub/Sub emulator: \{e}")
  }
  let port = match c.get_host_port(8085) {
    Some(p) => p
    None => abort("No port mapping for Pub/Sub emulator port 8085")
  }
  let base_url = "http://127.0.0.1:" + port.to_string()
  let no_auth : &@http.HttpClient = NoAuthHttpClient::{
    inner: @http.DefaultHttpClient::new(),
  }
  let client = @core.GoogleClient::new(fn() { "dummy" }, http=Some(no_auth))
  let svc = @gps.PubsubService::new(client, base_url~)
  (svc, "projects/test-project", c)
}

///|
async fn scenario_topic_lifecycle(
  svc : @gps.PubsubService,
  project : String,
) -> Unit {
  let topic = project + "/topics/e2e-topic-lifecycle"
  try_delete_topic(svc, topic)

  let created = svc.create_topic(topic, make_topic(topic))
  assert_eq(created.name, Some(topic))

  let fetched = svc.get_topic(topic)
  assert_eq(fetched.name, Some(topic))

  let listed = svc.list_topics(project, page_size=Some(100))
  let topics : Array[@gps.Topic] = listed.topics.unwrap_or([])
  let found = topics
    .iter()
    .any(fn(t) {
      match t.name {
        Some(n) => n == topic
        None => false
      }
    })
  assert_true(found)

  let _ : Result[Json, _] = Ok(svc.delete_topic(topic)) catch { _ => Err(()) }
  let result : Result[@gps.Topic, _] = Ok(svc.get_topic(topic)) catch {
    _ => Err(())
  }
  assert_true(result is Err(_))
}

///|
async fn scenario_subscription_publish_pull_ack(
  svc : @gps.PubsubService,
  project : String,
) -> Unit {
  let topic = project + "/topics/e2e-topic-flow"
  let subscription = project + "/subscriptions/e2e-sub-flow"
  try_delete_subscription(svc, subscription)
  try_delete_topic(svc, topic)

  let _ = svc.create_topic(topic, make_topic(topic))
  let _ = svc.create_subscription(
    subscription,
    make_subscription(subscription, topic),
  )

  let published = svc.publish(topic, @gps.PublishRequest::{
    topic: Some(topic),
    messages: Some([
      @gps.PubsubMessage::{
        data: Some("aGVsbG8tcHVic3Vi"),
        attributes: Some({ "kind": "e2e" }),
        message_id: None,
        publish_time: None,
        ordering_key: None,
      },
    ]),
  })
  assert_true(published.message_ids.unwrap_or([]).length() > 0)

  let pulled = svc.pull(subscription, @gps.PullRequest::{
    subscription: Some(subscription),
    return_immediately: Some(false),
    max_messages: Some(1),
  })
  let received = pulled.received_messages.unwrap_or([])
  assert_true(!received.is_empty())

  let ack_id = match received[0].ack_id {
    Some(id) => id
    None => abort("Pulled message does not include ack_id")
  }
  let _ : Result[Json, _] = Ok(
    svc.acknowledge(subscription, @gps.AcknowledgeRequest::{
      subscription: Some(subscription),
      ack_ids: Some([ack_id]),
    }),
  ) catch {
    _ => Err(())
  }

  let _ : Result[Json, _] = Ok(svc.delete_subscription(subscription)) catch {
    _ => Err(())
  }
  let _ : Result[Json, _] = Ok(svc.delete_topic(topic)) catch { _ => Err(()) }
}

///|
async test "pubsub e2e" {
  let (svc, project, c) = start_emulator()
  scenario_topic_lifecycle(svc, project)
  scenario_subscription_publish_pull_ack(svc, project)
  let _ = c.cleanup()
}
