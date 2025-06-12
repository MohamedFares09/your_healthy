import 'package:flutter/material.dart';
import 'package:your_health/core/theming/color.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
   CustomButton({super.key, required this.namebutton , required this.onPressed});
  final String namebutton;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ElevatedButton(
        onPressed: onPressed ,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManegaer.kprimarycolor,
          foregroundColor: Colors.white,

          minimumSize: Size(double.infinity, 50), // Full width button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Text(
          namebutton,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
