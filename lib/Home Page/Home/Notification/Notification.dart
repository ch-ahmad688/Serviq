import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notifiy extends StatelessWidget {
  const Notifiy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildHeader(),
              const SizedBox(height: 15),
              _buildNotificationList(),
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
      GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 1, color: const Color(0xffDFE4E9)),
          ),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.arrow_back, size: 20, color: Colors.black),
          ),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: RichText(
          text: const TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: 'Notifications\n'),
              TextSpan(
                text: 'You have 2 unread',
                style: TextStyle(fontSize: 12, color: Color(0xff616D7D), fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 1, color: const Color(0xffDFE4E9)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/Icon/icons8-notification.gif',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildNotificationList() {
  return Expanded(
    child: ListView.separated(
      itemCount: _notificationData.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final notification = _notificationData[index];
        return _buildNotificationItem(
          iconPath: notification['iconPath'],
          title: notification['title'],
          subtitle: notification['subtitle'],
          time: notification['time'],
          isRead: notification['isRead'],
          onTap: () {
            Get.snackbar(
              'Notification',
              'You tapped: ${notification['title']}',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.grey.shade100,
            );
          },
        );
      },
    ),
  );
}
Widget _buildNotificationItem({
  required String iconPath,
  required String title,
  required String subtitle,
  required String time,
  bool isRead = false,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isRead ? Colors.white : Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isRead ? Colors.grey.shade200 : Colors.blue.shade100,
          width: 1,
        ),
        boxShadow: isRead
            ? null
            : [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: isRead ? Colors.grey.shade100 : Colors.blue,
              borderRadius: BorderRadius.circular(14),
              boxShadow: isRead
                  ? null
                  : [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                iconPath,
                color: isRead ? Colors.grey : Colors.white,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: isRead ? FontWeight.w500 : FontWeight.w700,
                    color: isRead ? Colors.grey.shade700 : Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: isRead ? Colors.grey.shade500 : Colors.grey.shade700,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isRead ? Colors.grey.shade100 : Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: isRead ? Colors.grey.shade500 : Colors.blue.shade700,
                  ),
                ),
              ),
              if (!isRead)
                const SizedBox(height: 8),
              if (!isRead)
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ],
      ),
    ),
  );
}

List<Map<String, dynamic>> _notificationData = [
  {
    'iconPath': 'assets/Icon/bell.png',
    'title': 'Your pro is on the way',
    'subtitle': 'Omar Farooq will arrive in about 10 minutes.',
    'time': '2 min ago',
    'isRead': false,
  },
  {
    'iconPath': 'assets/Icon/atm-card.png',
    'title': 'Payment successful',
    'subtitle': 'You paid \$42.00 for AC Servicing.',
    'time': '15 min ago',
    'isRead': false,
  },
  {
    'iconPath': 'assets/Icon/parcel.png',
    'title': '20% off cleaning services',
    'subtitle': 'Use code CLEAN20 before Sunday.',
    'time': '1 hour ago',
    'isRead': true,
  },
  {
    'iconPath': 'assets/Icon/interest-rate.png',
    'title': 'Rate your recent service',
    'subtitle': 'How was your experience with James \n Wilson?',
    'time': '3 hours ago',
    'isRead': true,
  },
];