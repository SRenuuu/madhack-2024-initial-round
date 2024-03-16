import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/employer/employer_home_controller.dart';
import 'package:flutter_app/controllers/home_controller.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:get/get.dart';

import '../../widgets/form_text_field.dart';
import '../../widgets/job_card.dart';

class EmployerHomeView extends StatelessWidget {
  const EmployerHomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchField(),
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
                child: ElevatedButton(
                  onPressed: () => Get.toNamed("/job"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: WorkWiseColors.primaryColor,
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text("Post a New Job"),
                ),
              ),
              const SizedBox(height: 24.0),
              buildRecommendedJobs(),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    HomeController controller = Get.put(HomeController());
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 80.0,
      title: buildAppBarTitle(),
    );
  }

  Widget buildAppBarTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/workwise-logo-long.png',
            width: 180.0,
          ),
          buildProfileIcons(),
        ],
      ),
    );
  }

  Widget buildProfileIcons() {
    return Row(
      children: [
        IconButton(
          onPressed: () => Get.toNamed("/profile"),
          icon: const Icon(
            Icons.bookmarks_rounded,
            size: 24,
            color: WorkWiseColors.tertiaryColor,
          ),
        ),
        const SizedBox(width: 12.0),
        buildProfileIconButton(),
      ],
    );
  }

  Widget buildProfileIconButton() {
    return Container(
      width: 42.0,
      height: 42.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: WorkWiseColors.lightGreyColor,
      ),
      child: IconButton(
        onPressed: () => Get.toNamed("/profile"),
        icon: const Icon(
          Icons.person,
          size: 24,
          color: WorkWiseColors.primaryColor,
        ),
      ),
    );
  }

  Widget buildSearchField() {
    HomeController controller = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
      child: formTextField(
        showBorder: true,
        isDense: true,
        hintText: 'Search Jobs...',
        showLabel: false,
        label: 'Search Jobs',
        prefixIcon: const Icon(Icons.search,
            size: 26.0, color: WorkWiseColors.primaryColor),
        suffixIcon: IconButton(
          onPressed: () => print("Filter"),
          icon: const Icon(Icons.filter_alt_rounded,
              size: 26.0, color: WorkWiseColors.greyColor),
        ),
        controller: controller.searchController,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget buildRecentJobPostings() {
    EmployerHomeController controller = Get.put(EmployerHomeController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Recent Job Postings",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
        ),
        Obx(() => controller.isMostPopularJobPostsLoading.value
            ? _buildLoadingIndicator()
            : controller.mostPopularJobPosts.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: Text(
                        "No popular jobs found",
                        style: TextStyle(
                          color: WorkWiseColors.darkGreyColor,
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    // auto height
                    height: 800,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.mostPopularJobPosts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          margin: EdgeInsets.only(
                            top: 8.0,
                            bottom: 24.0,
                            left: index == 0 ? 24.0 : 0,
                            right: index == 9 ? 24.0 : 16.0,
                          ),
                          child: JobCard(
                            showDescription: false,
                            shadowColor:
                                WorkWiseColors.greyColor.withOpacity(0.5),
                            onCardTap: () => Get.toNamed("/profile"),
                            jobPosting: controller.mostPopularJobPosts[index],
                          ),
                        );
                      },
                    ),
                  )),
      ],
    );
  }

  Widget buildRecommendedJobs() {
    EmployerHomeController controller = Get.put(EmployerHomeController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recommended for you",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16.0),
          Obx(() => controller.isRecommendedJobPostsLoading.value
              ? _buildLoadingIndicator()
              : controller.recommendedJobPosts.isEmpty
                  ? const Center(
                      child: Text(
                        "No recommended jobs found",
                        style: TextStyle(
                          color: WorkWiseColors.darkGreyColor,
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.recommendedJobPosts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            JobCard(
                              shadowColor:
                                  WorkWiseColors.greyColor.withOpacity(0.5),
                              onCardTap: () => Get.toNamed("/profile"),
                              jobPosting: controller.recommendedJobPosts[index],
                            ),
                            const SizedBox(height: 8.0),
                          ],
                        );
                      },
                    )),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: WorkWiseColors.secondaryColor,
              ),
            ),
            SizedBox(width: 20.0),
            Text(
              'Loading...',
              style: TextStyle(
                color: WorkWiseColors.darkGreyColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
