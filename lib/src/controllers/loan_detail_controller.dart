// // lib/src/controllers/loan_detail_controller.dart
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:probashipower_app/src/models/loan_detail.dart';
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:probashipower_app/src/pages/packages_page.dart';
// import 'package:probashipower_app/src/pages/login_page.dart';

// class LoanDetailController extends GetxController {
//   var isLoading = false.obs;
//   var loanDetail =
//       LoanDetail(
//         id: 0,
//         loanName: '',
//         loanInterest: '',
//         loanAmount: '',
//         loanDuration: '',
//         loanDetails: '',
//       ).obs;

//   Future<String?> _getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('token');
//   }

//   Future<void> fetchLoanDetail(int loanId) async {
//     try {
//       isLoading(true);

//       final token = await _getToken();
//       if (token == null) {
//         Get.offAll(() => LoginPage());
//         return;
//       }

//       final response = await http.get(
//         Uri.parse('https://probashipower.com/api/loan-detail?id=$loanId'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Accept': 'application/json',
//         },
//       );

//       final data = jsonDecode(response.body);

//       if (response.statusCode == 200 && data['status'] == 'success') {
//         loanDetail.value = LoanDetail.fromJson(data['data']);
//       } else if (response.statusCode == 403) {
//         // No active package - redirect to packages page
//         Get.offAll(() => PackagesPage());
//         return;
//       } else if (response.statusCode == 401) {
//         Get.offAll(() => LoginPage());
//         return;
//       } else {
//         Get.back();
//       }
//     } catch (e) {
//       Get.back();
//     } finally {
//       isLoading(false);
//     }
//   }
// }

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:probashipower_app/src/models/loan_detail.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:probashipower_app/src/pages/packages_page.dart';
import 'package:probashipower_app/src/pages/login_page.dart';

class LoanDetailController extends GetxController {
  var isLoading = false.obs;
  var loanDetail =
      LoanDetail(
        id: 0,
        loanName: '',
        loanInterest: '',
        loanAmount: '',
        loanDuration: '',
        loanDetails: '',
      ).obs;
  var error = ''.obs;
  var showPackagePrompt = false.obs;

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> fetchLoanDetail(int loanId) async {
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
        Uri.parse('https://probashipower.com/api/loan-detail?id=$loanId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['status'] == 'success') {
        loanDetail.value = LoanDetail.fromJson(data['data']);
      } else if (response.statusCode == 403) {
        showPackagePrompt(true);
        error(data['message'] ?? 'No active package found');
      } else if (response.statusCode == 401) {
        Get.offAll(() => LoginPage());
      } else {
        error(data['message'] ?? 'Failed to load loan details');
      }
    } catch (e) {
      error('Error: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }
}
