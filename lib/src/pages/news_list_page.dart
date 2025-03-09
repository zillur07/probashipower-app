import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/models/news.dart';
import 'package:probashipower_app/src/widgets/custom_app_app.dart';
import '../controllers/news_controller.dart';

class NewsListPage extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());

  NewsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: Image.asset('assets/img/breaking-news.png'),
                    ),
                    const SizedBox(width: 10),
                    const KText(
                      text: 'প্রবাস খবর',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              if (newsController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: newsController.newsList.length,
                  itemBuilder: (context, index) {
                    News news = newsController.newsList[index];
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (news.newsImg.isNotEmpty)
                              Image.network(
                                news.newsImg,
                                width: double.infinity,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            SizedBox(height: 10),
                            Text(
                              news.newsTitle,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text('Date: ${news.date}'),
                            SizedBox(height: 10),
                            Text(
                              news.newsDetails,
                              maxLines: 2,
                              style: TextStyle(fontSize: 14),
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
