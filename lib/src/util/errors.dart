enum ErrorType {
  httpError,
  initializationError,
  permissionError,
  serviceUnavailableError
}

abstract class AppError {
  ErrorType error;
  get errorType => ErrorType;
  AppError(this.error);
}

class HttpError extends AppError {
  HttpError() : super(ErrorType.httpError);

  @override
  String toString() {
    return error.toString();
  }
}

class InitializationError extends AppError {
  InitializationError() : super(ErrorType.initializationError);

  @override
  String toString() {
    return error.toString();
  }
}

class PermissionError extends AppError {
  PermissionError() : super(ErrorType.permissionError);

  @override
  String toString() {
    return error.toString();
  }
}

class ServiceUnavailableError extends AppError {
  ServiceUnavailableError() : super(ErrorType.serviceUnavailableError);

  @override
  String toString() {
    return error.toString();
  }
}
