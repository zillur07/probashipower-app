import 'package:flutter/material.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/widgets/custom_app_app.dart';

class SocleMidiaPage extends StatelessWidget {
  const SocleMidiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: CustomAppBar(
        title: 'প্রবাসী পাওয়ার',
        backgroundColor: tabColor, // Replace with your desired color
        textColor: Colors.white,
        onLoginPressed: () {
          // Add your login logic here
          print('Login button pressed');
        },
      ),
      body: Padding(
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
                  border: Border.all(color: Colors.teal.withOpacity(0.3))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 30,
                        child: Image.asset('assets/img/social-media.png')),
                    const SizedBox(
                      width: 10,
                    ),
                    const KText(
                      text: 'সোশ্যাল মিডিয়া',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )
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
                _buildSocialMediaIcon('assets/img/facebook.png', 'Facebook'),
                _buildSocialMediaIcon('assets/img/instagram.png', 'Instagram'),
                _buildSocialMediaIcon('assets/img/social.png', 'Social'),
                _buildSocialMediaIcon('assets/img/youtube.png', 'YouTube'),
                _buildSocialMediaIcon('assets/img/email.png', 'Email'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Helper Function to Build Social Media Icons
Widget _buildSocialMediaIcon(String imagePath, String label) {
  return Column(
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
        child: Image.asset(
          imagePath,
          height: 40,
          width: 40,
        ),
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
  );
}
