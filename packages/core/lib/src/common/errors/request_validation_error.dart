class RequestValidationError implements Exception {
  RequestValidationError([
    this.message = '',
    this.code,
    this.type,
    this.response,
  ]);

  final String? message;
  final String? type;
  final int? code;
  final dynamic response;

  @override
  String toString() {
    if (message == null || message == '') return 'AppwriteException';
    return "AppwriteException: ${type ?? ''}, $message (${code ?? 0})";
  }
}
