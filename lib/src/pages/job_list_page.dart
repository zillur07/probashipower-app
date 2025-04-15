import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probashipower_app/src/config/colors.dart';
import 'package:probashipower_app/src/controllers/job_controller.dart';
import 'package:probashipower_app/src/helpers/k_text.dart';
import 'package:probashipower_app/src/pages/job_detail_page.dart';
import 'package:probashipower_app/src/widgets/custom_app_app.dart';

class JobListPage extends StatelessWidget {
  JobListPage({super.key});
  final TextEditingController controller = TextEditingController();
  final JobController jobController = Get.put(JobController());

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
                      child: Image.asset('assets/img/job.png'),
                    ),
                    const SizedBox(width: 10),
                    const KText(
                      text: 'চাকরি বিজ্ঞাপন',
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
                  jobController.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                        itemCount: jobController.jobs.length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (BuildContext context, int index) {
                          final job = jobController.jobs[index];
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
                                        text: 'পদবী: ${job.jobTitle}',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      KText(
                                        text: 'কোম্পানী : ${job.companyName}',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      KText(
                                        text: 'বেতন: ${job.jobSalary}',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      KText(
                                        text:
                                            'কর্মস্থল : ${job.companyAddress}',
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
                                    // child: IconButton(
                                    //   color: Colors.teal,
                                    //   disabledColor: Colors.teal,
                                    //   focusColor: Colors.red,
                                    //   onPressed: () {},
                                    //   icon: const Icon(
                                    //     Icons.arrow_forward,
                                    //     color: Colors.teal,
                                    //     size: 28,
                                    //   ),
                                    // ),
                                    child: // In your JobListPage, update the IconButton onPressed:
                                        IconButton(
                                      onPressed: () async {
                                        // Add this await to ensure the navigation completes
                                        await Get.to(
                                          () => JobDetailPage(
                                            jobId: int.parse(job.id),
                                          ),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                      icon: Icon(
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
