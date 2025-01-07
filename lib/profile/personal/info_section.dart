import 'package:flutter/material.dart';
import 'package:poseapp/profile/personal/row_info.dart';
import 'package:poseapp/profile/user_service.dart';
import 'package:poseapp/screens/user_profile.dart';

class InfoSection extends StatefulWidget {
  const InfoSection({super.key});

  @override
  State<InfoSection> createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  String name = '';
  String email = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    try {
      Map<String, String> userInfo = await UserService().getUserInfo();
      setState(() {
        name = userInfo['name'] ?? 'Unknown Name';
        email = userInfo['email'] ?? 'Unknown Email';
      });
    } catch (e) {
      setState(() {
        name = 'Error';
        email = 'Error';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = UserProfile();
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoRow(label: 'Name', value: name),
              InfoRow(label: 'Email', value: email),
              InfoRow(
                  label: 'Gender', value: profile.gender ?? "Not specified"),
              InfoRow(label: 'Age', value: profile.age ?? "Not specified"),
              InfoRow(
                  label: 'Height', value: profile.height ?? "Not specified"),
              InfoRow(
                  label: 'Weight',
                  value: profile.weight?.toString() ?? "Not specified"),
              InfoRow(
                  label: 'Activity Level',
                  value: profile.activity ?? "Not specified"),
            ],
          );
  }
}
