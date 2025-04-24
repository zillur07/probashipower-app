import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/controllers/ligal_help_controller.dart';

// class LegalHelpView extends StatelessWidget {
//   final LegalHelpController legalHelpController = Get.put(LegalHelpController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Legal Help List'),
//       ),
//       body: Obx(() {
//         if (legalHelpController.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         } else {
//           return ListView.builder(
//             itemCount: legalHelpController.legalHelpList.length,
//             itemBuilder: (context, index) {
//               LegalHelp legalHelp = legalHelpController.legalHelpList[index];
//               return Card(
//                 margin: EdgeInsets.all(10),
//                 child: Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         legalHelp.helpName,
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 5),
//                       Text('Contact: ${legalHelp.helpContact}'),
//                       Text('Address: ${legalHelp.helpAddress}'),
//                       SizedBox(height: 10),
//                       Text(
//                         legalHelp.helpDetails,
//                         style: TextStyle(fontSize: 14),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }

import 'package:probashipower_app/src/config/colors.dart';

import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/pages/legal_help_detail_page.dart';
import 'package:probashipower_app/src/widgets/custom_app_app.dart';

class LigalHelpListPage extends StatelessWidget {
  LigalHelpListPage({super.key});
  final TextEditingController controller = TextEditingController();
  final LegalHelpController legalHelpController = Get.put(
    LegalHelpController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.9),
      appBar: CustomAppBar(
        title: 'প্রবাসী পাওয়ার',
        backgroundColor: tabColor, // Replace with your desired color
        textColor: Colors.white,
        onLoginPressed: () {
          // Add your login logic here
          print('Login button pressed');
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.teal.withOpacity(0.3)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset('assets/img/legal-advice.png'),
                    ),
                    const SizedBox(width: 10),
                    const KText(
                      text: 'আইনি সহায়তা',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "খুজুন...",
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffix: const Icon(
                    Icons.search_sharp,
                    color: Colors.teal,
                  ), // Search icon
                  suffixIcon:
                      controller.text.isNotEmpty
                          ? IconButton(
                            icon: const Icon(Icons.clear, color: Colors.red),
                            onPressed: () => controller.clear(),
                          )
                          : null,
                  filled: true,
                  fillColor: Colors.white, // Background color
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ), // Rounded corners
                    borderSide: BorderSide.none, // No border
                  ),
                ),
                onChanged: (value) {
                  // Perform search logic here
                },
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () =>
                  legalHelpController.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                        itemCount: legalHelpController.legalHelpList.length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (BuildContext context, int index) {
                          final help = legalHelpController.legalHelpList[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: 12,
                              top: 12,
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      KText(
                                        text: 'নাম : ${help.helpName}',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      KText(
                                        text: 'মোবাইল নং : ${help.helpContact}',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    padding: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.teal),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: IconButton(
                                      color: Colors.teal,
                                      disabledColor: Colors.teal,
                                      focusColor: Colors.red,
                                      onPressed: () async {
                                        // Add this await to ensure the navigation completes
                                        await Get.to(
                                          () => LegalHelpDetailPage(
                                            helpId: int.parse(help.id),
                                          ),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.teal,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
