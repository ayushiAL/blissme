import 'package:blissme/todo_app/screens/home_page.dart';
import 'package:blissme/todo_app/screens/sign_in.dart';
import 'package:blissme/todo_app/screens/sign_up.dart';
import 'package:blissme/todo_app/service/auth_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainScreenDemo extends StatefulWidget {
  const MainScreenDemo({Key? key}) : super(key: key);

  @override
  State<MainScreenDemo> createState() => _MainScreenDemoState();
}

class _MainScreenDemoState extends State<MainScreenDemo> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Widget currentPage = SignUp();
  AuthClass authClass = AuthClass();

  void checkLogin() async {
    String? token = await authClass.getToken();

    if (token != null) {
      currentPage = HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: currentPage,
    );
  }
}
