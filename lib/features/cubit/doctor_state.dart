import 'package:flutter/material.dart';
import 'package:your_health/core/model/doctor_model.dart';

class DoctorState {}

class InitDoctor extends DoctorState {}

class LoadingDoctor extends DoctorState {}

class SuccessDoctor extends DoctorState {
  final List<DoctorModel> doctorList;
  SuccessDoctor({required this.doctorList});
}

class FailureDoctor extends DoctorState {
  String errMessage;
  FailureDoctor({required this.errMessage});
}
