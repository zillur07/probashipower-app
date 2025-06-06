import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/controllers/legal_help_detail_controller.dart';
import 'package:probashipower_app/src/controllers/package_controller.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/models/package.dart';
import 'package:probashipower_app/src/pages/login_page.dart';
import 'package:probashipower_app/src/pages/packages_page.dart';
import 'package:probashipower_app/src/widgets/custom_app_app.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LegalHelpDetailPage extends StatelessWidget {
  final int helpId;
  final LegalHelpDetailController _controller = Get.put(
    LegalHelpDetailController(),
  );
  final PackageController _packageController = Get.put(PackageController());

  LegalHelpDetailPage({required this.helpId, Key? key}) : super(key: key) {
    _controller.fetchLegalHelpDetail(helpId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'আইনি সহায়তা বিস্তারিত',
        backgroundColor: Colors.teal,
        textColor: Colors.white,
        onLoginPressed: () => Get.offAll(() => LoginPage()),
      ),
      body: Obx(() {
        // Check if user is not logged in
        // if (_controller.error.value == 'Unauthenticated') {
        //   return Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Icon(Icons.error_outline, size: 60, color: Colors.red),
        //         SizedBox(height: 20),
        //         Text(
        //           'লগইন করা প্রয়োজন',
        //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //         ),
        //         SizedBox(height: 20),
        //         ElevatedButton(
        //           onPressed: () => Get.offAll(() => LoginPage()),
        //           child: Text('লগইন করুন'),
        //         ),
        //       ],
        //     ),
        //   );
        // }

        // Check if loading
        if (_controller.isLoading.value || _packageController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        // Check if package is not purchased
        if (_controller.error.isNotEmpty ||
            _controller.showPackagePrompt.value &&
                _packageController.error.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: _packageController.refreshPackages,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
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
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _packageController.packages.length,
                    itemBuilder: (context, index) {
                      final package = _packageController.packages[index];
                      return _buildPackageCard(package);
                    },
                  ),
                ],
              ),
            ),
          );
        }

        // Show legal help details if everything is okay
        return _buildLegalHelpDetails();
      }),
    );
  }

  Widget _buildLegalHelpDetails() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Legal Help Profile Card
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.teal[100],
                    child: Icon(
                      FontAwesomeIcons.scaleBalanced,
                      size: 40,
                      color: Colors.teal[800],
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    _controller.legalHelpDetail.value.helpName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[900],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  Divider(),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildActionButton(
                        icon: FontAwesomeIcons.phone,
                        color: Colors.green,
                        onPressed:
                            () => _makePhoneCall(
                              _controller.legalHelpDetail.value.helpContact
                                  .split(',')[0]
                                  .trim(),
                            ),
                      ),
                      SizedBox(width: 20),
                      _buildActionButton(
                        icon: FontAwesomeIcons.mapMarkerAlt,
                        color: Colors.red,
                        onPressed:
                            () => _openMap(
                              _controller.legalHelpDetail.value.helpAddress,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          // Legal Help Details Section
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailItem(
                    icon: FontAwesomeIcons.phone,
                    title: 'যোগাযোগ নম্বর',
                    value: _controller.legalHelpDetail.value.helpContact,
                  ),
                  SizedBox(height: 15),
                  _buildDetailItem(
                    icon: FontAwesomeIcons.locationDot,
                    title: 'ঠিকানা',
                    value: _controller.legalHelpDetail.value.helpAddress,
                  ),
                  SizedBox(height: 15),
                  _buildDetailItem(
                    icon: FontAwesomeIcons.infoCircle,
                    title: 'বিস্তারিত',
                    value: _controller.legalHelpDetail.value.helpDetails,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          // Contact Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: Icon(
                FontAwesomeIcons.headset,
                size: 20,
                color: Colors.white,
              ),
              label: Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'যোগাযোগ করুন',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
              onPressed:
                  () => _makePhoneCall(
                    _controller.legalHelpDetail.value.helpContact
                        .split(',')[0]
                        .trim(),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: Colors.teal[800]),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.only(left: 28),
          child: Text(value, style: TextStyle(fontSize: 15)),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          shape: BoxShape.circle,
          border: Border.all(color: color.withOpacity(0.5)),
        ),
        child: Icon(icon, size: 24, color: color),
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
                  Get.to(() => PackagesPage());
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

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      Get.snackbar('ত্রুটি', 'ফোন কল শুরু করা যায়নি');
    }
  }

  Future<void> _openMap(String address) async {
    final Uri launchUri = Uri(
      scheme: 'https',
      host: 'www.google.com',
      path: '/maps/search/',
      queryParameters: {'api': '1', 'query': address},
    );
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      Get.snackbar('ত্রুটি', 'ম্যাপ খোলা যায়নি');
    }
  }
}
