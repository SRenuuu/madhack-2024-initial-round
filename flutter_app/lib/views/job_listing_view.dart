import 'package:flutter/material.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:get/get.dart';

import '../widgets/job_details.dart';
import '../widgets/location_map.dart';

class JobListingPage extends StatelessWidget {
  JobListingPage({super.key});

  final String jobTitle = "Software Engineer";
  final String companyName = "Flutter Inc.";
  final String location = "Mountain View, CA";
  final String jobDescription =
      "We are looking for a talented Flutter developer... We are looking for a talented Flutter developer... We are looking for a talented Flutter developer...";
  final List<String> requirements = [
    "Experience with Flutter and Dart",
    "Strong understanding of mobile app development",
    "Excellent problem-solving skills",
  ];
  final List<String> responsibilities = [
    "Develop and maintain highly performant Flutter applications",
    "Collaborate with designers and product managers",
    "Write clean and maintainable code",
  ];
  final String companyDescription =
      "Flutter Inc. is a leading company. Flutter Inc. is a leading company. Flutter Inc. is a leading company. Flutter Inc. is a leading company...";
  final String salaryRange = "\$80,000 - \$120,000";
  final double latitude = 6.91293;
  final double longitude = 79.85360;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back), onPressed: () => Get.back()),
        title: const Text("Job Listing"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              jobHeader(jobTitle, location, companyName),
              const SizedBox(height: 24),
              JobDetails(
                jobType: "Hybrid",
                // Replace with actual data
                employmentType: "Full Time",
                // Replace with actual data
                salaryRange: salaryRange,
                salaryFrequency: "Mo",
                salaryValue: "8K-12K",
              ),
              const SizedBox(height: 24),
              const Text(
                "Job Description",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: WorkWiseColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(jobDescription),
              const SizedBox(height: 24),
              const Text(
                "Requirements",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: WorkWiseColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              bulletedList(requirements),
              const SizedBox(height: 24),
              const Text(
                "Responsibilities",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: WorkWiseColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              bulletedList(responsibilities),
              const SizedBox(height: 24),
              const Text(
                "About Company",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: WorkWiseColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(companyDescription),
              const SizedBox(height: 16),
              locationMap(latitude, longitude),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 85,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: actionButtons(),
        ),
      ),
    );
  }

  Widget jobHeader(String jobTitle, String location, String companyName) {
    return Row(
      children: [
        // Widget to display the job icon
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://foyr.com/learn/wp-content/uploads/2021/08/modern-office-design.png'),
              // Replace with your image URL
              fit: BoxFit.cover, // Adjust fit as needed (cover, contain, etc.)
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jobTitle,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    companyName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: WorkWiseColors.secondaryColor,
                    ),
                  ),
                  Text(
                    " - $location",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget actionButtons() {
    return Row(
      children: [
        SizedBox(
          width: 72,
          child: OutlinedButton(
            onPressed: () {
              // Add functionality to save the job listing
            },
            child: const Icon(Icons.bookmark),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Add functionality to navigate to application process
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: WorkWiseColors.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Apply Now",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget bulletedList(List<String> items) {
    return Column(
      children: items.map((item) => listItem(text: item)).toList(),
    );
  }

  Widget listItem({required String text}) {
    return Row(
      children: [
        const Icon(
          Icons.circle,
          size: 8,
          color: Colors.blueGrey,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text),
        ),
      ],
    );
  }
}
