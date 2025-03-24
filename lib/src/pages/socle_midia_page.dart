import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/controllers/social_media_controller.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/widgets/custom_app_app.dart';

class SocleMidiaPage extends StatelessWidget {
  final SocialMediaController _controller = Get.put(SocialMediaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: CustomAppBar(
        title: 'প্রবাসী পাওয়ার',
        backgroundColor: tabColor,
        textColor: Colors.white,
        onLoginPressed: () => print('Login button pressed'),
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Social Media Header Card
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 70,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.teal.withOpacity(0.3)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/img/social-media.png', height: 30),
                      const SizedBox(width: 10),
                      const KText(
                        text: 'সোশ্যাল মিডিয়া',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Social Media Icons Grid
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _buildSocialMediaIcon(
                    'assets/img/facebook.png',
                    'Facebook',
                    _controller.socialMedia.value.facebook,
                  ),
                  _buildSocialMediaIcon(
                    'assets/img/instagram.png',
                    'Instagram',
                    _controller.socialMedia.value.insta,
                  ),
                  _buildSocialMediaIcon(
                    'assets/img/social.png',
                    'WhatsApp',
                    _controller.socialMedia.value.whatsapp,
                  ),
                  _buildSocialMediaIcon(
                    'assets/img/youtube.png',
                    'YouTube',
                    _controller.socialMedia.value.youtube,
                  ),
                  _buildSocialMediaIcon(
                    'assets/img/email.png',
                    'Email',
                    'mailto:${_controller.socialMedia.value.gmail}',
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildSocialMediaIcon(String imagePath, String label, String url) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.teal.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Image.asset(imagePath, height: 40, width: 40),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.teal.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (url.isEmpty) {
      Get.snackbar('Error', 'No link available');
      return;
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Get.snackbar('Error', 'Could not launch $url');
    }
  }
}
