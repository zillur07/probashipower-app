import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:probashipower_app/src/controllers/auth_controller.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:probashipower_app/src/models/profile_model.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var profile =
      ProfileModel(
        userid: 0,
        name: '',
        mobile: '',
        refId: '',
        waNumber: '',
        userImg: '',
      ).obs;

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> fetchProfile() async {
    try {
      isLoading(true);
      final String? token = await _getToken();

      if (token == null || token.isEmpty) {
        Get.snackbar('Error', 'No authentication token found');
        isLoading(false);
        return;
      }

      final response = await http.get(
        Uri.parse('http://probashipower.com/api/profile'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          profile.value = ProfileModel.fromJson(data['data']);
          // Update local profile data if needed
          await _updateLocalProfile(data['data']);
        } else {
          Get.snackbar('Error', data['message'] ?? 'Failed to load profile');
        }
      } else if (response.statusCode == 401) {
        // Token expired or invalid
        Get.snackbar('Error', 'Session expired. Please login again');
        Get.offAllNamed('/login');
      } else {
        Get.snackbar('Error', 'Failed to load profile: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Exception: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  Future<void> _updateLocalProfile(Map<String, dynamic> profileData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', profileData['name'] ?? '');
    await prefs.setString('mobile', profileData['mobile'] ?? '');
    await prefs.setString('ref_id', profileData['ref_id'] ?? '');
    await prefs.setString('user_img', profileData['user_img'] ?? '');
  }

  // Update your ProfilePage's logout method
  Future<void> _logout() async {
    final AuthController authController = Get.find<AuthController>();
    await authController.logout();
  }
}
