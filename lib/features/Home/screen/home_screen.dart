import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:your_health/core/api/dio_consumer.dart';
import 'package:your_health/core/theming/color.dart';
import 'package:your_health/features/tips/widgets/tips_widget_screen.dart';
import 'package:your_health/features/Home/widgets/home_widet_screen.dart';
import 'package:your_health/features/cubit/category_cubit.dart';
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
    return BlocProvider(
      create: (context) => CategoryCubit(DioConsumer(dio: Dio()))..getCategory(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            nameAppBar[currentIndex],
            style: TextStyle(color: Colors.white, fontSize: 13.sp),
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
      ),
    );
  }
}
