import 'dart:ui';

import 'package:blissme/todo_app/screens/home_page.dart';
import 'package:blissme/todo_app/screens/phone_auth.dart';
import 'package:blissme/todo_app/screens/sign_in.dart';
import 'package:blissme/todo_app/service/auth_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool circular = false;
  AuthClass authClass = AuthClass();

  Future<void> userData() async {
    setState(() {
      circular = true;
    });
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: emailcontroller.text, password: passwordController.text);
      print(userCredential.user!.email);
      setState(() {
        circular = false;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        circular = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              button('https://wallpapercave.com/wp/wp2860517.jpg',
                  'Continue with Google', () {
                authClass.signup(context);
              }),
              const SizedBox(
                height: 15,
              ),
              button(
                  'https://seeklogo.com/images/W/whatsapp-logo-A5A7F17DC1-seeklogo.com.png',
                  'Continue with mobile', () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const PhoneAuthScreen()));
              }),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Or",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              textItem(emailcontroller, "Email..", false),
              const SizedBox(
                height: 15,
              ),
              textItem(passwordController, "password", true),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  userData();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 90,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(colors: [
                      Colors.pinkAccent,
                       Color.fromARGB(255, 157, 125, 213),
                      Colors.pinkAccent
                    ]),
                  ),
                  child: circular
                      ? const CircularProgressIndicator()
                      : const Text(
                          "Sign Up",
                          style:  TextStyle(fontSize: 18),
                        ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "If you already have an Account ?",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const SignIn()));
                    },
                    child: const Text(
                      " LogIn",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget button(String img, String name, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 60,
        height: 60,
        child: Card(
          color: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.grey, width: 2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                img,
                height: 35,
                width: 35,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                name,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textItem(
      TextEditingController controller, String text, bool obscureText) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: text,
            labelStyle: const TextStyle(color: Colors.white, fontSize: 17),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 1, color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(width: 1, color: Colors.grey),
            )),
      ),
    );
  }
}
