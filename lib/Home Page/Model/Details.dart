import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serviq/Home%20Page/Home/Confirm%20Booking/Confirm%20Booking.dart';
import '../Home/Call/Call.dart';
import '../Home/Chat/Chat.dart';
import '../Model/Model.dart';
import '../Model/controllers.dart';

class DetailsScreen extends StatelessWidget {
  final Model selectedClient;
  const DetailsScreen({super.key, required this.selectedClient});

  @override
  Widget build(BuildContext context) {
    final DetailController controller = Get.put(DetailController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildHeader(),
              const SizedBox(height: 8),
              _buildCard(selectedClient, context),
              const SizedBox(height: 8),
              _buildContact(context),
              const SizedBox(height: 8),
              _buildTabBar(context),
              const SizedBox(height: 16),
              Obx(() => _buildTabContent(controller.selectedIndex.value)),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomSheet: _buildBottom(selectedClient),
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
            child: const Center(
              child: Icon(Icons.arrow_back_ios_new_sharp, size: 20),
            ),
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Text(
            'Professional',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(Model model, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(width: 1, color: const Color(0xffDFE4E9)),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              model.image,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: const Color(0xffCEEDFF)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Available',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1A7DE1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            model.category ?? '',
            style: const TextStyle(
              color: Color(0xff6B7686),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 16, color: Color(0xffffc107)),
              const SizedBox(width: 4),
              Text(
                model.rating ?? '0.0',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xffF4F4F4),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Certified professional with 8 years of hands-on'
                    '\n experience. Known for punctuality, clean '
                    '\n work and transparent pricing.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContact(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Get.to(() => Chat(userModel: selectedClient)),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: const Color(0xffDADEE5), width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/Icon/live-chat.png', height: 25),
                      ),
                      const Text(
                        'Chat',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: ()=>Get.to(() => CallScreen(userModel: selectedClient)),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: const Color(0xffDADEE5), width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/Icon/call.png', height: 25),
                      ),
                      const Text(
                        'Call',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black,
                        ),
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

  Widget _buildTabBar(BuildContext context) {
    final DetailController controller = Get.find<DetailController>();

    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffE8EFF9),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Obx(
            () => Row(
          children: [
            _buildTabItem(
              index: 0,
              label: 'About',
              isActive: controller.selectedIndex.value == 0,
            ),
            _buildTabItem(
              index: 1,
              label: 'Reviews',
              isActive: controller.selectedIndex.value == 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required int index,
    required String label,
    required bool isActive,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Get.find<DetailController>().changePage(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            gradient: isActive
                ? const LinearGradient(
              colors: [Colors.white, Color(0xFF0B0E30)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
                : null,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.black : const Color(0xff616D7D),
                fontSize: 16,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Specialties',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text('• Wiring', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
              const Text('• Lighting', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
              const Text('• Panels', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
              const SizedBox(height: 8),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 1, color: const Color(0xffDFE4E9)),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/Icon/icons8-location-64.png',
                            color: const Color(0xff0B6EBB),
                          ),
                        ),
                        const Text(
                          '1.2 km away arrives in 15 min',
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );

      case 1:
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Customer Reviews',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    '124 reviews',
                    style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildReviewItem(
                stars: '⭐⭐⭐⭐⭐',
                comment: 'Excellent service! The professional arrived on time and fixed the issue very professionally.',
                name: 'Ahmed Khan',
                time: '2 days ago',
              ),
              const SizedBox(height: 12),
              _buildReviewItem(
                stars: '⭐⭐⭐⭐',
                comment: 'Quick response and fair pricing. The work was done beautifully.',
                name: 'Sara Ali',
                time: '1 week ago',
              ),
              const SizedBox(height: 12),
              _buildReviewItem(
                stars: '⭐⭐⭐⭐⭐',
                comment: 'Best professional! Came within 15 minutes and solved the issue quickly.',
                name: 'Usman Raja',
                time: '2 weeks ago',
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xff0B6EBB),
                  ),
                  child: const Text(
                    'See all reviews →',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildReviewItem({
    required String stars,
    required String comment,
    required String name,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: const Color(0xffDFE4E9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(stars, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 4),
          Text(
            comment,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xff0B6EBB),
            ),
          ),
          Text(
            time,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
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
              onPressed: ()=>Get.to(Confirm(model:selectedClient)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0B6EBB),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
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