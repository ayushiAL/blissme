import 'package:flutter/material.dart';

import 'auth_controller.dart';

class HomePage1 extends StatefulWidget {
  final String text;

  const HomePage1({Key? key, required this.text}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  AuthController authController=AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(widget.text),
          ),
          ElevatedButton(
            onPressed: () {
              authController.userData(context);
            },
            child: Text(
              "GetUserData",
              style: TextStyle(color: Colors.black),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xffF8F8F8))),
          )
        ],
      ),
    );
  }
}
