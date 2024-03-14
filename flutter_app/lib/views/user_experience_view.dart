import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/double_form_field.dart';

import '../widgets/description_form_field.dart';
import '../widgets/form_field.dart';

class UserExperiencePage extends StatefulWidget {
  const UserExperiencePage({super.key});

  @override
  _UserExperiencePageState createState() => _UserExperiencePageState();
}

class _UserExperiencePageState extends State<UserExperiencePage> {
  // User profile data (replace with your data model)
  String jobTitle = "";
  String company = "";
  String sDate = "";
  String eDate = "";
  String description = "Thish ish some bullshit description";
  bool isCurrentPosition = false;


  // Update form data functions (replace with actual data update logic)
  void updateJobTitle(String? jobTitle) =>
      setState(() => jobTitle = (jobTitle ?? jobTitle)!);

  void updateCompany(String? company) =>
      setState(() => company = (company ?? company)!);

  void startDate(String? sDate) => setState(() => sDate = (sDate ?? sDate)!);

  void endDate(String? eDate) => setState(() => eDate = (eDate ?? eDate)!);

  void updateDescription(String? description) => setState(() => description = (description ?? description)!);

  void updateCurrentPosition(bool? isCurrentPosition) => setState(() => isCurrentPosition = (isCurrentPosition ?? isCurrentPosition)!);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center About Me text
            const Center(
              child: Text(
                'Work Experience',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Editable form
            formField('Job Title', jobTitle, updateJobTitle),
            formField('Last Name', company, updateCompany),
            doubleFormField('Start Date', sDate, startDate, 'End Date', eDate, endDate),
            Row(
              children: [
                Checkbox(
                  value: isCurrentPosition, // Set initial value
                  onChanged: updateCurrentPosition, // Handle value change
                ),
                const Text(
                  "Current Position",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            descriptionFormField(label: "Description", value:  description, onSaved: updateDescription),
            const SizedBox(height: 16.0),

          ],
        ),
      ),
    );
  }


}
