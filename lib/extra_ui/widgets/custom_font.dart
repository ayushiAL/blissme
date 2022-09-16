import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color colors;
  const CustomText(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.fontWeight, required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: colors,
          fontFamily: "poppins",
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}
