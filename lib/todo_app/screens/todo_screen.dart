import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
  String type = "";
  String category = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 8, 73),
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 28, 8, 73),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create",
                style: TextStyle(
                    color: Colors.white, letterSpacing: 2, fontSize: 30),
                textAlign: TextAlign.start,
              ),
              const Text(
                "New todo",
                style: TextStyle(
                    color: Colors.white, letterSpacing: 2, fontSize: 30),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Task title",
                style: const TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
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
                    fillColor: const Color.fromARGB(255, 171, 161, 161)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Task type",
                style: const TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  taskButton("Important", 0xff82CAFF, 120),
                  const SizedBox(
                    width: 15,
                  ),
                  taskButton("planed ", 0xff98AFC7, 90),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Description",
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
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
                  controller: DescriptionController,
                  maxLines: 4,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintStyle: const TextStyle(color: Colors.white60),
                      contentPadding: const EdgeInsets.all(15),
                      focusedBorder: OutlineInputBorder(
                        gapPadding: 0.0,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusColor: Colors.black,
                      filled: true,
                      fillColor: const Color.fromARGB(255, 171, 161, 161)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Description",
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  categoryButton("Food", 0xff2B60DE, 120),
                  const SizedBox(
                    width: 25,
                  ),
                  categoryButton("WorkOut ", 0xffA0CFEC, 90),
                  const SizedBox(
                    width: 25,
                  ),
                  categoryButton("Work ", 0xffD5D6EA, 90),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  categoryButton("Design", 0xff4EE2EC, 120),
                  const SizedBox(
                    width: 20,
                  ),
                  categoryButton("Run ", 0xff2E8B57, 90),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  FirebaseFirestore.instance.collection("Todo").add({
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
                      gradient: const LinearGradient(colors: [
                        Colors.pinkAccent,
                        Color.fromARGB(255, 157, 125, 213),
                        Colors.pinkAccent
                      ]),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    "add TODO",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget taskButton(String text, int color, double widthSize) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          type = text;
        });
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              type == text ? Colors.white : Color(color)),
          elevation: MaterialStateProperty.all(0),
          fixedSize: MaterialStateProperty.all(Size(widthSize, 40))),
      child: Text(
        text,
        style: TextStyle(color: type == text ? Colors.black : Colors.white),
      ),
    );
  }

  Widget categoryButton(String text, int color, double widthSize) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          category = text;
        });
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              category == text ? Colors.white : Color(color)),
          elevation: MaterialStateProperty.all(0),
          fixedSize: MaterialStateProperty.all(Size(widthSize, 40))),
      child: Text(
        text,
        style: TextStyle(color: category == text ? Colors.black : Colors.white),
      ),
    );
  }
}
