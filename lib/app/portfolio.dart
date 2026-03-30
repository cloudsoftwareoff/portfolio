import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/main_screen_controller.dart';
import 'package:portfolio/screens/main/main_screen.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainScreenController());
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
