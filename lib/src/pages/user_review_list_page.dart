import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/models/user_review.dart';
import 'package:probashipower_app/src/widgets/custom_app_app.dart';
import '../controllers/user_review_controller.dart';

class UserReviewListPage extends StatelessWidget {
  final UserReviewController userReviewController =
      Get.put(UserReviewController());

   UserReviewListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      appBar: CustomAppBar(
        title: 'প্রবাসী পাওয়ার',
        backgroundColor: tabColor, // Replace with your desired color
        textColor: Colors.white,
        onLoginPressed: () {
          // Add your login logic here
          print('Login button pressed');
        },
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
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
                        child: Image.asset(
                            'assets/img/best-customer-experience.png')),
                    const SizedBox(
                      width: 10,
                    ),
                    const KText(
                      text: 'ইউজার রিভিউ',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(() {
              if (userReviewController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: userReviewController.userReviewList.length,
                  itemBuilder: (context, index) {
                    UserReview review =
                        userReviewController.userReviewList[index];
                    return Card(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 7,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(
                                      review.personImg),
                                  radius: 25,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      review.personName,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      review.personMobile,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              review.personReview,
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Date: ${review.date}',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
