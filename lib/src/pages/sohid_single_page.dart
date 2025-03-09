import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/models/martyrs_list.dart';

import '../helpers/k_text.dart';

class SohidSinglePage extends StatelessWidget {
  final MartyrsList? sohid;

  const SohidSinglePage({
    super.key,
    required this.sohid,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          sohid!.name,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: Stack(
        children: [
          // Container(
          //   width: Get.width,
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/img/bg_blood.webp'),
          //       fit: BoxFit.cover,
          //       //opacity: 0.7,
          //     ),
          //   ),
          // ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: 230,
                  width: Get.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('${sohid!.imgDetails}'),
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
                    //border: Border.all(color: green, width: 2),
                  ),
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
                              text: sohid!.name,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: red,
                            ),
                            KText(
                              text: '${sohid!.type}',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                            KText(
                              textAlign: TextAlign.center,
                              text: '${sohid!.university}',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                            KText(
                              textAlign: TextAlign.center,
                              text: 'মৃত্যু তারিখ : ${sohid!.martyrsDate}',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                            KText(
                              textAlign: TextAlign.center,
                              text: 'বয়স : ${sohid!.age}',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                            KText(
                              textAlign: TextAlign.center,
                              text: 'জন্মস্থান : ${sohid!.address}',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
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
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.black26, // Shadow color
                    //     offset: Offset(
                    //       -2,
                    //       4,
                    //     ), // Shadow position
                    //     blurRadius: 5,
                    //     // Shadow blur radius
                    //   ),
                    // ],
                    borderRadius: BorderRadius.circular(4),
                    color: white,
                    //border: Border.all(color: green, width: 2),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: KText(
                            text: 'যেভাবে শহীদ হয়েছেন :',
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
                          text: '${sohid!.howMartyrs}',
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
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.black26, // Shadow color
                    //     offset: Offset(
                    //       -2,
                    //       4,
                    //     ), // Shadow position
                    //     blurRadius: 5,
                    //     // Shadow blur radius
                    //   ),
                    // ],
                    borderRadius: BorderRadius.circular(4),
                    color: white,
                    //border: Border.all(color: green, width: 2),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: KText(
                            text: 'ব্যক্তিগত জীবন :',
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
                          text: '${sohid!.shortBiography}',
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
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.black26, // Shadow color
                    //     offset: Offset(
                    //       -2,
                    //       4,
                    //     ), // Shadow position
                    //     blurRadius: 5,
                    //     // Shadow blur radius
                    //   ),
                    // ],
                    borderRadius: BorderRadius.circular(4),
                    color: white,
                    //border: Border.all(color: green, width: 2),
                  ),
                  child: Column(
                    children: [
                      sohid!.history == ''
                          ? const SizedBox()
                          : const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
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
                      sohid!.history != ''
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              child: KText(
                                textAlign: TextAlign.justify,
                                text: '${sohid!.history}',
                                fontSize: 14,
                                color: black,
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
