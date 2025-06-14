import 'package:flutter/material.dart';
import 'package:your_health/core/theming/color.dart';
import 'package:your_health/features/Home/widgets/Tips_widget_screen.dart';
import 'package:your_health/features/Home/widgets/home_widet_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = "homescreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<String> nameAppBar = ["التخصصات", "النصايح", "الصفحه الشخصيه "];

  List<Widget> pages = [
    HomeWidetScreen(),
   TipsWidgetScreen(),
    Scaffold(
      body: Center(
        child: Text("profile"),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          nameAppBar[currentIndex],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorManegaer.kprimarycolor,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: ColorManegaer.kprimarycolor,
          selectedFontSize: 16,
          selectedIconTheme: IconThemeData(size: 30),
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "الصفحه الريسيه "),
            BottomNavigationBarItem(
                icon: Icon(Icons.lightbulb), label: "النصايح"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "الصفحه الشخصيه "),
          ]),
      body: SafeArea(
        child: Center(
          child: pages[currentIndex],
        ),
      ),
    );
  }
}
