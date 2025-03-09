import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:probashipower_app/src/models/video.dart';
import 'dart:convert';

class VideoController extends GetxController {
  var videoList = <Video>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchVideos();
    super.onInit();
  }

  Future<void> fetchVideos() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://probashipower.com/api/short-videos'));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        videoList.value =
            jsonResponse.map((video) => Video.fromJson(video)).toList();
      } else {
        throw Exception('Failed to load videos');
      }
    } finally {
      isLoading(false);
    }
  }
}
