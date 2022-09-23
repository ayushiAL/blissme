import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
   CustomPopupMenuController controller = CustomPopupMenuController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Center(
            child: CustomPopupMenu(
              controller: controller,
              menuBuilder:()=>Container(
                height: 20,
                width: 20,
                color: Colors.red,
              ),
              pressType: PressType.longPress,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.black,
              ),
            ),
        ),
      ),
    );
  }
}
