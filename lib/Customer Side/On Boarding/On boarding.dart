import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serviq/Customer%20Side/Login/Login.dart';

class Customer extends StatelessWidget {
  const Customer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image:AssetImage('assets/images/ChatGPT Image Aug 3, 2026, 09_39_49 AM.png'),
            fit: BoxFit.cover,)
      ),
      child:Stack(
        children:[
          Padding(
            padding: const EdgeInsetsGeometry.only(top: 16),
            child: Align(
              alignment: AlignmentGeometry.topRight,
              child: TextButton(onPressed: ()=>Get.to(Login()),
                  child: Text('Skip',style:
                  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff006DDD)
                  ),)),
            ),
          )
        ]
      )
    ),
    );
  }
}
