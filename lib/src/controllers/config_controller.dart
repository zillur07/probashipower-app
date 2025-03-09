import 'package:get/get.dart';
import 'package:probashipower_app/src/pages/main_page.dart';

class ConfigController extends GetxController {
  // @override
  // void onInit() {
  //   initAppConfig();
  //   super.onInit();
  // }

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 3), () {
      // Get.offAll(() => const SohidSinglePage());
      //Get.offAll(() => JobListPage());
      Get.offAll(() => MainPage());
    });
    super.onReady();
  }

  void initAppConfig() {
    // ................
  }
}
