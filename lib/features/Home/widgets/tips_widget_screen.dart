import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/dio_consumer.dart';
import 'package:your_health/core/model/Tips_model.dart';
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
            return const Center(child: CircularProgressIndicator());
          } else if (state is SuccessTips) {
            final List<TipsModel> tipsList = state.tipsList;
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
