import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/controllers/auth_controller.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/pages/home_page.dart';
import 'package:probashipower_app/src/pages/home_view_page.dart';
import 'package:probashipower_app/src/pages/registration_page.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/img/ppr.png', height: 250),
              // KText(
              //   text: 'Probashi Power',
              //   fontSize: 25,
              //   color: Colors.teal,
              //   fontWeight: FontWeight.bold,
              // ),

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
              // Login Button
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
                              horizontal: 128,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ), // Rounded corners
                            ),
                          ),
                          onPressed: () {
                            authController.login(
                              mobileController.text,
                              passwordController.text,
                            );
                          },
                          child: Text(
                            'লগইন করুন',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),

                onPressed: () {
                  Get.to(RegistrationPage());
                },
                child: Text(
                  'অ্যাকাউন্ট নেই? নতুন অ্যাকাউন্ট তৈরি করুন',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),

                onPressed: () {},
                child: Text(
                  'পাসওয়ার্ড মনে নেই?',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
                  padding: EdgeInsets.symmetric(horizontal: 135, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),

                onPressed: () {
                  Get.to(HomeViewPage());
                },
                child: Text(
                  'হোম পেজ',
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
