import 'package:get/get.dart';
import 'package:probashipower_app/src/controllers/config_controller.dart';
import 'package:probashipower_app/src/controllers/home_controller.dart';
import 'package:probashipower_app/src/controllers/sreti_caron_controller.dart';
import 'package:probashipower_app/src/controllers/user_controller.dart';

class BaseBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfigController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => SretiCaronController());
  }
}
