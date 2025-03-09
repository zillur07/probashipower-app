import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:probashipower_app/src/models/vip_job.dart';
import 'dart:convert';

class VipJobController extends GetxController {
  var jobList = <VipJob>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchJobs();
    super.onInit();
  }

  Future<void> fetchJobs() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://probashipower.com/api/vip-job-list'));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse['status'] == 'success') {
          List<dynamic> offers = jsonResponse['offers'];
          jobList.value = offers.map((job) => VipJob.fromJson(job)).toList();
        } else {
          throw Exception('Failed to load jobs');
        }
      } else {
        throw Exception('Failed to load jobs');
      }
    } finally {
      isLoading(false);
    }
  }
}
