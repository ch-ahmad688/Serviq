import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller.dart';

class Bottom_bar extends StatelessWidget {
  const Bottom_bar({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: controller.pages,
      ),
      bottomNavigationBar: const _BottomNavBar(),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Controller>();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 0.25,
          ),
        ),
      ),
      child: Obx(
            () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          selectedItemColor: Color(0xff306DDD),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/Icon/home.png'),
                size: 24,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/Icon/calendar.png'),
                size: 24,
              ),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/Icon/wallet.png'),
                size: 24,
              ),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/Icon/people.png'),
                size: 24,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}