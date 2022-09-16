import 'package:blissme/model/checkbox_model.dart';
import 'package:blissme/screens/all_screen/cart_screen.dart';
import 'package:blissme/screens/salon_about/about_screen.dart';
import 'package:blissme/screens/salon_about/gallery_screen.dart';
import 'package:blissme/screens/salon_about/product_list.dart';
import 'package:blissme/widgets/custom_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../model/product_model.dart';
import '../salon_about/product_detail.dart';

class SalonAboutScreen extends StatefulWidget {
  final String title;
  final String image;

  const SalonAboutScreen({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  State<SalonAboutScreen> createState() => _SalonAboutScreenState();
}

class _SalonAboutScreenState extends State<SalonAboutScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _controller;
  late TabController _productController;

  int selectedIndex = 0;
  List<Widget> list = [
    const Tab(text: "Service"),
    const Tab(text: "Product"),
    const Tab(text: "About"),
    const Tab(text: "Gallery"),
  ];
  List<Widget> productList = [
    const Tab(text: "OilMask"),
    const Tab(text: "CreamBath"),
    const Tab(text: "Moisturizing"),
    const Tab(text: "Face Massage"),
  ];
  List<Widget> list1 = [
    const Tab(text: "Beauty"),
    const Tab(text: "Face Wash"),
    const Tab(text: "Face Massage"),
    Tab(text: "Face Massage"),
  ];

  late List<bool> value;

  int sum = 0;

  total(int index) {
    var checkValue = CheckModelList.checkModelList[index].total;

    setState(() {
      value[index] ? sum = sum - checkValue! : sum += checkValue!;
    });
  }

  int itemCount = 1;
  int qty = 1;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    value = List<bool>.filled(CheckModelList.checkModelList.length, false);

    _tabController = TabController(length: list.length, vsync: this);
    _controller = TabController(length: list1.length, vsync: this);
    _productController = TabController(length: productList.length, vsync: this);

    _tabController.addListener(() {
      setState(() {
        selectedIndex = _tabController.index;
      });
    });
  }

  // int index = 0;

  var selectList = [];
  Map<String, dynamic> selectList1 = {};

  // void userSelect(int index) {
  //   var cartList = CheckModelList.checkModelList[index];
  //   selectList1 = {
  //     "name": "Le spa by jan",
  //     "img": "assets/images/image.png",
  //     "data": []
  //   };
  //   if (value[index]) {
  //     selectList.add(cartList);
  //     selectList1['data'] = selectList;
  //   } else {}
  // }

  var productModelList = [
    ProductModel(
      img: "assets/images/image 1.png",
      title: "Kerastase Elixir Ultime Oleo Complexe Beautifying Oil Mask",
      price: 16,
    ),
    ProductModel(
      img: "assets/images/image2.png",
      title: "L'Oreal Paris Hair Spa Deep Nourishing Creambath For Dry ",
      price: 20,
    ),
    ProductModel(
      img: "assets/images/image3.png",
      title:
          "Wella Professional Enrich Moisturizing Treatment For Dry And Damaged Hair",
      price: 30,
    ),
    ProductModel(
      img: "assets/images/image4.png",
      title: "Schwarzkopf Spa Essence Hydrating Cream Masque",
      price: 50,
    ),
  ];
  int cartTotal = 0;

