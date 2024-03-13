import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:flutter_app/widgets/custom_input.dart';


class JobPostFormView extends StatefulWidget {
  const JobPostFormView({super.key});

  @override
  State<JobPostFormView> createState() => _JobPostFormViewState();
}

class _JobPostFormViewState extends State<JobPostFormView> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Stepper(
            type: StepperType.horizontal,
            currentStep: currentStep,
            onStepCancel: () => currentStep == 0
                ? null
                : setState(() {
              currentStep -= 1;
            }),
            onStepContinue: () {
              bool isLastStep = (currentStep == getSteps().length - 1);
              if (isLastStep) {
                //Do something with this information
              } else {
                setState(() {
                  currentStep += 1;
                });
              }
            },
            onStepTapped: (step) => setState(() {
              currentStep = step;
            }),
            steps: getSteps(),
          )
          ),

        ),
      ),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text("A"),
        content: Column(
          children: [
            CustomInput(
              hint: "Job title"
            ),
            CustomInput(
                hint: "Description",
              lines: 5,
            ),
            CustomInput(
              hint: "Responsibilities",
              lines: 5,
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text("B"),
        content: const Column(
          children: [
           //proper location input field
            CustomInput(
              hint: "Location"
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text("C"),
        content: const Column(
          children: [
            CustomInput(
              hint: "Salary Information"
            ),
          ],
        ),
      ),
    ];
  }

}

