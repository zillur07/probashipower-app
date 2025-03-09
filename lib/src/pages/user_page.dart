import 'package:flutter/material.dart';
import 'package:probashipower_app/src/base/base.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: Base.userController.user.length,
          itemBuilder: (BuildContext context, int index) {
            final item = Base.userController.user[index];
            return Text(item);
          },
        ),
      ),
    );
  }
}
