import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:probashipower_app/src/models/loan.dart';
import 'dart:convert';

class LoanController extends GetxController {
  var loans = <Loan>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchLoans();
    super.onInit();
  }

  Future<void> fetchLoans() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://probashipower.com/api/loan-scheme-list'));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        loans.value = jsonResponse.map((loan) => Loan.fromJson(loan)).toList();
      } else {
        throw Exception('Failed to load loans');
      }
    } finally {
      isLoading(false);
    }
  }
}
