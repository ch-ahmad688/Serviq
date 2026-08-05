import 'package:flutter/material.dart';
import 'Model.dart';

class Cart extends StatelessWidget {
  final Model model;
  const Cart({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.5),
        color: const Color(0xffCEEDFF),
        border: Border.all(
          color: Color(0xffDADEE5),
          width: 2
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              model.image,
              height: 40,
              width: 40,
              color: const Color(0xff1A7DE1),
            ),
          ),
          const SizedBox(height: 8), // Spacing between image and text

          // Text section with better alignment
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: '${model.name}\n',
                ),
                TextSpan(
                  text: model.price,
                  style: const TextStyle(
                    color: Color(0xff006DDF),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}