// import 'package:flutter/material.dart';
//
// import '../screens/salon_about/product_detail.dart';
// class CustomProduct extends StatefulWidget {
//   final String image;
//   final String title;
//   final int price;
//    final  int counter;
//   final bool shouldVisible;
//   const CustomProduct({Key? key, required this.image, required this.title, required this.price, required this.counter, required this.shouldVisible,}) : super(key: key);
//
//   @override
//   State<CustomProduct> createState() => _CustomProductState();
// }
//
// class _CustomProductState extends State<CustomProduct> {
//
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//       padding: const EdgeInsets.symmetric(
//           vertical: 10),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) =>
//                     ProductDetail(
//                         img:
//                         widget.image)),
//           );
//         },
//         child: Row(children: [
//           Container(
//             height: 100,
//             width: 100,
//             child: Image.asset(
//               widget.image,
//               fit: BoxFit.fill,
//             ),
//           ),
//           Expanded(
//             child: Container(
//               margin:
//               EdgeInsets.only(left: 10),
//               height: 100,
//               child: Column(
//                 crossAxisAlignment:
//                 CrossAxisAlignment.start,
//                 mainAxisAlignment:
//                 MainAxisAlignment
//                     .spaceAround,
//                 children: [
//                   Text(widget.title,
//                       overflow: TextOverflow
//                           .ellipsis,
//                       maxLines: 3),
//                   Text(
//                     "HK\$ ${widget.price}",
//                     style: TextStyle(
//                         fontWeight:
//                         FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           widget.shouldVisible &&
//               widget.counter > 0
//               ? Container(
//             child: Row(
//               children: [
//                 Container(
//                   height: 20,
//                   width: 25,
//                   color: Colors.pink,
//                   child: InkWell(
//                     onTap: () {
//                       setState(() {
//                         if (widget.counter >
//                             0) {
//                           widget.counter--;
//                         }
//                         print(widget.counter);
//                       });
//                     },
//                     child: Icon(
//                         Icons.remove,
//                         color: Colors
//                             .white,
//                         size: 15),
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                   const EdgeInsets
//                       .all(8.0),
//                   child: Text(widget
//                       .counter
//                       .toString()),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     setState(() {
//                       widget.counter++;
//                       var price =widget.price;
//                       var quantity = widget.counter;
//                       setState(() {
//                         productModelList.forEach((element) {
//                           cartTotal = (price * quantity);
//                           // var total1= cartTotal>=0?quantity++:quantity--;
//                           // print(total1);
//                         });
//                       });
//
//                     });
//                     print(
//                         widget.counter);
//                   },
//                   child: Container(
//                     height: 20,
//                     width: 25,
//                     color: Colors.pink,
//                     child: Icon(
//                       Icons.add,
//                       color:
//                       Colors.white,
//                       size: 15,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//               : InkWell(
//             onTap: () {
//               print(widget.counter);
//               setState(() {
//                 widget.shouldVisible =
//                 true;
//                 widget.counter++;
//               });
//             },
//             child: Container(
//                 margin: EdgeInsets.only(
//                     left: 5),
//                 alignment:
//                 Alignment.center,
//                 height: 35,
//                 width: 90,
//                 decoration:
//                 BoxDecoration(
//                   color: Colors.pink,
//                   borderRadius:
//                   BorderRadius
//                       .circular(5),
//                 ),
//                 child: const Text(
//                   "Add",
//                   style: TextStyle(
//                       color:
//                       Colors.white,
//                       fontSize: 15),
//                 )),
//           ),
//           SizedBox(
//             height: 20,
//           )
//         ]),
//       ),
//     );
//   }
// }
