
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

class Hotel {
  Hotel({
    this.isActive,
    this.userId,
    this.address,
    this.contact,
    this.deliveryDays,
    this.centerName,
    this.pincode,
    this.deliveryTime,
    this.hotelName,
    this.delFlag,
     this.id
   //  this.collections,
  });

  bool isActive;
  String userId;
  String address;
  String contact;
  List<String> deliveryDays;
  String centerName;
  String pincode;
  String deliveryTime;
  String hotelName;
  String delFlag;
  String id;

  // Collections collections;


  Map<String, dynamic> toMap() => {
    "isActive": isActive,
    "userId": userId,
    "address": address,
    "contact": contact,
    "deliveryDays": List<dynamic>.from(deliveryDays.map((x) => x)),
    "centerName": centerName,
    "pincode": pincode,
    "deliveryTime": deliveryTime,
    "hotelName": hotelName,
    "delFl": delFlag,
    "id": id,

    // "__collections__": collections.toJson(),
  };

  Hotel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        isActive= doc.data()["isActive"]??'',
  userId= doc.data()["userId"],
  address= doc.data()["address"],
  contact= doc.data()["contact"],
  deliveryDays= doc.data()["deliveryDays"],
  centerName= doc.data()["centerName"],
  pincode= doc.data()["pincode"],
  deliveryTime= doc.data()["deliveryTime"],
  hotelName= doc.data()["hotelName"],
  delFlag= doc.data()["delFlag"];
  // collections: Collections.fromJson(json["__collections__"]),

}
class Collections {
  Collections();

  factory Collections.fromJson(Map<String, dynamic> json) => Collections(
  );}