  void incrementCartList(int index) {
    var price = productModelList[index].price;
    // var quantity = productModelList[index].counter;
    setState(() {
      cartTotal += (price! * 1);
      print(cartTotal);

    });
  }
  void decrementCartList(int index) {
    var price = productModelList[index].price;
    var quantity = productModelList[index].counter;
    setState(() {
      cartTotal -= (price! * 1);
      print(cartTotal);

    });
  }

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
          text: widget.title,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Card(
                elevation: 8,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.26,
                ),
                child: TabBar(
                    isScrollable: true,
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    labelColor: Colors.pink,
                    splashBorderRadius: BorderRadius.circular(25),
                    unselectedLabelColor: Colors.black,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    indicatorColor: Colors.red,
                    indicator: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.pink, width: 8))),
                    tabs: list),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              Container(
                child: Column(
                  children: [
                    TabBar(
                        isScrollable: true,
                        physics: NeverScrollableScrollPhysics(),
                        controller: _controller,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.grey,
                        indicatorSize: TabBarIndicatorSize.tab,
                        overlayColor: MaterialStateProperty.all(Colors.red),
                        indicator: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                        splashBorderRadius:
                            BorderRadius.all(Radius.circular(15)),
                        tabs: list1),
                    Expanded(
                        child: TabBarView(
                      controller: _controller,
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: Container(
                                height: 500,
                                width: double.infinity,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        CheckModelList.checkModelList.length,
                                    itemBuilder: (context, index) {
                                      CheckBoxListTileModel model =
                                          CheckModelList.checkModelList[index];
                                      return Container(
                                        height: 70,
                                        child: Row(children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0))),
                                            value: value[index],
                                            onChanged: (val) {
                                              setState(() {
                                                total(index);
                                                value[index] = val!;
                                              });
                                            },
                                            focusColor: Colors.amberAccent,
                                            hoverColor: Colors.grey,
                                            fillColor:
                                                MaterialStateProperty.all(
                                                    Colors.pink),
                                          ),
                                          Expanded(
                                            child: Card(
                                              child: Container(
                                                height: 70,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                      model.title ?? "",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )),
                                                    Text(
                                                      "Hk \$ ${model.total.toString()}"
                                                      '/'
                                                      "${model.time}",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ]),
                                      );
                                    }),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              height: 60,
                              width: double.infinity,
                              color: Color(0xff1D1B44),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total  HK\$ $sum",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // userSelect(index);

                                      List<CheckBoxListTileModel> product = [];
                                      for (int j = 0; j < value.length; j++) {
                                        if (value.elementAt(j)) {
                                          product.add(
                                              CheckModelList.checkModelList[j]);
                                        }
                                      }
                                      product.forEach((element) {
                                        print(element);
                                      });
                                      service = product;
                                      servicePrice=sum ;
                                      print(servicePrice);

                                      // service.addAll(product);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => CartScreen(
                                                    srviceTotal: sum,
                                                    cartTotal: 0,
                                                  )));
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          "Continue",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Center(
                          child: Text("Face Wash"),
                        ),
                        Center(
                          child: Text("Face Massge"),
                        ),
                        Center(
                          child: Text("face wash"),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    TabBar(
                        isScrollable: true,
                        physics: NeverScrollableScrollPhysics(),
                        controller: _productController,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        indicator: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                        tabs: productList),
                    Expanded(
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                      controller: _productController,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      "Filter",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 15, right: 15, bottom: 10),
                                child: ListView.builder(
                                    itemCount: productModelList.length,
                                    itemBuilder: (context, index) {
                                      ProductModel model =
                                          productModelList[index];

                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductDetail(
                                                          img:
                                                              model.img ?? "")),
                                            );
                                          },
                                          child: Row(children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              child: Image.asset(
                                                model.img ?? "",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                height: 100,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(model.title ?? "",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 3),
                                                    Text(
                                                      "HK\$ ${model.price.toString()}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            model.shoudVisible &&
                                                    model.counter > 0
                                                ? Container(
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 25,
                                                          color: Colors.pink,
                                                          child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                if (model
                                                                        .counter >
                                                                    0) {
                                                                  model
                                                                      .counter--;
                                                                }
                                                                print(model
                                                                    .counter);
                                                                decrementCartList(index);
                                                              });
                                                            },
                                                            child: Icon(
                                                                Icons.remove,
                                                                color: Colors
                                                                    .white,
                                                                size: 15),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(model
                                                              .counter
                                                              .toString()),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              model.counter++;
                                                              incrementCartList(index);
                                                            });
                                                            print(
                                                                model.counter);
                                                          },
                                                          child: Container(
                                                            height: 20,
                                                            width: 25,
                                                            color: Colors.pink,
                                                            child: Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                              size: 15,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : InkWell(
                                                    onTap: () {
                                                      print(model.counter);
                                                      setState(() {
                                                        model.shoudVisible =
                                                            true;
                                                        model.counter++;
                                                      });
                                                      incrementCartList(index);
                                                    },
                                                    child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 5),
                                                        alignment:
                                                            Alignment.center,
                                                        height: 35,
                                                        width: 90,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.pink,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: const Text(
                                                          "Add",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15),
                                                        )),
                                                  ),
                                            SizedBox(
                                              height: 20,
                                            )
                                          ]),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 15,
                              ),
                              padding: EdgeInsets.only(left: 15, right: 15),
                              height: 60,
                              width: double.infinity,
                              color: Color(0xff1D1B44),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total  HK\$ $cartTotal",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      List<ProductModel> products = [];
                                      for (var i = 0;
                                          i < productModelList.length;
                                          i++) {
                                        if (productModelList[i].shoudVisible &&
                                            productModelList[i].counter > 0) {
                                          products.add(productModelList[i]);
                                        }
                                      }
                                      products.forEach((element) {
                                        print(element);
                                      });
                                      cart = products;
                                      cartPrice=cartTotal;
                                      print(cartPrice);
                                      // cart.addAll(products);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => CartScreen(
                                                    cartTotal: cartTotal,
                                                    srviceTotal: 0,
                                                  )));
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        height: 50,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          "Move to cart",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Center(
                          child: Text("creamBath"),
                        ),
                        Center(
                          child: Text("Moisturizing"),
                        ),
                        Center(
                          child: Text("Face Massage"),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CustomFont1(
                            text: "About  Le Spa by Jan", fontSize: 20)),
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
                        child:
                            CustomFont1(text: "Service on day", fontSize: 20)),
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
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "2/F Stanley 11, No. 11 Stanley Street",
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
                                    const CustomFont1(
                                        text: "2.5 km  ", fontSize: 12),
                                  ],
                                ),
                                Text(
                                  "See the location",
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.pinkAccent,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
