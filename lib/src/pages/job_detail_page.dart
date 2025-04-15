// // lib/src/pages/job_detail_page.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:probashipower_app/src/config/colors.dart';
// import 'package:probashipower_app/src/controllers/job_detail_controller.dart';
// import 'package:probashipower_app/src/helpers/k_text.dart';
// import 'package:probashipower_app/src/pages/money_rate_page.dart';
// import 'package:probashipower_app/src/pages/packages_page.dart';
// import 'package:probashipower_app/src/widgets/custom_app_app.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// class JobDetailPage extends StatelessWidget {
//   final int jobId;
//   final JobDetailController _controller = Get.put(JobDetailController());

//   JobDetailPage({required this.jobId, Key? key}) : super(key: key) {
//     _controller.fetchJobDetail(jobId);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'প্রবাসী পাওয়ার',
//         backgroundColor: tabColor,
//         textColor: Colors.white,
//         onLoginPressed: () => Get.to(MoneyRatePage()),
//       ),
//       body: Obx(() {
//         if (_controller.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         }

//         // if (_controller.error.isNotEmpty) {
//         //   return Center(
//         //     child: Column(
//         //       mainAxisAlignment: MainAxisAlignment.center,
//         //       children: [
//         //         KText(
//         //           text: _controller.error.value,
//         //           color: Colors.red,
//         //           fontSize: 16,
//         //         ),
//         //         if (_controller.error.value.contains('login'))
//         //           TextButton(
//         //             onPressed: () => Get.offAllNamed('/login'),
//         //             child: KText(text: 'Login Now'),
//         //           ),
//         //       ],
//         //     ),
//         //   );
//         // }

//         return SingleChildScrollView(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Company Image
//               Center(
//                 child: Container(
//                   height: 150,
//                   width: 150,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.teal),
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: // In your JobDetailPage's image widget:
//                         CachedNetworkImage(
//                       imageUrl:
//                           'https://probashipower.com/uploads/${_controller.jobDetail.value.companyImg}',
//                       fit: BoxFit.cover,
//                       placeholder:
//                           (context, url) => Container(
//                             color: Colors.grey[200],
//                             child: Icon(Icons.business, size: 50),
//                           ),
//                       errorWidget:
//                           (context, url, error) =>
//                               Icon(Icons.business, size: 50),
//                       imageBuilder:
//                           (context, imageProvider) => Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               image: DecorationImage(
//                                 image: imageProvider,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Job Title
//               Center(
//                 child: KText(
//                   text: _controller.jobDetail.value.jobTitle,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.teal.shade700,
//                 ),
//               ),
//               SizedBox(height: 10),

//               // Company Name
//               _buildDetailRow(
//                 'কোম্পানির নাম:',
//                 _controller.jobDetail.value.companyName,
//               ),
//               Divider(),

//               // Job Details
//               KText(
//                 text: 'চাকরির বিবরণ:',
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//               SizedBox(height: 5),
//               KText(text: _controller.jobDetail.value.jobDetails, fontSize: 16),
//               Divider(),

//               // Salary
//               _buildDetailRow('বেতন:', _controller.jobDetail.value.jobSalary),
//               Divider(),

//               // Address
//               _buildDetailRow(
//                 'কর্মস্থল:',
//                 _controller.jobDetail.value.companyAddress,
//               ),
//               Divider(),

//               // Apply Date
//               _buildDetailRow(
//                 'আবেদনের শেষ তারিখ:',
//                 _controller.jobDetail.value.applyDate,
//               ),
//               Divider(),

//               // Entry Date
//               _buildDetailRow(
//                 'প্রবেশের তারিখ:',
//                 _controller.jobDetail.value.entryDate,
//               ),

//               SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Add apply functionality
//                   },
//                   child: KText(text: 'আবেদন করুন'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: tabColor,
//                     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }

//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           KText(text: label, fontSize: 16, fontWeight: FontWeight.bold),
//           Expanded(child: KText(text: value, fontSize: 16)),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/controllers/job_detail_controller.dart';
import 'package:probashipower_app/src/controllers/package_controller.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/models/package.dart';
import 'package:probashipower_app/src/pages/login_page.dart';
import 'package:probashipower_app/src/pages/packages_page.dart';
import 'package:probashipower_app/src/widgets/custom_app_app.dart';
import 'package:cached_network_image/cached_network_image.dart';

class JobDetailPage extends StatelessWidget {
  final int jobId;
  final JobDetailController _controller = Get.put(JobDetailController());
  final PackageController controller = Get.put(PackageController());

  JobDetailPage({required this.jobId, Key? key}) : super(key: key) {
    _controller.fetchJobDetail(jobId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'প্রবাসী পাওয়ার',
        backgroundColor: tabColor,
        textColor: Colors.white,
        onLoginPressed: () => Get.offAll(LoginPage()),
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
                    // KText(
                    //   text: _controller.error.value,
                    //   color: Colors.red,
                    //   fontSize: 18,
                    //   textAlign: TextAlign.center,
                    // ),
                    // SizedBox(height: 20),
                    // if (_controller.showPackagePrompt.value)
                    //   ElevatedButton(
                    //     onPressed: () {
                    //       Get.to(PackagesPage()); // Navigate to packages page
                    //     },
                    //     child: KText(text: 'প্যাকেজ কিনুন'),
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: tabColor,
                    //       padding: EdgeInsets.symmetric(
                    //         horizontal: 30,
                    //         vertical: 15,
                    //       ),
                    //     ),
                    //   ),
                    // SizedBox(height: 10),

                    // ElevatedButton(
                    //   onPressed: () {
                    //     Get.back(); // Return to job list
                    //   },
                    //   child: KText(text: 'চাকরির তালিকায় ফিরে যান'),
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.grey,
                    //     padding: EdgeInsets.symmetric(
                    //       horizontal: 20,
                    //       vertical: 15,
                    //     ),
                    //   ),
                    // ),
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
              // Company Image
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.teal),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: // In your JobDetailPage's image widget:
                        CachedNetworkImage(
                      imageUrl:
                          'https://probashipower.com/uploads/${_controller.jobDetail.value.companyImg}',
                      fit: BoxFit.cover,
                      placeholder:
                          (context, url) => Container(
                            color: Colors.grey[200],
                            child: Icon(Icons.business, size: 50),
                          ),
                      errorWidget:
                          (context, url, error) =>
                              Icon(Icons.business, size: 50),
                      imageBuilder:
                          (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Job Title
              Center(
                child: KText(
                  text: _controller.jobDetail.value.jobTitle,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade700,
                ),
              ),
              SizedBox(height: 10),

              // Company Name
              _buildDetailRow(
                'কোম্পানির নাম:',
                _controller.jobDetail.value.companyName,
              ),
              Divider(),

              // Job Details
              KText(
                text: 'চাকরির বিবরণ:',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 5),
              KText(text: _controller.jobDetail.value.jobDetails, fontSize: 16),
              Divider(),

              // Salary
              _buildDetailRow('বেতন:', _controller.jobDetail.value.jobSalary),
              Divider(),

              // Address
              _buildDetailRow(
                'কর্মস্থল:',
                _controller.jobDetail.value.companyAddress,
              ),
              Divider(),

              // Apply Date
              _buildDetailRow(
                'আবেদনের শেষ তারিখ:',
                _controller.jobDetail.value.applyDate,
              ),
              Divider(),

              // Entry Date
              _buildDetailRow(
                'প্রবেশের তারিখ:',
                _controller.jobDetail.value.entryDate,
              ),

              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add apply functionality
                  },
                  child: KText(text: 'আবেদন করুন'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tabColor,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
