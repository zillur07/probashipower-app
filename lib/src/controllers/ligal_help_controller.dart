import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:probashipower_app/src/models/legal_help.dart';
import 'dart:convert';

class LegalHelpController extends GetxController {
  var legalHelpList = <LegalHelp>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchLegalHelps();
    super.onInit();
  }

  Future<void> fetchLegalHelps() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://probashipower.com/api/legal-help-list'));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        legalHelpList.value =
            jsonResponse.map((help) => LegalHelp.fromJson(help)).toList();
      } else {
        throw Exception('Failed to load legal help data');
      }
    } finally {
      isLoading(false);
    }
  }
}
