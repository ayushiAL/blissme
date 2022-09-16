import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color iconColor;
  final String time;
  final bool check;
  final Color iconBgcolor;
  final Function onChanged;
  final int index;
  const TodoCard(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.iconColor,
      required this.time,
      required this.check,
      required this.iconBgcolor,
      required this.onChanged,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      child: Row(children: [
        Theme(
            data: ThemeData(
                primarySwatch: Colors.blue,
                unselectedWidgetColor: Color(0xff50C878)),
            child: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  activeColor: Colors.blueAccent,
                  checkColor: Colors.white,
                  value: check,
                  onChanged: (bool? value) {
                    onChanged(index,value);
                  }),
            )),
        Expanded(
            child: Container(
                height: 75,
                child: Card(
                  color: Colors.white10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                     Expanded(
                       child: Row(
                        children: [
                           Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            height: 33,
                            width: 36,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: iconBgcolor),
                            child: Icon(
                              iconData,
                              color: iconColor,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            title,
                            style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1,
                                fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        
                        ],
                       ),
                     ),
                      Text(
                        time,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      SizedBox(width: 10,),
                    ],
                  ),
                )))
      ]),
    );
  }
}
