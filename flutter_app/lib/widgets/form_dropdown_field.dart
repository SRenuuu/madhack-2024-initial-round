import 'package:flutter/material.dart';
import 'package:flutter_app/theme/colors.dart';

Widget formDropdownField({
  required String label,
  required List<String> items,
  required ValueChanged<String?> onChanged,
  String? value,
  bool isDense = true,
  bool withFloatingLabel = false,
  bool showBorder = true,
  bool showShadow = true,
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
                      color: shadowColor,
                      blurRadius: 16,
                      offset: const Offset(0, 4),
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
            child: DropdownButtonFormField<String>(
              value: value,
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: onChanged,
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
                  vertical: isDense ? 16.0 : 20.0,
                  horizontal: 12.0,
                ),
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
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            isDense
                ? const SizedBox(height: 8.0)
                : const SizedBox(height: 10.0),
            DropdownButtonFormField<String>(
              value: value,
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: onChanged,
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
                  vertical: isDense ? 16.0 : 20.0,
                  horizontal: 12.0,
                ),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ],
        );
}
