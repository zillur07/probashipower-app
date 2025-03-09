import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/models/video.dart';
import 'package:probashipower_app/src/widgets/custom_app_app.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../controllers/video_controller.dart';

class VideoListPage extends StatelessWidget {
  final VideoController videoController = Get.put(VideoController());

  VideoListPage({super.key});

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
                      text: 'ভিডিও প্রতিবেদন',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              if (videoController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: videoController.videoList.length,
                  itemBuilder: (context, index) {
                    Video video = videoController.videoList[index];
                    String? videoId = YoutubePlayer.convertUrlToId(
                      video.videoLink,
                    );

                    return Card(
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              video.videoTitle,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            if (videoId != null)
                              YoutubePlayer(
                                controller: YoutubePlayerController(
                                  initialVideoId: videoId,
                                  flags: YoutubePlayerFlags(
                                    autoPlay: false,
                                    mute: false,
                                  ),
                                ),
                                showVideoProgressIndicator: true,
                                progressIndicatorColor: Colors.blueAccent,
                              ),
                            SizedBox(height: 10),
                            Text(
                              'Date: ${video.date}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
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
