class CheckBoxListTileModel {
  bool? check;
  String? title;
  int? total;
  String? time;

  CheckBoxListTileModel({this.check, this.title, this.total, this.time});
}
class CheckModelList{
  static List<CheckBoxListTileModel> checkModelList=[
    CheckBoxListTileModel(
      check: true,
        title: "Skin Radiance Facial",
        total: 588,
         time: "60 min",
         ),
      CheckBoxListTileModel(
         title: "Oily, Combination, Sensitive or Acne Prone skin Ainhoa Vitaminal Facial",
        total: 20,
         time: "60 min",
        ),
      CheckBoxListTileModel(
         title: "Neem & Tulsi Back Treatment",
        total: 300,
         time: "60 min",
         ),
      CheckBoxListTileModel(
         title: "Lotus and Barley Back Treatment",
        total: 200,
         time: "60 min",
         ),
      CheckBoxListTileModel(
         title: "Ainhoa Oxygen Facial",
        total: 100,
         time: "60 min",
      ),
  ];
}
