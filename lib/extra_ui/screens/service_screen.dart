import 'package:blissme/extra_ui/models/jsondata.dart';
import 'package:blissme/extra_ui/models/serviceModel.dart';
import 'package:blissme/extra_ui/widgets/custom_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen>
    with TickerProviderStateMixin {
  // static List<ServiceModel> iconList = [
  //   ServiceModel(
  //       img: 'assets/images/businesssetup.svg', name: "Business Setup"),
  //   ServiceModel(img: 'assets/images/tax.svg', name: "Tex & Compliance"),
  //   ServiceModel(img: 'assets/images/trademark.svg', name: "Trademark & Ip"),
  //   ServiceModel(img: 'assets/images/businesssetup.svg', name: "Documentation"),
  //   ServiceModel(
  //       img: 'assets/images/propertypersonal.svg', name: "Property & personal"),
  //   ServiceModel(img: 'assets/images/ngo.svg', name: "NGO"),
  //   ServiceModel(img: 'assets/images/loans.svg', name: "Loans")
  // ];
  late TabController _serviceController;
  List<Services> ourServices = [];
  List<Widget> list = [
    Tab(
      text: "Business Registration",
    ),
    Tab(
      text: "International Business Setup",
    ),
    Tab(
      text: "Company Name Search",
    ),
    Tab(
      text: "Licenses & Registation",
    ),
    Tab(
      text: "Bank Account",
    ),
  ];
  List subList = [
    "Sole Proprietship",
    "Limited Liability Partnetship",
    "One Person Company",
    "Startup India Registation",
    "Producer Company",
    "Nidhi Company",
    "Partnership Firm"
  ];

  List<Widget> taxList = [
    Tab(text: "changes in pvt ltd Company"),
    Tab(
      text: "Gst",
    ),
    Tab(
      text: "Accounting",
    ),
    Tab(
      text: "changes in pvt ltd Company",
    ),
  ];
  List<String> subTaxList = [
    "Remove a Durector",
    "Increase Authorized capital",
  ];
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ourServices =
        List<Services>.from(dataList.map((e) => Services.fromJson(e)));
    _serviceController = TabController(
        length: ourServices.elementAt(0).subCategory!.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
                size: 20,
              )),
          title: Text(
            "Our Services",
            style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          actions: [
            Container(
                alignment: Alignment.center,
                height: 32,
                width: 32,
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.question_mark_outlined,
                  color: Colors.black,
                  size: 20,
                )),
          ],
        ),
        body: NestedScrollView(
          controller: ScrollController(),
          headerSliverBuilder: (context, isScolled) {
            return [
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Choose Services to see sub-services",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 15),
                        child: GridView.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          shrinkWrap: true,
                          children: List.generate(
                              ourServices.length,
                              (index) => InkWell(
                                  onTap: () {
                                    _serviceController = TabController(
                                        length: ourServices.elementAt(index).subCategory!.length, vsync: this);
                                    setState(() {
                                      currentIndex = index;

                                    });
                                  },
                                  child: currentIndex != index
                                      ? Container(
                                          height: 100,
                                          width: 100,
                                          margin: EdgeInsets.only(top: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 50,
                                                child: SvgPicture.network(
                                                    "http://44.196.233.236/public/" +
                                                        (ourServices
                                                                .elementAt(
                                                                    index)
                                                                .icon ??
                                                            "")),
                                              ),
                                              CustomText(
                                                  colors: Colors.black,
                                                  text: ourServices
                                                          .elementAt(index)
                                                          .name ??
                                                      "",
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500)
                                            ],
                                          ),
                                        )
                                      : Container(
                                          height: 100,
                                          width: 100,
                                          margin: EdgeInsets.only(top: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: Colors.white,
                                            // border: Border(bottom: BorderSide(color: Colors.green))
                                          ),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      width: 50,
                                                      child: SvgPicture.network(
                                                          "http://44.196.233.236/public/" +
                                                              (ourServices
                                                                      .elementAt(
                                                                          index)
                                                                      .icon ??
                                                                  "")),
                                                    ),
                                                    CustomText(
                                                        colors: Colors.black,
                                                        text: ourServices
                                                                .elementAt(
                                                                    index)
                                                                .name ??
                                                            "",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 3,
                                                margin: EdgeInsets.only(
                                                    left: 15, right: 15),
                                                color: Colors.green,
                                              )
                                            ],
                                          ),
                                        ))),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ];
          },
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300)),
                child: TabBar(
                    tabs: List.generate(
                        ourServices.elementAt(currentIndex).subCategory!.length,
                        (index) => Text(ourServices
                                .elementAt(currentIndex)
                                .subCategory!
                                .elementAt(index)
                                .name ??
                            "")),
                    controller: _serviceController,
                    isScrollable: true,
                    indicator: BoxDecoration(),
                    indicatorColor: Colors.green,
                    indicatorWeight: 5,
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.black.withOpacity(0.7),
                    labelStyle: TextStyle(
                        fontFamily: "poppins",
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
              ),
              Expanded(
                child: TabBarView(
                  controller: _serviceController,
                  children: List.generate(
                    ourServices.elementAt(currentIndex).subCategory!.length,
                    (index) => ListView.builder(
                      itemCount: ourServices
                          .elementAt(currentIndex)
                          .subCategory!
                          .elementAt(index)
                          .services!
                          .length,
                      itemBuilder: (context, i) {
                        return customContainer(ourServices
                                .elementAt(currentIndex)
                                .subCategory!
                                .elementAt(index)
                                .services!
                                .elementAt(i)
                                .name ??
                            "");
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget customContainer(String text) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10, right: 15),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.green, width: 5)),
          ),
          CustomText(
            text: text,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            colors: Colors.black.withOpacity(0.7),
          )
        ],
      ),
    );
  }
}
