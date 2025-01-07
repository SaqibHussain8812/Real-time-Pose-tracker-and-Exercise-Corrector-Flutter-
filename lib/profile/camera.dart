import 'package:flutter/material.dart';
import 'package:poseapp/common/color2.dart';
import 'package:poseapp/models/buttons.dart';

class CamereGround extends StatefulWidget {
  final Widget nextScreen;

  const CamereGround({super.key, required this.nextScreen});

  @override
  State<CamereGround> createState() => _CamereGroundState();
}

class _CamereGroundState extends State<CamereGround> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backscreen,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Please place your phone\non the ground",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.1),
                // Image
                Container(
                  height: 220,
                  width: 220,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/56717.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                SizedBox(height: size.height * 0.09),

                const Text(
                  "Be Ready to Do Exercise",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.09),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: MyButtons(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => widget.nextScreen,
                        ),
                      );
                    },
                    text: "Get Started",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
