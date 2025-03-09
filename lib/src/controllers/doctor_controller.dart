import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:probashipower_app/src/models/doctor.dart';
import 'dart:convert';

class DoctorController extends GetxController {
  var doctorList = <Doctor>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchDoctors();
    super.onInit();
  }

  Future<void> fetchDoctors() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://probashipower.com/api/doctor-list'));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        doctorList.value =
            jsonResponse.map((doctor) => Doctor.fromJson(doctor)).toList();
      } else {
        throw Exception('Failed to load doctors');
      }
    } finally {
      isLoading(false);
    }
  }
}
