///|
pub(open) trait HttpClient {
  async request(Self, HttpRequest) -> HttpResponse raise HttpError
}
