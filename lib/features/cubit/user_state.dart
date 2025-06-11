class UserState {}

final class InitState extends UserState {}

final class LodingLogin extends UserState {}

final class SuccessLogin extends UserState {}

final class FailuerLogin extends UserState {
  late String errorMessage;
  FailuerLogin({required this.errorMessage});
}

final class LodingSignUp extends UserState {}

final class SuccessSignUp extends UserState {
  
}

final class FailuerSignUp extends UserState {
  late String errorMessage;
  FailuerSignUp({required this.errorMessage});
}
