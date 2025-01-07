import 'package:flutter/material.dart';
import 'package:poseapp/common/color2.dart';


class TextContainer extends StatelessWidget {
  const TextContainer(
      {super.key,
      required this.icon,
      required this.title1,
      required this.title2});
  final IconData icon;
  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
        color: cardcolor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: text1,
              size: 40,
            ),
           
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title1,
                    style: const TextStyle(color: text1, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    title2,
                    style: const TextStyle(color: textcolor, fontSize: 15),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
