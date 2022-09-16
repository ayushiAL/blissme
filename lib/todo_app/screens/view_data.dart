import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ViewDataScreen extends StatefulWidget {
  const ViewDataScreen({Key? key, required this.document, required this.id})
      : super(key: key);
  final Map<String, dynamic> document;
  final String id;
  @override
  State<ViewDataScreen> createState() => _ViewDataScreenState();
}

class _ViewDataScreenState extends State<ViewDataScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  String? type;
  String? category;
  bool delete = false;
  bool edit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String title = widget.document["title"] == null
        ? "hey there"
        : widget.document["title"];
    titleController = TextEditingController(text: title);
    DescriptionController =
        TextEditingController(text: widget.document["Description"]);
    type = widget.document["task"];
    category = widget.document["Category"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 28, 8, 73),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    // ignore: prefer_const_constructors
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        edit = !edit;
                      });
                    },
                    child: Icon(
                      Icons.edit,
                      color: edit ? Colors.red : Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      FirebaseFirestore.instance
                          .collection("Todo")
                          .doc(widget.id)
                          .delete()
                          .then((value) {
                        Navigator.pop(context);
                      });
                    },
                    child: Icon(
                      Icons.delete,
                      color: delete ? Colors.red : Colors.white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                edit ? "Editing" : "View",
                style: TextStyle(
                    color: Colors.white, letterSpacing: 2, fontSize: 30),
                textAlign: TextAlign.start,
              ),
              Text(
                "YOur todo",
                style: TextStyle(
                    color: Colors.white, letterSpacing: 2, fontSize: 30),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Task title",
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                enabled: edit,
                controller: titleController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusColor: Colors.black,
                    filled: true,
                    fillColor: Color.fromARGB(255, 171, 161, 161)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Task type",
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  taskButton("Important", 0xff82CAFF, 120),
                  SizedBox(
                    width: 15,
                  ),
                  taskButton("planed ", 0xff98AFC7, 90),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Description",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  // color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  enabled: edit,
                  controller: DescriptionController,
                  maxLines: 4,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintStyle: TextStyle(color: Colors.white60),
                      contentPadding: const EdgeInsets.all(15),
                      focusedBorder: OutlineInputBorder(
                        gapPadding: 0.0,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusColor: Colors.black,
                      filled: true,
                      fillColor: Color.fromARGB(255, 171, 161, 161)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Description",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  categoryButton("Food", 0xff2B60DE, 120),
                  SizedBox(
                    width: 25,
                  ),
                  categoryButton("WorkOut ", 0xffA0CFEC, 90),
                  SizedBox(
                    width: 25,
                  ),
                  categoryButton("Work ", 0xffD5D6EA, 90),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  categoryButton("Design", 0xff4EE2EC, 120),
                  SizedBox(
                    width: 20,
                  ),
                  categoryButton("Run ", 0xff2E8B57, 90),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              edit
                  ? InkWell(
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection("Todo")
                            .doc(widget.id)
                            .update({
                          "title": titleController.text,
                          "Category": category,
                          "Description": DescriptionController.text,
                          "type": type
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.pinkAccent,
                              Color.fromARGB(255, 157, 125, 213),
                              Colors.pinkAccent
                            ]),
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "Update TODO",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget taskButton(String text, int color, double widthSize) {
    return ElevatedButton(
      onPressed: edit
          ? () {
              setState(() {
                type = text;
              });
            }
          : null,
      child: Text(
        text,
        style: TextStyle(color: type == text ? Colors.black : Colors.white),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              type == text ? Colors.white : Color(color)),
          elevation: MaterialStateProperty.all(0),
          fixedSize: MaterialStateProperty.all(Size(widthSize, 40))),
    );
  }

  Widget categoryButton(String text, int color, double widthSize) {
    return ElevatedButton(
      onPressed: edit
          ? () {
              category = text;
            }
          : null,
      child: Text(
        text,
        style: TextStyle(color: category == text ? Colors.black : Colors.white),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              category == text ? Colors.white : Color(color)),
          elevation: MaterialStateProperty.all(0),
          fixedSize: MaterialStateProperty.all(Size(widthSize, 40))),
    );
  }
}
