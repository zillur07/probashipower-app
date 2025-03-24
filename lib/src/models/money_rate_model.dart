// lib/src/models/money_rate_model.dart
class MoneyRateModel {
  final int id;
  final String title;
  final String rateDetails;
  final String date;

  MoneyRateModel({
    required this.id,
    required this.title,
    required this.rateDetails,
    required this.date,
  });

  factory MoneyRateModel.fromJson(Map<String, dynamic> json) {
    return MoneyRateModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      rateDetails: json['rate_details'] ?? '',
      date: json['date'] ?? '',
    );
  }
}
