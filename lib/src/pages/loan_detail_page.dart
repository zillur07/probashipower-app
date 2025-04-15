// lib/src/pages/loan_detail_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/controllers/loan_detail_controller.dart';
import 'package:probashipower_app/src/controllers/package_controller.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/models/package.dart';
import 'package:probashipower_app/src/pages/login_page.dart';
import 'package:probashipower_app/src/widgets/custom_app_app.dart';

class LoanDetailPage extends StatelessWidget {
  final int loanId;
  final LoanDetailController _controller = Get.put(LoanDetailController());
  final PackageController controller = Get.put(PackageController());

  LoanDetailPage({required this.loanId, Key? key}) : super(key: key) {
    _controller.fetchLoanDetail(loanId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'প্রবাসী পাওয়ার',
        backgroundColor: tabColor,
        textColor: Colors.white,
        onLoginPressed: () => Get.offAll(() => LoginPage()),
      ),
      body: Obx(() {
        if (_controller.isLoading.value && controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (_controller.error.isNotEmpty ||
            _controller.showPackagePrompt.value &&
                controller.error.isNotEmpty) {
          return Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RefreshIndicator(
                      onRefresh: controller.refreshPackages,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            // Header
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 70,
                                vertical: 15,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.teal.withOpacity(0.3),
                                ),
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
                              primary: false,
                              physics: NeverScrollableScrollPhysics(),

                              itemCount: controller.packages.length,
                              itemBuilder: (context, index) {
                                final package = controller.packages[index];
                                return _buildPackageCard(package);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      Image.asset('assets/img/loan.png', height: 30),
                      SizedBox(width: 10),
                      KText(
                        text: 'লোনের বিবরণ',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Loan Details Card
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: KText(
                          text: _controller.loanDetail.value.loanName,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: tabColor,
                        ),
                      ),
                      SizedBox(height: 20),

                      _buildDetailRow(
                        'সুদের হার:',
                        _controller.loanDetail.value.loanInterest,
                      ),
                      Divider(),

                      _buildDetailRow(
                        'লোনের পরিমাণ:',
                        _controller.loanDetail.value.loanAmount,
                      ),
                      Divider(),

                      _buildDetailRow(
                        'মেয়াদকাল:',
                        _controller.loanDetail.value.loanDuration,
                      ),
                      Divider(),

                      SizedBox(height: 10),
                      KText(
                        text: 'বিস্তারিত তথ্য:',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),
                      KText(
                        text: _controller.loanDetail.value.loanDetails,
                        fontSize: 16,
                      ),

                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Add loan application functionality
                          },
                          child: KText(text: 'আবেদন করুন'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tabColor,
                            padding: EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
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

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KText(text: label, fontSize: 16, fontWeight: FontWeight.bold),
          Expanded(child: KText(text: value, fontSize: 16)),
        ],
      ),
    );
  }
}
