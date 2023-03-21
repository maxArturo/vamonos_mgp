enum ErrorType {
  untypedError,
  httpError,
  initializationError,
  permissionError,
  serviceUnavailableError,
  parsingError,
  dataNotFoundError,
  locationServiceError,
}

abstract class AppError {
  final ErrorType _errorType;
  final String _userText;

  get errorType => _errorType;
  get userText => _userText;

  String? description;

  AppError(
      {required ErrorType errorType,
      required String userText,
      this.description})
      : _errorType = errorType,
        _userText = userText;
}

class HttpError extends AppError {
  HttpError()
      : super(
            errorType: ErrorType.httpError,
            userText: "Could not connect to server");
}

class InitializationError extends AppError {
  InitializationError()
      : super(
            errorType: ErrorType.initializationError,
            userText: "Error with app initialization");
}

class PermissionError extends AppError {
  PermissionError()
      : super(
            errorType: ErrorType.permissionError, userText: "Permission error");
}

class ServiceUnavailableError extends AppError {
  ServiceUnavailableError({super.description})
      : super(
            errorType: ErrorType.serviceUnavailableError,
            userText: "Service is unavailable");
}

class DataNotFoundError extends AppError {
  DataNotFoundError({super.description})
      : super(
            errorType: ErrorType.dataNotFoundError, userText: "Data not found");
}

class ParsingError extends AppError {
  ParsingError({super.description})
      : super(
            errorType: ErrorType.parsingError,
            userText: "Error processing data");
}

class UntypedError extends AppError {
  UntypedError({super.description})
      : super(
            errorType: ErrorType.parsingError,
            userText: "An unexpected error occurred");
}

class LocationServiceError extends AppError {
  LocationServiceError({super.description})
      : super(
            errorType: ErrorType.locationServiceError,
            userText: "Current location not available");
}
