import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/controllers/auth_controller.dart';
import 'package:probashipower_app/src/controllers/profile_controller.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: tabColor,
        title: KText(
          text: 'প্রবাসী পাওয়ার',
          color: white,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.logout, color: Colors.white),
              onPressed: () => Get.find<AuthController>().logout(),
            ),
          ),
        ],
        elevation: 0,
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        // ),
      ),
      body: Obx(() {
        if (_profileController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(tabColor),
            ),
          );
        }

        if (_profileController.profile.value.userid == 0) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle, size: 80, color: Colors.grey[400]),
                SizedBox(height: 20),
                KText(
                  text: 'Please login to view your profile',
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => Get.to(LoginPage()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tabColor,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: KText(
                    text: 'Login',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        }

        return _buildProfileContent(context);
      }),
    );
  }

  Widget _buildProfileContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Container(
          //   height: 20,
          //   decoration: BoxDecoration(
          //     color: tabColor,
          //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          //   ),
          // ),
          SizedBox(height: 20),
          Transform.translate(
            offset: Offset(0, -10),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[200],
                  backgroundImage:
                      _profileController.profile.value.userImg.isNotEmpty
                          ? CachedNetworkImageProvider(
                            _profileController.profile.value.userImg,
                          )
                          : AssetImage('assets/img/sohid/dipto-dey.jpg')
                              as ImageProvider,
                ),
              ),
            ),
          ),
          // SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                KText(
                  text: _profileController.profile.value.name,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: tabColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: KText(
                    text: 'ID: ${_profileController.profile.value.refId}',
                    fontSize: 16,
                    color: tabColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 30),
                _buildProfileCard(context),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Edit profile functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tabColor,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: KText(
                      text: 'Edit Profile',
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildInfoRow(
              icon: Icons.phone,
              iconColor: Colors.blue,
              title: 'Mobile Number',
              value: _profileController.profile.value.mobile,
            ),
            Divider(height: 30, thickness: 0.5),
            _buildInfoRow(
              icon: Icons.message,
              iconColor: Colors.green,
              title: 'WhatsApp Number',
              value: _profileController.profile.value.waNumber,
            ),
            Divider(height: 30, thickness: 0.5),
            _buildInfoRow(
              icon: Icons.email,
              iconColor: Colors.red,
              title: 'Email',
              value: _profileController.profile.value.email ?? 'Not provided',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KText(text: title, fontSize: 14, color: Colors.grey[600]),
              SizedBox(height: 5),
              KText(
                text: value,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
