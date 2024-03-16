import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../services/auth_service.dart';
import '../../widgets/job_card.dart';

class EmployerHomeController extends GetxController {
  final AuthService authService = Get.find<AuthService>();
  final TextEditingController searchController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool isRecommendedJobPostsLoading = false.obs;
  final RxBool isMostPopularJobPostsLoading = false.obs;
  final RxBool isJobTagsLoading = false.obs;

  final RxList<String> jobTagsList = RxList<String>([]);
  final RxList<JobPosting> recommendedJobPosts = RxList<JobPosting>([]);
  final RxList<JobPosting> mostPopularJobPosts = RxList<JobPosting>([]);

  Future<void> fetchJobTags() async {
    isJobTagsLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    jobTagsList.value = [
      "Software Engineer",
      "Data Scientist",
      "UX/UI Designer"
    ];
    isJobTagsLoading.value = false;
  }

  Future<void> fetchRecommendedJobPosts() async {
    isRecommendedJobPostsLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    recommendedJobPosts.value = [
      JobPosting(
        id: "1",
        title: "Junior Web Developer",
        location: "CodeSphere - Colombo, Sri Lanka",
        description: "We are looking for a junior web developer...",
        image:
            "https://foyr.com/learn/wp-content/uploads/2021/08/modern-office-design.png",
        salaryValue: "\$8K",
        salaryFrequency: "Mo",
        tags: ["Remote", "Full Time", "New"],
        isSaved: true,
      ),
      JobPosting(
        id: "2",
        title: "Junior Web Developer",
        location: "CodeSphere - Colombo, Sri Lanka",
        description: "We are looking for a junior web developer...",
        image:
            "https://foyr.com/learn/wp-content/uploads/2021/08/modern-office-design.png",
        salaryValue: "\$8K",
        salaryFrequency: "Mo",
        tags: ["Remote", "Full Time", "New"],
        isSaved: true,
      ),
      JobPosting(
        id: "3",
        title: "Junior Web Developer",
        location: "CodeSphere - Colombo, Sri Lanka",
        description: "We are looking for a junior web developer...",
        image:
            "https://foyr.com/learn/wp-content/uploads/2021/08/modern-office-design.png",
        salaryValue: "\$8K",
        salaryFrequency: "Mo",
        tags: ["Remote", "Full Time", "New"],
        isSaved: true,
      ),
    ];
    isRecommendedJobPostsLoading.value = false;
  }

  Future<void> fetchRecentJobPostings() async {
    isMostPopularJobPostsLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    mostPopularJobPosts.value = [
      JobPosting(
        id: "1",
        title: "Junior Web Developer",
        location: "CodeSphere - Colombo, Sri Lanka",
        description: "We are looking for a junior web developer...",
        image:
            "https://foyr.com/learn/wp-content/uploads/2021/08/modern-office-design.png",
        salaryValue: "\$8K",
        salaryFrequency: "Mo",
        tags: ["Remote", "Full Time", "New"],
        isSaved: true,
      ),
      JobPosting(
        id: "2",
        title: "Junior Web Developer",
        location: "CodeSphere - Colombo, Sri Lanka",
        description: "We are looking for a junior web developer...",
        image:
            "https://foyr.com/learn/wp-content/uploads/2021/08/modern-office-design.png",
        salaryValue: "\$8K",
        salaryFrequency: "Mo",
        tags: ["Remote", "Full Time", "New"],
        isSaved: true,
      ),
      JobPosting(
        id: "3",
        title: "Junior Web Developer",
        location: "CodeSphere - Colombo, Sri Lanka",
        description: "We are looking for a junior web developer...",
        image:
            "https://foyr.com/learn/wp-content/uploads/2021/08/modern-office-design.png",
        salaryValue: "\$8K",
        salaryFrequency: "Mo",
        tags: ["Remote", "Full Time", "New"],
        isSaved: true,
      ),
    ];
    isMostPopularJobPostsLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    fetchJobTags();
    fetchRecommendedJobPosts();
    fetchRecentJobPostings();
  }
}
