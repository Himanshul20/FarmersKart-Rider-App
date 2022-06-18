// To parse this JSON data, do
//
//     final centers = centersFromJson(jsonString);

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'dart:convert';



class Society {
  Society({
     this.isActive,
     this.address,
     this.userId,
     this.pincode,
     this.deliveryTime,
     this.centerName,
      this.delFlag,
     this.deliveryDays,
     this.contact,
     this.id,
    this.count
  });

  dynamic isActive;
  String address;
  String userId;
  String pincode;
  String deliveryTime;
  String centerName;
  dynamic delFlag;
  String deliveryDays;
  String contact;
  String id;
  int count;

  Map<String, dynamic> toMap() {
    return {
     "isActive": isActive,
      "address": address,
      "userId": userId,
      "pincode": pincode,
      "deliveryTime": deliveryTime,
      "centerName": centerName,
       "delFlag": delFlag,
      "deliveryDays": deliveryDays,
      "contact": contact,
      "id": id,
    };
  }

  Society.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        isActive= doc.data()["isActive"]  ,
  address= doc.data()["address"],
   userId= doc.data()["userId"]??'',
  pincode= doc.data()["pincode"],
   deliveryTime= doc.data()["deliveryTime"],
   centerName= doc.data()["centerName"],
   delFlag= doc.data()["delFlag"],
  deliveryDays= doc.data()["deliveryDays"],
   contact= doc.data()["contact"];

}


