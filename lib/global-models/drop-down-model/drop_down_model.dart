import 'package:get/get.dart';

class DropdownModel {
  int? id;
  String? name;
  String? image;
  String? stringId;
  RxBool? isCheck = false.obs;

  DropdownModel({this.id, this.name, this.image, this.stringId, this.isCheck});

  DropdownModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    image = json['Image'];
    if (json['StringId'] != null) {
      stringId = json['StringId'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Image'] = image;
    return data;
  }
}
