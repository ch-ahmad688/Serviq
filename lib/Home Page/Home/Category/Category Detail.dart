import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/Model.dart';
import '../../Model/Service Card.dart';
import '../../Model/controllers.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String categoryName;
  const CategoryDetailScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    List<Model> professionals = [];

    switch (categoryName) {
      case 'Electrician':
        professionals = Get.put(ElectricianController()).professionals;
        break;
      case 'Plumber':
        professionals = Get.put(PlumberController()).professionals;
        break;
      case 'AC Repair':
        professionals = Get.put(ACController()).professionals;
        break;
      case 'Mechanic':
        professionals = Get.put(MechanicController()).professionals;
        break;
      case 'Cleaning':
        professionals = Get.put(CleaningController()).professionals;
        break;
      case 'Painter':
        professionals = Get.put(PainterController()).professionals;
        break;
      case 'Carpenter':
        professionals = Get.put(CarpenterController()).professionals;
        break;
      case 'Appliance':
        professionals = Get.put(ApplianceController()).professionals;
        break;
      default:
        professionals = Get.put(ElectricianController()).professionals;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildHeader(categoryName),
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
                itemCount: professionals.length,
                itemBuilder: (context, index) {
                  return ServiceCard(
                    model: professionals[index],
                    isHomePage: false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
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
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
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
}