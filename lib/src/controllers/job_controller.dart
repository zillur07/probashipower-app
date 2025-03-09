// Controller to handle API calls
import 'dart:convert';

import 'package:get/get.dart';
import 'package:probashipower_app/src/models/job.dart';
import 'package:http/http.dart' as http;

class JobController extends GetxController {
  var jobs = <Job>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchJobs();
    super.onInit();
  }

  void fetchJobs() async {
    try {
      isLoading(true);
      final response =
          await http.get(Uri.parse('https://probashipower.com/api/job-list'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        jobs.value = (jsonData['offers'] as List)
            .map((job) => Job.fromJson(job))
            .toList();
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load jobs');
    } finally {
      isLoading(false);
    }
  }
}
