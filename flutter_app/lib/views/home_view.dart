import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/home_controller.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:get/get.dart';

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
                const SizedBox(height: 60.0), // Spacer
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
