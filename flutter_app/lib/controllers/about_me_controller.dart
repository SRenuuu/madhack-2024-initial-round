import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/user_detail_controller.dart';
import 'package:get/get.dart';

import '../models/user_detail_response.dart';

class AboutMeController extends GetxController {
  UserDetailsController userDetailsController = Get.put(UserDetailsController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  TextEditingController newOne = TextEditingController();
  RxBool isLoading = false.obs;
  UserDetailResponse? response1 = null;

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

  void updateTextFields() {
    if (response1 == null) return;
    for(int i = 0; i < response1!.data.profile.socialLinks.length; i++) {
      TextEditingController tc = TextEditingController();
      tc.text = response1!.data.profile.socialLinks[i];
      textFieldControllers.add(tc);
      update();
    }
  }

  void clearTextFields() {
    textFieldControllers =
        List<TextEditingController>.empty(growable: true).obs;
    update();
  }

  void fetchData() {
    clearTextFields();
    userDetailsController.fetchUserData().then((response) => {
      response1 = response,
      if (response != null) {
        nameController.text = response.data.profile.name,
        dobController.text = response.data.profile.dob.split("T")[0],
        emailController.text = response.data.email,
        phoneController.text = response.data.profile.contact,
        updateTextFields(),
      }
    });
  }

}
