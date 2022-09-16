import 'package:blissme/screens/all_screen/salon_about_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../model/salon_model.dart';
import '../../widgets/custom_font.dart';

class TopSalonScreen extends StatefulWidget {
  const TopSalonScreen({Key? key}) : super(key: key);

  @override
  State<TopSalonScreen> createState() => _TopSalonScreenState();
}

class _TopSalonScreenState extends State<TopSalonScreen>
    with SingleTickerProviderStateMixin {
  List<dynamic> model = [
    "assets/images/pic.png",
    "assets/images/pic2.png",
    "assets/images/pic3.png"
  ];
  PageController controller = PageController();
  int currpage = 0;
  bool? isSelected;
  late TabController _tabController;
  int selectedIndex = 0;
  List<Widget> list = [
    Tab(text: "Beauty"),
    Tab(text: "Face Wash"),
    Tab(text: "Face Massage"),
    Tab(text: "Face Massage"),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: list.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: CustomFont1(
          text: selectedIndex == 1
              ? "Face Wash"
              : selectedIndex >= 2
                  ? "Face Massage"
                  : "Top Salon",
          fontSize: 20,
        ),
        actions: [
          const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.pink,
                ),
                const SizedBox(
                  width: 10,
                ),
                const CustomFont1(text: "Mong Kok Flower Market", fontSize: 18),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
              child: PageView.builder(
                  itemCount: model.length,
                  controller: controller,
                  onPageChanged: (value) {
                    currpage = value;
                  },
                  itemBuilder: ((context, index) {
                    return Image.asset(
                      model[index],
                      fit: BoxFit.cover,
                    );
                  })),
            ),
            TabBar(
                isScrollable: true,
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                tabs: list),
            const Align(
                alignment: Alignment.centerLeft,
                child: const CustomFont1(text: "Top Salon", fontSize: 20)),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: SalonModelList.salonModelList.length,
                    itemBuilder: (context, index) {
                      SalonModel model = SalonModelList.salonModelList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SalonAboutScreen(
                                      image: model.image ?? "",
                                      title: model.name ?? "",
                                    )),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            height: 140,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        model.image ?? "",
                                        height: 140,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 15, bottom: 15),
                                      height: 20,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
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
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 15, bottom: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          model.name ?? "",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              fontFamily: "Roboto",
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        const Text(
                                          "10:00 AM to 02:00 AM",
                                          style: TextStyle(color: Colors.green),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: Colors.black,
                                                ),
                                                const CustomFont1(
                                                    text: "2.5 km",
                                                    fontSize: 12),
                                              ],
                                            ),
                                            Container(
                                                alignment: Alignment.center,
                                                height: 35,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                  color: Colors.pink,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: const Text(
                                                  "Book",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: FaceModelList.faceModelList.length,
                    itemBuilder: (context, index) {
                      FaceMassageModel model =
                          FaceModelList.faceModelList[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          height: 140,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      model.image ?? "",
                                      height: 140,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 15, bottom: 15),
                                    height: 20,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
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
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 15, bottom: 15),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        model.name ?? "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            fontFamily: "Roboto",
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      const Text(
                                        "10:00 AM to 02:00 AM",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on,
                                                color: Colors.black,
                                              ),
                                              const CustomFont1(
                                                  text: "2.5 km", fontSize: 12),
                                            ],
                                          ),
                                          Container(
                                              alignment: Alignment.center,
                                              height: 35,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                color: Colors.pink,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: const Text(
                                                "Book",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: FaceModelList.faceModelList.length,
                    itemBuilder: (context, index) {
                      FaceMassageModel faceModel =
                          FaceModelList.faceModelList[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          height: 140,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      faceModel.image ?? "",
                                      height: 140,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 15, bottom: 15),
                                    height: 20,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
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
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 15, bottom: 15),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        faceModel.name ?? "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            fontFamily: "Roboto",
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      const Text(
                                        "10:00 AM to 02:00 AM",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on,
                                                color: Colors.black,
                                              ),
                                              const CustomFont1(
                                                  text: "2.5 km", fontSize: 12),
                                            ],
                                          ),
                                          Container(
                                              alignment: Alignment.center,
                                              height: 35,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                color: Colors.pink,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: const Text(
                                                "Book",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: SalonModelList.salonModelList.length,
                    itemBuilder: (context, index) {
                      SalonModel model = SalonModelList.salonModelList[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          height: 140,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      model.image ?? "",
                                      height: 140,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 15, bottom: 15),
                                    height: 20,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
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
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 15, bottom: 15),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        model.name ?? "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            fontFamily: "Roboto",
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      const Text(
                                        "10:00 AM to 02:00 AM",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on,
                                                color: Colors.black,
                                              ),
                                              const CustomFont1(
                                                  text: "2.5 km", fontSize: 12),
                                            ],
                                          ),
                                          Container(
                                              alignment: Alignment.center,
                                              height: 35,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                color: Colors.pink,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: const Text(
                                                "Book",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget customButton(String text) {
    return Row(
      children: [
        Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 15, top: 7, right: 10),
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ))
        // : Container(
        //     alignment: Alignment.center,
        //     margin: const EdgeInsets.only(bottom: 15, top: 7, right: 10),
        //     height: 40,
        //     width: 120,
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       border: Border.all(color: const Color(0xffA6A6A6)),
        //       borderRadius: BorderRadius.circular(20),
        //     ),
        //     child: Text(
        //       text,
        //       style: const TextStyle(
        //           color: const Color(0xffA6A6A6), fontSize: 15),
        //     ))
      ],
    );
  }
}
