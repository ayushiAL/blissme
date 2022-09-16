import 'dart:async';
import 'package:blissme/todo_app/screens/log_out.dart';
import 'package:blissme/todo_app/screens/sign_in.dart';
import 'package:blissme/todo_app/screens/todo_screen.dart';
import 'package:blissme/todo_app/screens/view_data.dart';
import 'package:blissme/todo_app/service/auth_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../custom/todo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthClass authClass = AuthClass();
  // final Stream<QuerySnapshot> _stream=
  late CollectionReference<Map<String, dynamic>> usersCollection;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usersCollection = FirebaseFirestore.instance.collection('Todo');
  }

  int index = 0;

  List<Select> selected = [];
  bool isSelect = false;
  List<dynamic> checkList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LogOutScreen()));
            },
            child: Icon(Icons.arrow_back)),
        title: Text(
          "Today's Schedule",
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Row(
                children: [
                  Text(
                    "Monday 21",
                    style: TextStyle(color: Colors.white, fontSize: 31),
                  ),
                  Visibility(
                      visible: checkList.isNotEmpty,
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
      body: StreamBuilder(
          stream: usersCollection.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapShot) {
            if (!snapShot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapShot.data?.docs.length,
                itemBuilder: (context, index) {
                  IconData iconData;
                  Color iconColor;
                  var document =
                      snapShot.data?.docs[index].data() as Map<String, dynamic>;
                  switch (document["Category"]) {
                    case "work":
                      iconData = Icons.run_circle_outlined;
                      iconColor = Colors.green;

                      break;
                    case "break":
                      iconData = Icons.accessible_forward_sharp;
                      iconColor = Colors.green;

                      break;
                    case "workout":
                      iconData = Icons.wysiwyg_rounded;
                      iconColor = Colors.green;

                      break;
                    case "food":
                      iconData = Icons.workspace_premium_outlined;
                      iconColor = Colors.green;

                      break;
                    case "design":
                      iconData = Icons.wifi_password;
                      iconColor = Colors.green;

                      break;
                    default:
                      iconData = Icons.run_circle_outlined;
                      iconColor = Colors.yellow;
                  }
                  selected.add(Select(
                      checkValue: false, id: snapShot.data!.docs[index].id));
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewDataScreen(
                              document: document,
                              id: snapShot.data!.docs[index].id),
                        ),
                      );
                    },
                    child: TodoCard(
                      title: document["title"] == null
                          ? "hey there"
                          : document["title"],
                      check: selected[index].checkValue,
                      // check: selected[index].checkValue,
                      iconBgcolor: Colors.white,
                      iconColor: iconColor,
                      iconData: iconData,
                      time: "10 pm ",
                      index: index,
                      onChanged: (index, value) {
                        onChanged(index, value);
                      },
                      // onChanged: onChanged(index),
                    ),
                  );
                });
          }),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TodoScreen()));
                },
                child: Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Colors.pinkAccent,
                      Color.fromARGB(255, 157, 125, 213),
                      Colors.pinkAccent
                    ]),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              label: "",
            ),
          ]),
    );
  }

  onChanged(int index, bool checkValue) {
    setState(() {
      selected[index].checkValue = !selected[index].checkValue;
      checkValue ? checkList.add(index) : checkList.remove(index);
    });
  }
}

class Select {
  String? id;
  bool checkValue = false;
  Select({this.id, required this.checkValue});
}
