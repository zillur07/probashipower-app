// // // lib/src/controllers/job_detail_controller.dart
// // import 'package:get/get.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:probashipower_app/src/models/job_detail.dart';
// // import 'package:probashipower_app/src/pages/job_list_page.dart';
// // import 'package:probashipower_app/src/pages/login_page.dart';
// // import 'dart:convert';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class JobDetailController extends GetxController {
// //   var isLoading = false.obs;
// //   var jobDetail =
// //       JobDetail(
// //         id: 0,
// //         jobTitle: '',
// //         jobDetails: '',
// //         jobSalary: '',
// //         companyName: '',
// //         companyAddress: '',
// //         applyDate: '',
// //         companyImg: '',
// //         entryDate: '',
// //       ).obs;
// //   var error = ''.obs;

// //   Future<String?> _getToken() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     return prefs.getString('token');
// //   }

// //   Future<void> fetchJobDetail(int jobId) async {
// //     try {
// //       isLoading(true);
// //       error('');

// //       final token = await _getToken();
// //       if (token == null) {
// //         //error('Please login to view job details');
// //         Get.offAll(LoginPage());
// //         return;
// //       }

// //       final response = await http.get(
// //         Uri.parse('https://probashipower.com/api/job-detail-view?id=$jobId'),
// //         headers: {
// //           'Authorization': 'Bearer $token',
// //           'Accept': 'application/json',
// //         },
// //       );

// //       if (response.statusCode == 200) {
// //         final data = jsonDecode(response.body);
// //         if (data['status'] == 'success') {
// //           jobDetail.value = JobDetail.fromJson(data['data']);
// //         } else {
// //           error(data['message'] ?? 'Failed to load job details');
// //         }
// //       } else if (response.statusCode == 403) {
// //         // error('Session expired. Please login again');
// //         Get.to((JobListPage()));
// //       } else if (response.statusCode == 401) {
// //         error('Session expired. Please login again');
// //         Get.offAll(LoginPage());
// //       } else {
// //         error('Failed to load job details (${response.statusCode})');
// //       }
// //     } catch (e) {
// //       error('Error: ${e.toString()}');
// //     } finally {
// //       isLoading(false);
// //     }
// //   }
// // }

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:probashipower_app/src/models/job_detail.dart';
// import 'package:probashipower_app/src/pages/login_page.dart';
// import 'package:probashipower_app/src/pages/packages_page.dart';
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class JobDetailController extends GetxController {
//   var isLoading = false.obs;
//   var jobDetail =
//       JobDetail(
//         id: 0,
//         jobTitle: '',
//         jobDetails: '',
//         jobSalary: '',
//         companyName: '',
//         companyAddress: '',
//         applyDate: '',
//         companyImg: '',
//         entryDate: '',
//       ).obs;

//   Future<String?> _getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('token');
//   }

//   Future<void> fetchJobDetail(int jobId) async {
//     try {
//       isLoading(true);

//       final token = await _getToken();
//       if (token == null) {
//         Get.offAll(LoginPage());
//         return;
//       }

//       final response = await http.get(
//         Uri.parse('https://probashipower.com/api/job-detail-view?id=$jobId'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Accept': 'application/json',
//         },
//       );

//       final data = jsonDecode(response.body);

//       if (response.statusCode == 200 && data['status'] == 'success') {
//         jobDetail.value = JobDetail.fromJson(data['data']);
//       } else if (response.statusCode == 403) {
//         // Use offAll with a new route instead of pushing
//         await Future.delayed(Duration.zero); // Ensure build completes
//         Get.offAll(
//           () => PackagesPage(),
//           transition: Transition.rightToLeft,
//           duration: Duration(milliseconds: 300),
//         );
//         return;
//       } else if (response.statusCode == 401) {
//         Get.offAll(LoginPage());
//         return;
//       } else {
//         Get.back();
//       }
//     } catch (e) {
//       //Get.back();
//     } finally {
//       isLoading(false);
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:probashipower_app/src/models/job_detail.dart';
import 'package:probashipower_app/src/pages/job_list_page.dart';
import 'package:probashipower_app/src/pages/login_page.dart';
import 'package:probashipower_app/src/pages/packages_page.dart'; // Add your packages page
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class JobDetailController extends GetxController {
  var isLoading = false.obs;
  var jobDetail =
      JobDetail(
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

  Future<void> fetchJobDetail(int jobId) async {
    try {
      isLoading(true);
      error('');
      showPackagePrompt(false);

      final token = await _getToken();
      if (token == null) {
        Get.offAll(LoginPage());
        return;
      }

      final response = await http.get(
        Uri.parse('https://probashipower.com/api/job-detail-view?id=$jobId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['status'] == 'success') {
        jobDetail.value = JobDetail.fromJson(data['data']);
      } else if (response.statusCode == 403) {
        showPackagePrompt(true);
        error(data['message'] ?? 'No active package found');
      } else if (response.statusCode == 401) {
        Get.offAll(LoginPage());
      } else {
        error(data['message'] ?? 'Failed to load job details');
      }
    } catch (e) {
      error('Error: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
