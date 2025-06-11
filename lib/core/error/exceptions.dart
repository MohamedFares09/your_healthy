import 'package:dio/dio.dart';
import 'package:your_health/core/error/errorModel.dart';
import 'dart:developer';

class ServerException implements Exception {
  final Errormodel errormodel;

  ServerException({required this.errormodel});
}

void HandelDioException(DioException e) {
  log('error is: (${e.response!.data.runtimeType}) $e');
  e.response!.data; // error
  log(e.message.toString());
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      // TODO: Handle this case.
      throw ServerException(errormodel: Errormodel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      // TODO: Handle this case.
      throw ServerException(errormodel: Errormodel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      // TODO: Handle this case.
      throw ServerException(errormodel: Errormodel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      // TODO: Handle this case.
      throw ServerException(errormodel: Errormodel.fromJson(e.response!.data));

    case DioExceptionType.cancel:
      // TODO: Handle this case.
      throw ServerException(errormodel: Errormodel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      // TODO: Handle this case.
      throw ServerException(errormodel: Errormodel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      // TODO: Handle this case.
      throw ServerException(errormodel: Errormodel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw ServerException(
              errormodel: Errormodel.fromJson(e.response!.data));
        case 401:
          throw ServerException(
              errormodel: Errormodel.fromJson(e.response!.data));
        case 403:
          throw ServerException(
              errormodel: Errormodel.fromJson(e.response!.data));
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
