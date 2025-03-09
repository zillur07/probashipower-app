class MartyrsList {
  int id;
  String? imgList;
  String? imgDetails;
  String name;
  String? age;
  String? type;
  String? university;
  String? address;
  String? martyrsDate;
  String? shortBiography;
  String? howMartyrs;
  String? history;

  MartyrsList({
    required this.id,
    required this.name,
    this.type,
    this.imgList,
    this.imgDetails,
    this.age,
    this.university,
    this.address,
    this.martyrsDate,
    this.shortBiography,
    this.howMartyrs,
    this.history,
  });
}
