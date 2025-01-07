import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:poseapp/common/color2.dart';
import 'package:poseapp/login/signup.dart';
import 'package:poseapp/models/buttons.dart';
import 'package:poseapp/models/snackbar.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  bool isLoading = false;

  Future<void> _deleteAccount() async {
    setState(() {
      isLoading = true;
    });

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .delete();

        await user.reload();

        await user.delete();

        showSnackBar(context, "Account deleted successfully.");

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const SignupScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        showSnackBar(context, 'Please log in again to delete your account.');
      } else {
        showSnackBar(context, e.message ?? 'Failed to delete account.');
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backscreen,
      body: Center(
        child: isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(
                      strokeWidth: 8,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.white70,
                      ),
                      backgroundColor: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Deleting your account...",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Are you sure you want to delete your account?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  MyButtons(
                    onTap: _deleteAccount,
                    text: "Delete Account",
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
