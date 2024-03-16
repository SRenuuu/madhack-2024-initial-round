import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/user_detail_controller.dart';
import 'package:get/get.dart';

class AboutMeController extends GetxController {
  UserDetailsController userDetailsController = Get.put(UserDetailsController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  TextEditingController newOne = TextEditingController();
  RxBool isLoading = false.obs;

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

  Rx<String?> selectedGender = null.obs;
  RxList<String> genders = ['Male', 'Female'].obs;

  void changeGender(String newGender) {
    selectedGender.value = newGender;
  }

  void fetchData() {
    userDetailsController.fetchUserData().then((response) => {
      if (response != null) {
        nameController.text = response.data.profile.name,
        dobController.text = response.data.profile.dob.split("T")[0],
        emailController.text = response.data.email,
        phoneController.text = response.data.profile.contact,
        selectedGender.value = "Male",
      }
    });
  }

}
