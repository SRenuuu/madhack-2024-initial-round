import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/views/user_experience_view.dart';
import 'package:flutter_app/views/user_personal_details.dart';


import 'job_listing_view.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);
  static const TextStyle boldTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20
  );


  @override
  Widget build(BuildContext context) {
    List<ProfileSection> profileSections = [
      ProfileSection(title: 'About Me', icon: CupertinoIcons.profile_circled, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const UserPersonalDetailPage()))),
      ProfileSection(title: 'Work Experience', icon: CupertinoIcons.briefcase, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const UserExperiencePage()))),
      ProfileSection(title: 'Education', icon: CupertinoIcons.book, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => JobListingPage()))),
      ProfileSection(title: 'Skills', icon: CupertinoIcons.hand_draw, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => JobListingPage()))), // Corrected typo
      ProfileSection(title: 'Qualifications', icon: CupertinoIcons.gear, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => JobListingPage()))),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 24.0),
            ...profileSections.map((section) => _buildProfileSectionCard(
              title: section.title,
              icon: section.icon,
              onTap: section.onTap,
            )).toList(),
          ],
        ),
      )
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        const CircleAvatar(
          radius: 60.0,
          backgroundImage: NetworkImage("https://foyr.com/learn/wp-content/uploads/2021/08/modern-office-design.png"), // Replace with user's profile image
        ),
        const SizedBox(height: 8.0),
        const Text(
          'John Doe',
          style: boldTextStyle,
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          width: 160,
          height: 40,
          child: ElevatedButton.icon(
            onPressed: () => {}, // Handle edit button press (navigate to edit page)
            label: const Text('Edit Details'),
            icon: const Icon(CupertinoIcons.pencil_ellipsis_rectangle),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black12,
            ),

          ),
        ),
      ],
    );
  }

  Widget _buildProfileSectionCard({
    required String title,
    required IconData icon,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, size: 28.0),
                  const SizedBox(width: 16.0),
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                ],
              ),
              const Icon(CupertinoIcons.plus_circled, size: 28.0),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileSection {
  final String title;
  final IconData icon;
  final VoidCallback? onTap; // Optional callback for tap functionality

  ProfileSection({required this.title, required this.icon, this.onTap});
}
