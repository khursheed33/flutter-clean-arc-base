class InvalidException implements Exception {
  final String message;

  InvalidException(this.message);

  @override
  String toString() {
    return message;
  }
}
