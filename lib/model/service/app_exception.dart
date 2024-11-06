class AppException implements Exception {
  final String message;
  AppException(this.message);
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