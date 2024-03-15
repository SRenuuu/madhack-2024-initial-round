import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutMeController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

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

  var selectedGender = ''.obs;
  var genders = ['', 'Male', 'Female'].obs;

  void changeGender(String newGender) {
    selectedGender.value = newGender;
  }
}
