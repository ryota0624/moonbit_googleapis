///|
test "DriveFile from_json parses Drive v3 file JSON" {
  let raw =
    #|{
    #|  "id": "fid1",
    #|  "name": "Doc",
    #|  "mimeType": "text/plain",
    #|  "kind": "drive#file",
    #|  "size": "12",
    #|  "createdTime": "2020-01-01T00:00:00.000Z",
    #|  "modifiedTime": "2020-01-02T00:00:00.000Z",
    #|  "parents": ["root"]
    #|}
  let j = @json.parse(raw) catch { _ => panic() }
  let f : @drive.DriveFile = @json.from_json(j)
  assert_eq(f.id, "fid1")
  assert_eq(f.name, "Doc")
  assert_eq(f.mime_type, "text/plain")
  assert_eq(f.kind, Some("drive#file"))
  assert_eq(f.size, Some("12"))
  assert_eq(f.created_time, Some("2020-01-01T00:00:00.000Z"))
  assert_eq(f.modified_time, Some("2020-01-02T00:00:00.000Z"))
  assert_eq(f.parents.unwrap().length(), 1)
  assert_eq(f.parents.unwrap()[0], "root")
}

///|
test "DriveFile from_json minimal required fields" {
  let raw = "{\"id\":\"x\",\"name\":\"n\",\"mimeType\":\"application/octet-stream\"}"
  let j = @json.parse(raw) catch { _ => panic() }
  let f : @drive.DriveFile = @json.from_json(j)
  assert_eq(f.id, "x")
  assert_eq(f.name, "n")
  assert_eq(f.mime_type, "application/octet-stream")
  assert_eq(f.kind, None)
  assert_eq(f.parents, None)
}

///|
test "FileList from_json parses list response" {
  let raw =
    #|{
    #|  "kind": "drive#fileList",
    #|  "nextPageToken": "tok2",
    #|  "files": [
    #|    {
    #|      "id": "a",
    #|      "name": "One",
    #|      "mimeType": "text/plain"
    #|    }
    #|  ]
    #|}
  let j = @json.parse(raw) catch { _ => panic() }
  let fl : @drive.FileList = @json.from_json(j)
  assert_eq(fl.kind, "drive#fileList")
  assert_eq(fl.next_page_token, Some("tok2"))
  let files = fl.files.unwrap()
  assert_eq(files.length(), 1)
  assert_eq(files[0].id, "a")
}

///|
test "FileList from_json empty files when omitted" {
  let raw = "{\"kind\":\"drive#fileList\"}"
  let j = @json.parse(raw) catch { _ => panic() }
  let fl : @drive.FileList = @json.from_json(j)
  let n = match fl.files {
    None => 0
    Some(fs) => fs.length()
  }
  assert_eq(n, 0)
}

///|
test "DriveFile from_json JsonDecodeError when id missing" {
  let j = Json::object({
    "name": Json::string("n"),
    "mimeType": Json::string("text/plain"),
  })
  try {
    let _ : @drive.DriveFile = @json.from_json(j)
    panic()
  } catch {
    @json.JsonDecodeError::JsonDecodeError(_) => ()
  }
}

///|
test "DriveFile from_json JsonDecodeError for non-object" {
  try {
    let _ : @drive.DriveFile = @json.from_json(Json::string("x"))
    panic()
  } catch {
    @json.JsonDecodeError::JsonDecodeError(_) => ()
  }
}
