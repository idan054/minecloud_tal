// To parse this JSON data, do
//
//     final plansModel = plansModelFromJson(jsonString);

import 'dart:convert';

List<PlansModel> plansModelFromJson(String str) => List<PlansModel>.from(json.decode(str).map((x) => PlansModel.fromJson(x)));

String plansModelToJson(List<PlansModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PlansModel {
  PlansModel({
    this.planTitle,
    this.planDesc,
    this.isSelected = false,
  });

  String? planTitle;
  String? planDesc;
  bool isSelected;

  factory PlansModel.fromJson(Map<String, dynamic> json) => PlansModel(
    planTitle: json["planTitle"],
    planDesc: json["planDesc"],
    isSelected: json["isSelected"],
  );

  Map<String, dynamic> toJson() => {
    "planTitle": planTitle,
    "planDesc": planDesc,
    "isSelected": isSelected,
  };
}
