///Manage the status of error codes
class RequestStatus {
  //Code of successful data
  static const int requestDataOk = 0;

  //The request is successful
  static const int success = 200;

  //The request is created & successful
  static const int created = 201;

  //The request is accepted & successful
  static const int accepted = 202;

  //The request is successful but no content
  static const int noContent = 204;

  //The server access NOT ALLOWED
  static const int notAllowed = 403;

  //The server access NOT ALLOWED
  static const int unAuthorized = 401;

  //The server access FORBIDDEN
  static const int forbidden = 403;

  static const int notFound = 404;

  //Other errors
  static const int unknownError = 1000;

  //network error
  static const int networkError = 1001;

  //Server connection error
  static const int socketError = 1002;

  //internal Server error
  static const int serverError = 1003;

  //TIMEOUT_ERROR
  static const int timeoutError = 1004;

  //CANCEL_ERROR
  static const int cancelError = 1005;

  //PARSE_ERROR
  static const int parseError = 1006;
}
