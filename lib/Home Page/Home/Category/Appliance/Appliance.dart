import 'package:flutter/material.dart';

class Appliance extends StatelessWidget {
  const Appliance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appliance'),
        backgroundColor: const Color(0xffCEEDFF),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.kitchen, size: 100, color: Color(0xff1A7DE1)),
              SizedBox(height: 20),
              Text(
                'Appliance Services',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Started from \$38',
                style: TextStyle(fontSize: 20, color: Color(0xff006DDF)),
              ),
              SizedBox(height: 20),
              Text(
                'Professional appliance repair and maintenance services.',
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