import 'package:flutter/material.dart';
import 'package:your_health/core/theming/color.dart';

class HomeWidetScreen extends StatelessWidget {
  HomeWidetScreen({super.key});
  List<String> nameCategories = [
    "اسنان",
    "باطنه",
    "عيون",
    "اطفال",
    "اوعيه دمويه",
    "جلديه",
    "عظام",
    "مسالك بوليه",
    "نسا و توليد"
  ];
  List<String> imageCategories = [
    "assets/images/DoctorCategories/Tooth.png",
    "assets/images/DoctorCategories/Stomach.png",
    "assets/images/DoctorCategories/Periods.png",
    "assets/images/DoctorCategories/Leg.png",
    "assets/images/DoctorCategories/Leather.png",
    "assets/images/DoctorCategories/Eye.png",
    "assets/images/DoctorCategories/Embryo.png",
    "assets/images/DoctorCategories/Colon.png",
    "assets/images/DoctorCategories/Baby Feet.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: nameCategories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: ColorManegaer.kprimarycolor),
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      nameCategories[index],
                      style: TextStyle(
                          color: ColorManegaer.kprimarycolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Image.asset(imageCategories[index]),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                height: 70,
                width: 370,
              ),
            );
          }),
    );
  }
}
