import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/base/base.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/pages/sohid_single_page.dart';
import 'package:probashipower_app/src/pages/sreti_caron_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'স্বাধীন বাংলাদেশ ২.০',
          style: TextStyle(fontSize: 20),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/img/pngtree-blood-splatter-png-image_10169461.png'), // Path to your image
                  fit: BoxFit.cover, // Cover the entire area of the header
                ),
              ),
              child: Text(
                '',
                style: TextStyle(
                    color: Colors.green, // White text color
                    fontSize: 25,
                    fontWeight: FontWeight.bold // Font size 18
                    ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Get.offAll(() => const HomePage());
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Developer'),
              onTap: () {
                // Navigate to the About Page (replace with actual page)
                //  Get.to(() => AboutPage()); // Replace with the correct page
              },
            ),
            ListTile(
              leading: const Icon(Icons.announcement_outlined),
              title: const Text('স্মৃতি চারণ'),
              onTap: () {
                // Navigate to the Settings Page (replace with actual page)
                Get.to(() => const SretiCaronPage());
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to the Settings Page (replace with actual page)
                // Get.to(() => SettingsPage());  // Uncomment and replace with your actual settings page
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(const SretiCaronPage()),
                      child: _buildInfoCard(
                          'এ পর্যন্ত শহীদ \n৬৫০+', Colors.red[50], red),
                    ),
                    _buildInfoCard('এ পর্যন্ত আহত \n৩৩,০০০+', Colors.amber[100],
                        Colors.amber[900]!),
                    _buildInfoCard(
                        'গ্রেফতার ও নিখোঁজ \n১১,০০০+', Colors.grey[200], black),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 5,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(4),
                    color: white,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: KText(
                      text: 'আন্দোলনে শহীদদের তালিকা',
                      fontSize: 16,
                      color: red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 7,
                        mainAxisExtent: 280,
                        crossAxisSpacing: 7,
                      ),
                      itemCount: Base.homeController.martyrsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = Base.homeController.martyrsList[index];
                        return GestureDetector(
                          onTap: () => Get.to(SohidSinglePage(sohid: item)),
                          child: _buildGridItem(item),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String text, Color? bgColor, Color textColor) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        color: bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: KText(
          textAlign: TextAlign.center,
          text: text,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildGridItem(var item) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 160,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadiusDirectional.only(
                    topEnd: Radius.circular(6),
                    topStart: Radius.circular(6),
                  ),
                  image: DecorationImage(
                    image: AssetImage('${item.imgList}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: -5,
                left: -5,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/red_boold_1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: KText(
                      text: '${item.id}',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          KText(
            text: item.name,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: red,
          ),
          KText(
            text: '${item.type}',
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          KText(
            textAlign: TextAlign.center,
            text: '${item.university}',
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          KText(
            textAlign: TextAlign.center,
            text: 'মৃত্যু তারিখ : ${item.martyrsDate}',
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
