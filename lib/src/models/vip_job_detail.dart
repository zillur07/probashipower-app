// lib/src/models/vip_job_detail_model.dart
class VipJobDetail {
  final int id;
  final String jobTitle;
  final String jobDetails;
  final String jobSalary;
  final String companyName;
  final String companyAddress;
  final String applyDate;
  final String companyImg;
  final String entryDate;

  VipJobDetail({
    required this.id,
    required this.jobTitle,
    required this.jobDetails,
    required this.jobSalary,
    required this.companyName,
    required this.companyAddress,
    required this.applyDate,
    required this.companyImg,
    required this.entryDate,
  });

  factory VipJobDetail.fromJson(Map<String, dynamic> json) {
    return VipJobDetail(
      id: json['id'] ?? 0,
      jobTitle: json['job_title'] ?? '',
      jobDetails: json['job_details'] ?? '',
      jobSalary: json['job_salary'] ?? '',
      companyName: json['company_name'] ?? '',
      companyAddress: json['company_address'] ?? '',
      applyDate: json['apply_date'] ?? '',
      companyImg: json['company_img'] ?? '',
      entryDate: json['entry_date'] ?? '',
    );
  }
}
