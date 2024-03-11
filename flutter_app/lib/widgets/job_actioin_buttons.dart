import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildActionButtons() {
  return Row(
    children: [
      ElevatedButton(
        onPressed: () {
          // Add functionality to save the job listing
        },
        key: GlobalKey(),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size(40, 50), // Adjust size if needed
        ), child: const Icon(Icons.bookmark),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: ElevatedButton(
          onPressed: () {
            // Add functionality to navigate to application process
          },
          child: const Text("Apply Now"),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    ],
  );
}
