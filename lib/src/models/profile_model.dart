// lib/src/models/profile_model.dart
class ProfileModel {
  final int userid;
  final String name;
  final String mobile;
  final String refId;
  final String waNumber;
  final String userImg;

  ProfileModel({
    required this.userid,
    required this.name,
    required this.mobile,
    required this.refId,
    required this.waNumber,
    required this.userImg,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      userid: json['userid'] ?? 0,
      name: json['name'] ?? '',
      mobile: json['mobile'] ?? '',
      refId: json['ref_id'] ?? '',
      waNumber: json['wa_number'] ?? '',
      userImg: json['user_img'] ?? '',
    );
  }
}
