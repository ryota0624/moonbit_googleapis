///|
pub(open) trait HttpClient {
  request(Self, HttpRequest) -> HttpResponse raise HttpError
}
