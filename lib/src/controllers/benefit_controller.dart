import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:probashipower_app/src/models/benefit.dart';
import 'dart:convert';

class BenefitController extends GetxController {
  var benefitList = <Benefit>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchBenefits();
    super.onInit();
  }

  Future<void> fetchBenefits() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://probashipower.com/api/member-benefit-list'));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        benefitList.value =
            jsonResponse.map((benefit) => Benefit.fromJson(benefit)).toList();
      } else {
        throw Exception('Failed to load benefits');
      }
    } finally {
      isLoading(false);
    }
  }
}
