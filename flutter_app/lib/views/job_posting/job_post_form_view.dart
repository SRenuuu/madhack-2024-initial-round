import 'package:flutter/material.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:flutter_app/util/enums.dart';
import 'package:flutter_app/views/job_posting/range_picker.dart';
import 'package:flutter_app/widgets/description_form_field.dart';
import 'package:flutter_app/widgets/form_dropdown_field.dart';
import 'package:flutter_app/widgets/form_text_field.dart';
import 'package:map_location_picker/map_location_picker.dart';

class JobPostFormView extends StatefulWidget {
  const JobPostFormView({super.key});

  @override
  State<JobPostFormView> createState() => _JobPostFormViewState();
}

class _JobPostFormViewState extends State<JobPostFormView> {
  int currentStep = 0;
  late Industries _selectedIndustry;
  late Categories _selectedCategory;
  late JobTypes _selectedJobType;
  late TypeOfWorkspace _selectedWorkspace;
  String address = "null";
  String autocompletePlace = "null";
  Prediction? initialValue;
  double startSalary = 0.0;
  double endSalary = 500000.0;

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _positionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Theme(
                data: ThemeData(
                    colorScheme: const ColorScheme.light(
                        primary: WorkWiseColors.primaryColor)),
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
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  List<Step> getSteps() {
    return <Step>[
      //description
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text("1"),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Description",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
            const SizedBox(height: 25.0),
            formDropdownField(
              label: 'Industry',
              items: Industries.values
                  .map((industry) => industry.displayName)
                  .toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedIndustry = Industries.values.firstWhere((industry) =>
                      industry.toString().split('.').last == newValue);
                });
              },
              selectedValue: null,
            ),
            const SizedBox(height: 15.0),
            formDropdownField(
              label: 'Categories',
              items: Categories.values
                  .map((category) => category.displayName)
                  .toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = Categories.values.firstWhere((category) =>
                      category.toString().split('.').last == newValue);
                });
              },
              selectedValue: null,
            ),
            const SizedBox(height: 20.0),
            formTextField(label: 'Position', controller: _positionController),
            const SizedBox(height: 20.0),
            formDropdownField(
              label: 'Job Type',
              items: JobTypes.values
                  .map((jobType) => jobType.displayName)
                  .toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedJobType = JobTypes.values.firstWhere((jobType) =>
                      jobType.toString().split('.').last == newValue);
                });
              },
              selectedValue: null,
            ),
            const SizedBox(height: 20.0),
            formDropdownField(
              label: 'Type of Workspace',
              items: TypeOfWorkspace.values
                  .map((workspace) => workspace.displayName)
                  .toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedWorkspace = TypeOfWorkspace.values.firstWhere(
                      (workspace) =>
                          workspace.toString().split('.').last == newValue);
                });
              },
              selectedValue: null,
            ),
          ],
        ),
      ),
      //location
      Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text("2"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Location",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 700,
                child: MapLocationPicker(
                  apiKey: 'AIzaSyC8UEjIW0OoOm-m5W_lc0GbMXs5sKH2d3c',
                  popOnNextButtonTaped: true,
                  currentLatLng: const LatLng(29.146727, 76.464895),
                  onNext: (GeocodingResult? result) {
                    if (result != null) {
                      setState(() {
                        address = result.formattedAddress ?? "";
                      });
                    }
                  },
                  onSuggestionSelected: (PlacesDetailsResponse? result) {
                    if (result != null) {
                      setState(() {
                        autocompletePlace =
                            result.result.formattedAddress ?? "";
                      });
                    }
                  },
                ),
              ),
            ],
          )),
      //Salary
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text("3"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Salary",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            RangePickerWidget(
              initialValueStart: startSalary,
              initialValueEnd: endSalary,
              onRangeStartChanged: (startValue) {
                setState(() {
                  startSalary = startValue;
                });
              },
              onRangeEndChanged: (endValue) {
                setState(() {
                  endSalary = endValue;
                });
              },
            ),
            const SizedBox(height: 40.0),
            // Add some space between the RangePickerWidget and the Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Start',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15)),
                    Text('LKR ${startSalary.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('End',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15)),
                    Text('LKR ${endSalary.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20)),
                  ],
                ),
              ],
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.2)
          ],
        ),
      ),
      //Details
      Step(
        state: currentStep > 3 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 3,
        title: const Text("5"),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Details",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
            const SizedBox(height: 15),
            descriptionFormField(label: 'Job Description', value: ''),
            const SizedBox(height: 20),
            descriptionFormField(label: 'Requirements', value: ''),
            const SizedBox(height: 20),
            descriptionFormField(label: 'Responsibilities', value: ''),
            const SizedBox(height: 20),
            descriptionFormField(label: 'About Company', value: ''),
          ],
        ),
      ),
    ];
  }
}
