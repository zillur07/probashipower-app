// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:probashipower_app/src/components/home_slide_component.dart';
// import 'package:probashipower_app/src/config/colors.dart';
// import 'package:probashipower_app/src/controllers/job_controller.dart';
// import 'package:probashipower_app/src/helpers/k_text.dart';
// import 'package:probashipower_app/src/pages/benefit_lite_page.dart';
// import 'package:probashipower_app/src/pages/doctor_list_page.dart';
// import 'package:probashipower_app/src/pages/job_list_page.dart';
// import 'package:probashipower_app/src/pages/ligal_help_list_page.dart';
// import 'package:probashipower_app/src/pages/loan_list_page.dart';
// import 'package:probashipower_app/src/pages/login_page.dart';
// import 'package:probashipower_app/src/pages/news_list_page.dart';
// import 'package:probashipower_app/src/pages/packages_page.dart';
// import 'package:probashipower_app/src/pages/ticket_list_page.dart';
// import 'package:probashipower_app/src/pages/user_review_list_page.dart';
// import 'package:probashipower_app/src/pages/video_list_page.dart';
// import 'package:probashipower_app/src/pages/vip_job_list_page.dart';
// import 'package:probashipower_app/src/widgets/custom_app_app.dart';

// class HomeViewPage extends StatelessWidget {
//   final JobController jobController = Get.put(JobController());

