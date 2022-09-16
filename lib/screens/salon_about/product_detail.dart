import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/custom_font.dart';

class ProductDetail extends StatelessWidget {
  final String img;
  const ProductDetail({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: CustomFont1(
          fontSize: 20,
          text: "Kerastase Elixir",
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        // margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.only(left: 20, top: 10, right: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  "assets/images/image 1.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text("HK\$ 16", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text("Feauters",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            SizedBox(
              height: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "1) They provides a unique and indulgent in-salon experienc"),
                Text("2) It's perfect for all types of hair"),
                Text(
                    "3) Helps replenish and revitalize dull, damaged and lifeless hair without overloading it"),
              ],
            ),
             SizedBox(
              height: 15,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text("Specification",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            SizedBox(
              height: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ProductTypeName : BEAUTY"),
                Text("ublisher : Kerastase"),
                Text("ReleaseDate : 2014-06-27"),
                Text('Size : 6.8 oz. SKU : 3474630477056-200ml'),
                Text("Studio : Kerastase"),
                Text("Title : Kerastase Elixir Ultime Beautifying Oil Masque, 6.8 Ounce"),
              ],
            ),
             Container(
              margin: EdgeInsets.only(top: 60),
                    alignment: Alignment.center,
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "Add",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )),
          ],
        ),
      ),
    );
  }
}
