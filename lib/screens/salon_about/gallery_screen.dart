import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class GalleryScreen extends StatelessWidget {
  GalleryScreen({Key? key}) : super(key: key);
  List<dynamic> list = [
    "assets/images/face1.png",
    "assets/images/face2.png",
    "assets/images/face3.png",
    "assets/images/face4.png",
    "assets/images/image1.png",
    "assets/images/image2.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: GridView.builder(
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 10, mainAxisExtent: 200),
      //     itemCount: list.length,
      //     itemBuilder: (context, index) {
      //       return Container(
      //         height: 200,
      //         width: 200,
      //         child: Image.asset(list[index]),
      //       );
      //     }),
    );
  }
}
