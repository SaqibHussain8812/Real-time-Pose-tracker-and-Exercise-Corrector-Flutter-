import 'package:flutter/material.dart';
import 'package:poseapp/common/color2.dart';

class PageTitle extends StatelessWidget {
  final String text;
  final String title;
  final Color color;
  const PageTitle(
      {super.key,
      required this.text,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double paddingValue = screenWidth * 0.08;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.1,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            //"What's your gender",

            style: const TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: paddingValue),
          child: Text(
            text,
            style: TextStyle(
              color: textcolor,
              fontSize: screenWidth * 0.04,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
