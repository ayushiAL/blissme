import 'package:blissme/extra_ui/screens/service_screen.dart';
import 'package:blissme/jwt_auth/jwt_log_in_screen.dart';
import 'package:blissme/video_player_demo/example.dart';
import 'package:blissme/video_player_demo/main_videoPlay.dart';

import 'package:blissme/video_player_demo/video_player_demo_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/all_screen/demo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainVideoPlay(),
    ),
  );
}
