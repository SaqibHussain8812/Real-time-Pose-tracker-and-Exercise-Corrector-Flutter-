import 'package:flutter/material.dart';
import 'package:poseapp/common/bottom_navigation.dart';
import 'package:poseapp/common/color2.dart';
import 'package:poseapp/home/workout_data.dart';
import 'package:poseapp/profile/camera.dart';

import 'package:poseapp/workout/workoutscreen.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final int upperExercise = round1.length;

  int _extractSeconds(String subtitle) {
    // Extract seconds from the subtitle in format "00:25"
    final timeParts = subtitle.split(':');
    return int.parse(timeParts[0]) * 60 + int.parse(timeParts[1]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backscreen,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: bluescreen,
          title: const Text(
            "WORKOUT",
            style: TextStyle(color: text1),
          ),
          leading: TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            label: const Icon(Icons.arrow_back),
          )),
      bottomNavigationBar: const MyBottomNavigation(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Stack(children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 15, right: 10),
                    width: double.infinity,
                    height: 240,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/images/4784.jpg"),
                          fit: BoxFit.fill),
                      color: cardcolor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Body\nBuild-Up",
                          style: TextStyle(
                              color: text1,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Don't rush these exercises.",
                          style: TextStyle(
                            color: text1,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  " $upperExercise Exercises",
                  style: const TextStyle(
                      color: text1, fontWeight: FontWeight.bold, fontSize: 25),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: round1.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // Extract seconds from the subtitle
                        final seconds =
                            _extractSeconds(round1[index]['subtitle']);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CamereGround(
                              nextScreen:
                                  WorkoutScreen(initialSeconds: seconds),
                            ),
                          ),
                        );
                      },
                      child: ListTile(
                        isThreeLine: true,
                        leading: Container(
                          width: 90.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(round1[index]['leading'][0]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        title: Text(round1[index]['title'],
                            style: const TextStyle(
                              color: Colors.white,
                            )),
                        subtitle: Text(
                          '${round1[index]['subtitle']}\n${round1[index]['leading'][1]}',
                          style: const TextStyle(color: textcolor),
                        ),
                        trailing: round1[index]['trailing'],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
