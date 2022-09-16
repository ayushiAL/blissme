class FaceMassageModel{
  String? image;
  String? name;
  FaceMassageModel({this.image, this.name});
}

class FaceModelList {
  static List<FaceMassageModel> faceModelList = [
    FaceMassageModel(image: "assets/images/face1.png", name: "Le Spa by Jan"),
    FaceMassageModel(
        image: "assets/images/face2.png",
        name: "Sala Raj Thai Traditional Massage"),
    FaceMassageModel(image: "face3.png", name: "Sandy Spa"),
    FaceMassageModel(
        image: "face4.png",
        name: "Tony Spa by TonyJan"),
  ];
}
