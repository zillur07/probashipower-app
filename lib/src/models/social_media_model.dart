// lib/src/models/social_media_model.dart
class SocialMediaModel {
  final String id;
  final String facebook;
  final String insta;
  final String youtube;
  final String whatsapp;
  final String gmail;

  SocialMediaModel({
    required this.id,
    required this.facebook,
    required this.insta,
    required this.youtube,
    required this.whatsapp,
    required this.gmail,
  });

  factory SocialMediaModel.fromJson(Map<String, dynamic> json) {
    return SocialMediaModel(
      id: json['id']?.toString() ?? '',
      facebook: json['facebook'] ?? '',
      insta: json['insta'] ?? '',
      youtube: json['youtube'] ?? '',
      whatsapp: json['whatsapp'] ?? '',
      gmail: json['gmail'] ?? '',
    );
  }
}
