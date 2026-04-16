///|
/// Schema LabelList
pub(all) struct LabelList {
  next_page_token : String?
  kind : String?
  labels : Array[Label]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema LabelFieldModification
pub(all) struct LabelFieldModification {
  field_id : String?
  set_integer_values : Array[String]?
  unset_values : Bool?
  kind : String?
  set_date_values : Array[String]?
  set_text_values : Array[String]?
  set_selection_values : Array[String]?
  set_user_values : Array[String]?
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
  send_notification : Bool?
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
  restrictions : Json?
  color_rgb : String?
  kind : String?
  name : String?
  background_image_link : String?
  theme_id : String?
  capabilities : Json?
  created_time : String?
  id : String?
  org_unit_id : String?
  background_image_file : Json?
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
  kind : String?
  field_modifications : Array[LabelFieldModification]?
  remove_label : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Operation
pub(all) struct Operation {
  response : Json?
  name : String?
  error : Status?
  metadata : Json?
  done : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
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
/// Schema Channel
pub(all) struct Channel {
  expiration : String?
  params : Json?
  id : String?
  resource_id : String?
  resource_uri : String?
  token : String?
  address : String?
  type_ : String?
  kind : String?
  payload : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema Permission
pub(all) struct Permission {
  expiration_time : String?
  domain : String?
  display_name : String?
  view : String?
  inherited_permissions_disabled : Bool?
  team_drive_permission_details : Array[Json]?
  photo_link : String?
  role : String?
  type_ : String?
  kind : String?
  email_address : String?
  id : String?
  allow_file_discovery : Bool?
  deleted : Bool?
  permission_details : Array[Json]?
  pending_owner : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema LabelField
pub(all) struct LabelField {
  text : Array[String]?
  integer : Array[String]?
  selection : Array[String]?
  kind : String?
  id : String?
  value_type : String?
  date_string : Array[String]?
  user : Array[User]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ListAccessProposalsResponse
pub(all) struct ListAccessProposalsResponse {
  next_page_token : String?
  access_proposals : Array[AccessProposal]?
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
/// Schema CommentList
pub(all) struct CommentList {
  kind : String?
  next_page_token : String?
  comments : Array[Comment]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema File
pub(all) struct File {
  viewed_by_me_time : String?
  content_restrictions : Array[ContentRestriction]?
  has_augmented_permissions : Bool?
  modified_by_me_time : String?
  file_extension : String?
  trashed : Bool?
  explicitly_trashed : Bool?
  shared_with_me_time : String?
  app_properties : Json?
  sharing_user : User?
  writers_can_share : Bool?
  full_file_extension : String?
  thumbnail_version : String?
  mime_type : String?
  inherited_permissions_disabled : Bool?
  viewed_by_me : Bool?
  team_drive_id : String?
  client_encryption_details : ClientEncryptionDetails?
  permissions : Array[Permission]?
  sha1_checksum : String?
  description : String?
  icon_link : String?
  copy_requires_writer_permission : Bool?
  drive_id : String?
  kind : String?
  head_revision_id : String?
  sha256_checksum : String?
  viewers_can_copy_content : Bool?
  capabilities : Json?
  md5_checksum : String?
  size : String?
  content_hints : Json?
  label_info : Json?
  trashed_time : String?
  video_media_metadata : Json?
  folder_color_rgb : String?
  starred : Bool?
  properties : Json?
  trashing_user : User?
  parents : Array[String]?
  version : String?
  modified_time : String?
  id : String?
  thumbnail_link : String?
  spaces : Array[String]?
  is_app_authorized : Bool?
  modified_by_me : Bool?
  name : String?
  link_share_metadata : Json?
  owners : Array[User]?
  resource_key : String?
  shared : Bool?
  image_media_metadata : Json?
  created_time : String?
  original_filename : String?
  owned_by_me : Bool?
  web_content_link : String?
  has_thumbnail : Bool?
  permission_ids : Array[String]?
  download_restrictions : DownloadRestrictionsMetadata?
  quota_bytes_used : String?
  shortcut_details : Json?
  last_modifying_user : User?
  export_links : Json?
  web_view_link : String?
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
/// Schema PermissionList
pub(all) struct PermissionList {
  permissions : Array[Permission]?
  next_page_token : String?
  kind : String?
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
/// Schema ReviewerResponse
pub(all) struct ReviewerResponse {
  reviewer : User?
  kind : String?
  response : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AccessProposal
pub(all) struct AccessProposal {
  roles_and_views : Array[AccessProposalRoleAndView]?
  create_time : String?
  recipient_email_address : String?
  proposal_id : String?
  requester_email_address : String?
  request_message : String?
  file_id : String?
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
/// Schema Status
pub(all) struct Status {
  code : Int?
  message : String?
  details : Array[Json]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema About
pub(all) struct About {
  user : User?
  import_formats : Json?
  kind : String?
  folder_color_palette : Array[String]?
  can_create_drives : Bool?
  max_upload_size : String?
  max_import_sizes : Json?
  drive_themes : Array[Json]?
  storage_quota : Json?
  app_installed : Bool?
  team_drive_themes : Array[Json]?
  export_formats : Json?
  can_create_team_drives : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Comment
pub(all) struct Comment {
  content : String?
  created_time : String?
  author : User?
  quoted_file_content : Json?
  resolved : Bool?
  replies : Array[Reply]?
  assignee_email_address : String?
  mentioned_email_addresses : Array[String]?
  kind : String?
  html_content : String?
  deleted : Bool?
  modified_time : String?
  id : String?
  anchor : String?
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
/// Schema Revision
pub(all) struct Revision {
  kind : String?
  last_modifying_user : User?
  modified_time : String?
  id : String?
  export_links : Json?
  published : Bool?
  keep_forever : Bool?
  published_link : String?
  published_outside_domain : Bool?
  publish_auto : Bool?
  size : String?
  mime_type : String?
  md5_checksum : String?
  original_filename : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Change
pub(all) struct Change {
  file : File?
  removed : Bool?
  file_id : String?
  drive : Drive?
  team_drive_id : String?
  team_drive : TeamDrive?
  change_type : String?
  kind : String?
  time : String?
  type_ : String?
  drive_id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema Label
pub(all) struct Label {
  fields : Json?
  id : String?
  kind : String?
  revision_id : String?
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
  email_address : String?
  permission_id : String?
  photo_link : String?
  display_name : String?
  kind : String?
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
/// Schema GeneratedIds
pub(all) struct GeneratedIds {
  ids : Array[String]?
  space : String?
  kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema App
pub(all) struct App {
  authorized : Bool?
  use_by_default : Bool?
  create_in_folder_template : String?
  name : String?
  kind : String?
  open_url_template : String?
  supports_offline_create : Bool?
  supports_multi_open : Bool?
  create_url : String?
  id : String?
  has_drive_wide_scope : Bool?
  object_type : String?
  secondary_file_extensions : Array[String]?
  long_description : String?
  installed : Bool?
  short_description : String?
  primary_mime_types : Array[String]?
  product_id : String?
  product_url : String?
  primary_file_extensions : Array[String]?
  icons : Array[AppIcons]?
  supports_import : Bool?
  supports_create : Bool?
  secondary_mime_types : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema Drive
pub(all) struct Drive {
  background_image_file : Json?
  id : String?
  org_unit_id : String?
  hidden : Bool?
  capabilities : Json?
  created_time : String?
  name : String?
  kind : String?
  background_image_link : String?
  theme_id : String?
  restrictions : Json?
  color_rgb : String?
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
/// Schema GenerateCseTokenResponse
pub(all) struct GenerateCseTokenResponse {
  current_kacls_name : String?
  file_id : String?
  current_kacls_id : String?
  kind : String?
  jwt : String?
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
/// Schema Reply
pub(all) struct Reply {
  author : User?
  created_time : String?
  action : String?
  assignee_email_address : String?
  content : String?
  deleted : Bool?
  id : String?
  modified_time : String?
  html_content : String?
  kind : String?
  mentioned_email_addresses : Array[String]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ReplyList
pub(all) struct ReplyList {
  kind : String?
  replies : Array[Reply]?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema AppList
pub(all) struct AppList {
  kind : String?
  items : Array[App]?
  default_app_ids : Array[String]?
  self_link : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ContentRestriction
pub(all) struct ContentRestriction {
  read_only : Bool?
  restricting_user : User?
  restriction_time : String?
  system_restricted : Bool?
  reason : String?
  type_ : String?
  owner_restricted : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
  ToJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema DecryptionMetadata
pub(all) struct DecryptionMetadata {
  kacls_name : String?
  encryption_resource_key_hash : String?
  kacls_id : String?
  key_format : String?
  jwt : String?
  wrapped_key : String?
  aes256_gcm_chunk_size : String?
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
  due_time : String?
  status : String?
  target_file_id : String?
  reviewer_responses : Array[ReviewerResponse]?
  approval_id : String?
  initiator : User?
  complete_time : String?
  kind : String?
  modify_time : String?
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
/// Schema ChangeList
pub(all) struct ChangeList {
  changes : Array[Change]?
  new_start_page_token : String?
  kind : String?
  next_page_token : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)

///|
/// Schema ModifyLabelsResponse
pub(all) struct ModifyLabelsResponse {
  kind : String?
  modified_labels : Array[Label]?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase"),
  ToJson(rename_fields="camelCase"),
)
