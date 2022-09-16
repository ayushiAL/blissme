import 'dart:async';

import 'package:blissme/screens/log_in_screens/logIn_screen.dart';
import 'package:blissme/screens/log_in_screens/spalsh_screen.dart';
import 'package:country_picker/country_picker.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class FirebaseOtp extends StatefulWidget {
  const FirebaseOtp({Key? key}) : super(key: key);

  @override
  _FirebaseOtpState createState() => _FirebaseOtpState();
}

class _FirebaseOtpState extends State<FirebaseOtp> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController number = TextEditingController();
  TextEditingController otpField = TextEditingController();

  String? verificationId;
  int? forceResendingToken;
  bool showResend = false;
  bool isLoad = false;
  int countryCode = 91;
  bool isVisible = false;
  bool isVerifyOtp = false;
  final keys = GlobalKey<FormState>();
  Timer? timer;
  int second = 60;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (second <= 60) {
        if (second == 1) {
          setState(() {
            timer.cancel();
            showResend = true;
          });
        }
        setState(() {
          second--;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.brown[900],
            height: 55 + MediaQuery.of(context).padding.top,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                "Verify Otp",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Ryefonts', fontSize: 20),
              ),
            ),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Verify Otp",
                  style: TextStyle(
                      fontFamily: 'Ryefonts',
                      fontSize: 27,
                      color: Colors.black),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            showPhoneCode: true,
                            // optional. Shows phone code before the country name.
                            onSelect: (Country country) {
                              countryCode = int.parse(country.phoneCode);
                            },
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 65,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black)),
                          child: Text(
                            "+$countryCode",
                            style: TextStyle(
                                color: Colors.brown[900],
                                fontFamily: 'Ryefonts',
                                fontSize: 17),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Form(
                          key: keys,
                          child: TextFormField(
                            validator: (value) {
                              if (value?.length != 10) {
                                return "Enter valid number";
                              }
                            },
                            cursorHeight: 22,
                            style: TextStyle(
                                color: Colors.brown[900],
                                fontFamily: 'Ryefonts',
                                fontSize: 17),
                            keyboardType: TextInputType.number,
                            controller: number,
                            decoration: InputDecoration(
                                labelText: "Mobile Number",
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Ryefonts',
                                    fontSize: 14),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                isVisible == true
                    ? Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                cursorHeight: 22,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Ryefonts',
                                    fontSize: 17),
                                keyboardType: TextInputType.number,
                                controller: otpField,
                                decoration: InputDecoration(
                                    labelText: "Verify Otp",
                                    labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Ryefonts',
                                        fontSize: 14),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black))),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                if (showResend == true) {
                                  phoneSignIn(int.parse(number.text));
                                  setState(() {
                                    showResend = false;
                                    second = 60;
                                    startTimer();
                                  });
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 60,
                                width: 115,
                                decoration: BoxDecoration(
                                  color: showResend == true
                                      ? Colors.black
                                      : Colors.grey.withOpacity(0.45),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: showResend == true
                                    ? Text(
                                        "Resend",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Ryefonts',
                                            fontSize: 15),
                                      )
                                    : Text(
                                        "($second) Resend",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Ryefonts',
                                            fontSize: 13),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                isVerifyOtp == false
                    ? InkWell(
                        onTap: () async {
                          if (keys.currentState?.validate() == true) {
                            phoneSignIn(int.parse(number.text));
                            FocusScope.of(context).unfocus();
                            setState(() {
                              isLoad = true;
                            });
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 135,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "Send Otp",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Ryefonts',
                                fontSize: 18),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            isLoad = true;
                          });
                          verifyOtp();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 135,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "Verify Otp",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Ryefonts',
                                fontSize: 18),
                          ),
                        ),
                      )
              ],
            ),
          )),
          isLoad
              ? Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  void showInSnackBar(String value) {}

  phoneSignIn(int phone) async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+$countryCode$phone",
      verificationCompleted: _onVerificationCompleted,
      verificationFailed: _onVerificationFailed,
      codeSent: _onCodeSent,
      codeAutoRetrievalTimeout: _onCodeTimeout,
      forceResendingToken: forceResendingToken,
    );
  }

  _onVerificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      isLoad = false;
    });
    if (second == 30) {
      phoneSignIn(int.parse(number.text));
    }
    signInWithAuth(phoneAuthCredential);
  }

  _onVerificationFailed(FirebaseAuthException error) {
    setState(() {
      isLoad = false;
    });
  }

  _onCodeSent(String verificationId, int? forceResendingToken) {
    startTimer();
    setState(() {
      isVerifyOtp = true;
      isVisible = true;
      isLoad = false;
    });
    print("veryId");
    print(verificationId);
    print(forceResendingToken);
    print("forecetoken");
    this.verificationId = verificationId;
    this.forceResendingToken = forceResendingToken;
  }

  _onCodeTimeout(String verificationId) {
    print("timeOut");
    print(verificationId);
    this.verificationId = verificationId;
  }

  Future<void> signInWithAuth(AuthCredential phoneAuthCredential) async {
    try {
      UserCredential userCredential =
          await auth.signInWithCredential(phoneAuthCredential);
      User? currentUser = auth.currentUser;
      if (userCredential.user?.uid == currentUser?.uid) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LogInScreen()));
      }
    } on FirebaseAuthException catch (e) {}
  }

  void verifyOtp() {
    AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verificationId ?? "", smsCode: otpField.text);
    signInWithAuth(authCredential);
  }
}
