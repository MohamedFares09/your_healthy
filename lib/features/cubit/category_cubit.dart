import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/api_consumer.dart';
import 'package:your_health/core/api/end_points.dart';
import 'package:your_health/core/model/categoet_model.dart';
import 'package:your_health/features/cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.api) : super(InitCateroy());
  ApiConsumer api;

  Future getCategory() async {
    if (isClosed) return;
    emit(LoadingCategory());
    try {
      final data = await api.get(EndPoints.category , );
      List<CategoetModel> categoryList = [];
      for (var category in data) {
       
        categoryList.add(CategoetModel.fromJson(category));
        
      }
      if (isClosed) return;
      emit(SuccessCategory(categoryList: categoryList));
    } on Exception {
      if (isClosed) return;
      emit(FailureCategory(errMessage: "يوجد مشكله في الوقت الحالي "));
    }
  }
}
