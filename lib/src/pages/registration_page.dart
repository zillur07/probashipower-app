import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/controllers/auth_controller.dart';
import 'package:probashipower_app/src/pages/login_page.dart';

class RegistrationPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController refcodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset('assets/img/ppr.png', height: 220),

              // Username Field
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Mobile Field
              TextField(
                controller: mobileController,
                decoration: InputDecoration(
                  labelText: 'Mobile',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Password Field
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Referral Code Field (Optional)
              TextField(
                controller: refcodeController,
                decoration: InputDecoration(
                  labelText: 'Referral Code (Optional)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              // Register Button
              Obx(
                () =>
                    authController.isLoading.value
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors
                                    .teal, // Use backgroundColor instead of primary
                            foregroundColor:
                                Colors
                                    .white, // Use foregroundColor instead of onPrimary
                            padding: EdgeInsets.symmetric(
                              horizontal: 118,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ), // Rounded corners
                            ),
                          ),
                          onPressed: () {
                            authController.register(
                              usernameController.text,
                              mobileController.text,
                              passwordController.text,
                              refcode:
                                  refcodeController.text.isNotEmpty
                                      ? refcodeController.text
                                      : null,
                            );
                          },
                          child: Text('রেজিস্ট্রেশন করুন'),
                        ),
              ),
              SizedBox(height: 15),
              OutlinedButton(
                style: ElevatedButton.styleFrom(
                  // backgroundColor:
                  //     Colors
                  //         .teal, // Use backgroundColor instead of primary
                  // foregroundColor:
                  //     Colors
                  //         .white, // Use foregroundColor instead of onPrimary
                  padding: EdgeInsets.symmetric(horizontal: 128, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),

                onPressed: () {
                  Get.to(LoginPage());
                },
                child: Text(
                  'লগইন করুন',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
