class AppException implements Exception {
  final dynamic _message;

  AppException(this._message);

  @override
  String toString() {
    return "$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException(super.message);
}

class TimeOutException extends AppException {
  TimeOutException(super.message);
}

class ServerException extends AppException {
  ServerException(super.message);
}

class InvalidInputException extends AppException {
  InvalidInputException(super.message);
}