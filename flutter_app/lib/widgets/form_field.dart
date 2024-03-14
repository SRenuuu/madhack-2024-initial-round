// Reusable form field widget
import 'package:flutter/material.dart';

Widget formField(
    String label, String value, void Function(String?)? onSaved) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      const SizedBox(height: 4.0),
      TextFormField(
        initialValue: value,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[100],
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        ),
        onSaved: onSaved,
      ),
      const SizedBox(height: 16.0),
    ],
  );
}