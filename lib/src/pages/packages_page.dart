// lib/src/pages/packages_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/controllers/package_controller.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/models/package.dart';
import 'package:probashipower_app/src/pages/login_page.dart';
import 'package:probashipower_app/src/widgets/custom_app_app.dart';

class PackagesPage extends StatelessWidget {
  final PackageController _controller = Get.put(PackageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'প্রবাসী পাওয়ার',
        backgroundColor: tabColor,
        textColor: Colors.white,
        onLoginPressed: () => Get.offAll(LoginPage()),
      ),
      body:
      // if (_controller.isLoading.value) {
      //   return Center(child: CircularProgressIndicator());
      // }
      // if (_controller.error.isNotEmpty) {
      //   return Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         KText(
      //           text: _controller.error.value,
      //           color: Colors.red,
      //           fontSize: 18,
      //         ),
      //         if (_controller.error.value.contains('login'))
      //           ElevatedButton(
      //             onPressed: () => Get.offAll(LoginPage()),
      //             child: KText(text: 'Login Now'),
      //           ),
      //       ],
      //     ),
      //   );
      // }
      Obx(
        () => SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Header
              Container(
                margin: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.teal.withOpacity(0.3)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset('assets/img/package.png', height: 30),
                      SizedBox(width: 10),
                      KText(
                        text: 'প্যাকেজ সমূহ',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Package List
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _controller.packages.length,
                itemBuilder: (context, index) {
                  final package = _controller.packages[index];
                  return _buildPackageCard(package);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPackageCard(Package package) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KText(
                  text: package.name,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: tabColor,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: tabColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: KText(
                    text: package.rate,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: tabColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                SizedBox(width: 5),
                KText(
                  text: package.duration,
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
            SizedBox(height: 15),
            KText(
              text: 'সুবিধা সমূহ:',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  package.features.split(',').map((feature) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: 16,
                            color: Colors.teal,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: KText(text: feature.trim(), fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add purchase functionality
                },
                child: KText(text: 'প্যাকেজ কিনুন'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: tabColor,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
