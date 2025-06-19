import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_health/core/widgets/app_text_form_field.dart';
import 'package:your_health/core/widgets/custom_button.dart';
import 'package:your_health/features/cubit/confarm_cubit.dart';
import 'package:your_health/features/cubit/confarm_state.dart';
import 'package:your_health/core/model/confarm_model.dart';
import 'package:dio/dio.dart';
import 'package:your_health/core/api/dio_consumer.dart';

class ConfarmScreen extends StatefulWidget {
  final int doctorId;
  final int serviceId;
  final String start;
  final String end;

  const ConfarmScreen({
    super.key,
    required this.doctorId,
    required this.serviceId,
    required this.start,
    required this.end,
  });

  @override
  State<ConfarmScreen> createState() => _ConfarmScreenState();
}

class _ConfarmScreenState extends State<ConfarmScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تاكيد الحجز")),
      body: BlocProvider<ConfarmCubit>(
        create: (context) => ConfarmCubit(
          DioConsumer(dio: Dio()),
        ),
        child: BlocConsumer<ConfarmCubit, ConfarmState>(
          listener: (context, state) {
            if (state is ConfarmSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("تم الحجز بنجاح")),
              );
              Navigator.pop(context);
            } else if (state is ConfarmError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AppTextFormField(
                        controller: _firstNameController,
                        hintText: 'الاسم الاول',
                        icon: const Icon(Icons.person),
                        validator: (value) =>
                            value!.isEmpty ? 'ادخل الاسم الاول' : null,
                      ),
                      AppTextFormField(
                        controller: _lastNameController,
                        hintText: 'الاسم الاخير',
                        icon: const Icon(Icons.person),
                        validator: (value) =>
                            value!.isEmpty ? 'ادخل الاسم الاخير' : null,
                      ),
                      AppTextFormField(
                        controller: _phoneController,
                        hintText: 'رقم الهاتف',
                        icon: const Icon(Icons.phone),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ادخل رقم الهاتف';
                          }
                          final phoneRegex =
                              RegExp(r'^(010|011|012|015)[0-9]{8}$');
                          if (!phoneRegex.hasMatch(value)) {
                            return 'رقم الهاتف غير صحيح';
                          }
                          return null;
                        },
                      ),
                      AppTextFormField(
                        controller: _emailController,
                        hintText: 'البريد الالكتروني',
                        icon: const Icon(Icons.email),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ادخل البريد الالكتروني';
                          }
                          final emailRegex =
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'البريد الالكتروني غير صالح';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        namebutton: state is ConfarmLoading
                            ? 'جاري الحجز...'
                            : 'تاكيد الحجز',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final model = ConfarmModel(
                              doctorId: widget.doctorId,
                              serviceId: widget.serviceId,
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              email: _emailController.text,
                              phone: _phoneController.text,
                              start: widget.start,
                              end: widget.end,
                            );
                            context.read<ConfarmCubit>().bookAppointment(model);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
