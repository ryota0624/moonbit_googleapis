///|
/// Schema DownloadRestriction
pub(all) struct DownloadRestriction {
  restricted_for_readers : Bool?
  restricted_for_writers : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ReplyList
pub(all) struct ReplyList {
  next_page_token : String?
  kind : String?
  replies : Array[Reply]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema DownloadRestrictionsMetadata
pub(all) struct DownloadRestrictionsMetadata {
  item_download_restriction : DownloadRestriction?
  effective_download_restriction_with_context : DownloadRestriction?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Approval
pub(all) struct Approval {
  create_time : String?
  kind : String?
  status : String?
  due_time : String?
  approval_id : String?
  modify_time : String?
  reviewer_responses : Array[ReviewerResponse]?
  target_file_id : String?
  complete_time : String?
  initiator : User?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ListAccessProposalsResponse
pub(all) struct ListAccessProposalsResponse {
  access_proposals : Array[AccessProposal]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema FileList
pub(all) struct FileList {
  files : Array[File]?
  kind : String?
  next_page_token : String?
  incomplete_search : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema RevisionList
pub(all) struct RevisionList {
  revisions : Array[Revision]?
  next_page_token : String?
  kind : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ResolveAccessProposalRequest
pub(all) struct ResolveAccessProposalRequest {
  role : Array[String]?
  send_notification : Bool?
  action : String?
  view : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AccessProposalRoleAndView
pub(all) struct AccessProposalRoleAndView {
  view : String?
  role : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Status
pub(all) struct Status {
  message : String?
  details : Array[Json]?
  code : Int?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema CommentList
pub(all) struct CommentList {
  next_page_token : String?
  kind : String?
  comments : Array[Comment]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LabelFieldModification
pub(all) struct LabelFieldModification {
  kind : String?
  unset_values : Bool?
  set_user_values : Array[String]?
  set_date_values : Array[String]?
  field_id : String?
  set_selection_values : Array[String]?
  set_integer_values : Array[String]?
  set_text_values : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema DriveList
pub(all) struct DriveList {
  kind : String?
  drives : Array[Drive]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AppList
pub(all) struct AppList {
  items : Array[App]?
  default_app_ids : Array[String]?
  kind : String?
  self_link : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Operation
pub(all) struct Operation {
  response : Json?
  done : Bool?
  metadata : Json?
  error : Status?
  name : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema File
pub(all) struct File {
  kind : String?
  spaces : Array[String]?
  viewed_by_me_time : String?
  app_properties : Json?
  content_restrictions : Array[ContentRestriction]?
  explicitly_trashed : Bool?
  full_file_extension : String?
  sharing_user : User?
  is_app_authorized : Bool?
  resource_key : String?
  sha256_checksum : String?
  modified_time : String?
  created_time : String?
  image_media_metadata : Json?
  shortcut_details : Json?
  shared : Bool?
  owners : Array[User]?
  owned_by_me : Bool?
  last_modifying_user : User?
  md5_checksum : String?
  inherited_permissions_disabled : Bool?
  team_drive_id : String?
  description : String?
  shared_with_me_time : String?
  size : String?
  original_filename : String?
  version : String?
  trashing_user : User?
  head_revision_id : String?
  id : String?
  trashed_time : String?
  has_thumbnail : Bool?
  thumbnail_link : String?
  modified_by_me : Bool?
  modified_by_me_time : String?
  sha1_checksum : String?
  name : String?
  download_restrictions : DownloadRestrictionsMetadata?
  thumbnail_version : String?
  mime_type : String?
  label_info : Json?
  web_content_link : String?
  parents : Array[String]?
  viewers_can_copy_content : Bool?
  starred : Bool?
  content_hints : Json?
  permissions : Array[Permission]?
  has_augmented_permissions : Bool?
  folder_color_rgb : String?
  quota_bytes_used : String?
  permission_ids : Array[String]?
  video_media_metadata : Json?
  link_share_metadata : Json?
  web_view_link : String?
  properties : Json?
  icon_link : String?
  capabilities : Json?
  viewed_by_me : Bool?
  trashed : Bool?
  file_extension : String?
  writers_can_share : Bool?
  export_links : Json?
  copy_requires_writer_permission : Bool?
  drive_id : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ModifyLabelsResponse
pub(all) struct ModifyLabelsResponse {
  kind : String?
  modified_labels : Array[Label]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ChangeList
pub(all) struct ChangeList {
  kind : String?
  new_start_page_token : String?
  next_page_token : String?
  changes : Array[Change]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Reply
pub(all) struct Reply {
  action : String?
  html_content : String?
  assignee_email_address : String?
  kind : String?
  modified_time : String?
  id : String?
  deleted : Bool?
  author : User?
  created_time : String?
  content : String?
  mentioned_email_addresses : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AppIcons
pub(all) struct AppIcons {
  size : Int?
  category : String?
  icon_url : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema PermissionList
pub(all) struct PermissionList {
  next_page_token : String?
  kind : String?
  permissions : Array[Permission]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Permission
pub(all) struct Permission {
  allow_file_discovery : Bool?
  permission_details : Array[Json]?
  inherited_permissions_disabled : Bool?
  kind : String?
  expiration_time : String?
  team_drive_permission_details : Array[Json]?
  type_ : String?
  domain : String?
  photo_link : String?
  view : String?
  pending_owner : Bool?
  display_name : String?
  email_address : String?
  deleted : Bool?
  id : String?
  role : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema TeamDrive
pub(all) struct TeamDrive {
  background_image_file : Json?
  name : String?
  theme_id : String?
  created_time : String?
  capabilities : Json?
  restrictions : Json?
  background_image_link : String?
  org_unit_id : String?
  color_rgb : String?
  kind : String?
  id : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Drive
pub(all) struct Drive {
  background_image_file : Json?
  name : String?
  theme_id : String?
  capabilities : Json?
  restrictions : Json?
  created_time : String?
  color_rgb : String?
  kind : String?
  hidden : Bool?
  id : String?
  background_image_link : String?
  org_unit_id : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema AccessProposal
pub(all) struct AccessProposal {
  recipient_email_address : String?
  requester_email_address : String?
  create_time : String?
  proposal_id : String?
  file_id : String?
  roles_and_views : Array[AccessProposalRoleAndView]?
  request_message : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema StartPageToken
pub(all) struct StartPageToken {
  kind : String?
  start_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Comment
pub(all) struct Comment {
  deleted : Bool?
  modified_time : String?
  id : String?
  author : User?
  created_time : String?
  mentioned_email_addresses : Array[String]?
  anchor : String?
  html_content : String?
  assignee_email_address : String?
  kind : String?
  quoted_file_content : Json?
  content : String?
  replies : Array[Reply]?
  resolved : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LabelList
pub(all) struct LabelList {
  kind : String?
  labels : Array[Label]?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LabelModification
pub(all) struct LabelModification {
  remove_label : Bool?
  field_modifications : Array[LabelFieldModification]?
  label_id : String?
  kind : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema About
pub(all) struct About {
  can_create_drives : Bool?
  user : User?
  import_formats : Json?
  storage_quota : Json?
  team_drive_themes : Array[Json]?
  max_import_sizes : Json?
  kind : String?
  drive_themes : Array[Json]?
  can_create_team_drives : Bool?
  folder_color_palette : Array[String]?
  export_formats : Json?
  max_upload_size : String?
  app_installed : Bool?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ContentRestriction
pub(all) struct ContentRestriction {
  read_only : Bool?
  reason : String?
  type_ : String?
  restricting_user : User?
  restriction_time : String?
  owner_restricted : Bool?
  system_restricted : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema Label
pub(all) struct Label {
  fields : Json?
  kind : String?
  id : String?
  revision_id : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ApprovalList
pub(all) struct ApprovalList {
  items : Array[Approval]?
  next_page_token : String?
  kind : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Change
pub(all) struct Change {
  team_drive_id : String?
  kind : String?
  time : String?
  change_type : String?
  removed : Bool?
  drive : Drive?
  file_id : String?
  file : File?
  type_ : String?
  team_drive : TeamDrive?
  drive_id : String?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema TeamDriveList
pub(all) struct TeamDriveList {
  team_drives : Array[TeamDrive]?
  kind : String?
  next_page_token : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema LabelField
pub(all) struct LabelField {
  date_string : Array[String]?
  integer : Array[String]?
  user : Array[User]?
  kind : String?
  id : String?
  text : Array[String]?
  value_type : String?
  selection : Array[String]?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ReviewerResponse
pub(all) struct ReviewerResponse {
  reviewer : User?
  kind : String?
  response : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema ModifyLabelsRequest
pub(all) struct ModifyLabelsRequest {
  label_modifications : Array[LabelModification]?
  kind : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Revision
pub(all) struct Revision {
  kind : String?
  mime_type : String?
  size : String?
  original_filename : String?
  published_link : String?
  keep_forever : Bool?
  id : String?
  publish_auto : Bool?
  published_outside_domain : Bool?
  modified_time : String?
  export_links : Json?
  published : Bool?
  md5_checksum : String?
  last_modifying_user : User?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema User
pub(all) struct User {
  display_name : String?
  email_address : String?
  me : Bool?
  kind : String?
  photo_link : String?
  permission_id : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema App
pub(all) struct App {
  open_url_template : String?
  secondary_mime_types : Array[String]?
  name : String?
  supports_import : Bool?
  primary_mime_types : Array[String]?
  has_drive_wide_scope : Bool?
  id : String?
  long_description : String?
  supports_multi_open : Bool?
  icons : Array[AppIcons]?
  object_type : String?
  secondary_file_extensions : Array[String]?
  supports_create : Bool?
  use_by_default : Bool?
  create_in_folder_template : String?
  product_url : String?
  installed : Bool?
  authorized : Bool?
  kind : String?
  supports_offline_create : Bool?
  primary_file_extensions : Array[String]?
  short_description : String?
  product_id : String?
  create_url : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))

///|
/// Schema Channel
pub(all) struct Channel {
  type_ : String?
  resource_uri : String?
  token : String?
  resource_id : String?
  id : String?
  address : String?
  kind : String?
  params : Json?
  expiration : String?
  payload : Bool?
} derive (
  Eq,
  Show,
  FromJson(rename_fields="camelCase", fields(type_(rename="type"))),
)

///|
/// Schema GeneratedIds
pub(all) struct GeneratedIds {
  space : String?
  ids : Array[String]?
  kind : String?
} derive(Eq, Show, FromJson(rename_fields="camelCase"))
