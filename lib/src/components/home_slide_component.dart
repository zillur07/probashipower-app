import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:probashipower_app/src/controllers/slider_controller.dart';
import 'package:probashipower_app/src/models/slider_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSliderComponent extends StatelessWidget {
  final SliderController _controller = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      return Column(
        children: [
          SizedBox(
            height: 178,
            child: Swiper(
              itemBuilder: (context, index) {
                return _buildSlideItem(_controller.sliderImages[index]);
              },
              itemCount: _controller.sliderImages.length,
              autoplay: true,
              duration: 1000,
              onIndexChanged: _controller.changePageIndex,
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  color: Colors.grey[300],
                  activeColor: Colors.blue,
                ),
              ),
            ),
          ),
          // SizedBox(height: 10),
          // _buildIndicator(),
        ],
      );
    });
  }

  Widget _buildSlideItem(SliderModel slider) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: slider.sliderImg,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(color: Colors.grey[200]),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    return Obx(
      () => AnimatedSmoothIndicator(
        activeIndex: _controller.currentIndex.value,
        count: _controller.sliderImages.length,
        effect: WormEffect(
          dotHeight: 8,
          dotWidth: 8,
          activeDotColor: Colors.blue,
        ),
      ),
    );
  }
}
