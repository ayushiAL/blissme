class SalonModel {
  String? image;
  String? name;
  SalonModel({this.image, this.name});
}

class SalonModelList {
  static List<SalonModel> salonModelList = [
    SalonModel(image: "assets/images/salon_photo.png", name: "Le Spa by Jan"),
    SalonModel(
        image: "assets/images/salon_photo2.png",
        name: "Sala Raj Thai Traditional Massage"),
    SalonModel(image: "assets/images/pic.png", name: "Sandy Spa"),
    SalonModel(
        image: "assets/images/pic2.png",
        name: "Tony Spa by TonyJan"),
  ];
}


class FaceMassageModel{
  String? image;
  String? name;
  FaceMassageModel({this.image, this.name});
}

class FaceModelList {
  static List<FaceMassageModel> faceModelList = [
    FaceMassageModel(image: "assets/images/salon_photo.png", name: "Le Spa by Jan"),
    FaceMassageModel(
        image: "assets/images/salon_photo2.png",
        name: "Sala Raj Thai Traditional Massage"),
    FaceMassageModel(image: "assets/images/pic.png", name: "Sandy Spa"),
    FaceMassageModel(
        image: "assets/images/pic2.png",
        name: "Tony Spa by TonyJan"),
  ];
}
