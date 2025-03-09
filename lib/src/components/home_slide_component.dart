import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // ✅ Import this

class HomeSliderComponent extends StatefulWidget {
  const HomeSliderComponent({super.key});

  @override
  State<HomeSliderComponent> createState() => _HomeSliderComponentState();
}

class _HomeSliderComponentState extends State<HomeSliderComponent> {
  int _currentIndex = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<String> addddd = [
    'assets/img/s1.jpeg',
    'assets/img/s2.jpeg',
    'assets/img/s3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 30.0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            CarouselSlider(
              carouselController: _controller,
              items: addddd
                  .map(
                    (item) => Container(
                      color: const Color.fromARGB(31, 144, 122, 122),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(2.0)),
                              child: Center(
                                child: Image.asset(
                                  item,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                aspectRatio: 16 / 8,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                viewportFraction: 1.0,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Positioned(
              bottom: 30,
              left: (screenWidth - (2 * (addddd.length) - 1) * 8.0) / 2.0,
              child: AnimatedSmoothIndicator(
                activeIndex: _currentIndex,
                count: addddd.length,
                duration: const Duration(milliseconds: 500),
                effect: const SlideEffect(
                  dotWidth: 10.0, // ✅ Small dots
                  dotHeight: 10.0, // ✅ Small dots
                  spacing: 10.0,
                  dotColor: Colors.white,
                  activeDotColor: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
