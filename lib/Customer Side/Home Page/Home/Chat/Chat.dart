import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serviq/Customer%20Side/Home%20Page/Model/Model.dart';

import '../Call/Call.dart';

class Chat extends StatelessWidget {
  final Model userModel;
  const Chat({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 10),
                children: [
                  _buildDateDivider('Today'),
                  const SizedBox(height: 10),

                  _buildMessage(
                    message: 'Hello! How can I help you?',
                    time: '10:30 AM',
                    isMine: false,
                  ),

                  _buildMessage(
                    message: 'Hi! I need help with electrical wiring.',
                    time: '10:32 AM',
                    isMine: true,
                  ),

                  _buildMessage(
                    message: 'Sure! I can help you with that. What specific wiring do you need?',
                    time: '10:33 AM',
                    isMine: false,
                  ),

                  _buildMessage(
                    message: 'I want to install new lighting in my living room.',
                    time: '10:35 AM',
                    isMine: true,
                  ),

                  _buildMessage(
                    message: 'I have experience with that. Here\'s a sample of my work:',
                    time: '10:36 AM',
                    isMine: false,
                    hasImage: true,
                    imageUrl: 'assets/images/sample_work.png',
                  ),

                  _buildDateDivider('Yesterday'),
                  const SizedBox(height: 10),

                  _buildMessage(
                    message: 'Can we schedule a visit for tomorrow?',
                    time: '02:15 PM',
                    isMine: false,
                  ),

                  _buildMessage(
                    message: 'Yes, tomorrow at 10 AM works for me.',
                    time: '02:20 PM',
                    isMine: true,
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.black54),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Message',
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                          suffixIcon:                  IconButton(
                            icon: const Icon(Icons.attach_file, color: Colors.black54),
                            onPressed: () {
                              _showAttachmentOptions(context);
                            },
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12),
                        ),
                        maxLines: null,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            Get.snackbar('Message', 'Sending: $value');
                          }
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: const Color(0xff0B6EBB),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                          Icons.send, color: Colors.white, size: 20),
                    ),
                    onPressed: () {
                      Get.snackbar(
                        'Message Sent',
                        'Your message has been sent.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 1, color: const Color(0xffDFE4E9)),
              ),
              child: const Center(
                child: Icon(Icons.arrow_back_ios_new_sharp, size: 20),
              ),
            ),
          ),
          const SizedBox(width: 12),

          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22.5),
              child: Image.asset(
                userModel.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  userModel.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: Color(0xff0B6EBB),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Online',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff0B6EBB),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: ()=>Get.to(() => CallScreen(userModel: userModel)),
          child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 1, color: const Color(0xffDFE4E9)),
              ),
              child: const Center(
                child: Icon(Icons.phone, color: Color(0xff0B6EBB), size: 22),
              ),
            ),
          ),
          const SizedBox(width: 8),

          GestureDetector(
            onTap: () {
             // _showBottomSheet(context);
            },
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 1, color: const Color(0xffDFE4E9)),
              ),
              child: const Center(
                child: Icon(Icons.more_vert, color: Colors.black, size: 22),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateDivider(String date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade300,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Text(
                date,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMessage({
    required String message,
    required String time,
    required bool isMine,
    bool hasImage = false,
    String? imageUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              decoration: BoxDecoration(
                color: isMine ? const Color(0xff0B6EBB) : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20).copyWith(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: isMine ? const Radius.circular(20) : const Radius.circular(20),
                  bottomRight: isMine ? const Radius.circular(20) : const Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (hasImage && imageUrl != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imageUrl,
                        height: 150,
                        width: 250,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Container(
                              decoration: BoxDecoration(),
                              child: const Center(
                                child: Image(image: AssetImage('assets/images/ChatGPT Image Aug 4, 2026, 04_45_59 PM.png'),
                                ) ),
                            ),
                      ),
                    ),
                  if (hasImage && imageUrl != null) const SizedBox(height: 8),
                  Text(
                    message,
                    style: TextStyle(
                      color: isMine ? Colors.white : Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(
                      color: isMine ? Colors.white70 : Colors.grey.shade600,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              _buildOptionTile(
                icon: Icons.visibility,
                title: 'View Profile',
                onTap: () {
                  Navigator.pop(context);
                  Get.snackbar('Profile', 'Viewing profile...');
                },
              ),
              _buildOptionTile(
                icon: Icons.block,
                title: 'Block User',
                onTap: () {
                  Navigator.pop(context);
                  _showConfirmationDialog(context, 'Block User', 'Are you sure you want to block this user?');
                },
                color: Colors.red,
              ),
              _buildOptionTile(
                icon: Icons.delete,
                title: 'Clear Chat',
                onTap: () {
                  Navigator.pop(context);
                  _showConfirmationDialog(context, 'Clear Chat', 'Are you sure you want to clear all messages?');
                },
                color: Colors.red,
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(icon, color: color ?? Colors.black),
      title: Text(
        title,
        style: TextStyle(
          color: color ?? Colors.black,
          fontSize: 16,
        ),
      ),
      onTap: onTap,
    );
  }

  void _showAttachmentOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildAttachmentOption(
                    icon: Icons.photo_library,
                    label: 'Gallery',
                    color: Colors.blueAccent,
                    onTap: () {
                      Navigator.pop(context);
                      Get.snackbar('Gallery', 'Opening gallery...');
                    },
                  ),
                  _buildAttachmentOption(
                    icon: Icons.camera_alt,
                    label: 'Camera',
                    color: Colors.pinkAccent,
                    onTap: () {
                      Navigator.pop(context);
                      Get.snackbar('Camera', 'Opening camera...');
                    },
                  ),
                  _buildAttachmentOption(
                    icon: Icons.document_scanner,
                    label: 'Document',
                    color: Colors.deepPurpleAccent,
                    onTap: () {
                      Navigator.pop(context);
                      Get.snackbar('Document', 'Selecting document...');
                    },
                  ),
                  _buildAttachmentOption(
                    icon: Icons.location_on_rounded,
                    label: 'Location',
                    color: Colors.greenAccent,
                    onTap: () {
                      Navigator.pop(context);
                      Get.snackbar('Location', 'Sharing location...');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAttachmentOption({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color(0xffDADEE5)
              )
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Get.snackbar('Success', '$title completed');
              },
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.red.shade700),
              ),
            ),
          ],
        );
      },
    );
  }
}