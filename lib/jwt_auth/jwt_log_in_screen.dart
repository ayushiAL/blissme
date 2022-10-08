import 'package:blissme/jwt_auth/auth_controller.dart';
import 'package:flutter/material.dart';

class JwtLogInScreen extends StatefulWidget {
  const JwtLogInScreen({Key? key}) : super(key: key);

  @override
  State<JwtLogInScreen> createState() => _JwtLogInScreenState();
}

class _JwtLogInScreenState extends State<JwtLogInScreen> {

   AuthController authController=AuthController();
   // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: AuthController.userName,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  focusColor: Colors.black,
                  filled: true,
                  hintText: "Username",
                  border: InputBorder.none,
                  fillColor: Color(0xffF8F8F8)),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: AuthController.password,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                hintText: "Password",
                  focusColor: Colors.black,
                  filled: true,
                  border: InputBorder.none,
                  fillColor: Color(0xffF8F8F8)),
            ),
            ElevatedButton(onPressed: (){
              authController.loginUser(context,);
            }, child: Text("LogIn",style: TextStyle(color: Colors.black),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xffF8F8F8))),)
          ],
        ),
      ),
    );
  }
}
