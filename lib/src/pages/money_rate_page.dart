// lib/src/pages/money_rate_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/controllers/money_rate_controller.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/pages/login_page.dart';
import 'package:probashipower_app/src/widgets/custom_app_app.dart';

class MoneyRatePage extends StatelessWidget {
  final MoneyRateController _controller = Get.put(MoneyRateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: KText(
      //     text: 'টাকার রেট',
      //     fontSize: 20,
      //     color: Colors.white,
      //   ),
      //   backgroundColor: tabColor,
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.refresh),
      //       onPressed: _controller.refreshData,
      //     ),
      //   ],
      // ),
      appBar: CustomAppBar(
        title: 'প্রবাসী পাওয়ার',
        backgroundColor: tabColor, // Replace with your desired color
        textColor: Colors.white,
        onLoginPressed: () {
          // Add your login logic here
          //Get.to(MoneyRatePage());
          print('Login button pressed');
        },
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.teal.withOpacity(0.3)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset('assets/img/taka.png'),
                    ),
                    const SizedBox(width: 10),
                    const KText(
                      text: 'টাকার রেট',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              if (_controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              if (_controller.errorMessage.isNotEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      KText(
                        text: _controller.errorMessage.value,
                        fontSize: 18,
                        color: Colors.red,
                      ),
                      if (_controller.errorMessage.value.contains('login'))
                        ElevatedButton(
                          onPressed: () => Get.to(LoginPage()),
                          child: KText(text: 'Login'),
                        ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.all(16),
                itemCount: _controller.moneyRates.length,
                itemBuilder: (context, index) {
                  final rate = _controller.moneyRates[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          KText(
                            text: rate.title,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 8),
                          KText(text: rate.rateDetails, fontSize: 16),
                          SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: KText(
                              text: 'Date: ${rate.date}',
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
