import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serviq/Customer%20Side/Home%20Page/Model/Model.dart';

class CallScreen extends StatelessWidget {
  final Model userModel;

  const CallScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B0E30),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff0B0E30),
                Color(0xff1A1F4E),
                Color(0xff0B0E30),
              ],
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Profile Image with extra top spacing
                        const SizedBox(height: 20),

                        Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xff0B6EBB),
                                Color(0xff1A7DE1),
                                Color(0xff4A9BE8),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xff0B6EBB).withOpacity(0.5),
                                blurRadius: 40,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 2,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.asset(
                                userModel.image,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      color: Colors.grey.shade800,
                                      child: const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 80,
                                      ),
                                    ),
                              ),
                            ),
                          ),
                        ),

                        // More spacing between image and name
                        const SizedBox(height: 35),

                        // User Name
                        Text(
                          userModel.name,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),

                        // More spacing between name and calling status
                        const SizedBox(height: 12),

                        // Calling Status
                        Text(
                          'Calling...',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        // Extra spacing before action buttons
                        const SizedBox(height: 60),

                        // Action Buttons Container
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 16
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withOpacity(0.05),
                                Colors.white.withOpacity(0.02),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.08),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildModernCallAction(
                                icon: Icons.volume_up_rounded,
                                label: 'Speaker',
                                color: const Color(0xff4A9BE8),
                                onTap: () {
                                  Get.snackbar(
                                    'Speaker',
                                    'Speaker mode toggled',
                                    backgroundColor: const Color(0xff1A1F4E),
                                    colorText: Colors.white,
                                  );
                                },
                              ),
                              _buildModernCallAction(
                                icon: Icons.mic_rounded,
                                label: 'Mute',
                                color: const Color(0xff4A9BE8),
                                onTap: () {
                                  Get.snackbar(
                                    'Mute',
                                    'Microphone muted',
                                    backgroundColor: const Color(0xff1A1F4E),
                                    colorText: Colors.white,
                                  );
                                },
                              ),
                              _buildModernCallAction(
                                icon: Icons.videocam_rounded,
                                label: 'Video',
                                color: const Color(0xff4A9BE8),
                                onTap: () {
                                  Get.snackbar(
                                    'Video',
                                    'Video call started',
                                    backgroundColor: const Color(0xff1A1F4E),
                                    colorText: Colors.white,
                                  );
                                },
                              ),
                              _buildModernCallAction(
                                icon: Icons.person_add_rounded,
                                label: 'Add',
                                color: const Color(0xff4A9BE8),
                                onTap: () {
                                  Get.snackbar(
                                    'Add',
                                    'Adding participant...',
                                    backgroundColor: const Color(0xff1A1F4E),
                                    colorText: Colors.white,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        // Extra spacing before end call button
                        const SizedBox(height: 50),

                        // End Call Button
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffE74C3C),
                                  Color(0xffC0392B),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xffE74C3C).withOpacity(0.5),
                                  blurRadius: 30,
                                  spreadRadius: 8,
                                ),
                                BoxShadow(
                                  color: const Color(0xffE74C3C).withOpacity(0.3),
                                  blurRadius: 60,
                                  spreadRadius: 15,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.call_end_rounded,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),

                        // Extra spacing after end call text
                        const SizedBox(height: 16),

                        Text(
                          'Tap to end call',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.3),
                            letterSpacing: 1,
                          ),
                        ),

                        // Bottom padding for scrolling
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildModernCallAction({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.05),
                ],
              ),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              color: color,
              size: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}