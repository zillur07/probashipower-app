import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:probashipower_app/src/base/base_bindings.dart';
import 'package:probashipower_app/src/config/app_theme.dart';
import 'package:probashipower_app/src/pages/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BaseBindings(),
      smartManagement: SmartManagement.onlyBuilder,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: const SplashPage(),
    );
  }
}
