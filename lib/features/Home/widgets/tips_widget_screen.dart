import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:dio/dio.dart';
import 'package:your_health/core/api/dio_consumer.dart';
import 'package:your_health/features/Home/widgets/card_widget_tips.dart';
import 'package:your_health/features/cubit/tips_cubit.dart';
import 'package:your_health/features/cubit/tips_state.dart';

class TipsWidgetScreen extends StatelessWidget {
  const TipsWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TipsCubit(DioConsumer(dio: Dio()))..getTips(),
      child: BlocBuilder<TipsCubit, TipsState>(
        builder: (context, state) {
          if (state is LoadingTips) {
            return Skeletonizer(
              enabled: true,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                // itemCount: 5, // عدد العناصر الوهمية
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // العنوان الرئيسي
                        Container(
                          width: double.infinity,
                          height: 230,
                          color: Colors.white,
                          margin: const EdgeInsets.only(bottom: 8),
                        ),

                        // اسم الكاتب والتاريخ
                        Row(
                          children: [
                            // اسم الكاتب
                            Container(
                              width: 120,
                              height: 16,
                              color: Colors.white,
                            ),

                            Spacer(),

                            Container(
                              width: 80,
                              height: 16,
                              color: Colors.white,
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // الخط الفاصل
                        Container(
                          height: 1,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (state is SuccessTips) {
            final tipsList = state.tipsList;
            return ListView.builder(
              itemCount: tipsList.length,
              itemBuilder: (context, index) {
                return CardWidgetTips(tipsModel: tipsList[index]);
              },
            );
          } else if (state is FailureTips) {
            return Center(child: Text(state.errMessage));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
