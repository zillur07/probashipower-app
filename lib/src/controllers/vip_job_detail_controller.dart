// lib/src/controllers/vip_job_detail_controller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:probashipower_app/src/models/vip_job_detail.dart';

import 'package:probashipower_app/src/pages/login_page.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class VipJobDetailController extends GetxController {
  var isLoading = false.obs;
  var vipJobDetail =
      VipJobDetail(
        id: 0,
        jobTitle: '',
        jobDetails: '',
        jobSalary: '',
        companyName: '',
        companyAddress: '',
        applyDate: '',
        companyImg: '',
        entryDate: '',
      ).obs;
  var error = ''.obs;
  var showPackagePrompt = false.obs;

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> fetchVipJobDetail(int jobId) async {
    try {
      isLoading(true);
      error('');
      showPackagePrompt(false);

      final token = await _getToken();
      if (token == null) {
        Get.offAll(() => LoginPage());
        return;
      }

      final response = await http.get(
        Uri.parse(
          'https://probashipower.com/api/vip-job-detail-view?id=$jobId',
        ),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['status'] == 'success') {
        vipJobDetail.value = VipJobDetail.fromJson(data['data']);
      } else if (response.statusCode == 403) {
        showPackagePrompt(true);
        error(data['message'] ?? 'No active package found');
      } else if (response.statusCode == 401) {
        Get.offAll(() => LoginPage());
      } else {
        error(data['message'] ?? 'Failed to load VIP job details');
      }
    } catch (e) {
      error('Error: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
