import 'package:flutter/material.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:get/get.dart';

import '../../controllers/employer/employer_home_controller.dart';
import '../../models/job_posting.dart';
import '../../widgets/job_card.dart';

class EmployerHomeView extends StatelessWidget {
  const EmployerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    EmployerHomeController controller = Get.put(EmployerHomeController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                const Text("Employer Page",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4.0), // Spacer
                const Text("Your ultimate job search companion!",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                        color: WorkWiseColors.darkGreyColor)),
                Obx(() => Column(
                      children: [
                        Text('Email: ${controller.authService.getUserEmail()}',
                            style: const TextStyle(fontSize: 16.0)),
                      ],
                    )),
                const SizedBox(height: 4.0), // Spacer
                TextButton(
                  onPressed: () {
                    controller.authService.forceLogout();
                  },
                  child:
                      const Text('Sign Out', style: TextStyle(fontSize: 16.0)),
                ),
                const SizedBox(height: 24.0), // Spacer

                // Recent Job Postings
                FutureBuilder(
                    future: controller.recentJobPostings(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<JobPostingResponse>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return Column(
                            children: [
                              const Text('Recent Job Postings',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(height: 16.0), // Spacer
                              SingleChildScrollView(
                                child: SizedBox(
                                  height: 400.0,
                                  child: Column(
                                    children: [
                                      for (JobPostingResponse jobPosting
                                          in snapshot.data!) ...[
                                        JobCard(
                                          onCardTap: () =>
                                              Get.toNamed("/profile"),
                                          jobPosting: JobPosting(
                                              title: jobPosting.title,
                                              location: jobPosting.location,
                                              description:
                                                  jobPosting.description,
                                              image:
                                                  "https://foyr.com/learn/wp-content/uploads/2021/08/modern-office-design.png",
                                              salaryValue:
                                                  jobPosting.salaryRange,
                                              salaryFrequency: "Mo",
                                              tags: [
                                                "Remote",
                                                "Full Time",
                                                "New"
                                              ],
                                              isSaved: true),
                                        ),
                                        const SizedBox(height: 16.0),
                                      ]
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
