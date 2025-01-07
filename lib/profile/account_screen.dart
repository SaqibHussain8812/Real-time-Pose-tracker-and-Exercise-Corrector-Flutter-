import 'package:flutter/material.dart';
import 'package:poseapp/common/bottom_navigation.dart';
import 'package:poseapp/common/color2.dart';
import 'package:poseapp/models/buttons.dart';
import 'package:poseapp/profile/personal/info_section.dart';
import 'package:poseapp/profile/personal/profile_image_picker.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backscreen,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bluescreen,
        title: const Text(
          'Account',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: MyBottomNavigation(),
      body: SingleChildScrollView(
        // Added this widget
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileImagePicker(),
              const SizedBox(height: 10),
              const Divider(),
              const InfoSection(),
              const SizedBox(height: 10), // Added `const` here for consistency
              Center(
                child: MyButtons(
                  onTap: () {
                    Navigator.pushNamed(context, "/gender");
                  },
                  text: "Update",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
