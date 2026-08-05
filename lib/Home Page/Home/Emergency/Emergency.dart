import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildHeader(),
              const SizedBox(height: 20),

              _buildHold(),
              const SizedBox(height: 30),

              Text(
                'Press and hold for 3 seconds to alert emergency '
                    '\n services and share your live location with your'
                    '\ntrusted contacts.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 30),

              _buildPolice(),
              const SizedBox(height: 30),

              _buildLine(),
              const SizedBox(height: 30),

              _buildTrust(),
              const SizedBox(height: 20),

              TextButton(onPressed:(){
                Get.back();
              },
                  child: Text('Cancel',style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff74879F)
                  ),))
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHeader() {
  return Row(
    children: [
      GestureDetector(
        onTap: ()=>Get.back(),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              width: 1,
              color: const Color(0xffDFE4E9),
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              size: 20,
            ),
          ),
        ),
      ),
      const SizedBox(width: 8),
      const Expanded(
        child: Text(
          'Emergency SOS',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}
Widget _buildHold() {
  return Column(
    children: [
      Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          border: Border.all(
            color: const Color(0xffEEB4BB),
            width: 10,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Icon/icons8-alert.gif',
              height: 40,
              width: 40,
            ),
            const Text(
              'Hold',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
  ]
  );
}

Widget _buildPolice() {
  return Column(
      children: [
        Container(
          height: 75,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
                width: 1,
                color: Color(0xffDADEE5)
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xffFCE9EA)
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.phone,
                      size: 24,
                      color: Color(0xffDF202E),
                    ),
                  ),
                ),
              ),
              const Text(
                'Police — 911',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ]
  );
}
Widget _buildLine() {
  return Column(
      children: [
        Container(
          height: 75,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
                width: 1,
                color: Color(0xffDADEE5)
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xffFCE9EA)
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.phone,
                      size: 24,
                      color: Color(0xffDF202E),
                    ),
                  ),
                ),
              ),
              const Text(
                'Local Support Line',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ]
  );
}

Widget _buildTrust() {
  return Column(
      children: [
        Container(
            height: 75,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                width: 1,
                color: Color(0xffDADEE5)
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                     color: Color(0xffFCE9EA)
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.phone,
                        size: 24,
                        color: Color(0xffDF202E),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Trusted contact: Mom',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
    ]
  );
}