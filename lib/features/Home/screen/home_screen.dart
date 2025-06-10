import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = "homescreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الصفحه الريسيه"),
      ),
      body: Center(
        child: Text(
          "Homepage",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
