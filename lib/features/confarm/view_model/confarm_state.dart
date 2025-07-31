abstract class ConfarmState {}

class ConfarmInitial extends ConfarmState {}

class ConfarmLoading extends ConfarmState {}

class ConfarmSuccess extends ConfarmState {}

class ConfarmError extends ConfarmState {
  final String message;
  ConfarmError(this.message);
}
