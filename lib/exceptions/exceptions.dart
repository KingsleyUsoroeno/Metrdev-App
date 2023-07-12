enum ExceptionLevel { warning, error }

class UserSignInFailedException implements Exception {
  final String message;

  UserSignInFailedException(this.message);
}

abstract class _ExceptionWrapper implements Exception {
  final dynamic cause;
  final int? statusCode;

  _ExceptionWrapper({required this.cause, this.statusCode});

  @override
  String toString() {
    Object? message = cause;
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}

class ConnectionException extends _ExceptionWrapper {
  ConnectionException(final dynamic cause) : super(cause: cause);
}

class ClientSideError extends _ExceptionWrapper {
  final int? errorCode;
  final dynamic data;

  ClientSideError({
    required this.errorCode,
    required this.data,
  }) : super(cause: 'HttpException', statusCode: errorCode);
}

class ServerSideError extends _ExceptionWrapper {
  final int? errorCode;
  final dynamic data;

  ServerSideError({
    required this.errorCode,
    required this.data,
  }) : super(cause: 'Unexpected HTTP $errorCode received', statusCode: errorCode);
}

class UnknownError extends _ExceptionWrapper {
  UnknownError(
    final dynamic cause,
    final StackTrace? stackTrace, {
    final dynamic details,
  }) : super(cause: cause);
}
