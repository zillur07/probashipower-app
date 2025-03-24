class SliderModel {
  final String id;
  final String sliderImg;

  SliderModel({required this.id, required this.sliderImg});

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['id']?.toString() ?? '',
      sliderImg: json['slider_img']?.toString() ?? '',
    );
  }
}
