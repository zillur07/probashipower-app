import 'package:flutter/material.dart';
import 'package:probashipower_app/src/base/base.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Base.configController.initAppConfig();
    return const Scaffold(
      body: Center(
        child: Text('Splash Page'),
      ),
    );
  }
}
