import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/base/base.dart';
import 'package:probashipower_app/src/pages/sreti_caron_single_page.dart';

class SretiCaronPage extends StatelessWidget {
  const SretiCaronPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'স্মৃতি চারণ ',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          primary: false,
          physics: const BouncingScrollPhysics(),
          itemCount: Base.sretiCaronController.sretiCaronList.length,
          itemBuilder: (context, index) {
            final item = Base.sretiCaronController.sretiCaronList[index];
            return GestureDetector(
              onTap: () => Get.to(SretiCaronSinglePage(sretiCaron: item)),
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10.0),
                      ),
                      child: Image.asset(
                        item.imageUrl,
                        width: double.infinity,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        maxLines: 3,
                        item.details,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
