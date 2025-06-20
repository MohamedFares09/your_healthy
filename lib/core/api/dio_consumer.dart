import 'package:dio/dio.dart';
import 'package:your_health/core/api/api_consumer.dart';
import 'package:your_health/core/api/end_points.dart';
import 'package:your_health/core/error/exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseURL;
  }
  @override
  Future delete(String path,
      {dynamic data,
      Map<String, dynamic>? quereParameters,
      bool isFormData = false,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await dio.delete(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: quereParameters,
          options: Options(headers: headers));
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future get(String path,
      {Object? data,
      Map<String, dynamic>? quereParameters,
      Map<String, dynamic>? headers}) async {
    try {
      final Response response = await dio.get(path,
          data: data,
          queryParameters: quereParameters,
          options: Options(headers: headers));
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? quereParameters,
      bool isFormData = false,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await dio.patch(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: quereParameters,
          options: Options(headers: headers));
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? quereParameters,
      bool isFormData = false,
      Map<String, dynamic>? headers}) async {
    try {
      final response = await dio.post(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: quereParameters,
          options: Options(headers: headers));
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }
}
