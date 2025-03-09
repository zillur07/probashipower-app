import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/models/sreti_caron_list.dart';
import '../helpers/k_text.dart';
import '../config/colors.dart';

class SretiCaronSinglePage extends StatelessWidget {
  final SretiCaron? sretiCaron;

  const SretiCaronSinglePage({
    super.key,
    required this.sretiCaron,
  });
  // final UrlController _urlController = Get.put(UrlController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          sretiCaron!.title,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: 230,
                  width: Get.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('${sretiCaron!.imageDitels}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color:
                            Color.fromARGB(66, 121, 114, 114), // Shadow color
                        offset: Offset(0, 2), // Shadow position
                        blurRadius: 5, // Shadow blur radius
                      ),
                    ],
                    borderRadius: BorderRadius.circular(0),
                    color: white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: Get.width,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              KText(
                                text: sretiCaron!.title,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: red,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: white,
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: KText(
                            text: 'স্মৃতি চারণ :',
                            fontSize: 15,
                            color: red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: KText(
                          textAlign: TextAlign.justify,
                          text: sretiCaron!.details,
                          fontSize: 14,
                          color: black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
