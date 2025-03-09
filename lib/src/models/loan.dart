class Loan {
  final String id;
  final String loanName;
  final String loanInterest;
  final String loanAmount;
  final String loanDuration;
  final String loanDetails;

  Loan({
    required this.id,
    required this.loanName,
    required this.loanInterest,
    required this.loanAmount,
    required this.loanDuration,
    required this.loanDetails,
  });

  factory Loan.fromJson(Map<String, dynamic> json) {
    return Loan(
      id: json['id'],
      loanName: json['loan_name'],
      loanInterest: json['loan_interest'],
      loanAmount: json['loan_amount'],
      loanDuration: json['loan_duration'],
      loanDetails: json['loan_details'],
    );
  }
}
