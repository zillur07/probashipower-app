// lib/src/controllers/notification_controller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:probashipower_app/src/models/notification_model.dart';

class NotificationController extends GetxController {
  var isLoading = false.obs;
  var notifications = <NotificationModel>[].obs;
  var error = ''.obs;

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> fetchNotifications() async {
    try {
      isLoading(true);
      error('');

      final token = await _getToken();
      if (token == null) {
        error('Please login to view notifications');
        return;
      }

      final response = await http.get(
        Uri.parse('http://probashipower.com/api/notification'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        notifications.assignAll(
          data.map((item) => NotificationModel.fromJson(item)).toList(),
        );
      } else if (response.statusCode == 401) {
        error('Session expired. Please login again');
        Get.offAllNamed('/login');
      } else {
        error('Failed to load notifications (${response.statusCode})');
      }
    } catch (e) {
      error('Error: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  Future<void> refresh() async => await fetchNotifications();
}
