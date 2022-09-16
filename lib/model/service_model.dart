class ServiceModel {
  String? img;
  String? text;
  String? place;
  ServiceModel({this.img, this.text, this.place});
}

class ServiceModelList {
  static List<ServiceModel> serviceModelList = [
    ServiceModel(
        img: "assets/images/Group2.png", text: "Beauty", place: "28 place"),
    ServiceModel(
        img: "assets/images/Group3.png", text: "Face Wash", place: "20 place"),
    ServiceModel(
        img: "assets/images/Group9.png",
        text: "Face Massage",
        place: "22 place"),
    ServiceModel(
        img: "assets/images/Group10.png",
        text: "Leg Massage",
        place: "18 place"),
    ServiceModel(
        img: "assets/images/Group12.png", text: "Beauty", place: "28 place"),
    ServiceModel(
        img: "assets/images/Group13.png", text: "Face Wash", place: "28 place"),
  ];
}
