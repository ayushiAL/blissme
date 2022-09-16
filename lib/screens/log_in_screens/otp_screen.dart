import 'dart:async';

import 'package:blissme/screens/log_in_screens/choose_interests_screen.dart';
import 'package:blissme/widgets/custom_button.dart';
import 'package:blissme/widgets/custom_font.dart';
import 'package:blissme/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OtpScreen extends StatefulWidget {
  final String number;
  const OtpScreen({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool? isLoad;
  Timer? timer;
  int second = 60;
  bool isVisible = false;
  bool isVerifyOtp = false;
  String? verificationId;
  int? forceResendingToken;
  String text = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateOtp(widget.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (() {
            Navigator.pop(context);
          }),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomFont(text: 'OTP Verification'),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: const [
                Text(
                  'Your Otp Verification code Sent to your',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontFamily: "Roboto",
                  ),
                ),
                Text(
                  'Mobile Number',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontFamily: "Roboto",
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: TextFormField(
                controller: otpController,
                cursorColor: Colors.black,
                textAlign: TextAlign.center,
                style: TextStyle(letterSpacing: 3),
                decoration: const InputDecoration(
                    focusColor: Colors.black,
                    filled: true,
                    border: InputBorder.none,
                    fillColor: Color(0xffF8F8F8)),
              ),
            ),
            CustomButton(
              text: 'Verify',
              widthSize: 45,
              navigation: () {
                verifyOtp();
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't Receive the code",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                      fontFamily: "Roboto",
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: "Roboto",
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  generateOtp(String phone) async {
    try {
      print(phone);
      await auth.verifyPhoneNumber(
        phoneNumber: "$phone",
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: _onVerificationFailed,
        codeSent: _onCodeSent,
        codeAutoRetrievalTimeout: _onCodeTimeout,
        forceResendingToken: forceResendingToken,
      );
    } on FirebaseAuthException catch (e) {}
  }

  _onVerificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      isLoad = false;
    });
    await auth.signInWithCredential(phoneAuthCredential).then((value) {
      print("you are logged in");
    });
    signInWithAuth(phoneAuthCredential);
  }

  _onVerificationFailed(FirebaseAuthException error) {
    print("verification failed");
    setState(() {
      isLoad = false;
    });
  }

  _onCodeSent(String verificationId, int? forceResendingToken) {
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
   auth.setSettings(appVerificationDisabledForTesting: true);
    UserCredential user = await auth.signInWithCredential(phoneAuthCredential);
    User? currentUser = auth.currentUser;
    if (user.user?.uid == currentUser?.uid) {
    }
  }

  void verifyOtp() {
    AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verificationId ?? "", smsCode: otpController.text);
    signInWithAuth(authCredential);
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => ChooseInterestsScreen()));
  }
}
