import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/base/base.dart';
import 'package:probashipower_app/src/controllers/config_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Base.configController.initAppConfig();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/img/ppr.png', height: 300),
            // const Text(
            //   'প্রবাসী পাওয়ার',
            //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            // ),
          ],
        ),
      ),
    );
  }
}
