import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
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
