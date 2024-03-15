import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutMeController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  var textFieldControllers =
      List<TextEditingController>.empty(growable: true).obs;

  void addTextField() {
    textFieldControllers.add(TextEditingController());
    update();
  }

  void removeTextField(int index) {
    textFieldControllers.removeAt(index);
    update();
  }
}
