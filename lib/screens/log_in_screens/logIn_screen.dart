import 'dart:ui';

import 'package:blissme/screens/log_in_screens/choose_interests_screen.dart';
import 'package:blissme/screens/log_in_screens/create_account_screen.dart';
import 'package:blissme/widgets/custom_font.dart';
import 'package:blissme/widgets/custom_textfield.dart';
import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../widgets/custom_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  int countryCode = 91;
  TextEditingController numberController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;


  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      if (result != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreateAccountScreen()));
      }
    }
  }
  // Future<void> signup(BuildContext context) async {
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  //   final GoogleSignInAccount? googleSignInAccount =
  //       await _googleSignIn.signIn();
  //   if (googleSignInAccount != null) {
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount.authentication;
  //     final AuthCredential authCredential = GoogleAuthProvider.credential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken);

  //     // Getting users credential
  //     UserCredential result = await auth.signInWithCredential(authCredential);
  //     if (result != null) {
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => CreateAccountScreen()));
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        alignment: Alignment.center,
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: const [CustomFont(text: "Login")],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22, bottom: 40),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode:
                                    true, // optional. Shows phone code before the country name.
                                onSelect: (Country country) {
                                  countryCode = int.parse(country.phoneCode);
                                },
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 10),
                              height: 48,
                              width: 70,
                              color: Color(0xffF8F8F8),
                              child: Text('+$countryCode'),
                            ),
                          ),
                          Expanded(
                              child: CustomTextField(
                            controller: numberController,
                            setText: (text) {},
                          )),
                        ],
                      ),
                    ),
                    CustomButton(
                        text: 'Continue',
                        widthSize: 45,
                        navigation: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InterestScreen(
                                      )));
                        }),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 25,
                          child: Divider(
                            thickness: 1,
                            color: Colors.black,
                            // endIndent: 50,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: CustomFont(
                            text: 'Or Sign Up With',
                          ),
                        ),
                        SizedBox(
                          width: 25,
                          child: Divider(
                            thickness: 1,
                            color: Colors.black,
                            // endIndent: 50,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () {
                                    signup(context);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    elevation: MaterialStateProperty.all(2),
                                    fixedSize:
                                        MaterialStateProperty.all(Size(12, 50)),
                                  ),
                                  child: SizedBox(
                                    child: Image.asset(
                                      height: 30,
                                      'assets/images/google_icon.png',
                                    ),
                                  ))),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 24, 84, 161)),
                              elevation: MaterialStateProperty.all(2),
                              fixedSize:
                                  MaterialStateProperty.all(Size(12, 50)),
                            ),
                            child: Image.asset(
                              'assets/images/Facebook_Logo.png',
                            ),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    elevation: MaterialStateProperty.all(2),
                                    fixedSize:
                                        MaterialStateProperty.all(Size(12, 50)),
                                  ),
                                  child: Image.asset(
                                    'assets/images/i_icon.png',
                                  )))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Dont have an account ?',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        fontFamily: "Roboto",
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateAccountScreen()));
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontFamily: "Roboto",
                          ),
                        ))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
