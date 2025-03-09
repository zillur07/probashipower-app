import 'package:get/get.dart';
import 'package:probashipower_app/src/controllers/config_controller.dart';
import 'package:probashipower_app/src/controllers/home_controller.dart';
import 'package:probashipower_app/src/controllers/sreti_caron_controller.dart';
import 'package:probashipower_app/src/controllers/user_controller.dart';

class Base {
  static final configController = Get.find<ConfigController>();
  static final userController = Get.find<UserController>();
  static final homeController = Get.find<HomeController>();
  static final sretiCaronController = Get.find<SretiCaronController>();
}
