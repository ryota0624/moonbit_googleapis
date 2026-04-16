///|
/// Schema AppList
pub(all) struct AppList {
  kind : String?
  items : Array[App]?
  self_link : String?
  default_app_ids : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Status
pub(all) struct Status {
  details : Array[Json]?
  message : String?
  code : Int?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Approval
pub(all) struct Approval {
  create_time : String?
  complete_time : String?
  target_file_id : String?
  due_time : String?
  reviewer_responses : Array[ReviewerResponse]?
  approval_id : String?
  status : String?
  kind : String?
  initiator : User?
  modify_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema CommentList
pub(all) struct CommentList {
  kind : String?
  comments : Array[Comment]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Revision
pub(all) struct Revision {
  mime_type : String?
  md5_checksum : String?
  published_link : String?
  last_modifying_user : User?
  published : Bool?
  publish_auto : Bool?
  modified_time : String?
  original_filename : String?
  keep_forever : Bool?
  size : String?
  id : String?
  export_links : Json?
  kind : String?
  published_outside_domain : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Comment
pub(all) struct Comment {
  created_time : String?
  modified_time : String?
  resolved : Bool?
  replies : Array[Reply]?
  content : String?
  deleted : Bool?
  html_content : String?
  quoted_file_content : Json?
  author : User?
  kind : String?
  mentioned_email_addresses : Array[String]?
  id : String?
  anchor : String?
  assignee_email_address : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GeneratedIds
pub(all) struct GeneratedIds {
  kind : String?
  ids : Array[String]?
  space : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LabelList
pub(all) struct LabelList {
  labels : Array[Label]?
  next_page_token : String?
  kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AppIcons
pub(all) struct AppIcons {
  size : Int?
  category : String?
  icon_url : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LabelField
pub(all) struct LabelField {
  id : String?
  date_string : Array[String]?
  text : Array[String]?
  kind : String?
  value_type : String?
  selection : Array[String]?
  user : Array[User]?
  integer : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LabelModification
pub(all) struct LabelModification {
  label_id : String?
  field_modifications : Array[LabelFieldModification]?
  remove_label : Bool?
  kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ChangeList
pub(all) struct ChangeList {
  new_start_page_token : String?
  changes : Array[Change]?
  kind : String?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Label
pub(all) struct Label {
  fields : Json?
  id : String?
  revision_id : String?
  kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema About
pub(all) struct About {
  can_create_team_drives : Bool?
  app_installed : Bool?
  max_import_sizes : Json?
  kind : String?
  import_formats : Json?
  export_formats : Json?
  drive_themes : Array[Json]?
  storage_quota : Json?
  can_create_drives : Bool?
  team_drive_themes : Array[Json]?
  folder_color_palette : Array[String]?
  user : User?
  max_upload_size : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema FileList
pub(all) struct FileList {
  next_page_token : String?
  kind : String?
  incomplete_search : Bool?
  files : Array[File]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ApprovalList
pub(all) struct ApprovalList {
  kind : String?
  next_page_token : String?
  items : Array[Approval]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema GenerateCseTokenResponse
pub(all) struct GenerateCseTokenResponse {
  current_kacls_name : String?
  file_id : String?
  jwt : String?
  kind : String?
  current_kacls_id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AccessProposalRoleAndView
pub(all) struct AccessProposalRoleAndView {
  role : String?
  view : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema TeamDrive
pub(all) struct TeamDrive {
  kind : String?
  background_image_link : String?
  restrictions : Json?
  capabilities : Json?
  theme_id : String?
  created_time : String?
  org_unit_id : String?
  background_image_file : Json?
  color_rgb : String?
  id : String?
  name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema RevisionList
pub(all) struct RevisionList {
  revisions : Array[Revision]?
  next_page_token : String?
  kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ModifyLabelsResponse
pub(all) struct ModifyLabelsResponse {
  modified_labels : Array[Label]?
  kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ContentRestriction
pub(all) struct ContentRestriction {
  type_ : String?
  owner_restricted : Bool?
  read_only : Bool?
  system_restricted : Bool?
  reason : String?
  restricting_user : User?
  restriction_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema ReplyList
pub(all) struct ReplyList {
  kind : String?
  next_page_token : String?
  replies : Array[Reply]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AccessProposal
pub(all) struct AccessProposal {
  recipient_email_address : String?
  request_message : String?
  create_time : String?
  roles_and_views : Array[AccessProposalRoleAndView]?
  proposal_id : String?
  file_id : String?
  requester_email_address : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DownloadRestriction
pub(all) struct DownloadRestriction {
  restricted_for_readers : Bool?
  restricted_for_writers : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema StartPageToken
pub(all) struct StartPageToken {
  start_page_token : String?
  kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ModifyLabelsRequest
pub(all) struct ModifyLabelsRequest {
  kind : String?
  label_modifications : Array[LabelModification]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DriveList
pub(all) struct DriveList {
  next_page_token : String?
  kind : String?
  drives : Array[Drive]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema File
pub(all) struct File {
  team_drive_id : String?
  client_encryption_details : ClientEncryptionDetails?
  resource_key : String?
  last_modifying_user : User?
  full_file_extension : String?
  folder_color_rgb : String?
  viewed_by_me_time : String?
  export_links : Json?
  kind : String?
  image_media_metadata : Json?
  writers_can_share : Bool?
  permissions : Array[Permission]?
  permission_ids : Array[String]?
  is_app_authorized : Bool?
  web_content_link : String?
  shared_with_me_time : String?
  thumbnail_version : String?
  content_hints : Json?
  starred : Bool?
  version : String?
  thumbnail_link : String?
  spaces : Array[String]?
  explicitly_trashed : Bool?
  has_augmented_permissions : Bool?
  size : String?
  inherited_permissions_disabled : Bool?
  trashing_user : User?
  modified_by_me_time : String?
  viewed_by_me : Bool?
  download_restrictions : DownloadRestrictionsMetadata?
  modified_time : String?
  capabilities : Json?
  icon_link : String?
  viewers_can_copy_content : Bool?
  owned_by_me : Bool?
  shared : Bool?
  md5_checksum : String?
  file_extension : String?
  video_media_metadata : Json?
  modified_by_me : Bool?
  label_info : Json?
  trashed : Bool?
  id : String?
  copy_requires_writer_permission : Bool?
  created_time : String?
  original_filename : String?
  drive_id : String?
  properties : Json?
  sha256_checksum : String?
  owners : Array[User]?
  quota_bytes_used : String?
  link_share_metadata : Json?
  mime_type : String?
  sha1_checksum : String?
  has_thumbnail : Bool?
  trashed_time : String?
  head_revision_id : String?
  app_properties : Json?
  web_view_link : String?
  shortcut_details : Json?
  sharing_user : User?
  name : String?
  parents : Array[String]?
  description : String?
  content_restrictions : Array[ContentRestriction]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Permission
pub(all) struct Permission {
  team_drive_permission_details : Array[Json]?
  permission_details : Array[Json]?
  display_name : String?
  allow_file_discovery : Bool?
  role : String?
  deleted : Bool?
  photo_link : String?
  view : String?
  pending_owner : Bool?
  expiration_time : String?
  domain : String?
  kind : String?
  inherited_permissions_disabled : Bool?
  type_ : String?
  id : String?
  email_address : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema TeamDriveList
pub(all) struct TeamDriveList {
  next_page_token : String?
  kind : String?
  team_drives : Array[TeamDrive]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Operation
pub(all) struct Operation {
  name : String?
  done : Bool?
  metadata : Json?
  response : Json?
  error : Status?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Change
pub(all) struct Change {
  drive_id : String?
  file : File?
  time : String?
  drive : Drive?
  kind : String?
  team_drive_id : String?
  file_id : String?
  team_drive : TeamDrive?
  change_type : String?
  removed : Bool?
  type_ : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema DecryptionMetadata
pub(all) struct DecryptionMetadata {
  wrapped_key : String?
  kacls_id : String?
  jwt : String?
  kacls_name : String?
  encryption_resource_key_hash : String?
  aes256_gcm_chunk_size : String?
  key_format : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Drive
pub(all) struct Drive {
  hidden : Bool?
  id : String?
  name : String?
  background_image_file : Json?
  color_rgb : String?
  created_time : String?
  org_unit_id : String?
  capabilities : Json?
  theme_id : String?
  restrictions : Json?
  kind : String?
  background_image_link : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema DownloadRestrictionsMetadata
pub(all) struct DownloadRestrictionsMetadata {
  item_download_restriction : DownloadRestriction?
  effective_download_restriction_with_context : DownloadRestriction?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema App
pub(all) struct App {
  long_description : String?
  supports_offline_create : Bool?
  supports_import : Bool?
  short_description : String?
  product_url : String?
  installed : Bool?
  use_by_default : Bool?
  kind : String?
  primary_file_extensions : Array[String]?
  name : String?
  id : String?
  create_in_folder_template : String?
  create_url : String?
  open_url_template : String?
  has_drive_wide_scope : Bool?
  authorized : Bool?
  primary_mime_types : Array[String]?
  supports_multi_open : Bool?
  object_type : String?
  secondary_mime_types : Array[String]?
  icons : Array[AppIcons]?
  product_id : String?
  supports_create : Bool?
  secondary_file_extensions : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Reply
pub(all) struct Reply {
  action : String?
  deleted : Bool?
  html_content : String?
  assignee_email_address : String?
  id : String?
  content : String?
  mentioned_email_addresses : Array[String]?
  kind : String?
  created_time : String?
  modified_time : String?
  author : User?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ClientEncryptionDetails
pub(all) struct ClientEncryptionDetails {
  encryption_state : String?
  decryption_metadata : DecryptionMetadata?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Channel
pub(all) struct Channel {
  id : String?
  resource_id : String?
  type_ : String?
  resource_uri : String?
  params : Json?
  token : String?
  kind : String?
  expiration : String?
  address : String?
  payload : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema ReviewerResponse
pub(all) struct ReviewerResponse {
  kind : String?
  reviewer : User?
  response : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema User
pub(all) struct User {
  me : Bool?
  permission_id : String?
  photo_link : String?
  kind : String?
  email_address : String?
  display_name : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ResolveAccessProposalRequest
pub(all) struct ResolveAccessProposalRequest {
  role : Array[String]?
  action : String?
  view : String?
  send_notification : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListAccessProposalsResponse
pub(all) struct ListAccessProposalsResponse {
  access_proposals : Array[AccessProposal]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema PermissionList
pub(all) struct PermissionList {
  next_page_token : String?
  kind : String?
  permissions : Array[Permission]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LabelFieldModification
pub(all) struct LabelFieldModification {
  kind : String?
  set_text_values : Array[String]?
  field_id : String?
  set_date_values : Array[String]?
  set_integer_values : Array[String]?
  unset_values : Bool?
  set_selection_values : Array[String]?
  set_user_values : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)
