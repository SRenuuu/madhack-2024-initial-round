import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildJobTitleRow(
    String jobTitle,
    String location,
    String companyName
    ) {
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
            image: NetworkImage('https://foyr.com/learn/wp-content/uploads/2021/08/modern-office-design.png'), // Replace with your image URL
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
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  companyName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
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
