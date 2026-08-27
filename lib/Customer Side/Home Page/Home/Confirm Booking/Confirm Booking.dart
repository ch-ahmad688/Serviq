import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serviq/Customer%20Side/Home%20Page/Home/Appoinment%20Time/Appoinment%20Time.dart';
import 'package:serviq/Customer%20Side/Home%20Page/Model/Model.dart';

import 'Controller.dart';


class Confirm extends StatelessWidget {
  final Model model;
  const Confirm({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final ConfirmController controller = Get.put(ConfirmController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    _buildHeader(),
                    _buildPackages(controller),
                  ],
                ),
              ),
            ),
            _buildBottom(model),
          ],
        ),
      ),
    );
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
              border: Border.all(width: 1, color: const Color(0xffDFE4E9)),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.arrow_back, size: 20, color: Colors.black),
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
              children: [
                const TextSpan(text: 'Book service\n'),
                TextSpan(
                  text: model.name,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xff616D7D),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildPackages(ConfirmController controller) {
    return Expanded(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Choose a package',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                      () => InkWell(
                    onTap: () => controller.toggleCard(true),
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          width: controller.isCard.value ? 2 : 1.5,
                          color: controller.isCard.value
                              ? const Color(0xff00A8A8)
                              : const Color(0xffE4E7EC),
                        ),
                        color: controller.isCard.value
                            ? const Color(0xffF0FAFA)
                            : Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Standard Vision',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: controller.isCard.value
                                        ? const Color(0xff00A8A8)
                                        : Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Inspection + minor fixes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '\$49.99',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: controller.isCard.value
                                      ? const Color(0xff00A8A8)
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'per session',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: controller.isCard.value
                                    ? const Color(0xff00A8A8)
                                    : const Color(0xffD5D9E2),
                                width: 2,
                              ),
                            ),
                            child: controller.isCard.value
                                ? const Icon(
                              Icons.circle,
                              size: 14,
                              color: Color(0xff00A8A8),
                            )
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                      () => InkWell(
                    onTap: () => controller.toggleCash(true),
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          width: controller.isCash.value ? 2 : 1.5,
                          color: controller.isCash.value
                              ? const Color(0xff00A8A8)
                              : const Color(0xffE4E7EC),
                        ),
                        color: controller.isCash.value
                            ? const Color(0xffF0FAFA)
                            : Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Full Service',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: controller.isCash.value
                                        ? const Color(0xff00A8A8)
                                        : Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Complete repair & parts check',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '\$89.99',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: controller.isCash.value
                                      ? const Color(0xff00A8A8)
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'per session',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: controller.isCash.value
                                    ? const Color(0xff00A8A8)
                                    : const Color(0xffD5D9E2),
                                width: 2,
                              ),
                            ),
                            child: controller.isCash.value
                                ? const Icon(
                              Icons.circle,
                              size: 14,
                              color: Color(0xff00A8A8),
                            )
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                      () => InkWell(
                    onTap: () => controller.toggleOther(true),
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          width: controller.isOther.value ? 2 : 1.5,
                          color: controller.isOther.value
                              ? const Color(0xff00A8A8)
                              : const Color(0xffE4E7EC),
                        ),
                        color: controller.isOther.value
                            ? const Color(0xffF0FAFA)
                            : Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Emergency (24/7)',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        color: controller.isOther.value
                                            ? const Color(0xff00A8A8)
                                            : Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: controller.isOther.value
                                            ? const Color(0xff00A8A8).withOpacity(0.2)
                                            : Colors.orange.withOpacity(0.2),
                                      ),
                                      child: Text(
                                        'POPULAR',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 9,
                                          color: controller.isOther.value
                                              ? const Color(0xff00A8A8)
                                              : Colors.orange,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Priority arrival within 1 hour',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '\$149.99',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: controller.isOther.value
                                      ? const Color(0xff00A8A8)
                                      : Colors.black,
                                ),
                              ),
                              Text(
                                'per session',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: controller.isOther.value
                                    ? const Color(0xff00A8A8)
                                    : const Color(0xffD5D9E2),
                                width: 2,
                              ),
                            ),
                            child: controller.isOther.value
                                ? const Icon(
                              Icons.circle,
                              size: 14,
                              color: Color(0xff00A8A8),
                            )
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Hours needed',style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height:75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color:   Color(0xffD5D9E2),
                          width: 2,
                        )
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Estimated hours',style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:   Color(0xffD5D9E2),
                                    width: 2,
                                  )
                              ),
                              child:Center(child: Text('-',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 25
                                ),
                              ))
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text('1',style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.black,
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Color(0xff006DDD),
                              shape: BoxShape.circle,
                            ),
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.add,
                                color: Color(0xffA6CCF4),),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 85,
                    decoration: BoxDecoration(
                      color: const Color(0xff006DDD),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xff2582E2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'assets/Icon/innovation.png',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'AI price estimate',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                Text(
                                  'Based on similar jobs, expect \$38–\$63 in total.',
                                  style: TextStyle(color: Colors.white60, fontSize: 12, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Describe the issue',style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  ),
                ),
                TextFormField(
                  maxLines: 4,
                  minLines: 3,
                  maxLength: 200,
                  decoration: InputDecoration(
                    hintText: 'Enter detailed description...',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffC2C7C8)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xffDADEE5),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xff00A8A8),
                        width: 2,
                      ),
                    ),
                    counterText: '200 characters max',
                  ),
                  keyboardType: TextInputType.multiline,
                )
              ]
          ),
        )
    );
  }

  Widget _buildBottom(Model model) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
        border: const Border(
          top: BorderSide(
            color: Color(0xffDADEE5),
            width: 2,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Starting at',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff707B89),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${model.price ?? '50'}/hr',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0B6EBB),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {
                Get.to(Appointment(selectedModel:model));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0B6EBB),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Book Now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}