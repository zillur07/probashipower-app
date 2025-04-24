// lib/src/controllers/legal_help_detail_controller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:probashipower_app/src/models/legal_help_detail.dart';
import 'package:probashipower_app/src/pages/login_page.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LegalHelpDetailController extends GetxController {
  var isLoading = false.obs;
  var legalHelpDetail =
      LegalHelpDetail(
        id: 0,
        helpName: '',
        helpContact: '',
        helpAddress: '',
        helpDetails: '',
      ).obs;
  var error = ''.obs;
  var showPackagePrompt = false.obs;

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> fetchLegalHelpDetail(int helpId) async {
    try {
      isLoading(true);
      error('');
      showPackagePrompt(false);

      final token = await _getToken();
      if (token == null) {
        error('Unauthenticated');
        Get.offAll(() => LoginPage());
        return;
      }

      final response = await http.get(
        Uri.parse('https://probashipower.com/api/legal-help-detail?id=$helpId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['status'] == 'success') {
        legalHelpDetail.value = LegalHelpDetail.fromJson(data['data']);
      } else if (response.statusCode == 403) {
        showPackagePrompt(true);
        error(data['message'] ?? 'No active package found');
      } else if (response.statusCode == 401) {
        error('Unauthenticated');
        Get.offAll(() => LoginPage());
      } else {
        error(data['message'] ?? 'Failed to load legal help details');
      }
    } catch (e) {
      error('Error: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
