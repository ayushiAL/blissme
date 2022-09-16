import 'package:blissme/model/checkbox_model.dart';
import 'package:blissme/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/custom_font.dart';
import '../salon_about/product_detail.dart';

List<ProductModel> cart = [];
List<CheckBoxListTileModel> service = [];
int cartPrice=0;
int servicePrice=0;


class CartScreen extends StatefulWidget {
  final int srviceTotal;
  final int cartTotal;
  const CartScreen({
    Key? key,  required this.srviceTotal, required this.cartTotal,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int cartTotal = 0;

  void cartList(int index) {
    var price = cart[index].price;
    var quantity = cart[index].counter;
    setState(() {
      cart.forEach((element) {
        cartTotal = (price! * quantity);
        // var total1= cartTotal>=0?quantity++:quantity--;
        // print(total1);
      });
    });

    print(cartTotal);
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
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const CustomFont1(
          fontSize: 20,
          text: "Cart",
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Product",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              Card(
                child: Container(
                  child: ListView.builder(
                    itemCount: cart.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      ProductModel model = cart[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
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
                              margin: EdgeInsets.only(left: 10),
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(model.title ?? "",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3),
                                  Text(
                                    "HK\$ ${model.price.toString()}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          model.shoudVisible && model.counter > 0
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
                                              if (model.counter > 0) {
                                                model.counter--;
                                              }
                                              print(model.counter);
                                            });
                                          },
                                          child: Icon(Icons.remove,
                                              color: Colors.white, size: 15),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(model.counter.toString()),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            model.counter++;
                                            cartList(index);
                                          });
                                          print(model.counter);
                                        },
                                        child: Container(
                                          height: 20,
                                          width: 25,
                                          color: Colors.pink,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
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
                                      model.shoudVisible = true;
                                      model.counter++;
                                    });
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(left: 5),
                                      alignment: Alignment.center,
                                      height: 35,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Text(
                                        "Add",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      )),
                                ),
                          SizedBox(
                            height: 20,
                          )
                        ]),
                      );
                    },
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Confirmation your appoinment",
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Coupen Code',
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Price Details',
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: service.length,
                  itemBuilder: (context, index) {
                    CheckBoxListTileModel serviceModel = service[index];

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  serviceModel.title ?? "",

                                  // overflow: TextOverflow.ellipsis,

                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Text(
                                "HK \$ ${serviceModel.total.toString()}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
              // Text(cartPrice.),
              Text(cartPrice.toString()
              ),
              Text(servicePrice.toString())
            ],
          ),
        ),
      ),
    );
  }
}
