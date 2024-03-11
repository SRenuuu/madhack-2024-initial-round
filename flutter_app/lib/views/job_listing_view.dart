import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/job_actioin_buttons.dart';
import '../widgets/job_company_detail.dart';
import '../widgets/job_details.dart';
import '../widgets/job_requirment_list.dart';
import '../widgets/job_title_row.dart';

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
        title: const Text("Job Listing"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildJobTitleRow(jobTitle, location, companyName),
              const SizedBox(height: 16),
              JobDetails(
                jobType: "Hybrid", // Replace with actual data
                employmentType: "Full Time", // Replace with actual data
                salaryRange: salaryRange,
              ),
              const SizedBox(height: 24),
              const Text(
                "Job Description",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
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
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              buildRequirementsList(requirements),
              const SizedBox(height: 24),
              const Text(
                "Responsibilities",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              buildRequirementsList(responsibilities),
              const SizedBox(height: 24),
              const Text(
                "About Company",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(companyDescription),
              const SizedBox(height: 16),
              buildCompanyLocation(latitude, longitude),
              const SizedBox(height: 16),
              buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}