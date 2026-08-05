import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'AC Repair/AC Repair.dart';
import 'Appliance/Appliance.dart';
import 'Carpenter/Carpenter.dart';
import 'Cart.dart';
import 'Cleaning/Cleaning.dart';
import 'Controller.dart';
import 'Electrican/Electrican.dart';
import 'Mechanic/Mechanic.dart';
import 'Painter/Painter.dart';
import 'Plumber/Plumber.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController controller = Get.put(CategoryController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildHeader(),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemCount: controller.model.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      switch(index) {
                        case 0:
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Electrician()));
                          break;
                        case 1:
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Plumber()));
                          break;
                        case 2:
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ACRepair()));
                          break;
                        case 3:
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Mechanic()));
                          break;
                        case 4:
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Cleaning()));
                          break;
                        case 5:
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Painter()));
                          break;
                        case 6:
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Carpenter()));
                          break;
                        case 7:
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Appliance()));
                          break;
                      }
                    },
                    child: Cart(
                      model: controller.model[index],
                    ),
                  );
                },
              ),
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
      Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 1,
            color: const Color(0xffDFE4E9),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/Icon/icons8-grid-64.png',
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.location_on);
              },
            ),
          ),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: RichText(
          text: TextSpan(
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            children: const [
              TextSpan(text: 'All categories \n'),
              TextSpan(
                text: 'Pick a service to explore pros',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff616D7D),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}