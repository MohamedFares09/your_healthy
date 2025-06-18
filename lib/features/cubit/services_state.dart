import 'package:your_health/core/model/services_model.dart';

class ServicesState {}

class InitServicesState extends ServicesState {}

class LoadingServicesState extends ServicesState {}

class SuccessServicesState extends ServicesState {
  List<ServicesModel> listServices;
  SuccessServicesState(this.listServices);
}

class FailuerServicesState extends ServicesState {
  String errMessage;
  FailuerServicesState(this.errMessage);
}
