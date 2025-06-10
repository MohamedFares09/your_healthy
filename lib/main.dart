import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:your_health/doc_app.dart';
import 'package:your_health/features/cubit/user_cubit.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => UserCubit(),
    child: DocApp(),
  ));
}
