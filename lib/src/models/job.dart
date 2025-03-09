class Job {
  final String id,
      jobTitle,
      jobDetails,
      jobSalary,
      companyName,
      companyAddress,
      companyImg,
      applyDate,
      entryDate;

  Job({
    required this.id,
    required this.jobTitle,
    required this.jobDetails,
    required this.jobSalary,
    required this.companyName,
    required this.companyAddress,
    required this.companyImg,
    required this.applyDate,
    required this.entryDate,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      jobTitle: json['job_title'],
      jobDetails: json['job_details'],
      jobSalary: json['job_salary'],
      companyName: json['company_name'],
      companyAddress: json['company_address'],
      companyImg: json['company_img'],
      applyDate: json['apply_date'],
      entryDate: json['entry_date'],
    );
  }
}
