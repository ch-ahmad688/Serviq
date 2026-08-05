import 'package:flutter/material.dart';

class ACRepair extends StatelessWidget {
  const ACRepair({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AC Repair'),
        backgroundColor: const Color(0xffCEEDFF),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.ac_unit, size: 100, color: Color(0xff1A7DE1)),
              SizedBox(height: 20),
              Text(
                'AC Repair Services',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Started from \$40',
                style: TextStyle(fontSize: 20, color: Color(0xff006DDF)),
              ),
              SizedBox(height: 20),
              Text(
                'Professional AC repair and maintenance services.',
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