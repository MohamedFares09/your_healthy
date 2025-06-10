class UserState {}

final class InitState extends UserState {}

final class LodingLogin extends UserState {}

final class SuccessLogin extends UserState {}

final class FailuerLogin extends UserState {
  String errorMessage;
  FailuerLogin(this.errorMessage);
}
