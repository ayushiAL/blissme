import 'dart:async';
import 'dart:ui';

import 'package:blissme/todo_app/service/auth_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({Key? key}) : super(key: key);

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  TextEditingController numberController = TextEditingController();
  Timer? timer;
  int second = 30;
  bool wait = false;
  String buttonname = "send";
  String verificationFinal = "";
  String? smsCode;

  AuthClass authClass = AuthClass();
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (second == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          second--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: const Text(
            "SignUp",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              const SizedBox(
                height: 140,
              ),
              textField(),
              const SizedBox(
                height: 60,
              ),
              otpField(),
              const SizedBox(
                height: 60,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "send otp again ",
                  style: TextStyle(color: Colors.amberAccent, fontSize: 18),
                ),
                TextSpan(
                  text: "00:$second ",
                  style: const TextStyle(color: Colors.pink, fontSize: 18),
                ),
                TextSpan(
                  text: "sec",
                  style: TextStyle(color: Colors.amberAccent, fontSize: 18),
                ),
              ])),
              const SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () {
                  authClass.signInWithAuth(verificationFinal, smsCode!, context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 90,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 121, 183, 188),
                      Color.fromARGB(255, 153, 178, 109),
                      Color.fromARGB(255, 121, 183, 188)
                    ]),
                  ),
                  child: Text(
                    "Lets go",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }

  Widget otpField() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width - 34,
      fieldWidth: 55,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: const Color.fromARGB(255, 52, 50, 50),
        borderColor: Colors.white,
      ),
      style: const TextStyle(fontSize: 17, color: Colors.white),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
        setState(() {
          smsCode = pin;
        });
      },
    );
  }

  Widget textField() {
    return Container(
        height: 60,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 52, 50, 50)),
        child: TextFormField(
            controller: numberController,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter your number",
              hintStyle: TextStyle(color: Colors.blueGrey),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 19, horizontal: 19),
              prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                  child: Text(
                    "(+91)",
                    style: TextStyle(color: Colors.white),
                  )),
              suffixIcon: InkWell(
                onTap: wait
                    ? null
                    : () async {
                        startTimer();
                        setState(() {
                          second = 30;
                          wait = true;
                          buttonname = "resend";
                        });
                        await authClass.verifyPhoneNumber(
                            "+91${numberController.text}", context, setData);
                      },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                  child: Text(
                    buttonname,
                    style: TextStyle(
                        color: wait ? Colors.grey : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )));
  }

  void setData(verificationId) {
    setState(() {
      verificationFinal = verificationId;
    });
    startTimer();
  }
}
