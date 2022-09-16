import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: const InputDecoration(
            focusColor: Colors.black,
            filled: true,
            border: InputBorder.none,
            fillColor: Color(0xffF8F8F8)));
  }
}
