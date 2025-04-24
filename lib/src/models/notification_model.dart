class NotificationModel {
  int? id;
  String? date;
  String? message;
  String? status;

  NotificationModel({this.id, this.date, this.message, this.status});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
