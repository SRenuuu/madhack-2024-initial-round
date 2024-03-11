import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobDetails extends StatelessWidget {
  final String jobType; // "Onsite", "Online", or "Hybrid"
  final String employmentType; // "Full Time" or "Part Time"
  final String salaryRange;

  const JobDetails({super.key,
    required this.jobType,
    required this.employmentType,
    required this.salaryRange,
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
        Text(
          salaryRange,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget buildToast({required String text, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}