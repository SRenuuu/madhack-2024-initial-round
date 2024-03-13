import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/home_controller.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:get/get.dart';

import '../widgets/job_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

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
                Image.asset(
                  'assets/images/workwise-logo.png',
                  width: 240.0,
                ),
                const SizedBox(height: 8.0), // Spacer
                const Text("Welcome to WorkWise",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4.0), // Spacer
                const Text("Your ultimate job search companion!",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                        color: WorkWiseColors.darkGreyColor)),
                const SizedBox(height: 48.0), // Spacer
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
                JobCard(
                    onCardTap: () => Get.toNamed("/job"),
                    jobPosting: JobPosting(
                        title: "Junior Web Developer",
                        location: "CodeSphere - Colombo, Sri Lanka",
                        description:
                            "We are looking for a junior web developer, who is passionate about web development and has a keen eye for detail.",
                        image:
                            "https://foyr.com/learn/wp-content/uploads/2021/08/modern-office-design.png",
                        salaryValue: "\$8K",
                        salaryFrequency: "Mo",
                        tags: ["Remote", "Full Time", "New"],
                        isSaved: true))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
