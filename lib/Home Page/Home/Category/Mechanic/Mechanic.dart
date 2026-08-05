import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Cart.dart';
import 'Controller.dart';

class Mechanic extends StatelessWidget {
  const Mechanic({super.key});

  @override
  Widget build(BuildContext context) {
    final MechanicController controller = Get.put(MechanicController());
    return Scaffold(
      body:SafeArea(
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
                  crossAxisCount: 1,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 4,
                ),
                itemCount: controller.model.length,
                itemBuilder: (context, index) {
                  return Cart(
                    model: controller.model[index],
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
      GestureDetector(
        onTap: () => Get.back(),
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
      const SizedBox(width: 16),
      const Expanded(
        child: Text(
          'Mechanic',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
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
        child: const Center(
          child: Icon(
            Icons.menu,
            size: 20,
          ),
        ),
      ),
    ],
  );
}
