// lib/src/models/notification_model.dart
class NotificationModel {
  final int id;
  final String date;
  final String message;

  NotificationModel({
    required this.id,
    required this.date,
    required this.message,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? 0,
      date: json['date'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
