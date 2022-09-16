// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import '../model/user_model.dart';

// class FireStoreDemoScreen extends StatefulWidget {
//   const FireStoreDemoScreen({Key? key}) : super(key: key);

//   @override
//   State<FireStoreDemoScreen> createState() => _FireStoreDemoScreenState();
// }

// class _FireStoreDemoScreenState extends State<FireStoreDemoScreen> {
//   TextEditingController name = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController number = TextEditingController();
//   TextEditingController password = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   late CollectionReference<Map<String, dynamic>> usersCollection;

//   List<UserModel>? userList=[];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     usersCollection = FirebaseFirestore.instance.collection("users");
//     getUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: name,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Enter Name';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                           )),
//                       labelText: "Enter Name",
//                       labelStyle: TextStyle(
//                         color: Colors.black,
//                       ),
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                           )),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     controller: email,
//                     validator: (value) {
//                       if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
//                         return 'Invalid email';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                           )),
//                       labelText: "Enter Email",
//                       labelStyle: TextStyle(
//                         color: Colors.black,
//                       ),
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                           )),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.number,
//                     controller: number,
//                     decoration: InputDecoration(
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                           )),
//                       labelText: "Enter Number",
//                       labelStyle: TextStyle(
//                         color: Colors.black,
//                       ),
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                           )),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(height: 30),
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.indigoAccent,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         fixedSize: const Size(500, 60),
//                       ),
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           saveUser();
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text('Please fill detail'),
//                             ),
//                           );
//                         }
//                       },
//                       child: const Text(
//                         "Sign In",
//                         style: TextStyle(
//                           fontSize: 18,
//                         ),
//                       )),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: userList != null && userList!.length > 0
//                   ? ListView.builder(
//                 itemCount: userList?.length,
//                 itemBuilder: (context, index) {
//                   UserModel userModel = userList![index];
//                   return Container(
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.black)),
//                     margin: EdgeInsets.only(top: 10),
//                     padding: EdgeInsets.all(10),
//                     width: double.infinity,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(userModel.name ?? ""),
//                         Text(userModel.email ?? ""),
//                         Text(userModel.number ?? ""),
//                       ],
//                     ),
//                   );
//                 },
//               )
//                   : Container(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> saveUser() async {
//     UserModel userModel =
//     UserModel(name: name.text, number: number.text, email: email.text);
//       await usersCollection.doc(name.text).set(userModel.toJson());
//     name.clear();
//     email.clear();
//     number.clear();
//   }

//   void getUsers() {
//     usersCollection.snapshots().listen((value) {
//       print("hello");
//       // userList = value.docs.map((e) => UserModel.fromJson(e.data()));
//       List<UserModel> list =[];
//       value.docs.forEach((element) {
//         setState(() {
//           list.add(UserModel.fromJson(element.data()));
//         });
//       });
//       setState(() {
//         userList=list;
//       });
//     });
//   }
// }

import 'package:blissme/model/user_model.dart';
import 'package:blissme/widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/custom_textfield.dart';
import '../../widgets/textfield.dart';

class InterestScreen extends StatefulWidget {
  const InterestScreen({Key? key}) : super(key: key);

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  late CollectionReference<Map<String, dynamic>> usersCollection;
  List<UserModel> userList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usersCollection = FirebaseFirestore.instance.collection('users');
    _getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder(
        stream: usersCollection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapShot) {
          if (!snapShot.hasData) {
            return const Center(
              child: Text("No data"),
            );
          }
          if (snapShot.hasData) {
            return ListView.builder(
              itemCount: snapShot.data?.docs.length,
              itemBuilder: (context, i) {
                var data =
                    snapShot.data?.docs[i].data() as Map<String, dynamic>;
                print(data['name']);
                return Column(
                  children: [
                    Card(
                      child: Column(
                        children: [
                          Text(data['name'].toString()),
                          Text(data['email'].toString()),
                          Text(data['phone'].toString()),
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
      // body: Padding(
      //   padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 30),
      //   child: Column(
      //     // crossAxisAlignment: CrossAxisAlignment.start,
      //     // mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Padding(
      //           padding: const EdgeInsets.symmetric(vertical: 15),
      //           child: CustomInput(
      //             controller: nameController,
      //           )),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(vertical: 15),
      //         child: CustomInput(
      //           controller: emailController,
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(vertical: 15),
      //         child: CustomInput(
      //           controller: widget.number,
      //         ),
      //       ),
      //       Align(
      //           alignment: Alignment.center,
      //           child: CustomButton(
      //               text: "Update",
      //               widthSize: double.infinity,
      //               navigation: () {})),
      //       Align(
      //         alignment: Alignment.center,
      //         child: CustomButton(
      //             text: "Remove",
      //             widthSize: double.infinity,
      //             navigation: () {}),
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  Future<void> _getUserName() async {
    usersCollection.doc('ayushi').get().then((value) {
      setState(() {
        usersCollection.snapshots().listen((value) {
          List<UserModel> list = [];
          value.docs.forEach((element) {
            // print(element.data());
            setState(() {
              list.add(
                UserModel.fromJson(element.data()),
              );
            });
          });
          setState(() {
            userList = list;
          });
        });
      });
    });
  }
}
