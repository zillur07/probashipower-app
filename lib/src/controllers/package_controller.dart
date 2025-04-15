// // lib/src/controllers/package_controller.dart
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:probashipower_app/src/models/package.dart';
// import 'package:probashipower_app/src/pages/login_page.dart';
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class PackageController extends GetxController {
//   var isLoading = false.obs;
//   var packages = <Package>[].obs;
//   var error = ''.obs;

//   Future<String?> _getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('token');
//   }

//   @override
//   void onInit() {
//     fetchPackages();
//     super.onInit();
//   }

//   Future<void> fetchPackages() async {
//     try {
//       isLoading(true);
//       error('');

//       final token = await _getToken();
//       if (token == null) {
//         error('Please login to view packages');
//         return;
//       }

//       final response = await http.get(
//         Uri.parse('http://probashipower.com/api/package-list'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Accept': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         final List<dynamic> data = jsonDecode(response.body);
//         packages.assignAll(data.map((item) => Package.fromJson(item)).toList());
//       } else if (response.statusCode == 401) {
//         error('Session expired. Please login again');
//         Get.offAll(LoginPage());
//       } else {
//         error('Failed to load packages: ${response.statusCode}');
//       }
//     } catch (e) {
//       error('Error: ${e.toString()}');
//     } finally {
//       isLoading(false);
//     }
//   }

//   Future<void> refreshPackages() async {
//     await fetchPackages();
//   }
// }

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:probashipower_app/src/models/package.dart';
import 'dart:convert';

class PackageController extends GetxController {
  var packages = <Package>[].obs;
  var isLoading = true.obs;
  var error = ''.obs;

  @override
  void onInit() {
    fetchPackages();
    super.onInit();
  }

  Future<void> fetchPackages() async {
    try {
      isLoading(true);
      error('');

      final response = await http.get(
        Uri.parse('https://probashipower.com/api/package-list'),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        packages.value =
            (jsonData as List)
                .map((package) => Package.fromJson(package))
                .toList();
      } else {
        error('Failed to load packages: ${response.statusCode}');
      }
    } catch (e) {
      error('Error: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  Future<void> refreshPackages() async {
    await fetchPackages();
  }
}
