import 'dart:ui';

import 'package:blissme/model/salon_model.dart';
import 'package:blissme/model/service_model.dart';
import 'package:blissme/screens/all_screen/top_salon_screen.dart';
import 'package:blissme/widgets/custom_font.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> model = [
    "assets/images/photo1.jpg",
    "assets/images/photo2.jpg",
    "assets/images/photo3.jpg"
  ];
  List<dynamic> productModel = [
    "assets/images/pic.png",
    "assets/images/pic2.png",
    "assets/images/pic3.png"
  ];
  int currentpage = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: CustomFont1(
          text: "Home1",
          fontSize: 20,
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.pink,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomFont1(text: "Mong Kok Flower Market", fontSize: 18),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width,
                color: Colors.amber,
                child: PageView.builder(
                    itemCount: model.length,
                    controller: controller,
                    onPageChanged: (value) {
                      currentpage = value;
                    },
                    itemBuilder: ((context, index) {
                      return Image.asset(
                        model[index],
                        fit: BoxFit.cover,
                      );
                    })),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomFont1(
                    text: "Top Salon",
                    fontSize: 18,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TopSalonScreen()));
                    },
                    child: CustomFont1(
                      text: "View all",
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.32,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: SalonModelList.salonModelList.length,
                    itemBuilder: (context, index) {
                      SalonModel model = SalonModelList.salonModelList[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 10, right: 15),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                             height: MediaQuery.of(context).size.height * 0.32,
                            width: MediaQuery.of(context).size.width * 0.48,
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      child: Image.asset(
                                        height: 120,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        model.image ?? "",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 15, bottom: 15),
                                      height: 20,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 16,
                                          ),
                                          Text(
                                            ' 4.5',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 7),
                                    child: SizedBox(
                                      height: 40,
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            model.name ?? "",
                                            maxLines: 2,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              fontFamily: "Roboto",
                                            ),
                                          )),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.black,
                                      ),
                                      CustomFont1(text: "2.5 km", fontSize: 12)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomFont1(
                      text: "Top Services",
                      fontSize: 18,
                    ),
                    CustomFont1(
                      text: "View all",
                      fontSize: 13,
                    ),
                  ],
                ),
              ),
              Container(
                height: 135,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: ServiceModelList.serviceModelList.length,
                    itemBuilder: (context, index) {
                      ServiceModel model =
                          ServiceModelList.serviceModelList[index];
                      return Container(
                        margin: EdgeInsets.only(right: 15),
                        height: 135,
                        width: 120,
                        child: Column(
                          children: [
                            Container(
                              height: 70,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffE4E4E4)),
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: AssetImage(model.img ?? ""))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              model.text ?? "",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color(0xff1D1B44), fontSize: 18),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              model.place ?? "",
                              style: TextStyle(
                                  color: Color(0xff1D1B44), fontSize: 15),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                // width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: model.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 20),
                              // height: 200,
                              width: 300,
                              color: Colors.amber,
                              child: Image.asset(
                                model[index],
                                fit: BoxFit.cover,
                              )),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: "  Get ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                TextSpan(
                                  text: "5%  ",
                                  style: TextStyle(
                                      color: Colors.pink,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 70),
                                ),
                              ])),
                              Text(
                                "  Discout for head massage",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(
                                      left: 10, bottom: 15, top: 7),
                                  height: 20,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Buy Now ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )),
                            ],
                          )
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: CustomFont1(text: "Our Products", fontSize: 23)),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                height: 220,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: productModel.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 180,
                            width: 250,
                            margin: EdgeInsets.only(right: 15),
                            color: Colors.black12,
                            child: Image.asset(
                              productModel[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'BodyWash',
                                style: TextStyle(
                                  color: Color(0xff1D1B44),
                                ),
                              ))
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
