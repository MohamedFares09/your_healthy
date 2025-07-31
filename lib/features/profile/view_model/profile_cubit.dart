import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/api/api_consumer.dart';
import 'package:your_health/core/api/end_points.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_health/features/profile/model/profile_model.dart';

import 'dart:developer';

import 'package:your_health/features/profile/view_model/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.api) : super(ProfileInitial());
  ApiConsumer api;
  getProfile() async {
    emit(ProfileLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token == null) {
        emit(ProfileError(error: 'لا يوجد توكن'));
        return;
      }
      final profileData = await api
          .get(EndPoints.profile, headers: {'Authorization': 'Bearer $token'});
      log('Profile API response:');
      log(profileData.toString());
      final profileModel = ProfileModel.fromJson(profileData);
      emit(ProfileLoaded(profile: profileModel));
    } catch (e) {
      emit(ProfileError(error: 'حدث خطأ غير متوقع'));
    }
  }
}
