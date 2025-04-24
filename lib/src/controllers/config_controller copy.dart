// import 'package:get/get.dart';
// import 'package:probashipower_app/src/pages/main_page.dart';

// class ConfigController extends GetxController {
//   // @override
//   // void onInit() {
//   //   initAppConfig();
//   //   super.onInit();
//   // }

//   @override
//   void onReady() {
//     Future.delayed(const Duration(seconds: 3), () {
//       // Get.offAll(() => const SohidSinglePage());
//       //Get.offAll(() => JobListPage());
//       Get.offAll(() => MainPage());
//     });
//     super.onReady();
//   }

//   void initAppConfig() {
//     // ................
//   }
// }

// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:probashipower_app/src/pages/main_page.dart';
// import 'package:probashipower_app/src/pages/login_main_page.dart'; // আপনার LoginMainPage ইম্পোর্ট করুন

// class ConfigController extends GetxController {
//   @override
//   void onReady() {
//     checkLoginStatus();
//     super.onReady();
//   }

//   Future<void> checkLoginStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isLoggedIn =
//         prefs.getString('token') != null; // টোকেন আছে কিনা চেক করুন

//     Future.delayed(const Duration(seconds: 3), () {
//       if (isLoggedIn) {
//         Get.offAll(() => LoginMainPage()); // লগইন করা থাকলে LoginMainPage-এ যান
//       } else {
//         Get.offAll(() => MainPage()); // লগইন না করা থাকলে MainPage-এ যান
//       }
//     });
//   }

//   void initAppConfig() {
//     // আপনার অন্যান্য কনফিগারেশন লজিক এখানে রাখুন
//   }
// }
