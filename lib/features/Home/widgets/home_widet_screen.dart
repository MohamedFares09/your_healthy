import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/features/Home/widgets/category_card_widget.dart';
import 'package:your_health/features/cubit/category_cubit.dart';
import 'package:your_health/features/cubit/category_state.dart';

class HomeWidetScreen extends StatelessWidget {
  const HomeWidetScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is LoadingCategory) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SuccessCategory) {
          return ListView.builder(
            itemCount: state.categoryList.length,
            itemBuilder: (context, index) {
              return CategoryCardWidget(
                categoetModel: state.categoryList[index],
              );
            },
          );
        } else if (state is FailureCategory) {
          return Center(
            child: Text(
              state.errMessage,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else {
          return const Center(child: Text("لا توجد بيانات"));
        }
      },
    );
  }
}
