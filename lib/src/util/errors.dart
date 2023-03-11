enum ErrorType {
  untypedError,
  httpError,
  initializationError,
  permissionError,
  serviceUnavailableError,
  parsingError
}

abstract class AppError {
  ErrorType error;
  get errorType => ErrorType;

  String? description;

  AppError(this.error, {this.description});
}

class HttpError extends AppError {
  HttpError() : super(ErrorType.httpError);
}

class InitializationError extends AppError {
  InitializationError() : super(ErrorType.initializationError);
}

class PermissionError extends AppError {
  PermissionError() : super(ErrorType.permissionError);
}

class ServiceUnavailableError extends AppError {
  ServiceUnavailableError() : super(ErrorType.serviceUnavailableError);
}

class ParsingError extends AppError {
  ParsingError({super.description}) : super(ErrorType.parsingError);
}

class UntypedError extends AppError {
  UntypedError() : super(ErrorType.parsingError);
}
