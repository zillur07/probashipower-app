class LegalHelp {
  final String id;
  final String helpName;
  final String helpContact;
  final String helpAddress;
  final String helpDetails;

  LegalHelp({
    required this.id,
    required this.helpName,
    required this.helpContact,
    required this.helpAddress,
    required this.helpDetails,
  });

  factory LegalHelp.fromJson(Map<String, dynamic> json) {
    return LegalHelp(
      id: json['id'],
      helpName: json['help_name'],
      helpContact: json['help_contact'],
      helpAddress: json['help_address'],
      helpDetails: json['help_details'],
    );
  }
}
