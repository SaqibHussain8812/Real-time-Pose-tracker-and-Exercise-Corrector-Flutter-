import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:poseapp/home/exercise.dart';
import 'package:poseapp/home/home_screen.dart';
import 'package:poseapp/login/login.dart';
import 'package:poseapp/login/signup.dart';
import 'package:poseapp/login/success.dart';
import 'package:poseapp/profile/aboutus.dart';

import 'package:poseapp/profile/instructions.dart';
import 'package:poseapp/profile/setting_screen.dart';
import 'package:poseapp/profile/personal/image_helper.dart';
import 'package:poseapp/profile/account_screen.dart';
import 'package:poseapp/progress/prog.dart';
import 'package:poseapp/screens/activity_level.dart';
import 'package:poseapp/screens/age.dart';
import 'package:poseapp/screens/gender.dart';
import 'package:poseapp/screens/goal.dart';
import 'package:poseapp/screens/height.dart';
import 'package:poseapp/screens/select_exercise.dart';
import 'package:poseapp/screens/weight.dart';
import 'package:poseapp/start.dart';

import 'package:poseapp/screens/user_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SQLite database
  await DBHelper.initDB();

  // Initialize Firebase
  await Firebase.initializeApp();

  // Load persisted user profile data
  final userProfile = UserProfile();
  await userProfile.loadFromDatabase();

  runApp(MyApp(userProfile: userProfile));
}

class MyApp extends StatelessWidget {
  final UserProfile userProfile;

  const MyApp({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const StartScreen(),
        "/login": (context) => const LoginScreen(),
        "/gender": (context) => const GenderScreen(),
        "/age": (context) => const AgeScreen(),
        "/weight": (context) => const WeightScreen(),
        "/height": (context) => const HeightScreen(),
        "/goal": (context) => const GoalScreen(),
        "/activitylevel": (context) => const ActivityLevel(),
        "/home": (context) => const HomeScreen(),
        "/exercise": (context) => const ExerciseScreen(),
        "/signup": (context) => const SignupScreen(),
        "/select": (context) => const SelectExercise(),
        "/mainprofile": (context) => const AccountPage(),
        "/personalinfo": (context) => const SettingsScreen(),
        "/progress": (context) => const StatsScreen(),
        "/aboutus": (context) => const AboutUs(),
        "/Instructions": (context) => const InstructionsScreen(),
        "/accountsucess": (context) => AccountSuccessScreen(),
      },
      initialRoute: "/",
      title: 'Fitness App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