//   HomeViewPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: tabColor,
//         title: KText(
//           text: 'প্রবাসী পাওয়ার',
//           color: white,
//           fontSize: 25,
//           fontWeight: FontWeight.w500,
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 5),
//             child: IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.login_outlined),
//             ),
//           ),
//         ],
//       ),
//       // appBar: CustomAppBar(
//       //   title: 'প্রবাসী পাওয়ার',
//       //   backgroundColor: tabColor, // Replace with your desired color
//       //   textColor: Colors.white,
//       //   onLoginPressed: () {
//       //     // Add your login logic here
//       //     Get.to(LoginPage());
//       //     print('Login button pressed');
//       //   },
//       // ),
//       drawer: const Drawer(),
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           children: [
//             HomeSliderComponent(),
//             const SizedBox(height: 15),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     //   jobController.fetchJobs();
//                     Get.to(JobListPage());
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       // color: Colors.green,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.teal.withOpacity(.3)),
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 65,
//                           child: Image.asset('assets/img/job.png'),
//                         ),
//                         const KText(
//                           text: "চাকরি",
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Get.to(VipJobListPage());
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       // color: Colors.green,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.teal.withOpacity(.3)),
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           width: 65,
//                           child: Image.asset('assets/img/businessman.png'),
//                         ),
//                         const KText(
//                           text: "VIP চাকরি",
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     //   jobController.fetchJobs();
//                     Get.to(LoanListPage());
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       // color: Colors.green,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.teal.withOpacity(.3)),
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           width: 65,
//                           child: Image.asset('assets/img/loan.png'),
//                         ),
//                         const KText(
//                           text: "লোন স্কিম",
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 15),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     //   jobController.fetchJobs();
//                     Get.to(DoctorListPage());
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       // color: Colors.green,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.teal.withOpacity(.3)),
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           width: 65,
//                           child: Image.asset('assets/img/doctor.png'),
//                         ),
//                         const KText(
//                           text: "ডাক্তার",
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Get.to(TicketListPage());
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       // color: Colors.green,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.teal.withOpacity(.3)),
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           width: 65,
//                           child: Image.asset('assets/img/ticket.png'),
//                         ),
//                         const KText(
//                           text: "বিমান টিকিট",
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(5),
//                   height: 100,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     // color: Colors.green,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.teal.withOpacity(.3)),
//                   ),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         width: 65,
//                         child: Image.asset('assets/img/job-offer.png'),
//                       ),
//                       const KText(
//                         text: "চাকরি দিবো",
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 15),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Get.to(LigalHelpListPage());
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       // color: Colors.green,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.teal.withOpacity(.3)),
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           width: 65,
//                           child: Image.asset('assets/img/legal-advice.png'),
//                         ),
//                         const KText(
//                           text: "আইনি সহায়তা",
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(5),
//                   height: 100,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     // color: Colors.green,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.teal.withOpacity(.3)),
//                   ),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         width: 65,
//                         child: Image.asset('assets/img/application.png'),
//                       ),
//                       const KText(
//                         text: "এজেন্ট আবেদন",
//                         fontSize: 13,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ],
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     //   jobController.fetchJobs();
//                     Get.to(BenefitLitePage());
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       // color: Colors.green,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.teal.withOpacity(.3)),
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           width: 65,
//                           child: Image.asset('assets/img/retention.png'),
//                         ),
//                         const KText(
//                           text: "মেম্বারশিপ সুবিধা",
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 15),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     //   jobController.fetchJobs();
//                     Get.to(NewsListPage());
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       // color: Colors.green,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.teal.withOpacity(.3)),
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           width: 65,
//                           child: Image.asset('assets/img/breaking-news.png'),
//                         ),
//                         const KText(
//                           text: "প্রবাস খবর",
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(5),
//                   height: 100,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     // color: Colors.green,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.teal.withOpacity(.3)),
//                   ),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         width: 65,
//                         child: Image.asset('assets/img/agreement.png'),
//                       ),
//                       const KText(
//                         text: "চুক্তিপত্র",
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ],
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Get.to(PackagesPage());
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       // color: Colors.green,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.teal.withOpacity(.3)),
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           width: 65,
//                           child: Image.asset('assets/img/member-card.png'),
//                         ),
//                         const KText(
//                           text: "মেম্বারশিপ",
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 15),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(5),
//                   height: 100,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     // color: Colors.green,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.teal.withOpacity(.3)),
//                   ),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         width: 65,
//                         child: Image.asset('assets/img/wallet.png'),
//                       ),
//                       const KText(
//                         text: "রেফার-ইনকাম",
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Container(
//                 //   padding: const EdgeInsets.all(5),
//                 //   height: 100,
//                 //   width: 100,
//                 //   decoration: BoxDecoration(
//                 //       // color: Colors.green,
//                 //       borderRadius: BorderRadius.circular(10),
//                 //       border: Border.all(color: Colors.teal.withOpacity(.3))),
//                 //   child: Column(
//                 //     children: [
//                 //       SizedBox(
//                 //           height: 65,
//                 //           child: Image.asset('assets/img/social-media.png')),
//                 //       const KText(
//                 //         text: "সোশ্যাল মিডিয়া",
//                 //         fontSize: 13,
//                 //         fontWeight: FontWeight.w500,
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 InkWell(
//                   onTap: () {
//                     Get.to(VideoListPage());
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       // color: Colors.green,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.teal.withOpacity(.3)),
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 65,
//                           child: Image.asset('assets/img/video.png'),
//                         ),
//                         const KText(
//                           text: "শর্ট ভিডিও",
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Get.to(UserReviewListPage());
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(5),
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       // color: Colors.green,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: Colors.teal),
//                     ),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           width: 60,
//                           child: Image.asset(
//                             'assets/img/best-customer-experience.png',
//                           ),
//                         ),
//                         const KText(
//                           text: "ইউজার রিভিউ",
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 15),
//             Card(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 15,
//                   horizontal: 10,
//                 ),
//                 child: Image.asset('assets/img/s1.jpeg'),
//               ),
//             ),
//             const SizedBox(height: 15),
//             Card(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 15,
//                   horizontal: 10,
//                 ),
//                 child: Image.asset('assets/img/s2.jpeg'),
//               ),
//             ),
//             const SizedBox(height: 15),
//             Card(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 15,
//                   horizontal: 10,
//                 ),
//                 child: Image.asset('assets/img/s3.jpeg'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/components/home_slide_component.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/controllers/job_controller.dart';
import 'package:probashipower_app/src/controllers/slider_controller.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/pages/benefit_lite_page.dart';
import 'package:probashipower_app/src/pages/doctor_list_page.dart';
import 'package:probashipower_app/src/pages/job_list_page.dart';
import 'package:probashipower_app/src/pages/ligal_help_list_page.dart';
import 'package:probashipower_app/src/pages/loan_list_page.dart';
import 'package:probashipower_app/src/pages/login_page.dart';
import 'package:probashipower_app/src/pages/news_list_page.dart';
import 'package:probashipower_app/src/pages/packages_page.dart';
import 'package:probashipower_app/src/pages/ticket_list_page.dart';
import 'package:probashipower_app/src/pages/user_review_list_page.dart';
import 'package:probashipower_app/src/pages/video_list_page.dart';
import 'package:probashipower_app/src/pages/vip_job_list_page.dart';
import 'package:probashipower_app/src/widgets/custom_app_app.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeViewPage extends StatelessWidget {
  final JobController jobController = Get.put(JobController());
  final SliderController sliderController = Get.put(SliderController());

  HomeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: tabColor,
        title: KText(
          text: 'প্রবাসী পাওয়ার',
          color: white,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () => Get.to(LoginPage()),
              icon: Icon(Icons.login_outlined),
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            HomeSliderComponent(),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMenuButton(
                  'assets/img/job.png',
                  "চাকরি",
                  () => Get.to(JobListPage()),
                ),
                _buildMenuButton(
                  'assets/img/businessman.png',
                  "VIP চাকরি",
                  () => Get.to(VipJobListPage()),
                ),
                _buildMenuButton(
                  'assets/img/loan.png',
                  "লোন স্কিম",
                  () => Get.to(LoanListPage()),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMenuButton(
                  'assets/img/doctor.png',
                  "ডাক্তার",
                  () => Get.to(DoctorListPage()),
                ),
                _buildMenuButton(
                  'assets/img/ticket.png',
                  "বিমান টিকিট",
                  () => Get.to(TicketListPage()),
                ),
                _buildMenuButton(
                  'assets/img/job-offer.png',
                  "চাকরি দিবো",
                  null,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMenuButton(
                  'assets/img/legal-advice.png',
                  "আইনি সহায়তা",
                  () => Get.to(LigalHelpListPage()),
                ),
                _buildMenuButton(
                  'assets/img/application.png',
                  "এজেন্ট আবেদন",
                  null,
                ),
                _buildMenuButton(
                  'assets/img/retention.png',
                  "মেম্বারশিপ সুবিধা",
                  () => Get.to(BenefitLitePage()),
                  fontSize: 12,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMenuButton(
                  'assets/img/breaking-news.png',
                  "প্রবাস খবর",
                  () => Get.to(NewsListPage()),
                ),
                _buildMenuButton(
                  'assets/img/agreement.png',
                  "চুক্তিপত্র",
                  null,
                ),
                _buildMenuButton(
                  'assets/img/member-card.png',
                  "মেম্বারশিপ",
                  () => Get.to(PackagesPage()),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMenuButton('assets/img/wallet.png', "রেফার-ইনকাম", null),
                _buildMenuButton(
                  'assets/img/video.png',
                  "শর্ট ভিডিও",
                  () => Get.to(VideoListPage()),
                ),
                InkWell(
                  onTap: () => Get.to(UserReviewListPage()),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.teal),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 60,
                          child: Image.asset(
                            'assets/img/best-customer-experience.png',
                          ),
                        ),
                        const KText(
                          text: "ইউজার রিভিউ",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // API Slider Images Section
            Obx(() {
              if (sliderController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (sliderController.sliderImages.isEmpty) {
                return const SizedBox(); // Return empty if no images
              }

              return Column(
                children:
                    sliderController.sliderImages
                        .map(
                          (slider) => Column(
                            children: [
                              const SizedBox(height: 15),
                              Card(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 10,
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: '${slider.sliderImg}',
                                    fit: BoxFit.cover,
                                    placeholder:
                                        (context, url) => Container(
                                          height: 200,
                                          color: Colors.grey[200],
                                          child: const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                    errorWidget:
                                        (context, url, error) => Container(
                                          height: 200,
                                          color: Colors.grey[200],
                                          child: const Icon(Icons.error),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    String imagePath,
    String text,
    Function()? onTap, {
    double fontSize = 13,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.teal.withOpacity(.3)),
        ),
        child: Column(
          children: [
            SizedBox(width: 65, child: Image.asset(imagePath)),
            KText(text: text, fontSize: fontSize, fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}
