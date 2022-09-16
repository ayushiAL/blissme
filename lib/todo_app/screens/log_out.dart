import 'package:blissme/screens/log_in_screens/logIn_screen.dart';
import 'package:blissme/todo_app/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:async';
import 'package:flutter/src/widgets/framework.dart';

import '../service/auth_class.dart';

class LogOutScreen extends StatefulWidget {
  const LogOutScreen({Key? key}) : super(key: key);

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  AuthClass authClass = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
             setState(() {
               authClass.logOut();
             });
            },
            child: Icon(
              Icons.logout,
              color: Colors.black,
            )),
      ),
    );
  }
}
