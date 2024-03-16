import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WorkExperienceController extends GetxController {
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Rx<bool> isCurrentJob = false.obs;

  void changeIsCurrentJob() {
    isCurrentJob.value = !isCurrentJob.value;
  }

  var textFieldControllers =
      List<TextEditingController>.empty(growable: true).obs;
}