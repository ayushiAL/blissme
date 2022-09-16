import 'package:blissme/screens/all_screen/home_screen.dart';
import 'package:blissme/screens/all_screen/nearby_screen.dart';
import 'package:blissme/screens/all_screen/order_screen.dart';
import 'package:blissme/screens/all_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


class Screens extends StatefulWidget {
  const Screens({Key? key}) : super(key: key);

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int pageIndex = 0;
  final pageList = [
    const HomeScreen(),
    const NearByScreen(),
    const OrderScreen(),
    const ProfileScreen(),
  ];
  void _onTap(int index) {
    pageIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.nearby_off),
            label: 'Nearby',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.outbox_rounded),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: pageIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Color(0xff323232),
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
      ),
      // Container(
      //   height: 74,
      //   width: 400,
      //   color: Colors.yellow,
      //   // child: Row(
      //   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   //   children: [
      //   //     InkWell(
      //   //         splashColor: Colors.white,
      //   //         enableFeedback: false,
      //   //         onTap: () {
      //   //           setState(() {
      //   //             pageIndex = 0;
      //   //           });
      //   //         },
      //   //         child: Container(
      //   //           width: MediaQuery.of(context).size.width / 3,
      //   //           alignment: Alignment.center,
      //   //           child:
      //   //               Column(
      //   //                   mainAxisSize: MainAxisSize.min,
      //   //                   children: [
      //   //                    Icon(Icons.home_filled,color: Colors.black,),
      //   //                     const SizedBox(
      //   //                       height: 4,
      //   //                     ),
      //   //                     Text("Home",)
      //   //                   ],
      //   //                 )

      //   //         )),
      //   //     InkWell(
      //   //         enableFeedback: false,
      //   //         splashColor: Colors.white,
      //   //         onTap: () {
      //   //           setState(() {
      //   //             pageIndex = 1;
      //   //           });
      //   //         },
      //   //         child: Container(
      //   //           width: MediaQuery.of(context).size.width / 3,
      //   //           alignment: Alignment.center,
      //   //           child: Column(
      //   //                   mainAxisSize: MainAxisSize.min,
      //   //                   children: [
      //   //                     const Text(
      //   //                       "Cart",
      //   //                       style: TextStyle(
      //   //                           fontSize: 14, fontWeight: FontWeight.bold),
      //   //                     ),
      //   //                     const SizedBox(
      //   //                       height: 4,
      //   //                     ),
      //   //                     Container(
      //   //                       height: 3,
      //   //                       width: 5,
      //   //                       decoration: BoxDecoration(
      //   //                           borderRadius: BorderRadius.circular(10)),
      //   //                     )
      //   //                   ],
      //   //                 )
      //   //         )),
      //   //     InkWell(
      //   //       enableFeedback: false,
      //   //       splashColor: Colors.white,
      //   //       onTap: () {
      //   //         setState(() {
      //   //           pageIndex = 2;
      //   //         });
      //   //       },
      //   //       child: Container(
      //   //         width: MediaQuery.of(context).size.width / 3,
      //   //         alignment: Alignment.center,
      //   //         child: Column(
      //   //                 mainAxisSize: MainAxisSize.min,
      //   //                 children: [
      //   //                   const Text(
      //   //                     "Account",
      //   //                     style: TextStyle(
      //   //                         fontSize: 14, fontWeight: FontWeight.bold),
      //   //                   ),
      //   //                   const SizedBox(
      //   //                     height: 4,
      //   //                   ),
      //   //                   Container(
      //   //                     height: 3,
      //   //                     width: 8,
      //   //                     decoration: BoxDecoration(
      //   //                         borderRadius: BorderRadius.circular(10)),
      //   //                   )
      //   //                 ],
      //   //               )
      //   //       ),
      //   //     ),
      //   //   ],
      //   // ),
      // ),
    );
  }
}
