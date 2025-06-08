import 'package:flutter/material.dart';

class TexrDetailsSignupScreen extends StatelessWidget {
  const TexrDetailsSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      " ! مرحبًا بك في تطبيقنا \n يرجى ملء المعلومات أدناه لإنشاء حساب جديد.",
      textAlign: TextAlign.right,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }
}
