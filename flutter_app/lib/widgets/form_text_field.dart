// Reusable form field widget
import 'package:flutter/material.dart';
import 'package:flutter_app/theme/colors.dart';

Widget formTextField({
  required String label,
  required TextEditingController controller,
  bool isDense = true,
  bool withFloatingLabel = false,
  bool obscureText = false,
  bool isFilled = true,
  bool showBorder = true,
  bool showShadow = true,
  int maxLines = 1,
  TextInputType keyboardType = TextInputType.text,
  Color shadowColor = WorkWiseColors.lightGreyColor,
  Color borderColor = WorkWiseColors.lightGreyColor,
}) {
  return withFloatingLabel
      ? Container(
          decoration: showShadow
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor, // Shadow color
                      blurRadius: 16, // Blur radius
                      offset: const Offset(0, 4), // Shadow offset
                    ),
                  ],
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              maxLines: maxLines,
              obscureText: obscureText,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  borderSide: showBorder
                      ? BorderSide(
                          width: 2.0,
                          color: borderColor,
                        )
                      : const BorderSide(color: Colors.transparent),
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: isDense ? 16.0 : 20.0, horizontal: 12.0),
                border: InputBorder.none,
                labelText: label,
              ),
            ),
          ),
        )
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            isDense
                ? const SizedBox(height: 8.0)
                : const SizedBox(height: 10.0),
            TextFormField(
              controller: controller,
              maxLines: maxLines,
              obscureText: obscureText,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  borderSide: showBorder
                      ? BorderSide(
                          width: 2.0,
                          color: borderColor,
                        )
                      : const BorderSide(color: Colors.transparent),
                ),
                filled: isFilled,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                    vertical: isDense ? 16.0 : 20.0, horizontal: 12.0),
              ),
            ),
          ],
        );
}
