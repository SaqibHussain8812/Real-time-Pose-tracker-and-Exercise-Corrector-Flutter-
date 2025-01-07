import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:poseapp/common/color2.dart';
import 'package:poseapp/login/login.dart';
import 'package:poseapp/models/buttons.dart';

class SignOutScreen extends StatelessWidget {
  const SignOutScreen({super.key});

  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backscreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Are you sure you want to sign out?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            MyButtons(
              onTap: () => _signOut(context),
              text: "Sign Out",
            ),
            MyButtons(
              onTap: () {
                Navigator.pop(context);
              },
              text: "Cancel",
            ),
          ],
        ),
      ),
    );
  }
}
