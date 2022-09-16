// import 'package:blissme/model/product_model.dart';
// import 'package:blissme/screens/salon_about/product_detail.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class ProductList extends StatelessWidget {
//   const ProductList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         margin: EdgeInsets.only(left: 15, right: 15, top: 10,bottom: 10),
//         child: ListView.builder(
//             itemCount: ProductModelList.productModelList.length,
//             itemBuilder: (context, index) {
//               ProductModel model = ProductModelList.productModelList[index];
//               return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: InkWell(
//                       onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ProductDetail(img: model.img??"")),
//                           );
//                         },
//                   child: Row(children: [
//                     Container(
//                       height: 100,
//                       width: 100,
//                       child: Image.asset(model.img??"",fit: BoxFit.cover,),
//                     ),
//                     Expanded(
//                       child: Container(
//                         margin: EdgeInsets.only(left: 10),
//                         height: 100,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                            mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Text(model.title??"",overflow: TextOverflow.ellipsis,maxLines: 3),
//                             Text("HK\$ ${model.price.toString()}",style: TextStyle(fontWeight: FontWeight.bold),),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                         margin: EdgeInsets.only(left: 5),
//                         alignment: Alignment.center,
//                         height: 35,
//                         width: 90,
//                         decoration: BoxDecoration(
//                           color: Colors.pink,
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: const Text(
//                           "Add",
//                           style: TextStyle(color: Colors.white, fontSize: 15),
//                         )),
//                         SizedBox(heirght: 20,)
//                   ]),
//                 ),
//               );
//             }),
//       ),
//     );
//   }
// }
