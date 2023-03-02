enum ErrorType { httpError, initializationError }

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
