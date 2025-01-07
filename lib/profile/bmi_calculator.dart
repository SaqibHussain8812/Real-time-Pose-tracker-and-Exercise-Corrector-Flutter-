import 'package:flutter/material.dart';
import 'package:poseapp/common/color2.dart';
import 'package:poseapp/models/buttons.dart';
import 'dart:math'; // For BMI calculation
import 'package:poseapp/screens/user_profile.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  late double bmi;
  late String bmiCategory;
  late String suggestion;

  @override
  void initState() {
    super.initState();
    calculateBmi(); // Calculate BMI on initialization
  }

  void calculateBmi() {
    final userData = UserProfile();
    final double userWeight = userData.weight ?? 60.0; // Default weight if null
    final double userHeight = (userData.height != null)
        ? double.parse(userData.height!) / 100
        : 1.6; // Default height in meters if null

    bmi = userWeight / pow(userHeight, 2); // BMI formula

    if (bmi < 18.5) {
      bmiCategory = "Underweight";
      suggestion =
          "Focus on gaining weight with a balanced diet and strength training.";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      bmiCategory = "Normal weight";
      suggestion = "Great job! Maintain your current healthy lifestyle.";
    } else if (bmi >= 25 && bmi < 29.9) {
      bmiCategory = "Overweight";
      suggestion = "Consider a mix of cardio exercises and a balanced diet.";
    } else {
      bmiCategory = "Obesity";
      suggestion = "Consult a healthcare professional for personalized advice.";
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backscreen, // Dark background
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bluescreen,
        title: const Text(
          'BMI Calculator',
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
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.05,
          horizontal: size.width * 0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your BMI Result",
              style: TextStyle(
                fontSize: size.height * 0.04,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              bmi.toStringAsFixed(1), // Display BMI value
              style: TextStyle(
                fontSize: size.height * 0.06,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              "Category: $bmiCategory", // Display BMI category
              style: TextStyle(
                fontSize: size.height * 0.03,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Text(
              suggestion, // Provide suggestions based on the BMI
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.height * 0.025,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: size.height * 0.1),
            MyButtons(onTap: () => Navigator.pop(context), text: "Back")
          ],
        ),
      ),
    );
  }
}
