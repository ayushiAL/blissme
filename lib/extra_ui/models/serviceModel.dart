// class ServiceModel{
//   String? img;
//   String? name;
//   ServiceModel({this.img,this.name});
// }

// To parse this JSON data, do
//
//     final services = servicesFromJson(jsonString);

import 'dart:convert';

List<Services> servicesFromJson(String str) => List<Services>.from(json.decode(str).map((x) => Services.fromJson(x)));

String servicesToJson(List<Services> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Services {
  Services({
    this.id,
    this.name,
    this.icon,
    this.isActive,
    this.createAt,
    this.subCategory,
  });

  int? id;
  String? name;
  String? icon;
  bool? isActive;
  DateTime? createAt;
  List<SubCategory>? subCategory;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
    isActive: json["isActive"],
    createAt: DateTime.parse(json["createAt"]),
    subCategory: List<SubCategory>.from(json["subCategory"].map((x) => SubCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "isActive": isActive,
    "createAt": createAt?.toIso8601String(),
    "subCategory": List<dynamic>.from(subCategory!.map((x) => x.toJson())),
  };
}

class SubCategory {
  SubCategory({
    this.id,
    this.name,
    this.isActive,
    this.categoryId,
    this.createAt,
    this.services,
  });

  int? id;
  String? name;
  bool? isActive;
  int? categoryId;
  DateTime? createAt;
  List<Service>? services;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["id"],
    name: json["name"],
    isActive: json["isActive"],
    categoryId: json["categoryId"],
    createAt: DateTime.parse(json["createAt"]),
    services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "isActive": isActive,
    "categoryId": categoryId,
    "createAt": createAt?.toIso8601String(),
    "services": List<dynamic>.from(services!.map((x) => x.toJson())),
  };
}

class Service {
  Service({
    this.id,
    this.name,
    this.icon,
    this.serviceImage,
    this.serviceTotalAmount,
    this.serviceTokenAmount,
    this.overview,
    this.benefits,
    this.document,
    this.deliverable,
    this.isOnlinePayment,
    this.isActive,
    this.pdfUrl,
    this.categoryId,
    this.subCategoryId,
    this.createAt,
  });

  int? id;
  String? name;
  String? icon;
  String? serviceImage;
  int? serviceTotalAmount;
  int? serviceTokenAmount;
  Overview? overview;
  List<String>? benefits;
  List<String>? document;
  List<dynamic>? deliverable;
  bool? isOnlinePayment;
  bool? isActive;
  String? pdfUrl;
  int? categoryId;
  int? subCategoryId;
  DateTime? createAt;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
    serviceImage: json["service_image"],
    serviceTotalAmount: json["service_total_amount"],
    serviceTokenAmount: json["service_token_amount"],
    overview: Overview.fromJson(json["overview"]),
    benefits: List<String>.from(json["benefits"].map((x) => x)),
    document: List<String>.from(json["document"].map((x) => x)),
    deliverable: List<dynamic>.from(json["deliverable"].map((x) => x)),
    isOnlinePayment: json["is_online_payment"],
    isActive: json["isActive"],
    pdfUrl: json["pdfURL"] == null ? null : json["pdfURL"],
    categoryId: json["categoryId"],
    subCategoryId: json["subCategoryId"],
    createAt: DateTime.parse(json["createAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
    "service_image": serviceImage,
    "service_total_amount": serviceTotalAmount,
    "service_token_amount": serviceTokenAmount,
    "overview": overview!.toJson(),
    "benefits": List<dynamic>.from(benefits!.map((x) => x)),
    "document": List<dynamic>.from(document!.map((x) => x)),
    "deliverable": List<dynamic>.from(deliverable!.map((x) => x)),
    "is_online_payment": isOnlinePayment,
    "isActive": isActive,
    "pdfURL": pdfUrl == null ? null : pdfUrl,
    "categoryId": categoryId,
    "subCategoryId": subCategoryId,
    "createAt": createAt!.toIso8601String(),
  };
}

class Overview {
  Overview({
    this.penalty,
    this.duration,
    this.description,
  });

  Penalty? penalty;
  String? duration;
  String? description;

  factory Overview.fromJson(Map<String, dynamic> json) => Overview(
    penalty: penaltyValues.map?[json["penalty"]],
    duration: json["duration"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "penalty": penaltyValues.reverse?[penalty],
    "duration": duration,
    "description": description,
  };
}

enum Penalty { NO, NOT }

final penaltyValues = EnumValues({
  "No": Penalty.NO,
  "Not": Penalty.NOT
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
