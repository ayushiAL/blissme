import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final clickOnLogin;
  final String text;
  final double widthSize;
  final void Function() navigation;
  const CustomButton({
    Key? key,
    required this.text,  required this.widthSize, required this.navigation, this.clickOnLogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: navigation,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xff1D1B44)),
        elevation: MaterialStateProperty.all(0),
        fixedSize: MaterialStateProperty.all(
            Size(MediaQuery.of(context).size.width * 0.7, widthSize)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          fontFamily: "Roboto",
        ),
      ),
    );
  }
}
