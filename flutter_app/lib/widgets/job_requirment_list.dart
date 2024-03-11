import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildRequirementsList(List<String> items) {
  return Column(
    children: items.map((item) => buildRequirementItem(text: item)).toList(),
  );
}

Widget buildRequirementItem({required String text}) {
  return Row(
    children: [
      const Icon(
        Icons.circle,
        size: 8,
        color: Colors.blueGrey,
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Text(text),
      ),
    ],
  );
}