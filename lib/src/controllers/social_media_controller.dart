// lib/src/controllers/social_media_controller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:probashipower_app/src/models/social_media_model.dart';

class SocialMediaController extends GetxController {
  var isLoading = false.obs;
  var socialMedia =
      SocialMediaModel(
        id: '',
        facebook: '',
        insta: '',
        youtube: '',
        whatsapp: '',
        gmail: '',
      ).obs;

  @override
  void onInit() {
    fetchSocialMedia();
    super.onInit();
  }

  Future<void> fetchSocialMedia() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://probashipower.com/api/social-media'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        if (data.isNotEmpty) {
          socialMedia.value = SocialMediaModel.fromJson(data.first);
        }
      } else {
        throw Exception('Failed to load social media links');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch social media: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
