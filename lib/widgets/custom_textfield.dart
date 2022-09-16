import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.controller,
    required this.setText,
  }) : super(key: key);

  final TextEditingController controller;
  final keys = GlobalKey<FormState>();
  final Function setText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: keys,
      controller: controller,
      onChanged: (value) {
        setText(value);
      },
      cursorColor: Colors.black,
      decoration: const InputDecoration(
          focusColor: Colors.black,
          filled: true,
          border: InputBorder.none,
          fillColor: Color(0xffF8F8F8)),
    );
  }
}
