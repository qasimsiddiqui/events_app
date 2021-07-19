import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final double letterspacing;

  CustomText(
      {required this.text,
      this.size = 20,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.letterspacing = 1});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterspacing,
      ),
    );
  }
}
