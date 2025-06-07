import 'package:flutter/material.dart';
import 'package:your_health/core/theming/color.dart';

class ButtonLoginScreen extends StatelessWidget {
  const ButtonLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ElevatedButton(
        onPressed: () {
          // Add your login logic here
        },
        style: ElevatedButton.styleFrom(
           backgroundColor: ColorManegaer.kprimarycolor,
        foregroundColor: Colors.white,
      
          minimumSize: Size(double.infinity, 50), // Full width button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Text(
          'تسجيل الدخول',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}