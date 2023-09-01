enum ErrorType {
  untypedError,
  httpError,
  initializationError,
  permissionError,
  serviceUnavailableError,
  parsingError,
  dataNotFoundError,
  locationServiceError,
  libraryImplementationError,
  fileSystemError,
}

abstract class AppError {
  final ErrorType _errorType;
  final String _userText;
  final String? description;
  final StackTrace _stackTrace;

  get errorType => _errorType;
  get userText => _userText;
  get stackTrace => _stackTrace;

  AppError(
      {required ErrorType errorType,
      required String userText,
      this.description = "An unexpected error occurred",
      StackTrace? stackTrace})
      : _errorType = errorType,
        _userText = userText,
        _stackTrace = stackTrace ?? StackTrace.current;
}

class HttpError extends AppError {
  HttpError({super.description, super.stackTrace})
      : super(
            errorType: ErrorType.httpError,
            userText: "Could not connect to server");
}

class InitializationError extends AppError {
  InitializationError({super.description, super.stackTrace})
      : super(
            errorType: ErrorType.initializationError,
            userText: "Error with app initialization");
}

class PermissionError extends AppError {
  PermissionError({super.description, super.stackTrace})
      : super(
            errorType: ErrorType.permissionError, userText: "Permission error");
}

class ServiceUnavailableError extends AppError {
  ServiceUnavailableError({super.description, super.stackTrace})
      : super(
            errorType: ErrorType.serviceUnavailableError,
            userText: "Service is unavailable");
}

class DataNotFoundError extends AppError {
  DataNotFoundError({super.description, super.stackTrace})
      : super(
            errorType: ErrorType.dataNotFoundError, userText: "Data not found");
}

class ParsingError extends AppError {
  ParsingError({super.description, super.stackTrace})
      : super(
            errorType: ErrorType.parsingError,
            userText: "Error processing data");
}

class UntypedError extends AppError {
  UntypedError({super.description, super.stackTrace})
      : super(
            errorType: ErrorType.untypedError,
            userText: "An unexpected error occurred");
}

class LocationServiceError extends AppError {
  LocationServiceError({super.description, super.stackTrace})
      : super(
            errorType: ErrorType.locationServiceError,
            userText: "Ubicación actual no disponible");
}

class LibraryImplementationError extends AppError {
  LibraryImplementationError({super.description, super.stackTrace})
      : super(
            errorType: ErrorType.libraryImplementationError,
            userText: "A software internal error occurred");
}

class FileSystemError extends AppError {
  FileSystemError({super.description, super.stackTrace})
      : super(
            errorType: ErrorType.fileSystemError,
            userText: "Error reading file");
}
