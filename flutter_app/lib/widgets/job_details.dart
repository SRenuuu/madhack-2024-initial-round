import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class JobDetails extends StatelessWidget {
  final String jobType; // "Onsite", "Online", or "Hybrid"
  final String employmentType; // "Full Time" or "Part Time"
  final String salaryRange;
  final String salaryValue;
  final String salaryFrequency;

  const JobDetails({super.key,
    required this.jobType,
    required this.employmentType,
    required this.salaryRange,
    required this.salaryValue,
    required this.salaryFrequency,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              buildToast(text: jobType, color: Colors.teal),
              const SizedBox(width: 8),
              buildToast(text: employmentType, color: Colors.blueAccent),
            ],
          ),
        ),
        // const Spacer(),
        Row(
          children: [
            Text(
              "\$$salaryValue",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 2.0),
            Text(
              "/$salaryFrequency",
              style: const TextStyle(
                color: WorkWiseColors.darkGreyColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildToast({required String text, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}