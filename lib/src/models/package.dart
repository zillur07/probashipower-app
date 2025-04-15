// lib/src/models/package_model.dart
class Package {
  final String id;
  final String name;
  final String rate;
  final String duration;
  final String features;

  Package({
    required this.id,
    required this.name,
    required this.rate,
    required this.duration,
    required this.features,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      id: json['pl_id']?.toString() ?? '',
      name: json['package_name'] ?? '',
      rate: json['package_rate'] ?? '',
      duration: json['package_duration'] ?? '',
      features: json['package_feature'] ?? '',
    );
  }
}
