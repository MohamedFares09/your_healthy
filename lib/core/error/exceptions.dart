import 'package:dio/dio.dart';
import 'package:your_health/core/error/error_model.dart';


class ServerException implements Exception {
  final Errormodel errormodel;

  ServerException({required this.errormodel});
}

void handelDioException(DioException e) {
  // log('error is: (${e.response!.data.runtimeType}) $e');
  e.response!.data; // error
  
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      
      throw ServerException(errormodel: Errormodel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      
      throw ServerException(errormodel: Errormodel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
    
      throw ServerException(errormodel: Errormodel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
    
      throw ServerException(errormodel: Errormodel.fromJson(e.response!.data));

    case DioExceptionType.cancel:
      
      throw ServerException(errormodel: Errormodel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      
      throw ServerException(errormodel: Errormodel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      
      throw ServerException(errormodel: Errormodel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw ServerException(
              errormodel: Errormodel.fromString("هذا الايميل مستخدم من قبل")); 
        case 401:
          throw ServerException(
              errormodel: Errormodel.fromJson(e.response!.data));
        case 403:
          throw ServerException(
              errormodel: Errormodel.fromString("الايميل او كلمه المرور غير صحيحه"));
        case 404:
          throw ServerException(
              errormodel: Errormodel.fromJson(e.response!.data));
        case 409:
          throw ServerException(
              errormodel: Errormodel.fromJson(e.response!.data));
        case 422:
          throw ServerException(
              errormodel: Errormodel.fromJson(e.response!.data));
        case 504:
          throw ServerException(
              errormodel: Errormodel.fromJson(e.response!.data));
      }
  }
}
