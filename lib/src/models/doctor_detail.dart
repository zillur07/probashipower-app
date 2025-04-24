// lib/src/models/doctor_detail_model.dart
class DoctorDetail {
  final int id;
  final String doctorName;
  final String doctorSpecialty;
  final String doctorContact;
  final String chamberAddress;
  final String workingPlace;
  final String doctorDegree;
  final String visitFees;
  final String visitTime;

  DoctorDetail({
    required this.id,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.doctorContact,
    required this.chamberAddress,
    required this.workingPlace,
    required this.doctorDegree,
    required this.visitFees,
    required this.visitTime,
  });

  factory DoctorDetail.fromJson(Map<String, dynamic> json) {
    return DoctorDetail(
      id: json['id'] ?? 0,
      doctorName: json['doctor_name'] ?? '',
      doctorSpecialty: json['doctor_specialty'] ?? '',
      doctorContact: json['doctor_contact'] ?? '',
      chamberAddress: json['chamber_address'] ?? '',
      workingPlace: json['working_place'] ?? '',
      doctorDegree: json['doctor_degree'] ?? '',
      visitFees: json['visit_fees'] ?? '',
      visitTime: json['visit_time'] ?? '',
    );
  }
}
