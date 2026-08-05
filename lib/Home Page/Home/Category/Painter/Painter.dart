import 'package:flutter/material.dart';

class Painter extends StatelessWidget {
  const Painter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painter'),
        backgroundColor: const Color(0xffCEEDFF),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.format_paint, size: 100, color: Color(0xff1A7DE1)),
              SizedBox(height: 20),
              Text(
                'Painter Services',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Started from \$50',
                style: TextStyle(fontSize: 20, color: Color(0xff006DDF)),
              ),
              SizedBox(height: 20),
              Text(
                'Professional painting services for your home and office.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}