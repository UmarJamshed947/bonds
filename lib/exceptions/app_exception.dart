
class AppException implements Exception{
  final String? _message;
  final String? _prefix;
  AppException([this._message, this._prefix]);
  @override
  String toString(){
    return "$_message$_prefix";
  }
}

class FetchException extends AppException{
  FetchException([String? message]) : super(message ,"Error during communication");
}

class BadRequestException extends AppException{
  BadRequestException([String? message]) : super(message, "Invalid request");
}
class UnAuthorisedRequest extends AppException{
  UnAuthorisedRequest([String? message]) : super(message, "UnAuthorised Request");
}
class InvalidInputException extends AppException{
  InvalidInputException([String? message]) : super(message, "Invalid Input Exception");
}