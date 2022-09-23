import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String text;
  const HomePage({Key? key, required this.text}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(""),
      ),
    );
  }
}
