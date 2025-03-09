import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:probashipower_app/src/models/ticket.dart';

class TicketController extends GetxController {
  var ticketList = <Ticket>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchTickets();
    super.onInit();
  }

  Future<void> fetchTickets() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://probashipower.com/api/ticket-list'));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        ticketList.value =
            jsonResponse.map((ticket) => Ticket.fromJson(ticket)).toList();
      } else {
        throw Exception('Failed to load tickets');
      }
    } finally {
      isLoading(false);
    }
  }
}
