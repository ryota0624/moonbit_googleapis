///|
/// Schema Label
pub(all) struct Label {
  revision_id : String?
  id : String?
  fields : Json?
  kind : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema DownloadRestriction
pub(all) struct DownloadRestriction {
  restricted_for_readers : Bool?
  restricted_for_writers : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ModifyLabelsResponse
pub(all) struct ModifyLabelsResponse {
  modified_labels : Array[Label]?
  kind : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LabelField
pub(all) struct LabelField {
  selection : Array[String]?
  text : Array[String]?
  user : Array[User]?
  kind : String?
  value_type : String?
  date_string : Array[String]?
  id : String?
  integer : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LabelFieldModification
pub(all) struct LabelFieldModification {
  unset_values : Bool?
  set_selection_values : Array[String]?
  kind : String?
  set_date_values : Array[String]?
  set_integer_values : Array[String]?
  set_user_values : Array[String]?
  field_id : String?
  set_text_values : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema FileList
pub(all) struct FileList {
  next_page_token : String?
  kind : String?
  files : Array[File]?
  incomplete_search : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AppList
pub(all) struct AppList {
  default_app_ids : Array[String]?
  self_link : String?
  kind : String?
  items : Array[App]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ModifyLabelsRequest
pub(all) struct ModifyLabelsRequest {
  label_modifications : Array[LabelModification]?
  kind : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Reply
pub(all) struct Reply {
  modified_time : String?
  id : String?
  action : String?
  assignee_email_address : String?
  author : User?
  content : String?
  created_time : String?
  deleted : Bool?
  html_content : String?
  kind : String?
  mentioned_email_addresses : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Channel
pub(all) struct Channel {
  payload : Bool?
  token : String?
  resource_id : String?
  kind : String?
  address : String?
  id : String?
  resource_uri : String?
  expiration : String?
  type_ : String?
  params : Json?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema About
pub(all) struct About {
  max_upload_size : String?
  drive_themes : Array[Json]?
  team_drive_themes : Array[Json]?
  can_create_team_drives : Bool?
  import_formats : Json?
  folder_color_palette : Array[String]?
  export_formats : Json?
  app_installed : Bool?
  kind : String?
  max_import_sizes : Json?
  user : User?
  storage_quota : Json?
  can_create_drives : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TeamDrive
pub(all) struct TeamDrive {
  name : String?
  id : String?
  restrictions : Json?
  theme_id : String?
  background_image_link : String?
  color_rgb : String?
  created_time : String?
  org_unit_id : String?
  background_image_file : Json?
  kind : String?
  capabilities : Json?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema TeamDriveList
pub(all) struct TeamDriveList {
  next_page_token : String?
  kind : String?
  team_drives : Array[TeamDrive]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AppIcons
pub(all) struct AppIcons {
  category : String?
  size : Int?
  icon_url : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Drive
pub(all) struct Drive {
  background_image_link : String?
  color_rgb : String?
  created_time : String?
  org_unit_id : String?
  kind : String?
  capabilities : Json?
  background_image_file : Json?
  name : String?
  id : String?
  restrictions : Json?
  hidden : Bool?
  theme_id : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Change
pub(all) struct Change {
  file : File?
  time : String?
  file_id : String?
  type_ : String?
  drive : Drive?
  team_drive : TeamDrive?
  removed : Bool?
  team_drive_id : String?
  drive_id : String?
  change_type : String?
  kind : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema LabelList
pub(all) struct LabelList {
  next_page_token : String?
  kind : String?
  labels : Array[Label]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ResolveAccessProposalRequest
pub(all) struct ResolveAccessProposalRequest {
  action : String?
  role : Array[String]?
  view : String?
  send_notification : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListAccessProposalsResponse
pub(all) struct ListAccessProposalsResponse {
  next_page_token : String?
  access_proposals : Array[AccessProposal]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PermissionList
pub(all) struct PermissionList {
  permissions : Array[Permission]?
  next_page_token : String?
  kind : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema RevisionList
pub(all) struct RevisionList {
  revisions : Array[Revision]?
  next_page_token : String?
  kind : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema DownloadRestrictionsMetadata
pub(all) struct DownloadRestrictionsMetadata {
  item_download_restriction : DownloadRestriction?
  effective_download_restriction_with_context : DownloadRestriction?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema GeneratedIds
pub(all) struct GeneratedIds {
  kind : String?
  ids : Array[String]?
  space : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LabelModification
pub(all) struct LabelModification {
  label_id : String?
  field_modifications : Array[LabelFieldModification]?
  remove_label : Bool?
  kind : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AccessProposalRoleAndView
pub(all) struct AccessProposalRoleAndView {
  role : String?
  view : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Revision
pub(all) struct Revision {
  published_link : String?
  export_links : Json?
  id : String?
  mime_type : String?
  size : String?
  last_modifying_user : User?
  keep_forever : Bool?
  kind : String?
  publish_auto : Bool?
  modified_time : String?
  md5_checksum : String?
  original_filename : String?
  published : Bool?
  published_outside_domain : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ApprovalList
pub(all) struct ApprovalList {
  kind : String?
  items : Array[Approval]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ChangeList
pub(all) struct ChangeList {
  new_start_page_token : String?
  changes : Array[Change]?
  kind : String?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Status
pub(all) struct Status {
  details : Array[Json]?
  code : Int?
  message : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema App
pub(all) struct App {
  secondary_mime_types : Array[String]?
  authorized : Bool?
  supports_multi_open : Bool?
  supports_create : Bool?
  short_description : String?
  product_url : String?
  id : String?
  name : String?
  long_description : String?
  kind : String?
  use_by_default : Bool?
  product_id : String?
  open_url_template : String?
  create_url : String?
  supports_import : Bool?
  create_in_folder_template : String?
  has_drive_wide_scope : Bool?
  primary_mime_types : Array[String]?
  secondary_file_extensions : Array[String]?
  icons : Array[AppIcons]?
  object_type : String?
  primary_file_extensions : Array[String]?
  installed : Bool?
  supports_offline_create : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ReviewerResponse
pub(all) struct ReviewerResponse {
  kind : String?
  response : String?
  reviewer : User?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Comment
pub(all) struct Comment {
  replies : Array[Reply]?
  modified_time : String?
  mentioned_email_addresses : Array[String]?
  kind : String?
  quoted_file_content : Json?
  html_content : String?
  deleted : Bool?
  content : String?
  author : User?
  assignee_email_address : String?
  id : String?
  anchor : String?
  created_time : String?
  resolved : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ReplyList
pub(all) struct ReplyList {
  kind : String?
  replies : Array[Reply]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Approval
pub(all) struct Approval {
  status : String?
  kind : String?
  create_time : String?
  modify_time : String?
  due_time : String?
  target_file_id : String?
  approval_id : String?
  reviewer_responses : Array[ReviewerResponse]?
  complete_time : String?
  initiator : User?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Operation
pub(all) struct Operation {
  response : Json?
  done : Bool?
  name : String?
  metadata : Json?
  error : Status?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema DriveList
pub(all) struct DriveList {
  next_page_token : String?
  kind : String?
  drives : Array[Drive]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Permission
pub(all) struct Permission {
  allow_file_discovery : Bool?
  inherited_permissions_disabled : Bool?
  permission_details : Array[Json]?
  team_drive_permission_details : Array[Json]?
  deleted : Bool?
  pending_owner : Bool?
  kind : String?
  photo_link : String?
  view : String?
  id : String?
  type_ : String?
  domain : String?
  email_address : String?
  role : String?
  display_name : String?
  expiration_time : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema CommentList
pub(all) struct CommentList {
  kind : String?
  comments : Array[Comment]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AccessProposal
pub(all) struct AccessProposal {
  create_time : String?
  file_id : String?
  request_message : String?
  proposal_id : String?
  requester_email_address : String?
  roles_and_views : Array[AccessProposalRoleAndView]?
  recipient_email_address : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema User
pub(all) struct User {
  permission_id : String?
  me : Bool?
  email_address : String?
  display_name : String?
  kind : String?
  photo_link : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema File
pub(all) struct File {
  version : String?
  content_restrictions : Array[ContentRestriction]?
  original_filename : String?
  kind : String?
  mime_type : String?
  has_augmented_permissions : Bool?
  web_view_link : String?
  shared : Bool?
  link_share_metadata : Json?
  label_info : Json?
  download_restrictions : DownloadRestrictionsMetadata?
  drive_id : String?
  viewers_can_copy_content : Bool?
  thumbnail_link : String?
  has_thumbnail : Bool?
  owners : Array[User]?
  permissions : Array[Permission]?
  viewed_by_me : Bool?
  head_revision_id : String?
  quota_bytes_used : String?
  spaces : Array[String]?
  shared_with_me_time : String?
  export_links : Json?
  trashing_user : User?
  resource_key : String?
  created_time : String?
  full_file_extension : String?
  video_media_metadata : Json?
  web_content_link : String?
  md5_checksum : String?
  inherited_permissions_disabled : Bool?
  starred : Bool?
  trashed_time : String?
  modified_by_me_time : String?
  team_drive_id : String?
  icon_link : String?
  file_extension : String?
  viewed_by_me_time : String?
  trashed : Bool?
  app_properties : Json?
  shortcut_details : Json?
  thumbnail_version : String?
  permission_ids : Array[String]?
  explicitly_trashed : Bool?
  properties : Json?
  copy_requires_writer_permission : Bool?
  sharing_user : User?
  modified_time : String?
  capabilities : Json?
  sha1_checksum : String?
  owned_by_me : Bool?
  content_hints : Json?
  folder_color_rgb : String?
  sha256_checksum : String?
  last_modifying_user : User?
  size : String?
  name : String?
  id : String?
  parents : Array[String]?
  description : String?
  modified_by_me : Bool?
  image_media_metadata : Json?
  writers_can_share : Bool?
  is_app_authorized : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ContentRestriction
pub(all) struct ContentRestriction {
  type_ : String?
  reason : String?
  restricting_user : User?
  restriction_time : String?
  owner_restricted : Bool?
  read_only : Bool?
  system_restricted : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema StartPageToken
pub(all) struct StartPageToken {
  start_page_token : String?
  kind : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))
