class Benefit {
  final String id;
  final String title;
  final String details;

  Benefit({
    required this.id,
    required this.title,
    required this.details,
  });

  factory Benefit.fromJson(Map<String, dynamic> json) {
    return Benefit(
      id: json['id'],
      title: json['title'],
      details: json['details'],
    );
  }
}
