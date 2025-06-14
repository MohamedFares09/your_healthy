import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:your_health/core/theming/color.dart';
import 'package:your_health/features/Home/screen/home_screen.dart';
import 'package:your_health/features/login/ui/login_screen.dart';
import 'package:your_health/features/onbording/onbording_screen.dart';
import 'package:your_health/features/sign_up/ui/sign_up_screen.dart';

class DocApp extends StatelessWidget {
 const DocApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: ColorManegaer.kprimarycolor,
            scaffoldBackgroundColor: Colors.white),
        routes: {
          OnbordingScreen.id: (context) => OnbordingScreen(),
          LoginScreen.id: (context) => LoginScreen() ,
          SignUpScreen.id: (context) => SignUpScreen(),
          HomeScreen.id : (context)=>HomeScreen(),
          // TipsDetailsScreen.id : (context)=>TipsDetailsScreen()
        },
        initialRoute: OnbordingScreen.id,
      ),
    );
  }
}
