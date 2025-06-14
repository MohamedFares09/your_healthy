import 'dart:developer'; // تم تضمينها بالفعل
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/api_consumer.dart'; // تأكد من المسار الصحيح
import 'package:your_health/core/model/Tips_model.dart';
import 'package:your_health/features/cubit/tips_state.dart'; // تأكد من المسار الصحيح للـ States

class TipsCubit extends Cubit<TipsState> {

  TipsCubit(this.apiConsumer) : super(LoadingTips());

  final ApiConsumer apiConsumer;

  Future<void> getTips() async {
    try {
      emit(LoadingTips()); // إصدار حالة التحميل قبل بدء العملية

      final response = await apiConsumer.get(
          "https://dev-booking-system-website.pantheonsite.io/wp-json/wp/v2/posts?_embed");

      if (response is List) {
        final List<TipsModel> tips =
            response.map((json) => TipsModel.fromJson(json)).toList();

        if (tips.isNotEmpty) {
          emit(SuccessTips(tipsList: tips));
        } else {
          emit(FailureTips(errMessage: 'لا توجد نصائح في الوقت الحالي.'));
        }
      } else {
        emit(FailureTips(errMessage: 'تنسيق بيانات غير متوقع من الخادم.'));
        log('Unexpected response format: $response');
      }
    } on DioException catch (e) {
      log('Dio error in getTips: $e');
      if (e.response != null) {
        log('Dio error response data: ${e.response!.data}');
        log('Dio error response status: ${e.response!.statusCode}');
        emit(FailureTips(
            errMessage:
                'خطأ في الخادم: ${e.response!.statusCode ?? 'غير معروف'}'));
      } else {
        emit(FailureTips(errMessage: 'مشكلة في الاتصال بالشبكة: ${e.message}'));
      }
    } catch (error, stackTrace) {
      log('Unexpected error in getTips: $error', stackTrace: stackTrace);
      emit(FailureTips(errMessage: "حدث خطأ غير متوقع أثناء جلب البيانات."));
    }
  }
}
