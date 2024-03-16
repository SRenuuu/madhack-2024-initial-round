import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/auth_service.dart';
import '../widgets/job_card.dart';

class HomeController extends GetxController {
  final AuthService authService = Get.find<AuthService>();

  // Home View
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

  Future<void> fetchMostPopularJobPosts() async {
    isMostPopularJobPostsLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    mostPopularJobPosts.value = [
      JobPosting(
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

  // Search Filters view
  final TextEditingController filterLocationController =
      TextEditingController();

  Rx<String> selectedIndustry = 'Information Technology'.obs;
  Rx<String> selectedCategory = 'UI/UX'.obs;

  final industries = [
    'Information Technology',
    'Finance',
    'Healthcare',
    'Retail',
    'Manufacturing',
    'Telecommunications',
  ];

  final industryCategories = {
    'Information Technology': [
      'BA/BI',
      'UI/UX',
      'Software Development',
      'Network Administration'
    ],
    'Finance': ['Accounting', 'Financial Planning', 'Auditing'],
    'Healthcare': ['Nursing', 'Medical Technology', 'Pharmacy'],
    'Retail': ['Sales', 'Merchandising', 'Customer Service'],
    'Manufacturing': ['Production', 'Quality Assurance', 'Supply Chain'],
    'Telecommunications': [
      'Network Engineering',
      'Telecom Sales',
      'Customer Support'
    ],
  };

  void changeIndustry(String newIndustry) {
    print(newIndustry);
    selectedIndustry.value = newIndustry;
    // Reset category when industry changes
    selectedCategory.value = categoriesForIndustry(newIndustry).first;
    update();
  }

  void changeCategory(String newCategory) {
    print(newCategory);
    selectedCategory.value = newCategory;
    update();
  }

  List<String> categoriesForIndustry(String industry) {
    return industryCategories[industry] ?? [];
  }

  // add required stuff here

  final Rx<RangeValues> salaryRange =
      const RangeValues(50000, 250000).obs; // Initial salary range

  final RxList<String> allTags = [
    'On-site',
    'Remote',
    'Hybrid',
    'Full Time',
    'Part Time',
    'Intern',
    'Senior',
    'New',
    'Urgent'
  ].obs;
  final RxList<String> selectedTags = <String>[].obs;

  void addTag(String tag) {
    selectedTags.add(tag);
  }

  void removeTag(String tag) {
    selectedTags.remove(tag);
  }

  @override
  void onInit() {
    super.onInit();
    fetchJobTags();
    fetchRecommendedJobPosts();
    fetchMostPopularJobPosts();
  }
}
