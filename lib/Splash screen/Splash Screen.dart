import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serviq/Splash%20screen/Splash%20Controller.dart';

class Splash_screen extends StatelessWidget {
  const Splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
      Get.put(Splash_controller());

      return Scaffold(
      backgroundColor: Color(0xff006DDD),
      body: Center(child: Image(
          image: AssetImage
            ("assets/Icon/WhatsApp Image 2026-07-31 at 3.09.03 PM (1).jpeg"))),
    );
  }
}
