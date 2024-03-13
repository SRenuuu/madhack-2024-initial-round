import 'package:flutter/material.dart';

import '../theme/colors.dart';

class JobTag extends StatelessWidget {
  final String tag;
  final Color backgroundColor;
  final double fontSize;

  const JobTag(
      {super.key,
      required this.tag,
      this.backgroundColor = WorkWiseColors.primaryColor,
      this.fontSize = 11});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        tag,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
