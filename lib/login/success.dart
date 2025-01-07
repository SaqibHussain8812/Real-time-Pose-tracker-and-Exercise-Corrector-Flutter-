import 'package:flutter/material.dart';
import 'package:poseapp/common/color2.dart';

import 'package:poseapp/models/buttons.dart';
import 'package:poseapp/screens/gender.dart';

class AccountSuccessScreen extends StatelessWidget {
  const AccountSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backscreen,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  padding: EdgeInsets.all(20),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  "Account Successfully Created",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "You have successfully created your account. You can now explore the app.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white38,
                  ),
                ),
                SizedBox(height: 40),
                MyButtons(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GenderScreen(),
                        ),
                      );
                    },
                    text: "Continue")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
