import 'package:your_health/core/model/profile_model.dart';

class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileModel profile;
  ProfileLoaded({required this.profile});
}

class ProfileError extends ProfileState {
  final String error;
  ProfileError({required this.error});
}
