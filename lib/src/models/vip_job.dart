class VipJob {
  final String id;
  final String jobTitle;
  final String jobDetails;
  final String jobSalary;
  final String companyName;
  final String companyAddress;
  final String applyDate;
  final String companyImg;
  final String entryDate;

  VipJob({
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

  factory VipJob.fromJson(Map<String, dynamic> json) {
    return VipJob(
      id: json['id'],
      jobTitle: json['job_title'],
      jobDetails: json['job_details'],
      jobSalary: json['job_salary'],
      companyName: json['company_name'],
      companyAddress: json['company_address'],
      applyDate: json['apply_date'],
      companyImg: json['company_img'],
      entryDate: json['entry_date'],
    );
  }
}
