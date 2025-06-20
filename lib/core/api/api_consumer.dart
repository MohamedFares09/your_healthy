abstract class ApiConsumer {
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? quereParameters,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> post(
    String path, {
    Object? data,
    Map<String, dynamic>? quereParameters,
    bool isFormData = false,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? quereParameters,
    bool isFormData = false,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? quereParameters,
    bool isFormData = false,
    Map<String, dynamic>? headers,
  });
}
