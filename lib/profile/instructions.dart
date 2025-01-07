import 'package:flutter/material.dart';
import 'package:poseapp/common/color2.dart';

class InstructionsScreen extends StatelessWidget {
  const InstructionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backscreen,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bluescreen,
        title: const Text(
          'Instructions',
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
      body: SingleChildScrollView(
        // Added this widget
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'How to Use the Fitness App',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                '1. Place your phone on a stable surface, ensuring the camera can capture your full body for real-time feedback.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                '2. Customize your profile by entering your weight, height, age, and activity level to get personalized workout recommendations.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                '3. Choose an exercise from the provided list. The app tracks repetitions, form, and provides instant feedback.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                '4. Follow the guided workout instructions displayed on the screen. Adjust your form based on the feedback provided.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                '5. Monitor your progress through your profile to stay motivated and achieve your fitness goals.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                '6. Ensure proper lighting and avoid any obstructions in the camera’s field of view for accurate pose detection.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
