import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller.dart';

class Bottom_bar extends StatelessWidget {
  const Bottom_bar({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: controller.pages,
      ),
      bottomNavigationBar: const _ModernLightNavBar(),
    );
  }
}

class _ModernLightNavBar extends StatelessWidget {
  const _ModernLightNavBar();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Controller>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      height: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff306DDD).withOpacity(0.08),
            blurRadius: 30,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Obx(
                () => Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeOutCubic,
                  left: _getPillPosition(
                    controller.currentIndex.value,
                    constraints.maxWidth,
                  ),
                  top: 6,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOutCubic,
                    width: 68,
                    height: 62,
                    decoration: BoxDecoration(
                      color: const Color(0xff306DDD).withOpacity(0.08),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: const Color(0xff306DDD).withOpacity(0.1),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(4, (index) {
                    final isSelected = controller.currentIndex.value == index;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => controller.changePage(index),
                        child: Container(
                          height: 75,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Icon with scale animation
                              AnimatedScale(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeOutBack,
                                scale: isSelected ? 1.1 : 1.0,
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 200),
                                  opacity: isSelected ? 1.0 : 0.6,
                                  child: ImageIcon(
                                    _getIconForIndex(index),
                                    size: 26,
                                    color: isSelected
                                        ? const Color(0xff306DDD)
                                        : Colors.grey.shade500,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              // Label
                              AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 200),
                                style: TextStyle(
                                  color: isSelected
                                      ? const Color(0xff306DDD)
                                      : Colors.grey.shade400,
                                  fontSize: isSelected ? 11 : 10,
                                  fontWeight: isSelected
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                  letterSpacing: isSelected ? 0.3 : 0,
                                ),
                                child: Text(
                                  _getLabelForIndex(index),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  double _getPillPosition(int index, double totalWidth) {
    const double pillWidth = 68;
    const double itemCount = 4;
    const double padding = 0;

    double availableWidth = totalWidth - (padding * 2);
    double itemWidth = availableWidth / itemCount;

    double centerOffset = (itemWidth - pillWidth) / 2;
    double position = (index * itemWidth) + centerOffset;

    return position;
  }

  AssetImage _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return const AssetImage('assets/Icon/menu.png');
      case 1:
        return const AssetImage('assets/Icon/job-fair.png');
      case 2:
        return const AssetImage('assets/Icon/profit.png');
      case 3:
        return const AssetImage('assets/Icon/user.png');
      default:
        return const AssetImage('assets/Icon/menu.png');
    }
  }

  String _getLabelForIndex(int index) {
    switch (index) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'Jobs';
      case 2:
        return 'Earning';
      case 3:
        return 'Profile';
      default:
        return '';
    }
  }
}