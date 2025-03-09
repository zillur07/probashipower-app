import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:probashipower_app/src/models/news.dart';

class NewsController extends GetxController {
  var newsList = <News>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<void> fetchNews() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://probashipower.com/api/probash-info-list'));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        newsList.value =
            jsonResponse.map((news) => News.fromJson(news)).toList();
      } else {
        throw Exception('Failed to load news');
      }
    } finally {
      isLoading(false);
    }
  }
}
