// lib/src/models/legal_help_detail_model.dart
class LegalHelpDetail {
  final int id;
  final String helpName;
  final String helpContact;
  final String helpAddress;
  final String helpDetails;

  LegalHelpDetail({
    required this.id,
    required this.helpName,
    required this.helpContact,
    required this.helpAddress,
    required this.helpDetails,
  });

  factory LegalHelpDetail.fromJson(Map<String, dynamic> json) {
    return LegalHelpDetail(
      id: json['id'] ?? 0,
      helpName: json['help_name'] ?? '',
      helpContact: json['help_contact'] ?? '',
      helpAddress: json['help_address'] ?? '',
      helpDetails: json['help_details'] ?? '',
    );
  }
}
