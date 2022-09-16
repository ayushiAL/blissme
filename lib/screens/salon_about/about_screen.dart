import 'package:blissme/widgets/custom_font.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: CustomFont1(text: "About  Le Spa by Jan", fontSize: 20)),
          SizedBox(
            height: 10,
          ),
          Text(
            "Located in the heart of the city, Le Spa by Jan is an independent, high-quality spa with a passionate skilled team offering a calm retreat away from the hustle and bustle of HK. As a boutique Spa, we believe in excellency in service, unique care, specially selected products yet affordable prices.",
            style: TextStyle(color: Color(0xff686666)),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: CustomFont1(text: "Service on day", fontSize: 20)),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Monday-Thursday",
                style: TextStyle(color: Color(0xff686666)),
              ),
              Text(
                "8:30 AM - 9:00 PM",
                style: TextStyle(color: Color(0xff686666)),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Friday-Saturday",
                style: TextStyle(color: Color(0xff686666)),
              ),
              Text(
                "8:30 AM - 9:00 PM",
                style: TextStyle(color: Color(0xff686666)),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: CustomFont1(text: "Location", fontSize: 20)),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 70,
                width: 120,
                child: Image.asset(
                  "assets/images/location.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "2/F Stanley 11, No. 11 Stanley Street",
                    // overflow: TextOverflow.ellipsis,
                    // maxLines: 2,
                    // style: TextStyle(color: Color(0xff686666)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.black,
                          ),
                          const CustomFont1(text: "2.5 km  ", fontSize: 12),
                        ],
                      ),
                     Text("See the location",),
                    ],
                  )
                ],
              )
            ],
          ),
        ]));
  }
}
