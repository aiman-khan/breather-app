class SomethingWentWrongException implements Exception {}

class MessageException implements Exception {
  final String message;

  MessageException({required this.message});
}
