import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serviq/Login/Login.dart';

import '../Bottom Bar/Bottom Bar.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Center(
              child: Image(
                image: AssetImage(
                    "assets/Icon/WhatsApp Image 2026-07-31 at 3.09.03 PM (1).jpeg"),
                height: 75,
                width: 75,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Create Your Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              'Enter your credentials to continuous',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff7992A6),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                height: 50,
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color(0xff7992A6),
                    ),
                    hintText: 'Full name',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff7992A6),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color(0xff7992A6),
                        width: 0.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color(0xff7992A6),
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color(0xff7992A6),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                height: 50,
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.mail_outline,
                      color: Color(0xff7992A6),
                    ),
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff7992A6),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color(0xff7992A6),
                        width: 0.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color(0xff7992A6),
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color(0xff7992A6),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                height: 50,
                width: 300,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xff7992A6),
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff7992A6),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color(0xff7992A6),
                        width: 0.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color(0xff7992A6),
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color(0xff7992A6),
                        width: 1.0,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.visibility_off,
                        color: Color(0xffBFBFBF),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                height: 50,
                width: 300,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xff7992A6),
                    ),
                    hintText: 'Confirm Password',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff7992A6),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color(0xff7992A6),
                        width: 0.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color(0xff7992A6),
                        width: 0.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Color(0xff7992A6),
                        width: 1.0,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.visibility_off,
                        color: Color(0xffBFBFBF),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(25),
              child: GestureDetector(
                onTap: ()=>Get.to(Bottom_bar()),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff006DDD),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1,
                      color: const Color(0xffE5E5E5),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Or Continuous with',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xffE5E5E5),
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1,
                      color: const Color(0xffE5E5E5),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/Icon/facebook 1.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.2),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/Icon/google 1.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: GestureDetector(
                onTap: ()=>Get.to(Login()),
                child: const Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff202020),
                      fontWeight: FontWeight.w400,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff006DDD),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}