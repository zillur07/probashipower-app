import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:probashipower_app/src/models/slider_model.dart';

class SliderController extends GetxController {
  var isLoading = false.obs;
  var sliderImages = <SliderModel>[].obs;
  var currentIndex = 0.obs;

  @override
  void onInit() {
    fetchSliderImages();
    super.onInit();
  }

  Future<void> fetchSliderImages() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://probashipower.com/api/slider-img'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        sliderImages.assignAll(
          data.map((item) => SliderModel.fromJson(item)).toList(),
        );
      } else {
        throw Exception('Failed to load slider images');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch slider images: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  void changePageIndex(int index) {
    currentIndex.value = index;
  }
}
