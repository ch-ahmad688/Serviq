import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serviq/Home%20Page/Home/Booking%20Status/Booking%20Status.dart';
import '../../Model/Model.dart';
import 'Controller.dart';

class Payment extends StatelessWidget {
  final Model model;
  const Payment({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(PaymentController());
    controller.initModel(model);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildCustomHeader(),
            Expanded(
              child: _buildBody(context, controller, model),
            ),
            _buildBottom(controller,model),
          ],
        ),
      ),
    );
  }
}

Widget _buildCustomHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                width: 1,
                color: const Color(0xffDFE4E9),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.black,
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
              children: [
                const TextSpan(
                  text: 'Payment\n',
                ),
                const TextSpan(
                  text: 'Review and confirm',
                  style: TextStyle(
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
    ),
  );
}

Widget _buildBody(BuildContext context, PaymentController controller, Model model) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xffDADEE5),
                width: 1,
              ),
            ),
            child: Obx(
                  () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Order summary',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildDetail(
                    model.category ?? 'Category',
                    model.price??'',
                  ),
                  _buildDetail(
                    'Platform fee',
                    '\$${controller.platformFee.value.toStringAsFixed(2)}',
                  ),
                  _buildDetail(
                    'Tax',
                    '\$${controller.tax.value.toStringAsFixed(2)}',
                  ),
                  _buildDetail(
                    'Discount',
                    '-\$${controller.discount.value.toStringAsFixed(2)}',
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(color: Color(0xffDADEE5)),
                  ),
                  _buildDetail(
                    'Total',
                    '\$${controller.formattedTotal}',
                    isTotal: true,
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Payment method',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/Icon/visa.png',
                        height: 30,
                        width: 40,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.credit_card, size: 30),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Visa',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: controller.isCard.value
                                  ? const Color(0xff00A8A8)
                                  : Colors.black,
                            ),
                          ),
                          const Text(
                            '.... 4242',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff616D7D),
                            ),
                          ),
                        ],
                      ),
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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
                () => InkWell(
              onTap: () => controller.toggleWallet(true),
              borderRadius: BorderRadius.circular(14),
              child: Container(
                height: 70,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    width: controller.isWallet.value ? 2 : 1.5,
                    color: controller.isWallet.value
                        ? const Color(0xff00A8A8)
                        : const Color(0xffE4E7EC),
                  ),
                  color: controller.isWallet.value
                      ? const Color(0xffF0FAFA)
                      : Colors.white,
                ),
                child: Row(
                  children: [
                    const ImageIcon(
                      AssetImage('assets/Icon/wallet.png'),
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Serviq Wallet',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: controller.isWallet.value
                                  ? const Color(0xff00A8A8)
                                  : Colors.black,
                            ),
                          ),
                          const Text(
                            'Balance = \$120.50',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff616D7D),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: controller.isWallet.value
                              ? const Color(0xff00A8A8)
                              : const Color(0xffD5D9E2),
                          width: 2,
                        ),
                      ),
                      child: controller.isWallet.value
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
        ),
      ],
    ),
  );
}

Widget _buildDetail(String category, String amount, {bool isTotal = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
    child: Row(
      children: [
        Text(
          category,
          style: TextStyle(
            fontSize: 14,
            color: isTotal ? Colors.black : const Color(0xff616D7D),
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w400,
          ),
        ),
        const Spacer(),
        Text(
          amount,
          style: TextStyle(
            color: isTotal ? const Color(0xff006DDD) : Colors.black,
            fontSize: isTotal ? 16 : 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget _buildBottom(PaymentController controller, Model model) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
    child: Obx(
          () => ElevatedButton(
        onPressed: () {
          Get.to(Status(selectedModel:model));
          if (controller.isCard.value) {
            Get.snackbar(
              'Processing',
              'Processing card payment...',
              snackPosition: SnackPosition.BOTTOM,
            );
          } else if (controller.isWallet.value) {
            Get.snackbar(
              'Processing',
              'Processing wallet payment...',
              snackPosition: SnackPosition.BOTTOM,
            );
          } else {
            Get.snackbar(
              'Error',
              'Please select a payment method',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff006DDD),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Confirm & pay \$${controller.formattedTotal}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}