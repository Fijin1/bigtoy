import 'package:flutter/rendering.dart';

class CarModel {
  String name;
  String purchase;
  String expanse;
  String sold;
  String image;


  String id;


  CarModel(
      {required this.name, required this.image, required this.id,required this.purchase,required this.expanse,required this.sold,});

  Map<String, dynamic> toMap() {
    return {"name": this.name, "image": this.image, "id": this.id,"purchase": this.purchase,"expence":this.expanse,"sold":this.sold};
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      name: map["name"] ?? "",
      image: map["image"] ?? "",
      id: map["id"] ?? "",
      purchase: map["purchase"] ?? "",
      expanse: map["expanse"] ?? "",
      sold: map["sold"] ?? "",

    );
  }

  CarModel copyWith({String? name, String? image, String? id,String? purchase, String? expanse, String? sold,}) {
    return CarModel(
      name: name ?? this.name,
      image: image ?? this.image,
      id: id ?? this.id,
      purchase: purchase?? this.purchase,
      expanse: expanse?? this.expanse,
      sold: sold?? this.sold,


    );
  }
}