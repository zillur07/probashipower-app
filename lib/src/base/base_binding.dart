import 'package:get/get.dart';
import 'package:probashipower_app/src/controllers/auth_controller.dart';
import 'package:probashipower_app/src/controllers/config_controller.dart';

class BaseBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(ConfigController(), permanent: true);
    // Add other controllers here
  }
}
