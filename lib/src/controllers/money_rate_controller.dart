// lib/src/controllers/money_rate_controller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:probashipower_app/src/models/money_rate_model.dart';

class MoneyRateController extends GetxController {
  var isLoading = false.obs;
  var moneyRates = <MoneyRateModel>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchMoneyRates();
    super.onInit();
  }

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> fetchMoneyRates() async {
    try {
      isLoading(true);
      errorMessage('');

      final String? token = await _getToken();

      if (token == null || token.isEmpty) {
        errorMessage('Please login to view money rates');
        isLoading(false);
        return;
      }

      // final token = await _getToken();
      //   if (token == null) {
      //     Get.offAll(() => LoginPage());
      //     return;
      //   }

      final response = await http.get(
        Uri.parse('https://probashipower.com/api/money-rate'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          moneyRates.assignAll(
            (data['data'] as List)
                .map((item) => MoneyRateModel.fromJson(item))
                .toList(),
          );
        } else {
          errorMessage(data['message'] ?? 'Failed to load money rates');
        }
      } else if (response.statusCode == 401) {
        errorMessage('Session expired. Please login again');
        Get.offAllNamed('/login');
      } else {
        errorMessage('Failed to load money rates: ${response.statusCode}');
      }
    } catch (e) {
      errorMessage('Error: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  Future<void> refreshData() async {
    await fetchMoneyRates();
  }
}
