///|
pub suberror ParseDriveError {
  InvalidJson(String)
  MissingField(String)
} derive(Show)

///|
pub(all) struct DriveFile {
  id : String
  name : String
  mime_type : String
  kind : String?
  size : String?
  created_time : String?
  modified_time : String?
  parents : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
pub(all) struct FileList {
  kind : String
  next_page_token : String?
  files : Array[DriveFile]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))
