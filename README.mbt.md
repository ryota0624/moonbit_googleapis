# ryota0624/googleapis

MoonBit client library for Google REST APIs.

Works on both **native** and **js** targets via HTTP/1.1.

## Features

- **HttpClient trait** with pluggable implementation (default: `mizchi/x/http`)
- **GoogleClient** - async token provider, auto-injected auth headers, error parsing
- **Protobuf-based code generator** - generate typed MoonBit clients from buf Image JSON
  - Path / query / body parameters
  - Repeated (array) query parameters
  - POST request body serialization
  - Server-streaming responses
- **10 generated Google API clients** - Cloud Storage, Firestore, BigQuery Storage, Pub/Sub, Logging, Cloud Tasks, Cloud Scheduler, Cloud Trace, Monitoring, Error Reporting

## Installation

```json
{
  "deps": {
    "ryota0624/googleapis": "0.2.3"
  }
}
```

## Quick Start

### Firestore - List documents

```moonbit nocheck
///|
async fn main {
  let token = @sys.get_env_var("GOOGLE_ACCESS_TOKEN").unwrap()
  let project = @sys.get_env_var("GCP_PROJECT").unwrap()
  let client = @core.GoogleClient::new(fn() { token })
  let firestore = @gfs.FirestoreService::new(client)
  let parent = "projects/" + project + "/databases/(default)/documents"
  let result = firestore.list_documents(parent, "my-collection", page_size=Some(10))
  match result.documents {
    Some(docs) =>
      for doc in docs {
        println(doc.name.unwrap_or("(unnamed)"))
      }
    None => println("(no documents)")
  }
}
```

### Cloud Storage - List objects

```moonbit nocheck
///|
async fn main {
  let token = @sys.get_env_var("GOOGLE_ACCESS_TOKEN").unwrap()
  let project = @sys.get_env_var("GCP_PROJECT").unwrap()
  let client = @core.GoogleClient::new(fn() { token })
  let storage = @gcs.StorageService::new(client)
  let result = storage.objects_list("my-bucket")
  match result.items {
    Some(items) =>
      for obj in items {
        println(obj.name.unwrap_or("(unnamed)"))
      }
    None => println("(no objects)")
  }
}
```

### Run samples

```bash
export GOOGLE_ACCESS_TOKEN="$(gcloud auth print-access-token)"
export GCP_PROJECT="your-project-id"

# Firestore
export FIRESTORE_COLLECTION="your-collection"
moon run sample/firestore --target native

# Cloud Storage
moon run sample/storage --target native
```

## Code Generator

Generate typed MoonBit clients from the [googleapis](https://github.com/googleapis/googleapis) protobuf repository using [buf](https://buf.build):

```bash
# Build the buf Image (one-time, cached in /tmp)
cd googleapis && buf build . --exclude-path preview --output json -o /tmp/googleapis-image.json

# Generate a client for a specific API
moon run discovery --target native -- google.firestore.v1 --output generated/firestore
moon run discovery --target native -- google.pubsub.v1 --output generated/pubsub

# Regenerate all bundled clients
./scripts/generate_all.sh
```

**CLI options:**

| Option | Default | Description |
|--------|---------|-------------|
| `<proto_package>` | (required) | e.g. `google.firestore.v1` |
| `--image <path>` | `/tmp/googleapis-image.json` | Path to buf Image JSON |
| `--output <dir>` | stdout | Output directory |

The generator produces three files per service:

| File | Contents |
|------|----------|
| `types.mbt` | Structs with `FromJson` / `ToJson` derives |
| `client.mbt` | Async service methods with typed parameters |
| `helpers.mbt` | URL encoding and query-string utilities |

## Generated Services

| Service | Package | Proto package |
|---------|---------|---------------|
| Cloud Storage | `generated/storage` | `google.storage.v2` |
| Cloud Firestore | `generated/firestore` | `google.firestore.v1` |
| BigQuery Storage | `generated/bigquery` | `google.cloud.bigquery.storage.v1` |
| Cloud Pub/Sub | `generated/pubsub` | `google.pubsub.v1` |
| Cloud Logging | `generated/logging` | `google.logging.v2` |
| Cloud Tasks | `generated/cloudtasks` | `google.cloud.tasks.v2` |
| Cloud Scheduler | `generated/cloudscheduler` | `google.cloud.scheduler.v1` |
| Cloud Trace | `generated/cloudtrace` | `google.devtools.cloudtrace.v2` |
| Cloud Monitoring | `generated/monitoring` | `google.monitoring.v3` |
| Error Reporting | `generated/clouderrorreporting` | `google.devtools.clouderrorreporting.v1beta1` |

## Package Structure

| Package | Description |
|---------|-------------|
| `http/` | `HttpClient` trait, `HttpRequest` / `HttpResponse` types, default implementation |
| `core/` | `GoogleClient`, auth headers, error parsing, pagination |
| `discovery/` | Protobuf-based MoonBit code generator CLI |
| `generated/` | Generated service clients (one sub-package per API) |
| `sample/` | Usage examples (Storage, Firestore) |

## Authentication

This library does **not** handle token acquisition. Pass an access token obtained from:

- [ryota0624/googleauth](https://github.com/ryota0624/moonbit_googleauth) (MoonBit OAuth2 library)
- `gcloud auth print-access-token`
- Any OAuth2 flow

`GoogleClient` accepts a token provider function, so tokens can be refreshed dynamically:

```moonbit nocheck
///|
let client = @core.GoogleClient::new(fn() { get_fresh_token() })
```

## Dependencies

- [`mizchi/x`](https://mooncakes.io/docs/#/mizchi/x/) - HTTP client (native + js)
- [`moonbitlang/async`](https://mooncakes.io/docs/#/moonbitlang/async/) - Async runtime

## License

Apache-2.0
