import 'dart:async';

import 'package:blissme/screens/log_in_screens/logIn_screen.dart';
import 'package:blissme/screens/log_in_screens/otp_screen.dart';
import 'package:blissme/widgets/custom_button.dart';
import 'package:blissme/widgets/custom_font.dart';
import 'package:blissme/widgets/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../model/user_model.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool? isLoad;
  String text = "";

  @override
  void initState() {
    // TODO: implement initState
    usersCollection = FirebaseFirestore.instance.collection('users');
    getUsers();
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final numberController = TextEditingController();

  late CollectionReference<Map<String, dynamic>> usersCollection;

  List<UserModel> userList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const CustomFont(text: 'Create new Account'),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Align(
                      alignment: Alignment.centerLeft, child: Text('Name')),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: CustomTextField(
                      controller: nameController,
                      setText: (text) {},
                    ),
                  ),
                  const Align(
                      alignment: Alignment.centerLeft, child: Text('Email Id')),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: CustomTextField(
                      controller: emailController,
                      setText: (text) {},
                    ),
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Phone Number')),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: CustomTextField(
                        controller: numberController,
                        setText: (value) {
                          text = value;
                        }),
                  ),
                  CustomButton(
                    text: 'Create New Account',
                    widthSize: 45,
                    navigation: () {
                      if (text.length == 10) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpScreen(
                              number: "+91${numberController.text}",
                            ),
                          ),
                        );
                        saveUser();
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account ?',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            fontFamily: "Roboto",
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                               Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LogInScreen()));
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: "Roboto",
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
              child: Column(
                children: const [
                  Text('By clicking create new account you agree to the'),
                  Text(' following Terms & Condition.')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveUser() async {
    print("snjfnuij");
    UserModel userModel = UserModel(
        name: nameController.text,
        email: emailController.text,
        number: numberController.text);
    await usersCollection.doc(nameController.text).set(userModel.toJson());
    print(nameController.text);
    nameController.clear();
    emailController.clear();
    numberController.clear();
  }

  void getUsers() {
    print("hello");
    usersCollection.snapshots().listen((value) {
      // userList = value.docs.map((e) => UserModel.fromJson(e.data()));
      List<UserModel> list = [];
      value.docs.forEach((element) {
        setState(() {
          list.add(UserModel.fromJson(element.data()));
        });
      });
      setState(() {
        userList = list;
      });
    });
  }
}
