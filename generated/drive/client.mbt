///| API client for drive v3

///| Base URL: https://www.googleapis.com/drive/v3/

///|
pub struct DriveService {
  base_url : String
  client : @core.GoogleClient
}

///|
pub fn DriveService::new(client : @core.GoogleClient) -> DriveService {
  DriveService::{ base_url: "https://www.googleapis.com/drive/v3", client }
}

///| drive.about.get

///|
/// Gets information about the user, the user's Drive, and system capabilities. For more information, see [Return user info](https://developers.google.com/workspace/drive/api/guides/user-info). Required: The `fields` parameter must be set. To return the exact fields you need, see [Return specific fields](https://developers.google.com/workspace/drive/api/guides/fields-parameter).
pub async fn DriveService::about_get(
  self : DriveService,
) -> About raise @http.HttpError {
  let path = "/" + "about"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.accessproposals.get

///|
/// Retrieves an access proposal by ID. For more information, see [Manage pending access proposals](https://developers.google.com/workspace/drive/api/guides/pending-access).
pub async fn DriveService::accessproposals_get(
  self : DriveService,
  file_id : String,
  proposal_id : String,
) -> AccessProposal raise @http.HttpError {
  let path = "/" +
    "files" +
    "/" +
    file_id +
    "/" +
    "accessproposals" +
    "/" +
    proposal_id
  let url = self.base_url + path
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.accessproposals.list

///|
/// List the access proposals on a file. For more information, see [Manage pending access proposals](https://developers.google.com/workspace/drive/api/guides/pending-access). Note: Only approvers are able to list access proposals on a file. If the user isn't an approver, a 403 error is returned.
pub async fn DriveService::accessproposals_list(
  self : DriveService,
  file_id : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ListAccessProposalsResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "files" + "/" + file_id + "/" + "accessproposals"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.accessproposals.resolve

///|
/// Approves or denies an access proposal. For more information, see [Manage pending access proposals](https://developers.google.com/workspace/drive/api/guides/pending-access).
pub async fn DriveService::accessproposals_resolve(
  self : DriveService,
  file_id : String,
  proposal_id : String,
) -> @http.HttpResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" +
    "files" +
    "/" +
    file_id +
    "/" +
    "accessproposals" +
    "/" +
    proposal_id +
    "/" +
    ":resolve"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::POST,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  resp
}

///| drive.approvals.get

///|
/// Gets an Approval by ID.
pub async fn DriveService::approvals_get(
  self : DriveService,
  file_id : String,
  approval_id : String,
) -> Approval raise @http.HttpError {
  let path = "/" +
    "files" +
    "/" +
    file_id +
    "/" +
    "approvals" +
    "/" +
    approval_id
  let url = self.base_url + path
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.approvals.list

///|
/// Lists the Approvals on a file.
pub async fn DriveService::approvals_list(
  self : DriveService,
  file_id : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ApprovalList raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "files" + "/" + file_id + "/" + "approvals"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.apps.get

///|
/// Gets a specific app. For more information, see [Return user info](https://developers.google.com/workspace/drive/api/guides/user-info).
pub async fn DriveService::apps_get(
  self : DriveService,
  app_id : String,
) -> App raise @http.HttpError {
  let path = "/" + "apps" + "/" + app_id
  let url = self.base_url + path
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.apps.list

///|
/// Lists a user's installed apps. For more information, see [Return user info](https://developers.google.com/workspace/drive/api/guides/user-info).
pub async fn DriveService::apps_list(
  self : DriveService,
  app_filter_extensions? : String? = None,
  app_filter_mime_types? : String? = None,
  language_code? : String? = None,
) -> AppList raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match app_filter_extensions {
    Some(v) => qp.push(("appFilterExtensions", url_encode(v)))
    None => ()
  }
  match app_filter_mime_types {
    Some(v) => qp.push(("appFilterMimeTypes", url_encode(v)))
    None => ()
  }
  match language_code {
    Some(v) => qp.push(("languageCode", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "apps"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.changes.getStartPageToken

///|
/// Gets the starting pageToken for listing future changes. For more information, see [Retrieve changes](https://developers.google.com/workspace/drive/api/guides/manage-changes).
pub async fn DriveService::changes_get_start_page_token(
  self : DriveService,
  drive_id? : String? = None,
  supports_all_drives? : Bool? = None,
  supports_team_drives? : Bool? = None,
  team_drive_id? : String? = None,
) -> StartPageToken raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match drive_id {
    Some(v) => qp.push(("driveId", url_encode(v)))
    None => ()
  }
  match supports_all_drives {
    Some(v) => qp.push(("supportsAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_team_drives {
    Some(v) => qp.push(("supportsTeamDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match team_drive_id {
    Some(v) => qp.push(("teamDriveId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "changes" + "/" + "startPageToken"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.changes.list

///|
/// Lists the changes for a user or shared drive. For more information, see [Retrieve changes](https://developers.google.com/workspace/drive/api/guides/manage-changes).
pub async fn DriveService::changes_list(
  self : DriveService,
  drive_id? : String? = None,
  include_corpus_removals? : Bool? = None,
  include_items_from_all_drives? : Bool? = None,
  include_labels? : String? = None,
  include_permissions_for_view? : String? = None,
  include_removed? : Bool? = None,
  include_team_drive_items? : Bool? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  restrict_to_my_drive? : Bool? = None,
  spaces? : String? = None,
  supports_all_drives? : Bool? = None,
  supports_team_drives? : Bool? = None,
  team_drive_id? : String? = None,
) -> ChangeList raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match drive_id {
    Some(v) => qp.push(("driveId", url_encode(v)))
    None => ()
  }
  match include_corpus_removals {
    Some(v) =>
      qp.push(("includeCorpusRemovals", if v { "true" } else { "false" }))
    None => ()
  }
  match include_items_from_all_drives {
    Some(v) =>
      qp.push(("includeItemsFromAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match include_labels {
    Some(v) => qp.push(("includeLabels", url_encode(v)))
    None => ()
  }
  match include_permissions_for_view {
    Some(v) => qp.push(("includePermissionsForView", url_encode(v)))
    None => ()
  }
  match include_removed {
    Some(v) => qp.push(("includeRemoved", if v { "true" } else { "false" }))
    None => ()
  }
  match include_team_drive_items {
    Some(v) =>
      qp.push(("includeTeamDriveItems", if v { "true" } else { "false" }))
    None => ()
  }
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match restrict_to_my_drive {
    Some(v) => qp.push(("restrictToMyDrive", if v { "true" } else { "false" }))
    None => ()
  }
  match spaces {
    Some(v) => qp.push(("spaces", url_encode(v)))
    None => ()
  }
  match supports_all_drives {
    Some(v) => qp.push(("supportsAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_team_drives {
    Some(v) => qp.push(("supportsTeamDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match team_drive_id {
    Some(v) => qp.push(("teamDriveId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "changes"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.changes.watch

///|
/// Subscribes to changes for a user. For more information, see [Notifications for resource changes](https://developers.google.com/workspace/drive/api/guides/push).
pub async fn DriveService::changes_watch(
  self : DriveService,
  drive_id? : String? = None,
  include_corpus_removals? : Bool? = None,
  include_items_from_all_drives? : Bool? = None,
  include_labels? : String? = None,
  include_permissions_for_view? : String? = None,
  include_removed? : Bool? = None,
  include_team_drive_items? : Bool? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  restrict_to_my_drive? : Bool? = None,
  spaces? : String? = None,
  supports_all_drives? : Bool? = None,
  supports_team_drives? : Bool? = None,
  team_drive_id? : String? = None,
) -> Channel raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match drive_id {
    Some(v) => qp.push(("driveId", url_encode(v)))
    None => ()
  }
  match include_corpus_removals {
    Some(v) =>
      qp.push(("includeCorpusRemovals", if v { "true" } else { "false" }))
    None => ()
  }
  match include_items_from_all_drives {
    Some(v) =>
      qp.push(("includeItemsFromAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match include_labels {
    Some(v) => qp.push(("includeLabels", url_encode(v)))
    None => ()
  }
  match include_permissions_for_view {
    Some(v) => qp.push(("includePermissionsForView", url_encode(v)))
    None => ()
  }
  match include_removed {
    Some(v) => qp.push(("includeRemoved", if v { "true" } else { "false" }))
    None => ()
  }
  match include_team_drive_items {
    Some(v) =>
      qp.push(("includeTeamDriveItems", if v { "true" } else { "false" }))
    None => ()
  }
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match restrict_to_my_drive {
    Some(v) => qp.push(("restrictToMyDrive", if v { "true" } else { "false" }))
    None => ()
  }
  match spaces {
    Some(v) => qp.push(("spaces", url_encode(v)))
    None => ()
  }
  match supports_all_drives {
    Some(v) => qp.push(("supportsAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_team_drives {
    Some(v) => qp.push(("supportsTeamDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match team_drive_id {
    Some(v) => qp.push(("teamDriveId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "changes" + "/" + "watch"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::POST,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.channels.stop

///|
/// Stops watching resources through this channel. For more information, see [Notifications for resource changes](https://developers.google.com/workspace/drive/api/guides/push).
pub async fn DriveService::channels_stop(
  self : DriveService,
) -> @http.HttpResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "channels" + "/" + "stop"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::POST,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  resp
}

///| drive.comments.create

///|
/// Creates a comment on a file. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments). Required: The `fields` parameter must be set. To return the exact fields you need, see [Return specific fields](https://developers.google.com/workspace/drive/api/guides/fields-parameter).
pub async fn DriveService::comments_create(
  self : DriveService,
  file_id : String,
) -> Comment raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "files" + "/" + file_id + "/" + "comments"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::POST,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.comments.delete

///|
/// Deletes a comment. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments).
pub async fn DriveService::comments_delete(
  self : DriveService,
  file_id : String,
  comment_id : String,
) -> @http.HttpResponse raise @http.HttpError {
  let path = "/" + "files" + "/" + file_id + "/" + "comments" + "/" + comment_id
  let url = self.base_url + path
  let req = @http.HttpRequest::new(url, @http.HttpMethod::DELETE, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  resp
}

///| drive.comments.get

///|
/// Gets a comment by ID. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments). Required: The `fields` parameter must be set. To return the exact fields you need, see [Return specific fields](https://developers.google.com/workspace/drive/api/guides/fields-parameter).
pub async fn DriveService::comments_get(
  self : DriveService,
  file_id : String,
  comment_id : String,
  include_deleted? : Bool? = None,
) -> Comment raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match include_deleted {
    Some(v) => qp.push(("includeDeleted", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "files" + "/" + file_id + "/" + "comments" + "/" + comment_id
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.comments.list

///|
/// Lists a file's comments. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments). Required: The `fields` parameter must be set. To return the exact fields you need, see [Return specific fields](https://developers.google.com/workspace/drive/api/guides/fields-parameter).
pub async fn DriveService::comments_list(
  self : DriveService,
  file_id : String,
  include_deleted? : Bool? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  start_modified_time? : String? = None,
) -> CommentList raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match include_deleted {
    Some(v) => qp.push(("includeDeleted", if v { "true" } else { "false" }))
    None => ()
  }
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match start_modified_time {
    Some(v) => qp.push(("startModifiedTime", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "files" + "/" + file_id + "/" + "comments"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.comments.update

///|
/// Updates a comment with patch semantics. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments). Required: The `fields` parameter must be set. To return the exact fields you need, see [Return specific fields](https://developers.google.com/workspace/drive/api/guides/fields-parameter).
pub async fn DriveService::comments_update(
  self : DriveService,
  file_id : String,
  comment_id : String,
) -> Comment raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "files" + "/" + file_id + "/" + "comments" + "/" + comment_id
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::PATCH,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.drives.create

///|
/// Creates a shared drive. For more information, see [Manage shared drives](https://developers.google.com/workspace/drive/api/guides/manage-shareddrives).
pub async fn DriveService::drives_create(
  self : DriveService,
  request_id? : String? = None,
) -> Drive raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match request_id {
    Some(v) => qp.push(("requestId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "drives"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::POST,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.drives.delete

///|
/// Permanently deletes a shared drive for which the user is an `organizer`. The shared drive cannot contain any untrashed items. For more information, see [Manage shared drives](https://developers.google.com/workspace/drive/api/guides/manage-shareddrives).
pub async fn DriveService::drives_delete(
  self : DriveService,
  drive_id : String,
  allow_item_deletion? : Bool? = None,
  use_domain_admin_access? : Bool? = None,
) -> @http.HttpResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match allow_item_deletion {
    Some(v) => qp.push(("allowItemDeletion", if v { "true" } else { "false" }))
    None => ()
  }
  match use_domain_admin_access {
    Some(v) =>
      qp.push(("useDomainAdminAccess", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "drives" + "/" + drive_id
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::DELETE, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  resp
}

///| drive.drives.get

///|
/// Gets a shared drive's metadata by ID. For more information, see [Manage shared drives](https://developers.google.com/workspace/drive/api/guides/manage-shareddrives).
pub async fn DriveService::drives_get(
  self : DriveService,
  drive_id : String,
  use_domain_admin_access? : Bool? = None,
) -> Drive raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match use_domain_admin_access {
    Some(v) =>
      qp.push(("useDomainAdminAccess", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "drives" + "/" + drive_id
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.drives.hide

///|
/// Hides a shared drive from the default view. For more information, see [Manage shared drives](https://developers.google.com/workspace/drive/api/guides/manage-shareddrives).
pub async fn DriveService::drives_hide(
  self : DriveService,
  drive_id : String,
) -> Drive raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "drives" + "/" + drive_id + "/" + "hide"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::POST,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.drives.list

///|
///  Lists the user's shared drives. This method accepts the `q` parameter, which is a search query combining one or more search terms. For more information, see the [Search for shared drives](https://developers.google.com/workspace/drive/api/guides/search-shareddrives) guide.
pub async fn DriveService::drives_list(
  self : DriveService,
  page_size? : Int? = None,
  page_token? : String? = None,
  q? : String? = None,
  use_domain_admin_access? : Bool? = None,
) -> DriveList raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match q {
    Some(v) => qp.push(("q", url_encode(v)))
    None => ()
  }
  match use_domain_admin_access {
    Some(v) =>
      qp.push(("useDomainAdminAccess", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "drives"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.drives.unhide

///|
/// Restores a shared drive to the default view. For more information, see [Manage shared drives](https://developers.google.com/workspace/drive/api/guides/manage-shareddrives).
pub async fn DriveService::drives_unhide(
  self : DriveService,
  drive_id : String,
) -> Drive raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "drives" + "/" + drive_id + "/" + "unhide"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::POST,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.drives.update

///|
/// Updates the metadata for a shared drive. For more information, see [Manage shared drives](https://developers.google.com/workspace/drive/api/guides/manage-shareddrives).
pub async fn DriveService::drives_update(
  self : DriveService,
  drive_id : String,
  use_domain_admin_access? : Bool? = None,
) -> Drive raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match use_domain_admin_access {
    Some(v) =>
      qp.push(("useDomainAdminAccess", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "drives" + "/" + drive_id
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::PATCH,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.files.copy

///|
/// Creates a copy of a file and applies any requested updates with patch semantics. For more information, see [Create and manage files](https://developers.google.com/workspace/drive/api/guides/create-file).
pub async fn DriveService::files_copy(
  self : DriveService,
  file_id : String,
  enforce_single_parent? : Bool? = None,
  ignore_default_visibility? : Bool? = None,
  include_labels? : String? = None,
  include_permissions_for_view? : String? = None,
  keep_revision_forever? : Bool? = None,
  ocr_language? : String? = None,
  supports_all_drives? : Bool? = None,
  supports_team_drives? : Bool? = None,
) -> File raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match enforce_single_parent {
    Some(v) =>
      qp.push(("enforceSingleParent", if v { "true" } else { "false" }))
    None => ()
  }
  match ignore_default_visibility {
    Some(v) =>
      qp.push(("ignoreDefaultVisibility", if v { "true" } else { "false" }))
    None => ()
  }
  match include_labels {
    Some(v) => qp.push(("includeLabels", url_encode(v)))
    None => ()
  }
  match include_permissions_for_view {
    Some(v) => qp.push(("includePermissionsForView", url_encode(v)))
    None => ()
  }
  match keep_revision_forever {
    Some(v) =>
      qp.push(("keepRevisionForever", if v { "true" } else { "false" }))
    None => ()
  }
  match ocr_language {
    Some(v) => qp.push(("ocrLanguage", url_encode(v)))
    None => ()
  }
  match supports_all_drives {
    Some(v) => qp.push(("supportsAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_team_drives {
    Some(v) => qp.push(("supportsTeamDrives", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "files" + "/" + file_id + "/" + "copy"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::POST,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.files.create

///|
///  Creates a file. For more information, see [Create and manage files](https://developers.google.com/workspace/drive/api/guides/create-file). This method supports an */upload* URI and accepts uploaded media with the following characteristics: - *Maximum file size:* 5,120 GB - *Accepted Media MIME types:* `*/*` (Specify a valid MIME type, rather than the literal `*/*` value. The literal `*/*` is only used to indicate that any valid MIME type can be uploaded. For more information, see [Google Workspace and Google Drive supported MIME types](https://developers.google.com/workspace/drive/api/guides/mime-types).) For more information on uploading files, see [Upload file data](https://developers.google.com/workspace/drive/api/guides/manage-uploads). Apps creating shortcuts with the `create` method must specify the MIME type `application/vnd.google-apps.shortcut`. Apps should specify a file extension in the `name` property when inserting files with the API. For example, an operation to insert a JPEG file should specify something like `"name": "cat.jpg"` in the metadata. Subsequent `GET` requests include the read-only `fileExtension` property populated with the extension originally specified in the `name` property. When a Google Drive user requests to download a file, or when the file is downloaded through the sync client, Drive builds a full filename (with extension) based on the name. In cases where the extension is missing, Drive attempts to determine the extension based on the file's MIME type.
pub async fn DriveService::files_create(
  self : DriveService,
  enforce_single_parent? : Bool? = None,
  ignore_default_visibility? : Bool? = None,
  include_labels? : String? = None,
  include_permissions_for_view? : String? = None,
  keep_revision_forever? : Bool? = None,
  ocr_language? : String? = None,
  supports_all_drives? : Bool? = None,
  supports_team_drives? : Bool? = None,
  use_content_as_indexable_text? : Bool? = None,
) -> File raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match enforce_single_parent {
    Some(v) =>
      qp.push(("enforceSingleParent", if v { "true" } else { "false" }))
    None => ()
  }
  match ignore_default_visibility {
    Some(v) =>
      qp.push(("ignoreDefaultVisibility", if v { "true" } else { "false" }))
    None => ()
  }
  match include_labels {
    Some(v) => qp.push(("includeLabels", url_encode(v)))
    None => ()
  }
  match include_permissions_for_view {
    Some(v) => qp.push(("includePermissionsForView", url_encode(v)))
    None => ()
  }
  match keep_revision_forever {
    Some(v) =>
      qp.push(("keepRevisionForever", if v { "true" } else { "false" }))
    None => ()
  }
  match ocr_language {
    Some(v) => qp.push(("ocrLanguage", url_encode(v)))
    None => ()
  }
  match supports_all_drives {
    Some(v) => qp.push(("supportsAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_team_drives {
    Some(v) => qp.push(("supportsTeamDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match use_content_as_indexable_text {
    Some(v) =>
      qp.push(("useContentAsIndexableText", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "files"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::POST,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.files.delete

///|
/// Permanently deletes a file owned by the user without moving it to the trash. For more information, see [Trash or delete files and folders](https://developers.google.com/workspace/drive/api/guides/delete). If the file belongs to a shared drive, the user must be an `organizer` on the parent folder. If the target is a folder, all descendants owned by the user are also deleted.
pub async fn DriveService::files_delete(
  self : DriveService,
  file_id : String,
  enforce_single_parent? : Bool? = None,
  supports_all_drives? : Bool? = None,
  supports_team_drives? : Bool? = None,
) -> @http.HttpResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match enforce_single_parent {
    Some(v) =>
      qp.push(("enforceSingleParent", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_all_drives {
    Some(v) => qp.push(("supportsAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_team_drives {
    Some(v) => qp.push(("supportsTeamDrives", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "files" + "/" + file_id
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::DELETE, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  resp
}

///| drive.files.download

///|
/// Downloads the content of a file. For more information, see [Download and export files](https://developers.google.com/workspace/drive/api/guides/manage-downloads). Operations are valid for 24 hours from the time of creation.
pub async fn DriveService::files_download(
  self : DriveService,
  file_id : String,
  mime_type? : String? = None,
  revision_id? : String? = None,
) -> Operation raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match mime_type {
    Some(v) => qp.push(("mimeType", url_encode(v)))
    None => ()
  }
  match revision_id {
    Some(v) => qp.push(("revisionId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "files" + "/" + file_id + "/" + "download"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::POST,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.files.emptyTrash

///|
/// Permanently deletes all of the user's trashed files. For more information, see [Trash or delete files and folders](https://developers.google.com/workspace/drive/api/guides/delete).
pub async fn DriveService::files_empty_trash(
  self : DriveService,
  drive_id? : String? = None,
  enforce_single_parent? : Bool? = None,
) -> @http.HttpResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match drive_id {
    Some(v) => qp.push(("driveId", url_encode(v)))
    None => ()
  }
  match enforce_single_parent {
    Some(v) =>
      qp.push(("enforceSingleParent", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "files" + "/" + "trash"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::DELETE, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  resp
}

///| drive.files.export

///|
/// Exports a Google Workspace document to the requested MIME type and returns exported byte content. For more information, see [Download and export files](https://developers.google.com/workspace/drive/api/guides/manage-downloads). Note that the exported content is limited to 10 MB.
pub async fn DriveService::files_export(
  self : DriveService,
  file_id : String,
  mime_type? : String? = None,
) -> @http.HttpResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match mime_type {
    Some(v) => qp.push(("mimeType", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "files" + "/" + file_id + "/" + "export"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  resp
}

///| drive.files.generateIds

///|
/// Generates a set of file IDs which can be provided in create or copy requests. For more information, see [Create and manage files](https://developers.google.com/workspace/drive/api/guides/create-file).
pub async fn DriveService::files_generate_ids(
  self : DriveService,
  count? : Int? = None,
  space? : String? = None,
  type_? : String? = None,
) -> GeneratedIds raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match count {
    Some(v) => qp.push(("count", v.to_string()))
    None => ()
  }
  match space {
    Some(v) => qp.push(("space", url_encode(v)))
    None => ()
  }
  match type_ {
    Some(v) => qp.push(("type", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "files" + "/" + "generateIds"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.files.get

///|
///  Gets a file's metadata or content by ID. For more information, see [Search for files and folders](https://developers.google.com/workspace/drive/api/guides/search-files). If you provide the URL parameter `alt=media`, then the response includes the file contents in the response body. Downloading content with `alt=media` only works if the file is stored in Drive. To download Google Docs, Sheets, and Slides use [`files.export`](https://developers.google.com/workspace/drive/api/reference/rest/v3/files/export) instead. For more information, see [Download and export files](https://developers.google.com/workspace/drive/api/guides/manage-downloads).
pub async fn DriveService::files_get(
  self : DriveService,
  file_id : String,
  acknowledge_abuse? : Bool? = None,
  include_labels? : String? = None,
  include_permissions_for_view? : String? = None,
  supports_all_drives? : Bool? = None,
  supports_team_drives? : Bool? = None,
) -> File raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match acknowledge_abuse {
    Some(v) => qp.push(("acknowledgeAbuse", if v { "true" } else { "false" }))
    None => ()
  }
  match include_labels {
    Some(v) => qp.push(("includeLabels", url_encode(v)))
    None => ()
  }
  match include_permissions_for_view {
    Some(v) => qp.push(("includePermissionsForView", url_encode(v)))
    None => ()
  }
  match supports_all_drives {
    Some(v) => qp.push(("supportsAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_team_drives {
    Some(v) => qp.push(("supportsTeamDrives", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "files" + "/" + file_id
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.files.list

///|
///  Lists the user's files. For more information, see [Search for files and folders](https://developers.google.com/workspace/drive/api/guides/search-files). This method accepts the `q` parameter, which is a search query combining one or more search terms. This method returns *all* files by default, including trashed files. If you don't want trashed files to appear in the list, use the `trashed=false` query parameter to remove trashed files from the results.
pub async fn DriveService::files_list(
  self : DriveService,
  corpora? : String? = None,
  corpus? : String? = None,
  drive_id? : String? = None,
  include_items_from_all_drives? : Bool? = None,
  include_labels? : String? = None,
  include_permissions_for_view? : String? = None,
  include_team_drive_items? : Bool? = None,
  order_by? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  q? : String? = None,
  spaces? : String? = None,
  supports_all_drives? : Bool? = None,
  supports_team_drives? : Bool? = None,
  team_drive_id? : String? = None,
) -> FileList raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match corpora {
    Some(v) => qp.push(("corpora", url_encode(v)))
    None => ()
  }
  match corpus {
    Some(v) => qp.push(("corpus", url_encode(v)))
    None => ()
  }
  match drive_id {
    Some(v) => qp.push(("driveId", url_encode(v)))
    None => ()
  }
  match include_items_from_all_drives {
    Some(v) =>
      qp.push(("includeItemsFromAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match include_labels {
    Some(v) => qp.push(("includeLabels", url_encode(v)))
    None => ()
  }
  match include_permissions_for_view {
    Some(v) => qp.push(("includePermissionsForView", url_encode(v)))
    None => ()
  }
  match include_team_drive_items {
    Some(v) =>
      qp.push(("includeTeamDriveItems", if v { "true" } else { "false" }))
    None => ()
  }
  match order_by {
    Some(v) => qp.push(("orderBy", url_encode(v)))
    None => ()
  }
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match q {
    Some(v) => qp.push(("q", url_encode(v)))
    None => ()
  }
  match spaces {
    Some(v) => qp.push(("spaces", url_encode(v)))
    None => ()
  }
  match supports_all_drives {
    Some(v) => qp.push(("supportsAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_team_drives {
    Some(v) => qp.push(("supportsTeamDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match team_drive_id {
    Some(v) => qp.push(("teamDriveId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "files"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.files.listLabels

///|
/// Lists the labels on a file. For more information, see [List labels on a file](https://developers.google.com/workspace/drive/api/guides/list-labels).
pub async fn DriveService::files_list_labels(
  self : DriveService,
  file_id : String,
  max_results? : Int? = None,
  page_token? : String? = None,
) -> LabelList raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match max_results {
    Some(v) => qp.push(("maxResults", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "files" + "/" + file_id + "/" + "listLabels"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.files.modifyLabels

///|
/// Modifies the set of labels applied to a file. For more information, see [Set a label field on a file](https://developers.google.com/workspace/drive/api/guides/set-label). Returns a list of the labels that were added or modified.
pub async fn DriveService::files_modify_labels(
  self : DriveService,
  file_id : String,
) -> ModifyLabelsResponse raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "files" + "/" + file_id + "/" + "modifyLabels"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::POST,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.files.update

///|
///  Updates a file's metadata, content, or both. When calling this method, only populate fields in the request that you want to modify. When updating fields, some fields might be changed automatically, such as `modifiedDate`. This method supports patch semantics. This method supports an */upload* URI and accepts uploaded media with the following characteristics: - *Maximum file size:* 5,120 GB - *Accepted Media MIME types:* `*/*` (Specify a valid MIME type, rather than the literal `*/*` value. The literal `*/*` is only used to indicate that any valid MIME type can be uploaded. For more information, see [Google Workspace and Google Drive supported MIME types](https://developers.google.com/workspace/drive/api/guides/mime-types).) For more information on uploading files, see [Upload file data](https://developers.google.com/workspace/drive/api/guides/manage-uploads).
pub async fn DriveService::files_update(
  self : DriveService,
  file_id : String,
  add_parents? : String? = None,
  enforce_single_parent? : Bool? = None,
  include_labels? : String? = None,
  include_permissions_for_view? : String? = None,
  keep_revision_forever? : Bool? = None,
  ocr_language? : String? = None,
  remove_parents? : String? = None,
  supports_all_drives? : Bool? = None,
  supports_team_drives? : Bool? = None,
  use_content_as_indexable_text? : Bool? = None,
) -> File raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match add_parents {
    Some(v) => qp.push(("addParents", url_encode(v)))
    None => ()
  }
  match enforce_single_parent {
    Some(v) =>
      qp.push(("enforceSingleParent", if v { "true" } else { "false" }))
    None => ()
  }
  match include_labels {
    Some(v) => qp.push(("includeLabels", url_encode(v)))
    None => ()
  }
  match include_permissions_for_view {
    Some(v) => qp.push(("includePermissionsForView", url_encode(v)))
    None => ()
  }
  match keep_revision_forever {
    Some(v) =>
      qp.push(("keepRevisionForever", if v { "true" } else { "false" }))
    None => ()
  }
  match ocr_language {
    Some(v) => qp.push(("ocrLanguage", url_encode(v)))
    None => ()
  }
  match remove_parents {
    Some(v) => qp.push(("removeParents", url_encode(v)))
    None => ()
  }
  match supports_all_drives {
    Some(v) => qp.push(("supportsAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_team_drives {
    Some(v) => qp.push(("supportsTeamDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match use_content_as_indexable_text {
    Some(v) =>
      qp.push(("useContentAsIndexableText", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "files" + "/" + file_id
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::PATCH,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.files.watch

///|
/// Subscribes to changes to a file. For more information, see [Notifications for resource changes](https://developers.google.com/workspace/drive/api/guides/push).
pub async fn DriveService::files_watch(
  self : DriveService,
  file_id : String,
  acknowledge_abuse? : Bool? = None,
  include_labels? : String? = None,
  include_permissions_for_view? : String? = None,
  supports_all_drives? : Bool? = None,
  supports_team_drives? : Bool? = None,
) -> Channel raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match acknowledge_abuse {
    Some(v) => qp.push(("acknowledgeAbuse", if v { "true" } else { "false" }))
    None => ()
  }
  match include_labels {
    Some(v) => qp.push(("includeLabels", url_encode(v)))
    None => ()
  }
  match include_permissions_for_view {
    Some(v) => qp.push(("includePermissionsForView", url_encode(v)))
    None => ()
  }
  match supports_all_drives {
    Some(v) => qp.push(("supportsAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_team_drives {
    Some(v) => qp.push(("supportsTeamDrives", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "files" + "/" + file_id + "/" + "watch"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::POST,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.operations.get

///|
/// Gets the latest state of a long-running operation. Clients can use this method to poll the operation result at intervals as recommended by the API service.
pub async fn DriveService::operations_get(
  self : DriveService,
  name : String,
) -> Operation raise @http.HttpError {
  let path = "/" + "operations" + "/" + name
  let url = self.base_url + path
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.permissions.create

///|
/// Creates a permission for a file or shared drive. For more information, see [Share files, folders, and drives](https://developers.google.com/workspace/drive/api/guides/manage-sharing). **Warning:** Concurrent permissions operations on the same file aren't supported; only the last update is applied.
pub async fn DriveService::permissions_create(
  self : DriveService,
  file_id : String,
  email_message? : String? = None,
  enforce_expansive_access? : Bool? = None,
  enforce_single_parent? : Bool? = None,
  move_to_new_owners_root? : Bool? = None,
  send_notification_email? : Bool? = None,
  supports_all_drives? : Bool? = None,
  supports_team_drives? : Bool? = None,
  transfer_ownership? : Bool? = None,
  use_domain_admin_access? : Bool? = None,
) -> Permission raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match email_message {
    Some(v) => qp.push(("emailMessage", url_encode(v)))
    None => ()
  }
  match enforce_expansive_access {
    Some(v) =>
      qp.push(("enforceExpansiveAccess", if v { "true" } else { "false" }))
    None => ()
  }
  match enforce_single_parent {
    Some(v) =>
      qp.push(("enforceSingleParent", if v { "true" } else { "false" }))
    None => ()
  }
  match move_to_new_owners_root {
    Some(v) =>
      qp.push(("moveToNewOwnersRoot", if v { "true" } else { "false" }))
    None => ()
  }
  match send_notification_email {
    Some(v) =>
      qp.push(("sendNotificationEmail", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_all_drives {
    Some(v) => qp.push(("supportsAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_team_drives {
    Some(v) => qp.push(("supportsTeamDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match transfer_ownership {
    Some(v) => qp.push(("transferOwnership", if v { "true" } else { "false" }))
    None => ()
  }
  match use_domain_admin_access {
    Some(v) =>
      qp.push(("useDomainAdminAccess", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "files" + "/" + file_id + "/" + "permissions"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::POST,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.permissions.delete

///|
/// Deletes a permission. For more information, see [Share files, folders, and drives](https://developers.google.com/workspace/drive/api/guides/manage-sharing). **Warning:** Concurrent permissions operations on the same file aren't supported; only the last update is applied.
pub async fn DriveService::permissions_delete(
  self : DriveService,
  file_id : String,
  permission_id : String,
  enforce_expansive_access? : Bool? = None,
  supports_all_drives? : Bool? = None,
  supports_team_drives? : Bool? = None,
  use_domain_admin_access? : Bool? = None,
) -> @http.HttpResponse raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match enforce_expansive_access {
    Some(v) =>
      qp.push(("enforceExpansiveAccess", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_all_drives {
    Some(v) => qp.push(("supportsAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_team_drives {
    Some(v) => qp.push(("supportsTeamDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match use_domain_admin_access {
    Some(v) =>
      qp.push(("useDomainAdminAccess", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "files" +
    "/" +
    file_id +
    "/" +
    "permissions" +
    "/" +
    permission_id
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::DELETE, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  resp
}

///| drive.permissions.get

///|
/// Gets a permission by ID. For more information, see [Share files, folders, and drives](https://developers.google.com/workspace/drive/api/guides/manage-sharing).
pub async fn DriveService::permissions_get(
  self : DriveService,
  file_id : String,
  permission_id : String,
  supports_all_drives? : Bool? = None,
  supports_team_drives? : Bool? = None,
  use_domain_admin_access? : Bool? = None,
) -> Permission raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match supports_all_drives {
    Some(v) => qp.push(("supportsAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_team_drives {
    Some(v) => qp.push(("supportsTeamDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match use_domain_admin_access {
    Some(v) =>
      qp.push(("useDomainAdminAccess", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "files" +
    "/" +
    file_id +
    "/" +
    "permissions" +
    "/" +
    permission_id
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.permissions.list

///|
/// Lists a file's or shared drive's permissions. For more information, see [Share files, folders, and drives](https://developers.google.com/workspace/drive/api/guides/manage-sharing).
pub async fn DriveService::permissions_list(
  self : DriveService,
  file_id : String,
  include_permissions_for_view? : String? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
  supports_all_drives? : Bool? = None,
  supports_team_drives? : Bool? = None,
  use_domain_admin_access? : Bool? = None,
) -> PermissionList raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match include_permissions_for_view {
    Some(v) => qp.push(("includePermissionsForView", url_encode(v)))
    None => ()
  }
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match supports_all_drives {
    Some(v) => qp.push(("supportsAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_team_drives {
    Some(v) => qp.push(("supportsTeamDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match use_domain_admin_access {
    Some(v) =>
      qp.push(("useDomainAdminAccess", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "files" + "/" + file_id + "/" + "permissions"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.permissions.update

///|
/// Updates a permission with patch semantics. For more information, see [Share files, folders, and drives](https://developers.google.com/workspace/drive/api/guides/manage-sharing). **Warning:** Concurrent permissions operations on the same file aren't supported; only the last update is applied.
pub async fn DriveService::permissions_update(
  self : DriveService,
  file_id : String,
  permission_id : String,
  enforce_expansive_access? : Bool? = None,
  remove_expiration? : Bool? = None,
  supports_all_drives? : Bool? = None,
  supports_team_drives? : Bool? = None,
  transfer_ownership? : Bool? = None,
  use_domain_admin_access? : Bool? = None,
) -> Permission raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match enforce_expansive_access {
    Some(v) =>
      qp.push(("enforceExpansiveAccess", if v { "true" } else { "false" }))
    None => ()
  }
  match remove_expiration {
    Some(v) => qp.push(("removeExpiration", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_all_drives {
    Some(v) => qp.push(("supportsAllDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match supports_team_drives {
    Some(v) => qp.push(("supportsTeamDrives", if v { "true" } else { "false" }))
    None => ()
  }
  match transfer_ownership {
    Some(v) => qp.push(("transferOwnership", if v { "true" } else { "false" }))
    None => ()
  }
  match use_domain_admin_access {
    Some(v) =>
      qp.push(("useDomainAdminAccess", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" +
    "files" +
    "/" +
    file_id +
    "/" +
    "permissions" +
    "/" +
    permission_id
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::PATCH,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.replies.create

///|
/// Creates a reply to a comment. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments).
pub async fn DriveService::replies_create(
  self : DriveService,
  file_id : String,
  comment_id : String,
) -> Reply raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" +
    "files" +
    "/" +
    file_id +
    "/" +
    "comments" +
    "/" +
    comment_id +
    "/" +
    "replies"
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::POST,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.replies.delete

///|
/// Deletes a reply. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments).
pub async fn DriveService::replies_delete(
  self : DriveService,
  file_id : String,
  comment_id : String,
  reply_id : String,
) -> @http.HttpResponse raise @http.HttpError {
  let path = "/" +
    "files" +
    "/" +
    file_id +
    "/" +
    "comments" +
    "/" +
    comment_id +
    "/" +
    "replies" +
    "/" +
    reply_id
  let url = self.base_url + path
  let req = @http.HttpRequest::new(url, @http.HttpMethod::DELETE, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  resp
}

///| drive.replies.get

///|
/// Gets a reply by ID. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments).
pub async fn DriveService::replies_get(
  self : DriveService,
  file_id : String,
  comment_id : String,
  reply_id : String,
  include_deleted? : Bool? = None,
) -> Reply raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match include_deleted {
    Some(v) => qp.push(("includeDeleted", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "files" +
    "/" +
    file_id +
    "/" +
    "comments" +
    "/" +
    comment_id +
    "/" +
    "replies" +
    "/" +
    reply_id
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.replies.list

///|
/// Lists a comment's replies. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments).
pub async fn DriveService::replies_list(
  self : DriveService,
  file_id : String,
  comment_id : String,
  include_deleted? : Bool? = None,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> ReplyList raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match include_deleted {
    Some(v) => qp.push(("includeDeleted", if v { "true" } else { "false" }))
    None => ()
  }
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "files" +
    "/" +
    file_id +
    "/" +
    "comments" +
    "/" +
    comment_id +
    "/" +
    "replies"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.replies.update

///|
/// Updates a reply with patch semantics. For more information, see [Manage comments and replies](https://developers.google.com/workspace/drive/api/guides/manage-comments).
pub async fn DriveService::replies_update(
  self : DriveService,
  file_id : String,
  comment_id : String,
  reply_id : String,
) -> Reply raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" +
    "files" +
    "/" +
    file_id +
    "/" +
    "comments" +
    "/" +
    comment_id +
    "/" +
    "replies" +
    "/" +
    reply_id
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::PATCH,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.revisions.delete

///|
/// Permanently deletes a file version. You can only delete revisions for files with binary content in Google Drive, like images or videos. Revisions for other files, like Google Docs or Sheets, and the last remaining file version can't be deleted. For more information, see [Manage file revisions](https://developers.google.com/drive/api/guides/manage-revisions).
pub async fn DriveService::revisions_delete(
  self : DriveService,
  file_id : String,
  revision_id : String,
) -> @http.HttpResponse raise @http.HttpError {
  let path = "/" +
    "files" +
    "/" +
    file_id +
    "/" +
    "revisions" +
    "/" +
    revision_id
  let url = self.base_url + path
  let req = @http.HttpRequest::new(url, @http.HttpMethod::DELETE, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  resp
}

///| drive.revisions.get

///|
/// Gets a revision's metadata or content by ID. For more information, see [Manage file revisions](https://developers.google.com/workspace/drive/api/guides/manage-revisions).
pub async fn DriveService::revisions_get(
  self : DriveService,
  file_id : String,
  revision_id : String,
  acknowledge_abuse? : Bool? = None,
) -> Revision raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match acknowledge_abuse {
    Some(v) => qp.push(("acknowledgeAbuse", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" +
    "files" +
    "/" +
    file_id +
    "/" +
    "revisions" +
    "/" +
    revision_id
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.revisions.list

///|
/// Lists a file's revisions. For more information, see [Manage file revisions](https://developers.google.com/workspace/drive/api/guides/manage-revisions). **Important:** The list of revisions returned by this method might be incomplete for files with a large revision history, including frequently edited Google Docs, Sheets, and Slides. Older revisions might be omitted from the response, meaning the first revision returned may not be the oldest existing revision. The revision history visible in the Workspace editor user interface might be more complete than the list returned by the API.
pub async fn DriveService::revisions_list(
  self : DriveService,
  file_id : String,
  page_size? : Int? = None,
  page_token? : String? = None,
) -> RevisionList raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "files" + "/" + file_id + "/" + "revisions"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.revisions.update

///|
/// Updates a revision with patch semantics. For more information, see [Manage file revisions](https://developers.google.com/workspace/drive/api/guides/manage-revisions).
pub async fn DriveService::revisions_update(
  self : DriveService,
  file_id : String,
  revision_id : String,
) -> Revision raise @http.HttpError {
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" +
    "files" +
    "/" +
    file_id +
    "/" +
    "revisions" +
    "/" +
    revision_id
  let url = self.base_url + path
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::PATCH,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.teamdrives.create

///|
/// Deprecated: Use `drives.create` instead.
pub async fn DriveService::teamdrives_create(
  self : DriveService,
  request_id? : String? = None,
) -> TeamDrive raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match request_id {
    Some(v) => qp.push(("requestId", url_encode(v)))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "teamdrives"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::POST,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.teamdrives.delete

///|
/// Deprecated: Use `drives.delete` instead.
pub async fn DriveService::teamdrives_delete(
  self : DriveService,
  team_drive_id : String,
) -> @http.HttpResponse raise @http.HttpError {
  let path = "/" + "teamdrives" + "/" + team_drive_id
  let url = self.base_url + path
  let req = @http.HttpRequest::new(url, @http.HttpMethod::DELETE, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  resp
}

///| drive.teamdrives.get

///|
/// Deprecated: Use `drives.get` instead.
pub async fn DriveService::teamdrives_get(
  self : DriveService,
  team_drive_id : String,
  use_domain_admin_access? : Bool? = None,
) -> TeamDrive raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match use_domain_admin_access {
    Some(v) =>
      qp.push(("useDomainAdminAccess", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "teamdrives" + "/" + team_drive_id
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.teamdrives.list

///|
/// Deprecated: Use `drives.list` instead.
pub async fn DriveService::teamdrives_list(
  self : DriveService,
  page_size? : Int? = None,
  page_token? : String? = None,
  q? : String? = None,
  use_domain_admin_access? : Bool? = None,
) -> TeamDriveList raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match page_size {
    Some(v) => qp.push(("pageSize", v.to_string()))
    None => ()
  }
  match page_token {
    Some(v) => qp.push(("pageToken", url_encode(v)))
    None => ()
  }
  match q {
    Some(v) => qp.push(("q", url_encode(v)))
    None => ()
  }
  match use_domain_admin_access {
    Some(v) =>
      qp.push(("useDomainAdminAccess", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let path = "/" + "teamdrives"
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(url, @http.HttpMethod::GET, {})
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}

///| drive.teamdrives.update

///|
/// Deprecated: Use `drives.update` instead.
pub async fn DriveService::teamdrives_update(
  self : DriveService,
  team_drive_id : String,
  use_domain_admin_access? : Bool? = None,
) -> TeamDrive raise @http.HttpError {
  let qp : Array[(String, String)] = Array::new()
  match use_domain_admin_access {
    Some(v) =>
      qp.push(("useDomainAdminAccess", if v { "true" } else { "false" }))
    None => ()
  }
  let qs = build_query_string(qp)
  let meta : Map[String, Json] = Map::new()
  let body = Json::object(meta).stringify()
  let h : Map[String, String] = {}
  h.set("Content-Type", "application/json")
  let path = "/" + "teamdrives" + "/" + team_drive_id
  let url = if qs.is_empty() {
    self.base_url + path
  } else {
    self.base_url + path + "?" + qs
  }
  let req = @http.HttpRequest::new(
    url,
    @http.HttpMethod::PATCH,
    h,
    body=Some(body),
  )
  let resp = self.client.request(req) catch { e => raise e }
  if resp.status_code >= 400 {
    raise @http.HttpError::network_message(
      "HTTP " + resp.status_code.to_string() + ": " + resp.body,
    )
  }
  let json = @json.parse(resp.body) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
  @json.from_json(json) catch {
    e => raise @http.HttpError::network_message(e.to_string())
  }
}
