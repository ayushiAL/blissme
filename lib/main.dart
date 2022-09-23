import 'package:blissme/extra_ui/screens/service_screen.dart';
import 'package:blissme/jwt_auth/jwt_log_in_screen.dart';
import 'package:blissme/todo_app/screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/all_screen/demo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JwtLogInScreen(),
    ),
  );
}
