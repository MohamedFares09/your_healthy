import 'package:flutter/material.dart';
import 'package:your_health/core/theming/color.dart';
import 'package:your_health/features/Home/screen/home_screen.dart';

class SignoutButtonWidget extends StatelessWidget {
  const SignoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorManegaer.kprimarycolor),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: Text(
            "تسجيل الخروج",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
    );
  }
}
