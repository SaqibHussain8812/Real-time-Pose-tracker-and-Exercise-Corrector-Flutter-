import 'package:flutter/material.dart';
import 'package:poseapp/common/color2.dart';

class EmailUs extends StatelessWidget {
  const EmailUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backscreen,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bluescreen,
        title: const Text(
          'Email Us',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'If you have any issues or questions, please contact us at:',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'support@example.com',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'We are here to help you with any problems you might encounter while using our app. Your feedback is valuable to us!',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
