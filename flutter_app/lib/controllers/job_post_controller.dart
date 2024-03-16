import 'package:flutter/material.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:flutter_app/widgets/form_dropdown_field.dart';
import 'package:flutter_app/widgets/form_text_field.dart';
import 'package:get/get.dart';
import 'package:flutter_app/views/job_posting/range_picker.dart';

class JobPostController extends GetxController {
  final TextEditingController positionController = TextEditingController();
  RxInt currentStep = 0.obs;

  RxList<TextEditingController> textFieldControllers =
      <TextEditingController>[].obs;

  Rx<String?> selectedIndustry = Rx<String?>(null);
  RxList<String> industries = ['Industry 1', 'Industry 2', 'Industry 3'].obs;

  Rx<String?> selectedCategory = Rx<String?>(null);
  RxList<String> categories = ['Category 1', 'Category 2', 'Category 3'].obs;

  Rx<String?> selectedJobType = Rx<String?>(null);
  RxList<String> jobTypes = ['Type 1', 'Type 2', 'Type 3'].obs;

  Rx<String?> selectedWorkspace = Rx<String?>(null);
  RxList<String> workspaces = ['Workspace 1', 'Workspace 2', 'Workspace 3'].obs;

  // Rx variables for start and end salary
  Rx<double> startSalary = 0.0.obs;
  Rx<double> endSalary = 0.0.obs;

  void addTextField() {
    textFieldControllers.add(TextEditingController());
    update();
  }

  void removeTextField(int index) {
    textFieldControllers.removeAt(index);
    update();
  }

  void changeIndustry(String newIndustry) {
    selectedIndustry.value = newIndustry;
  }

  void changeCategory(String newCategory) {
    selectedCategory.value = newCategory;
  }

  void changeJobType(String newJobType) {
    selectedJobType.value = newJobType;
  }

  void changeWorkspace(String newWorkspace) {
    selectedWorkspace.value = newWorkspace;
  }

  void nextStep() {
    if (currentStep.value < getSteps().length - 1) {
      currentStep.value++;
      update(); // Add this line to trigger UI update
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
      update();
    }
  }

  void goToStep(int step) {
    currentStep.value = step;
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep.value > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep.value >= 0,
        title: const Text(""),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Description",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
            const SizedBox(height: 25.0),
            //industries
            formDropdownField(
                prefixIcon: const Icon(Icons.apartment_sharp,
                    size: 20.0, color: WorkWiseColors.primaryColor),
                label: 'Industries',
                items: industries,
                selectedValue: selectedIndustry.value,
                onChanged: (val) => changeIndustry),
            const SizedBox(height: 15.0),
            //categories
            formDropdownField(
                prefixIcon: const Icon(Icons.category_sharp,
                    size: 20.0, color: WorkWiseColors.primaryColor),
                label: 'Categories',
                items: categories,
                selectedValue: selectedCategory.value,
                onChanged: (val) => changeCategory),
            const SizedBox(height: 20.0),
            //positions
            formTextField(
                label: 'Position',
                prefixIcon: const Icon(Icons.work,
                    size: 20.0, color: WorkWiseColors.primaryColor),
                controller: positionController,
                keyboardType: TextInputType.text),

            const SizedBox(height: 20.0),
            //job types
            formDropdownField(
                prefixIcon: const Icon(Icons.business_center_sharp,
                    size: 20.0, color: WorkWiseColors.primaryColor),
                label: 'Job Types',
                items: jobTypes,
                selectedValue: selectedJobType.value,
                onChanged: (val) => changeJobType),
            const SizedBox(height: 20.0),
            //workspaces
            formDropdownField(
                prefixIcon: const Icon(Icons.add_location_alt_sharp,
                    size: 20.0, color: WorkWiseColors.primaryColor),
                label: 'Workspaces',
                items: workspaces,
                selectedValue: selectedWorkspace.value,
                onChanged: (val) => changeWorkspace),
          ],
        ),
      ),
      Step(
        state: currentStep.value > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep.value >= 1,
        title: const Text(""),
        content: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Location",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
            SizedBox(height: 15),
          ],
        ),
      ),
      Step(
        state: currentStep.value > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep.value >= 2,
        title: const Text(""),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Salary",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
            RangePickerWidget(
              initialValueStart: startSalary.value,
              initialValueEnd: endSalary.value,
              onRangeStartChanged: (startValue) {
                startSalary.value = startValue;
              },
              onRangeEndChanged: (endValue) {
                endSalary.value = endValue;
              },
            ),
          ],
        ),
      ),
      Step(
        state: currentStep.value > 3 ? StepState.complete : StepState.indexed,
        isActive: currentStep.value >= 3,
        title: const Text(""),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Details",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
            // Your details content goes here
          ],
        ),
      ),
    ];
  }
}
