import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/controllers/home_controller.dart';
import 'package:probashipower_app/src/pages/home_view_page.dart';
import 'package:probashipower_app/src/pages/job_list_page.dart';
import 'package:probashipower_app/src/pages/notification_page.dart';
import 'package:probashipower_app/src/pages/profile_page.dart';
import 'package:probashipower_app/src/pages/socle_midia_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // init Home Controller
    final controller = Get.put(HomeController());
    //.......................................

    // Nave Item Icon and Text
    var navbarItem = [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
            size: 30,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.person_pin_rounded,
            size: 30,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.contact_phone_outlined,
            size: 30,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications_active_outlined,
            size: 30,
          ),
          label: ''),
    ];
    //.......................

    // Nav Body Page
    var navBody = [
      HomeViewPage(),
      ProfilePage(),

      SocleMidiaPage(),
      NotificationPage(),
      // SettingPage(),
    ];
    //...........................

    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: tabColor,
          unselectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(fontSize: 0),
          backgroundColor: Colors.white,
          items: navbarItem,
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
        label: const Text(
          'Phone',
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(
          Icons.phone,
          color: Colors.white,
        ),
      ),
    );
  }
}
