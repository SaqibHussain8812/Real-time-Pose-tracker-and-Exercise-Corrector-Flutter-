import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poseapp/common/color2.dart';
import 'package:poseapp/models/buttons.dart';
import 'package:poseapp/models/snackbar.dart';
import 'package:poseapp/models/text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
 

  @override
  Widget build(BuildContext context) {
  //   var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backscreen,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Forgot Your Password",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white
              ),
            ),
            const SizedBox(height: 70),
            TextFieldInput(textEditingController: emailController, hintText: "e.g., abc@gmail.com", textInputType: TextInputType.emailAddress,
            ),
            
             const SizedBox(height: 15),
            MyButtons(onTap: () async {
                await auth
                    .sendPasswordResetEmail(email: emailController.text)
                    .then((value) {
                  showSnackBar(context,
                      "We have sent you the reset password link to your email. Please check it.");
                }).onError((error, stackTrace) {
                  showSnackBar(context, error.toString());
                });
                Navigator.pop(context);
                emailController.clear();
              }, text: "Send"),
           
            
            MyButtons(onTap: (){
                  Navigator.pop(context);
                }, text: "Back"),
            
          ],
        ),
      ),
    );
  }
}
