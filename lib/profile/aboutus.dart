import 'package:flutter/material.dart';
import 'package:poseapp/common/color2.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backscreen,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bluescreen,
        title: const Text(
          'About Us',
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to Our Fitness App!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                'Our mission is to help you achieve your fitness goals through personalized exercise plans, real-time feedback, and a supportive community. We believe that everyone can lead a healthier life, and we are here to support you on your journey.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                'Features:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 8),
              const Text(
                '- Personalized workout plans\n'
                '- Real-time feedback on exercises\n'
                '- Community support and motivation\n'
                '- Progress tracking and goal setting',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                'Thank you for choosing us to be a part of your fitness journey! We look forward to helping you reach your goals.',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
