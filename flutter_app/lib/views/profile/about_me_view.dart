import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/about_me_controller.dart';
import '../../widgets/form_text_field.dart';

class UserPersonalDetailPage extends StatelessWidget {
  const UserPersonalDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    AboutMeController controller = Get.put(AboutMeController());

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('About me'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Editable form
                formTextField(
                    label: 'First Name',
                    controller: controller.firstNameController,
                    withFloatingLabel: false),
                const SizedBox(height: 24.0),
                // formField('Last Name', lastName, updateLastName),
                // formField('Date of Birth (DD/MM/YYYY)', dob, updateDob),
                // formField('Email', email, updateEmail),
                // buildMobileNumberField(
                //     countryCode, phoneNumber, updateCountryCode, updatePhoneNumber),
                // const SizedBox(height: 16.0),
                //
                // // Links section
                // const Text(
                //   'Links',
                //   style: TextStyle(
                //     fontSize: 16.0,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // Column(
                //   children: [
                //     ...["Hello", "world"].map((link) => buildLink(link, addLink)),
                //   ],
                // ),
                // ElevatedButton.icon(
                //   onPressed: () => addLink(''),
                //   label: const Text('Add Link'),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.white12,
                //   ),
                //   icon: const Icon(CupertinoIcons.add_circled_solid),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable link widget
  Widget buildLink(String value, void Function(String?)? onSaved) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              initialValue: value,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              ),
              onSaved: onSaved,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.remove_circle),
            onPressed: () => {}, // delete
          ),
        ],
      ),
    );
  }

  // Reusable mobile number field
  Widget buildMobileNumberField(
      String code,
      String number,
      void Function(String?) onCodeChange,
      void Function(String?)? onNumberChange) {
    return Row(
      children: [
        DropdownButton<String>(
          value: code,
          items: const [
            DropdownMenuItem(
              value: "+1",
              child: Text("+1 (US)"),
            ),
            DropdownMenuItem(
              value: "+94",
              child: Text("+94 (LK)"),
            ),
            // Add more countries as needed
          ],
          onChanged: onCodeChange,
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: TextFormField(
            initialValue: number,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.phone,
            onSaved: onNumberChange,
          ),
        ),
      ],
    );
  }
}
