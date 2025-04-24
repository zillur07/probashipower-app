import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/app.dart';
import 'package:probashipower_app/src/controllers/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.reset();
  runApp(const App());
}
