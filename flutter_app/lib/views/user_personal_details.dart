import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/form_field.dart';

class UserPersonalDetailPage extends StatefulWidget {
  const UserPersonalDetailPage({super.key});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserPersonalDetailPage> {
  // User profile data (replace with your data model)
  String firstName = "";
  String lastName = "";
  String dob = "";
  String email = "";
  String countryCode = "+1"; // Default country code
  String phoneNumber = "";
  List<String> links = [
    "Link1",
    "Link2",
    "Link3",
  ];


  // Update form data functions (replace with actual data update logic)
  void updateFirstName(String? name) =>
      setState(() => firstName = (name ?? name)!);

  void updateLastName(String? name) =>
      setState(() => lastName = (name ?? name)!);

  void updateDob(String? date) => setState(() => dob = (date ?? date)!);

  void updateEmail(String? mail) => setState(() => email = (mail ?? mail)!);

  void updateCountryCode(String? code) =>
      setState(() => countryCode = (code ?? code)!);

  void updatePhoneNumber(String? number) =>
      setState(() => phoneNumber = (number ?? number)!);

  void addLink(String? link) => setState(() => links.add((link ?? link)!));

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
                'About Me',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Editable form
            formField('First Name', firstName, updateFirstName),
            formField('Last Name', lastName, updateLastName),
            formField('Date of Birth (DD/MM/YYYY)', dob, updateDob),
            formField('Email', email, updateEmail),
            buildMobileNumberField(
                countryCode, phoneNumber, updateCountryCode, updatePhoneNumber),
            const SizedBox(height: 16.0),

            // Links section
            const Text(
              'Links',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: [
                ...["Hello", "world"].map((link) => buildLink(link, addLink)),
              ],
            ),
            const SizedBox(height: 8.0),
            ElevatedButton.icon(
              onPressed: () => addLink(''),
              label: const Text('Add Link'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white12,
              ),
              icon: const Icon(CupertinoIcons.add_circled_solid),
            ),
          ],
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
