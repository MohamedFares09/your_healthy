
import 'package:your_health/core/model/categoet_model.dart';

class CategoryState {}

class InitCateroy extends CategoryState {}

class LoadingCategory extends CategoryState {}

class SuccessCategory extends CategoryState {
  final List<CategoetModel> categoryList;
  SuccessCategory({required this.categoryList});
}

class FailureCategory extends CategoryState {
  final String errMessage;
  FailureCategory({required this.errMessage});
}
