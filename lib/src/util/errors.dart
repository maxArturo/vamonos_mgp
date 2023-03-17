enum ErrorType {
  untypedError,
  httpError,
  initializationError,
  permissionError,
  serviceUnavailableError,
  parsingError,
  dataNotFoundError
}

abstract class AppError {
  final ErrorType _errorType;
  get errorType => _errorType;

  String? description;

  AppError({required ErrorType errorType, this.description})
      : _errorType = errorType;
}

class HttpError extends AppError {
  HttpError() : super(errorType: ErrorType.httpError);
}

class InitializationError extends AppError {
  InitializationError() : super(errorType: ErrorType.initializationError);
}

class PermissionError extends AppError {
  PermissionError() : super(errorType: ErrorType.permissionError);
}

class ServiceUnavailableError extends AppError {
  ServiceUnavailableError({super.description})
      : super(errorType: ErrorType.serviceUnavailableError);
}

class DataNotFoundError extends AppError {
  DataNotFoundError({super.description})
      : super(errorType: ErrorType.dataNotFoundError);
}

class ParsingError extends AppError {
  ParsingError({super.description}) : super(errorType: ErrorType.parsingError);
}

class UntypedError extends AppError {
  UntypedError() : super(errorType: ErrorType.parsingError);
}
