import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/dio_consumer.dart';
import 'package:your_health/features/cubit/tips_cubit.dart';
import 'package:your_health/features/cubit/tips_state.dart';
import 'package:your_health/features/Home/widgets/card_widget_tips.dart';
// تأكد من استيراد ApiConsumer الخاص بك إذا كنت لا تزال تستخدمه هنا
import 'package:your_health/core/api/api_consumer.dart'; // أو مسارك الصحيح

class TipsWidgetScreen extends StatelessWidget {
  const TipsWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TipsCubit>(
      // <--- أضف BlocProvider هنا
      create: (context) => TipsCubit(DioConsumer(dio: Dio()))
        ..getTips(), // استبدل DummyApiConsumer بتطبيقك الفعلي
      child: BlocBuilder<TipsCubit, TipsState>(
        builder: (context, state) {
          if (state is LoadingTips) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FailureTips) {
            return Center(child: Text(state.errMessage));
          } else if (state is SuccessTips) {
            final tipsList = state.tipsList;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: tipsList.length,
                itemBuilder: (context, index) {
                  return CardWidgetTips(
                      tipsModel: tipsList[
                          index]); // استخدم اسم الودجت الصحيح والمعامل الصحيح
                },
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
