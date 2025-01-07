import 'package:flutter/material.dart';
import 'package:poseapp/common/bottom_navigation.dart';
import 'package:poseapp/common/color2.dart';

import 'package:poseapp/profile/aboutus.dart';
import 'package:poseapp/profile/bmi_calculator.dart';
import 'package:poseapp/profile/delete_account.dart';
import 'package:poseapp/profile/emil_us.dart';
import 'package:poseapp/profile/account_screen.dart';
import 'package:poseapp/profile/instructions.dart';
import 'package:poseapp/profile/sign_out_app.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backscreen,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bluescreen,
        title: const Text(
          'Setting',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigation(),
      body: ListView(
        children: [
          _buildListItem(
              context, Icons.person, 'Personal Info', const SettingsScreen()),
          _buildListItem(context, Icons.person_search_outlined, 'About Us',
              const AboutUs()),
          _buildListItem(context, Icons.assignment, 'Instructions',
              const InstructionsScreen()),
          _buildListItem(
              context, Icons.monitor_weight, 'BmiCalulator', BmiCalculator()),
          _buildListItem(context, Icons.logout, 'Sign out', SignOutScreen()),
          _buildListItem(
              context, Icons.delete, 'Delete account', DeleteAccountScreen()),
          _buildListItem(context, Icons.email, 'Email Us', const EmailUs()),
        ],
      ),
    );
  }

  Widget _buildListItem(
      BuildContext context, IconData icon, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
