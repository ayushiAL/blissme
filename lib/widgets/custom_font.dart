import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomFont extends StatelessWidget {
  final String text;
  const CustomFont({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 20,
        fontFamily: "Roboto",
      ),
    );
  }
}

class CustomFont1 extends StatelessWidget {
  final String text;
  final double fontSize;
  const CustomFont1({Key? key, required this.text, required this.fontSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        fontFamily: "Roboto",
      ),
    );
  }
}
