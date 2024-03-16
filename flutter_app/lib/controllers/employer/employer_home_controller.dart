import 'package:flutter_app/models/job_posting.dart';
import 'package:get/get.dart';

import '../../services/auth_service.dart';

class EmployerHomeController extends GetxController {
  final AuthService authService = Get.find<AuthService>();

  Future<List<JobPostingResponse>> recentJobPostings() async {
    final List<JobPostingResponse> jobPostings = [
      const JobPostingResponse(
        title: "Junior Web Developer",
        location: "CodeSphere - Colombo, Sri Lanka",
        description:
            "We are looking for a junior web developer, who is passionate about web development and has a keen eye for detail.",
        salaryRange: "\$8K",
        // image: "https://foyr.com/learn/wp-content/uploads/2021/08/modern-office-design.png",
        employerId: "1",
      ),
      const JobPostingResponse(
        title: "Junior Developer",
        location: "CodeSphere - Colombo, Sri Lanka",
        description:
            "We are looking for a junior web developer, who is passionate about web development and has a keen eye for detail.",
        salaryRange: "\$8K",
        // image: "https://foyr.com/learn/wp-content/uploads/2021/08/modern-office-design.png",
        employerId: "1",
      ),
      const JobPostingResponse(
        title: "Junior Developer",
        location: "CodeSphere - Colombo, Sri Lanka",
        description:
            "We are looking for a junior web developer, who is passionate about web development and has a keen eye for detail.",
        salaryRange: "\$8K",
        // image: "https://foyr.com/learn/wp-content/uploads/2021/08/modern-office-design.png",
        employerId: "1",
      ),
      // Add more JobPosting objects for the remaining four cards
    ];

    return jobPostings;
  }
}
