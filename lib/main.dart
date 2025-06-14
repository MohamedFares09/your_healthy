import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:your_health/core/api/dio_consumer.dart';
import 'package:your_health/doc_app.dart';
import 'package:your_health/features/cubit/tips_cubit.dart';
import 'package:your_health/features/cubit/user_cubit.dart';

void main() {
  final tipsCubit = TipsCubit(DioConsumer(dio: Dio()));
tipsCubit.getTips();
  runApp(BlocProvider(
    create: (context) => UserCubit(DioConsumer(dio: Dio())),
    child: DocApp(),
  ));
}
