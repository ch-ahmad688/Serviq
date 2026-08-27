import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/Model.dart';

class Status extends StatelessWidget {
  final Model selectedModel;
  const Status({super.key, required this.selectedModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildCustomHeader(),
            Expanded(
              child: _buildBody(selectedModel, context),
            ),
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
                  text: 'Booking status\n',
                ),
                const TextSpan(
                  text: 'BB-2041',
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

Widget _buildBody(Model selectedModel, BuildContext context) {
  // Calculate progress based on active steps
  int totalSteps = 6;
  int completedSteps = 3; // Currently at "Service In Progress"
  double progressValue = completedSteps / totalSteps;

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: const Color(0xffDADEE5),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffCEEDFF),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      selectedModel.image,
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: selectedModel.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: '\n',
                        ),
                        TextSpan(
                          text: selectedModel.category,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff616D7D),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ' • ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff616D7D),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: 'In Progress',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff1A7DE1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xff1A7DE1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Track',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: const Color(0xffDADEE5),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with progress
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Service Timeline',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue[200]!),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 4),
                          Text(
                            '$completedSteps/$totalSteps Steps',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue[600],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Progress bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff1A7DE1)),
                  minHeight: 4,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildTimelineItem(
                      status: 'Service Requested',
                      time: '09:00 AM',
                      date: 'Today',
                      imagePath: 'assets/Icon/document.png',
                      color: Colors.green,
                      isActive: true,
                      isFirst: true,
                      description: 'Your service request has been received',
                    ),
                    _buildTimelineItem(
                      status: 'Service Provider Assigned',
                      time: '09:30 AM',
                      date: 'Today',
                      imagePath: 'assets/Icon/approve.png',
                      color: Colors.green,
                      isActive: true,
                      isFirst: false,
                      description: 'Expert assigned to your service',
                    ),
                    _buildTimelineItem(
                      status: 'Provider on Route',
                      time: '10:00 AM',
                      date: 'Today',
                      imagePath: 'assets/Icon/route.png',
                      color: Colors.green,
                      isActive: true,
                      isFirst: false,
                      description: 'Provider is on the way to your location',
                    ),
                    _buildTimelineItem(
                      status: 'Service In Progress',
                      time: '10:30 AM',
                      date: 'Today',
                      imagePath: 'assets/Icon/processing-time.png',
                      color: Color(0xff1A7DE1),
                      isActive: true,
                      isFirst: false,
                      description: 'Service is currently being performed',
                    ),
                    _buildTimelineItem(
                      status: 'Service Completed',
                      time: '11:30 AM',
                      date: 'Today',
                      imagePath: 'assets/Icon/agile-manifesto.png',
                      color: Colors.grey,
                      isActive: false,
                      isFirst: false,
                      description: 'Service will be completed shortly',
                    ),
                    _buildTimelineItem(
                      status: 'Payment & Feedback',
                      time: '11:45 AM',
                      date: 'Today',
                      imagePath: 'assets/Icon/customer-rating.png',
                      color: Colors.grey,
                      isActive: false,
                      isFirst: false,
                      isLast: true,
                      description: 'Complete payment and share your feedback',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _buildTimelineItem({
  required String status,
  required String time,
  required String date,
  required String imagePath,
  required Color color,
  bool isActive = false,
  bool isFirst = false,
  bool isLast = false,
  String description = '',
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 40,
        child: Column(
          children: [
            if (!isFirst)
              Container(
                height: 20,
                width: 2,
                color: isActive ? color : Colors.grey[300],
              ),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? color : Colors.grey[200],
                border: Border.all(
                  color: isActive ? color : Colors.grey[400]!,
                  width: 2,
                ),
                boxShadow: isActive
                    ? [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]
                    : null,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Image.asset(
                    imagePath,
                    height: 20,
                    width: 20,
                    color: isActive ? Colors.white : Colors.grey[500],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            if (!isLast)
              Container(
                height: 20,
                width: 2,
                color: isActive ? color : Colors.grey[300],
              ),
          ],
        ),
      ),

      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                status,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isActive ? Colors.black87 : Colors.grey[500],
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 13,
                    color: isActive ? Colors.grey[600] : Colors.grey[400],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: isActive ? Colors.grey[600] : Colors.grey[400],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Icon(
                    Icons.calendar_today,
                    size: 13,
                    color: isActive ? Colors.grey[600] : Colors.grey[400],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 12,
                      color: isActive ? Colors.grey[600] : Colors.grey[400],
                    ),
                  ),
                ],
              ),
              if (description.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 14,
                        color: isActive ? Colors.grey[500] : Colors.grey[400],
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          description,
                          style: TextStyle(
                            fontSize: 12,
                            color: isActive ? Colors.grey[600] : Colors.grey[400],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (isActive && status == 'Service In Progress')
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue[200]!),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 12,
                          height: 12,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Color(0xff1A7DE1)),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'In Progress...',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.blue[700],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    ],
  );
}