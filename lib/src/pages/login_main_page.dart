import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/controllers/home_controller.dart';
import 'package:probashipower_app/src/pages/home_view_page.dart';
import 'package:probashipower_app/src/pages/login_home_view_page.dart';
import 'package:probashipower_app/src/pages/profile_page.dart';
import 'package:probashipower_app/src/pages/socle_midia_page.dart';
import 'package:probashipower_app/src/pages/notification_page.dart';

class LoginMainPage extends StatelessWidget {
  const LoginMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    // Navigation items with icons and labels
    final List<BottomNavigationBarItem> navbarItems = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_filled, size: 28),
        activeIcon: Icon(Icons.home_filled, size: 32, color: tabColor),
        label: 'হোম',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_pin_rounded, size: 28),
        activeIcon: Icon(Icons.person_pin_rounded, size: 32, color: tabColor),
        label: 'প্রোফাইল',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.contact_phone_outlined, size: 28),
        activeIcon: Icon(
          Icons.contact_phone_outlined,
          size: 32,
          color: tabColor,
        ),
        label: 'সাপোর্ট',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications_active_outlined, size: 28),
        activeIcon: Icon(
          Icons.notifications_active_outlined,
          size: 32,
          color: tabColor,
        ),
        label: 'নোটিশ',
      ),
    ];

    // Navigation body pages
    final List<Widget> navBody = [
      LoginHomeViewPage(),
      ProfilePage(),
      SocleMidiaPage(),
      NotificationPage(),
    ];

    return Scaffold(
      body: Obx(() => navBody.elementAt(controller.currentNavIndex.value)),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: tabColor,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          backgroundColor: Colors.white,
          elevation: 0.2,
          items: navbarItems,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: tabColor,
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('Phone', style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.phone, color: Colors.white),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
