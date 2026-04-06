# ryota0624/googleapis

MoonBit client library for Google REST APIs.

Works on both **native** and **js** targets via HTTP/1.1 (Google REST APIs do not require HTTP/2).

## Features

- **HttpClient trait** with pluggable implementation (default: `mizchi/x/http`)
- **Google API common layer** - auth headers, error parsing, pagination
- **Discovery Document code generator** - parse Discovery JSON and generate MoonBit types + client code
- **Drive API v3** - files.list, files.get, files.create
- **derive(FromJson)** with `rename_fields="camelCase"` for automatic JSON deserialization

## Installation

Add to your `moon.mod.json`:

```json
{
  "deps": {
    "ryota0624/googleapis": "0.1.0"
  }
}
```

## Quick Start

### Drive API - List files

```moonbit nocheck
///|
async fn main {
  let token = @sys.get_env_var("GOOGLE_ACCESS_TOKEN").unwrap()
  let drive = @drive.DriveService::new(token)
  let http = @http.DefaultHttpClient::new()
  let client = http as &@http.HttpClient
  let file_list = drive.files_list(client, page_size=Some(10))
  match file_list.files {
    Some(files) =>
      for file in files {
        println(file.name + " (" + file.id + ")")
      }
    None => println("(no files)")
  }
}
```

### Run the sample

```bash
export GOOGLE_ACCESS_TOKEN="$(gcloud auth print-access-token)"
moon run sample/ --target native
```

### Discovery Document code generation

Generate MoonBit types from a Google API Discovery Document:

```bash
curl -o /tmp/drive.json "https://www.googleapis.com/discovery/v1/apis/drive/v3/rest"
moon run discovery/ --target native -- /tmp/drive.json
```

## Package Structure

| Package | Description |
|---------|-------------|
| `http/` | `HttpClient` trait, `HttpRequest`/`HttpResponse` types, `DefaultHttpClient` |
| `core/` | `GoogleService`, auth headers, error parsing, pagination helpers |
| `discovery/` | Discovery Document parser + MoonBit code generator CLI |
| `services/drive/` | Drive API v3 client (`DriveService`, `DriveFile`, `FileList`) |
| `sample/` | Usage example (Drive API file listing) |

## API Overview

### HTTP Layer

```moonbit nocheck
// Pluggable HTTP client

///|
pub(open) trait HttpClient {
  async request(Self, HttpRequest) -> HttpResponse raise HttpError
}

// Default implementation using mizchi/x/http

///|
let client = DefaultHttpClient::new()

///|
let resp = client.request(req)
```

### Drive API

```moonbit nocheck
///|
let client = DefaultHttpClient::new() as &HttpClient

///|
let drive = DriveService::new(client, access_token)

// List files

///|
let list = drive.files_list(
  page_size=Some(10),
  q=Some("mimeType='application/pdf'"),
)

// Get file metadata

///|
let file = drive.files_get(file_id)

// Create file (metadata only)

///|
let created = drive.files_create(
  "report.txt",
  "text/plain",
  parents=Some(["folder_id"]),
)
```

### Google Service (generic)

```moonbit nocheck
///|
let svc = GoogleService::new(
  access_token,
  base_url="https://www.googleapis.com",
)

///|
let resp = svc.execute("/drive/v3/files", @http.HttpMethod::GET)
```

## Authentication

This library does **not** handle token acquisition. Pass an access token string obtained from:

- [ryota0624/googleauth](https://github.com/ryota0624/moonbit_googleauth) (MoonBit OAuth2 library)
- `gcloud auth print-access-token`
- Any OAuth2 flow

## Dependencies

- `mizchi/x` - HTTP client (native + js)
- `moonbitlang/async` - Async runtime

## License

Apache-2.0
