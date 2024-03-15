import 'package:flutter/material.dart';

class WorkExperienceView extends StatelessWidget {
  const WorkExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center About Me text
            Center(
              child: Text(
                'Work Experience',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Editable form
            // formField('Job Title', jobTitle, updateJobTitle),
            // formField('Last Name', company, updateCompany),
            // doubleFormField(
            //     'Start Date', sDate, startDate, 'End Date', eDate, endDate),
            // Row(
            //   children: [
            //     Checkbox(
            //       value: isCurrentPosition, // Set initial value
            //       onChanged: updateCurrentPosition, // Handle value change
            //     ),
            //     const Text(
            //       "Current Position",
            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 16.0),
            // descriptionFormField(
            //     label: "Description",
            //     value: description,
            //     onSaved: updateDescription),
            // const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
