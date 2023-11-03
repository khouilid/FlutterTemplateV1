class DioException implements Exception {
  final int? code;
  final String? message;

  DioException({required this.code, required this.message});
}
