class UserReview {
  final String id;
  final String userId;
  final String personName;
  final String personMobile;
  final String country;
  final String personImg;
  final String personReview;
  final String date;

  UserReview({
    required this.id,
    required this.userId,
    required this.personName,
    required this.personMobile,
    required this.country,
    required this.personImg,
    required this.personReview,
    required this.date,
  });

  factory UserReview.fromJson(Map<String, dynamic> json) {
    return UserReview(
      id: json['id'],
      userId: json['userid'],
      personName: json['person_name'],
      personMobile: json['person_mobile'],
      country: json['country'],
      personImg: json['person_img'],
      personReview: json['person_review'],
      date: json['date'],
    );
  }
}
