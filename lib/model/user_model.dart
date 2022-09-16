class UserModel {
  String? name;
  String? email;
  String? number;
  UserModel({this.name, this.email, this.number});
  UserModel.fromJson(Map<String, dynamic> json) {
    name = json[name];
    email = json[email];
    number = json[number];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['phone'] = number;
    return data;
  }
}
