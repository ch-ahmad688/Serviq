import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Cart.dart';
import 'Category/Category.dart';
import 'Controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

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

              const SizedBox(height: 16),

              _buildSearchBar(),

              const SizedBox(height: 16),

              _buildAIEstimator(),

              const SizedBox(height: 20),

              _buildCategoriesHeader(),

              const SizedBox(height: 8),

              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: controller.model.length,
                  itemBuilder: (context, index) {
                    return Cart(
                      model: controller.model[index],
                    );
                  },
                ),

              const SizedBox(height: 16),

              _buildAIRecommended(),

              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
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
                'assets/Icon/icons8-location-64.png',
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
                fontSize: 12,
                color: Color(0xff616D7D),
              ),
              children: const [
                TextSpan(text: 'Current location \n'),
                TextSpan(
                  text: 'Baker Street , London',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'assets/Icon/icons8-notification.gif',
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.notifications);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          width: 1,
          color: const Color(0xffDFE4E9),
        ),
      ),
      child: TextFormField(
        textAlign: TextAlign.justify,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          border: InputBorder.none,
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/Icon/icons8-search.gif',
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.search);
              },
            ),
          ),
          hintText: 'Describe your problem to AI...',
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Color(0xff616D7D),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/Icon/icons8-mike.gif',
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.mic);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAIEstimator() {
    return Container(
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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/Icon/innovation.png',
                    color: Colors.white,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.lightbulb,
                        color: Colors.white,
                      );
                    },
                  ),
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
                    'AI Price Estimator',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Get instant quotes before you book',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Categories',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: ()=>Get.to(Category()),
          child: const Text(
            'See all',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xff006DDD),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAIRecommended() {
    return const Row(
      children: [
        Image(
          image: AssetImage('assets/Icon/innovation.png'),
          height: 25,
          color: Color(0xff167ADF),
        ),
        SizedBox(width: 8),
        Text(
          'AI recommended pros',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}