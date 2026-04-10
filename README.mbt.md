# ryota0624/googleapis

MoonBit client library for Google REST APIs.

Works on both **native** and **js** targets via HTTP/1.1.

## Features

- **HttpClient trait** with pluggable implementation (default: `mizchi/x/http`)
- **GoogleClient** - async token provider, auto-injected auth headers, error parsing
- **Discovery Document code generator** - parse Discovery JSON and emit typed MoonBit clients
  - Path / query / body parameters
  - Repeated (array) query parameters
  - POST request body serialization
  - Server-streaming responses
- **11 generated Google API clients** - Drive, Cloud Storage, Firestore, BigQuery, Pub/Sub, Logging, Cloud Tasks, Cloud Scheduler, Cloud Trace, Monitoring, Error Reporting

## Installation

```json
{
  "deps": {
    "ryota0624/googleapis": "0.2.0"
  }
}
```

## Quick Start

### Drive API - List files

```moonbit nocheck
///|
async fn main {
  let token = @sys.get_env_var("GOOGLE_ACCESS_TOKEN").unwrap()
  let client = @core.GoogleClient::new(fn() { token })
  let drive = @gdrive.DriveService::new(client)
  let file_list = drive.files_list(page_size=Some(10))
  match file_list.files {
    Some(files) =>
      for file in files {
        let name = file.name.unwrap_or("(no name)")
        let id = file.id.unwrap_or("(no id)")
        println(name + " (" + id + ")")
      }
    None => println("(no files)")
  }
}
```

### Cloud Storage - List buckets

```moonbit nocheck
///|
async fn main {
  let token = @sys.get_env_var("GOOGLE_ACCESS_TOKEN").unwrap()
  let project = @sys.get_env_var("GCP_PROJECT").unwrap()
  let client = @core.GoogleClient::new(fn() { token })
  let storage = @gcs.StorageService::new(client)
  let buckets = storage.buckets_list(
    project=Some(project),
    max_results=Some(20),
  )
  match buckets.items {
    Some(items) =>
      for bucket in items {
        println(bucket.name.unwrap_or("(unnamed)"))
      }
    None => println("(no buckets)")
  }
}
```

### Firestore - List documents

```moonbit nocheck
///|
async fn main {
  let token = @sys.get_env_var("GOOGLE_ACCESS_TOKEN").unwrap()
  let project = @sys.get_env_var("GCP_PROJECT").unwrap()
  let client = @core.GoogleClient::new(fn() { token })
  let firestore = @gfs.FirestoreService::new(client)
  let parent = "projects/" + project + "/databases/(default)/documents"
  let result = firestore.projects_databases_documents_list_documents(
    parent,
    "my-collection",
    page_size=Some(10),
  )
  match result.documents {
    Some(docs) =>
      for doc in docs {
        println(doc.name.unwrap_or("(unnamed)"))
      }
    None => println("(no documents)")
  }
}
```

### Run samples

```bash
export GOOGLE_ACCESS_TOKEN="$(gcloud auth print-access-token)"

# Drive
moon run sample/drive --target native

# Cloud Storage
export GCP_PROJECT="your-project-id"
moon run sample/storage --target native

# Firestore
export FIRESTORE_COLLECTION="your-collection"
moon run sample/firestore --target native
```

## Discovery Document Code Generation

Generate typed MoonBit clients from any Google API Discovery Document:

```bash
# Download a Discovery Document
curl -o /tmp/drive.json \
  "https://www.googleapis.com/discovery/v1/apis/drive/v3/rest"

# Generate MoonBit code
moon run discovery/ --target native -- /tmp/drive.json --output generated/drive

# With server-streaming metadata (for APIs like Firestore)
moon run discovery/ --target native -- /tmp/firestore.json \
  --output generated/firestore \
  --server-streaming streaming_methods.txt
```

The generator produces three files per service:

| File | Contents |
|------|----------|
| `types.mbt` | Structs with `FromJson` / `ToJson` derives |
| `client.mbt` | Async service methods with typed parameters |
| `helpers.mbt` | URL encoding and query-string utilities |

## Generated Services

| Service | Package | API |
|---------|---------|-----|
| Google Drive | `generated/drive` | Drive API v3 |
| Cloud Storage | `generated/storage` | Cloud Storage JSON API v1 |
| Cloud Firestore | `generated/firestore` | Firestore v1 |
| BigQuery | `generated/bigquery` | BigQuery API v2 |
| Cloud Pub/Sub | `generated/pubsub` | Pub/Sub v1 |
| Cloud Logging | `generated/logging` | Cloud Logging v2 |
| Cloud Tasks | `generated/cloudtasks` | Cloud Tasks v2 |
| Cloud Scheduler | `generated/cloudscheduler` | Cloud Scheduler v1 |
| Cloud Trace | `generated/cloudtrace` | Cloud Trace v2 |
| Cloud Monitoring | `generated/monitoring` | Monitoring v3 |
| Error Reporting | `generated/clouderrorreporting` | Error Reporting v1beta1 |

## Package Structure

| Package | Description |
|---------|-------------|
| `http/` | `HttpClient` trait, `HttpRequest` / `HttpResponse` types, default implementation |
| `core/` | `GoogleClient`, auth headers, error parsing, pagination |
| `discovery/` | Discovery Document parser + MoonBit code generator CLI |
| `generated/` | Generated service clients (one sub-package per API) |
| `sample/` | Usage examples (Drive, Storage, Firestore) |

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
