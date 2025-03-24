import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:probashipower_app/src/controllers/money_rate_controller.dart';
import 'package:probashipower_app/src/controllers/notification_controller.dart';
import 'package:probashipower_app/src/controllers/profile_controller.dart';
import 'package:probashipower_app/src/pages/home_view_page.dart';
import 'package:probashipower_app/src/pages/login_main_page.dart';
import 'package:probashipower_app/src/pages/login_page.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  // Login part .........................
  var isLoading = false.obs;

  // Future<void> login(String mobile, String password) async {
  //   try {
  //     isLoading(true);
  //     final response = await http.post(
  //       Uri.parse('https://probashipower.com/api/user-login'),
  //       body: {'mobile': mobile, 'password': password},
  //     );

  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);
  //       if (data['status'] == 'success') {
  //         // Save user data to SharedPreferences
  //         SharedPreferences prefs = await SharedPreferences.getInstance();
  //         prefs.setString('userid', data['data']['userid'].toString());
  //         prefs.setString('name', data['data']['name']);
  //         prefs.setString('mobile', data['data']['mobile']);
  //         prefs.setString('role', data['data']['role']);
  //         prefs.setString('token', data['data']['token']);

  //         Get.snackbar('Success', data['message']);
  //         Get.offAll(LoginMainPage()); // Navigate to home screen after login
  //       } else {
  //         Get.snackbar('Error', data['message']);
  //       }
  //     } else {
  //       Get.snackbar('Error', 'Failed to login');
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  Future<void> login(String mobile, String password) async {
    try {
      isLoading(true);

      // First clear any existing data before new login
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      final response = await http.post(
        Uri.parse('https://probashipower.com/api/user-login'),
        body: {'mobile': mobile, 'password': password},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          // Save new user data
          await prefs.setString('userid', data['data']['userid'].toString());
          await prefs.setString('name', data['data']['name']);
          await prefs.setString('mobile', data['data']['mobile']);
          await prefs.setString('role', data['data']['role']);
          await prefs.setString('token', data['data']['token']);

          // Clear and recreate controllers to ensure fresh state
          Get.delete<ProfileController>(force: true);
          Get.put(ProfileController());

          Get.delete<MoneyRateController>(force: true);
          Get.put(MoneyRateController());

          Get.snackbar('Success', data['message']);
          Get.offAll(() => LoginMainPage());
        } else {
          Get.snackbar('Error', data['message']);
        }
      } else {
        Get.snackbar('Error', 'Failed to login');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  // End login part ...............

  //   var isLoading = false.obs;

  // // Login Method (already implemented)
  // Future<void> login(String mobile, String password) async {
  //   // Your existing login code
  // }

  // Registration Method
  Future<void> register(
    String username,
    String mobile,
    String password, {
    String? refcode,
  }) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse('http://probashipower.com/api/user-register'),
        body: {
          'username': username,
          'mobile': mobile,
          'password': password,
          if (refcode != null) 'refcode': refcode,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          // Save user data to SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('userid', data['data']['userid'].toString());
          prefs.setString('name', data['data']['username']);
          prefs.setString('mobile', data['data']['mobile']);
          prefs.setString('token', data['data']['token']);

          Get.snackbar('Success', data['message']);
          // Navigate to home screen after registration
          Get.offAll(LoginMainPage());
        } else {
          Get.snackbar('Error', data['message']);
        }
      } else {
        Get.snackbar('Error', 'Failed to register');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  // Add this to your AuthController...............
  Future<void> logout() async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Clear all user-related data from SharedPreferences
      await prefs.remove('token');
      await prefs.remove('userid');
      await prefs.remove('name');
      await prefs.remove('mobile');
      await prefs.remove('role');
      await prefs.remove('ref_id');
      await prefs.remove('wa_number');
      await prefs.remove('user_img');

      // Clear all GetX controllers that might contain user data
      Get.delete<ProfileController>(force: true);
      Get.delete<MoneyRateController>(force: true);
      Get.delete<NotificationController>(force: true);
      // Add other controllers as needed

      // Navigate to login page and remove all previous routes
      Get.offAll(() => LoginPage());
    } catch (e) {
      Get.snackbar('Error', 'Logout failed: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
