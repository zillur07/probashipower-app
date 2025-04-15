// lib/src/models/loan_detail_model.dart
class LoanDetail {
  final int id;
  final String loanName;
  final String loanInterest;
  final String loanAmount;
  final String loanDuration;
  final String loanDetails;

  LoanDetail({
    required this.id,
    required this.loanName,
    required this.loanInterest,
    required this.loanAmount,
    required this.loanDuration,
    required this.loanDetails,
  });

  factory LoanDetail.fromJson(Map<String, dynamic> json) {
    return LoanDetail(
      id: json['id'] ?? 0,
      loanName: json['loan_name'] ?? '',
      loanInterest: json['loan_interest'] ?? '',
      loanAmount: json['loan_amount'] ?? '',
      loanDuration: json['loan_duration'] ?? '',
      loanDetails: json['loan_details'] ?? '',
    );
  }
}
