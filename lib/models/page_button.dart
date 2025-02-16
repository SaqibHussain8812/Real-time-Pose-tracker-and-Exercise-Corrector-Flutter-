import 'package:flutter/material.dart';
import 'package:poseapp/common/color2.dart';

class PageButton extends StatelessWidget {

  final String text;
  final VoidCallback onTap;
  final bool showBackButton;
  final VoidCallback? onBackTap;

  const PageButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.showBackButton = false,
      this.onBackTap});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        if (showBackButton)
          GestureDetector(
            onTap: onBackTap,
            child: Container(
              margin: EdgeInsets.only(
                top: size.height * 0.02,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
              ),
              height: size.height * 0.07,
              child: Center(
                child: Text( 
                  "Back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.05,
                  ),
                ),
              ),
            ),
          ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: kFirstColor,
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.only(
              top: size.height * 0.02,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
            ),
            height: size.height * 0.07,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.05,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}