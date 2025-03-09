import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:probashipower_app/src/models/user_review.dart';
import 'dart:convert';

class UserReviewController extends GetxController {
  var userReviewList = <UserReview>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchUserReviews();
    super.onInit();
  }

  Future<void> fetchUserReviews() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://probashipower.com/api/user-review-list'));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        userReviewList.value =
            jsonResponse.map((review) => UserReview.fromJson(review)).toList();
      } else {
        throw Exception('Failed to load user reviews');
      }
    } finally {
      isLoading(false);
    }
  }
}
