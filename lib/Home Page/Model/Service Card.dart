import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Home/Category/Category Detail.dart';
import 'Details.dart';
import 'Model.dart';

class ServiceCard extends StatelessWidget {
  final Model model;
  final bool isHomePage;

  const ServiceCard({
    super.key,
    required this.model,
    this.isHomePage = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isHomePage) {
      return _buildHomeCard();
    }
    return _buildDetailCard();
  }

  Widget _buildHomeCard() {
    return GestureDetector(
      onTap: () => _navigateToCategory(),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.5),
                color: const Color(0xffCEEDFF),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  model.image,
                  errorBuilder: (_, __, ___) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              model.name,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard() {
    return GestureDetector(
      onTap: () => Get.to(() => DetailsScreen(selectedClient: model)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          border: Border.all(
            color: const Color(0xffDADEE5),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                model.image,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(text: '${model.name}\n'),
                        TextSpan(
                          text: model.category ?? '',
                          style: const TextStyle(
                            color: Color(0xff6B7686),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Color(0xffffc107)),
                      const SizedBox(width: 4),
                      Text(model.rating ?? '0.0'),
                      const SizedBox(width: 16),
                      Text(
                        model.price ?? '\$0',
                        style: const TextStyle(
                          color: Color(0xff006DDF),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xffCEEDFF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Available',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1A7DE1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildBookButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBookButton() {
    return GestureDetector(
      onTap: () {
        Get.snackbar(
          'Booking',
          '${model.name} booked successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xff1A7DE1),
          colorText: Colors.white,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xff1A7DE1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          'Book',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  void _navigateToCategory() {
    Get.to(() => CategoryDetailScreen(
      categoryName: model.category ?? model.name,
    ));
  }
}