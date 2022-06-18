// To parse this JSON data, do
//
//     final order = orderFromMap(jsonString);

import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'dart:convert';


String orderToMap(Order data) => json.encode(data.toMap());

class Order {
  Order({
    this.id,
    this.unpaidAmount,
    this.totalAmount,
    this.couponId,
    this.societyName,
    this.customerId,
    this.orderStatus,
    this.deliveryAmount,
    this.customerName,
    this.feedback,
    this.riderToken,
    this.packedBy,
    this.datePlaced,
    this.riderReview,
    this.unpaidStatus,
    this.centerId,
    this.riderNumber,
    this.riderName,
    this.datePicked,
    this.riderId,
    this.isCompleted,
    this.isUpdated,
    this.customerToken,
    this.customerNumber,
    this.discountAmount,
    this.wing,
    this.riderStatus,
    this.couponCode,
    this.items,
    this.payment,
    this.paidUnpaidAmount,
    this.customerEmail,
    this.dateDelivered,
    this.customerReview,
    this.address,
    this.deliveryInstructions,
    this.flatNo,
    this.itemTotalAmount,
    this.userType,
    this.isCancelled,
    this.isRated,
    this.collections,
  });

  String id;
  dynamic unpaidAmount;
  dynamic totalAmount;
  dynamic couponId;
  String societyName;
  String customerId;
  Status orderStatus;
  dynamic deliveryAmount;
  String customerName;
  String feedback;
  String riderToken;
  String packedBy;
  dynamic datePlaced;
  String riderReview;
  String unpaidStatus;
  String centerId;
  String riderNumber;
  String riderName;
  String datePicked;
  String riderId;
  dynamic isCompleted;
  dynamic isUpdated;
  String customerToken;
  String customerNumber;
  dynamic discountAmount;
  String wing;
  String riderStatus;
  String couponCode;
  List<Item> items;
  List<Payment> payment;
  String paidUnpaidAmount;
  String customerEmail;
  String dateDelivered;
  String customerReview;
  String address;
  String deliveryInstructions;
  String flatNo;
  dynamic itemTotalAmount;
  String userType;
  dynamic isCancelled;
  dynamic isRated;
  Collections collections;

  // factory Order.fromMap(Map<String, dynamic> json) => Order(
  //   unpaidAmount: json["unpaidAmount"],
  //   totalAmount: json["totalAmount"],
  //   couponId: json["couponId"],
  //   societyName: json["societyName"],
  //   customerId: json["customerId"],
  //   orderStatus: statusValues.map[json["orderStatus"]],
  //   deliveryAmount: json["deliveryAmount"],
  //   customerName: json["customerName"],
  //   feedback: json["feedback"],
  //   riderToken: json["riderToken"],
  //   packedBy: json["packedBy"],
  //   datePlaced: json["datePlaced"],
  //   riderReview: json["riderReview"],
  //   unpaidStatus: json["unpaidStatus"],
  //   centerId: json["centerId"],
  //   riderNumber: json["riderNumber"],
  //   riderName: json["riderName"],
  //   datePicked: json["datePicked"],
  //   riderId: json["riderId"],
  //   isCompleted: json["isCompleted"],
  //   isUpdated: json["isUpdated"],
  //   customerToken: json["customerToken"],
  //   customerNumber: json["customerNumber"],
  //   discountAmount: json["discountAmount"],
  //   wing: json["wing"],
  //   riderStatus: json["riderStatus"],
  //   couponCode: json["couponCode"],
  //   items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
  //   payment: List<Payment>.from(json["payment"].map((x) => Payment.fromMap(x))),
  //   paidUnpaidAmount: json["paidUnpaidAmount"],
  //   customerEmail: json["customerEmail"],
  //   dateDelivered: json["dateDelivered"],
  //   customerReview: json["customerReview"],
  //   address: json["address"],
  //   deliveryInstructions: json["deliveryInstructions"],
  //   flatNo: json["flatNo"],
  //   itemTotalAmount: json["itemTotalAmount"],
  //   userType: json["userType"],
  //   isCancelled: json["isCancelled"],
  //   isRated: json["isRated"],
  //   collections: Collections.fromMap(json["__collections__"]),
  // );

  Map<String, dynamic> toMap() => {
        "unpaidAmount": unpaidAmount,
        "totalAmount": totalAmount,
        "couponId": couponId,
        "societyName": societyName,
        "customerId": customerId,
        "orderStatus": statusValues.reverse[orderStatus],
        "deliveryAmount": deliveryAmount,
        "customerName": customerName,
        "feedback": feedback,
        "riderToken": riderToken,
        "packedBy": packedBy,
        "datePlaced": datePlaced,
        "riderReview": riderReview,
        "unpaidStatus": unpaidStatus,
        "centerId": centerId,
        "riderNumber": riderNumber,
        "riderName": riderName,
        "datePicked": datePicked,
        "riderId": riderId,
        "isCompleted": isCompleted,
        "isUpdated": isUpdated,
        "customerToken": customerToken,
        "customerNumber": customerNumber,
        "discountAmount": discountAmount,
        "wing": wing,
        "riderStatus": riderStatus,
        "couponCode": couponCode,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "payment": List<dynamic>.from(payment.map((x) => x.toMap())),
        "paidUnpaidAmount": paidUnpaidAmount,
        "customerEmail": customerEmail,
        "dateDelivered": dateDelivered,
        "customerReview": customerReview,
        "address": address,
        "deliveryInstructions": deliveryInstructions,
        "flatNo": flatNo,
        "itemTotalAmount": itemTotalAmount,
        "userType": userType,
        "isCancelled": isCancelled,
        "isRated": isRated,
        "__collections__": collections.toMap(),
      };

  Order.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        unpaidAmount = doc.data()["unpaidAmount"],
        totalAmount = doc.data()["totalAmount"],
        couponId = doc.data()["couponId"],
        societyName = doc.data()["societyName"],
        customerId = doc.data()["customerId"],

        //orderStatus: statusValues.map[json["orderStatus"]],
        deliveryAmount = doc.data()["deliveryAmount"],
        customerName = doc.data()["customerName"],
        feedback = doc.data()["feedback"],
        riderToken = doc.data()["riderToken"],
        packedBy = doc.data()["packedBy"],
        datePlaced = doc.data()["datePlaced"],
        riderReview = doc.data()["riderReview"],
        unpaidStatus = doc.data()["unpaidStatus"],
        centerId = doc.data()["centerId"],
        riderNumber = doc.data()["riderNumber"],
        riderName = doc.data()["riderName"],
        datePicked = doc.data()["datePicked"]==null?'':doc.data()["datePicked"].toString(),
        riderId = doc.data()["riderId"],
        isCompleted = doc.data()["isCompleted"],
        isUpdated = doc.data()["isUpdated"],
        customerToken = doc.data()["customerToken"],
        customerNumber = doc.data()["customerNumber"],
        discountAmount = doc.data()["discountAmount"],
        wing = doc.data()["wing"],
        riderStatus = doc.data()["riderStatus"],
        couponCode = doc.data()["couponCode"],
        paidUnpaidAmount = doc.data()["paidUnpaidAmount"].toString(),
        customerEmail = doc.data()["customerEmail"],
        dateDelivered = doc.data()["dateDelivered"].toString(),
        customerReview = doc.data()["customerReview"],
        address = doc.data()["address"],
        deliveryInstructions = doc.data()["deliveryInstructions"],
        flatNo = doc.data()["flatNo"],
        itemTotalAmount = doc.data()["itemTotalAmount"],
        userType = doc.data()["userType"],
        isCancelled = doc.data()["isCancelled"],
        isRated = doc.data()["isRated"];

//       collections: Collections.fromMap(json["__collections__"]),
// items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
// payment: List<Payment>.from(json["payment"].map((x) => Payment.fromMap(x))),

}

class Collections {
  Collections();

  factory Collections.fromMap(Map<String, dynamic> json) => Collections();

  Map<String, dynamic> toMap() => {};
}

class Item {
  Item({
    this.comment,
    this.originalPrice,
    this.name,
    this.itemStatus,
    this.category,
    this.discountedPrice,
    this.hsn,
    this.imageUrl,
    this.quantity,
    this.categoryName,
    this.productId,
    this.weight,
    this.subCategory,
    this.gst,
    this.message,
    this.brandName,
  });

  String comment;
  dynamic originalPrice;
  String name;
  Status itemStatus;
  Category category;
  dynamic discountedPrice;
  String hsn;
  String imageUrl;
  dynamic quantity;
  CategoryName categoryName;
  String productId;
  String weight;
  String subCategory;
  String gst;
  String message;
  BrandName brandName;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        comment: json["comment"],
        originalPrice: json["originalPrice"],
        name: json["name"],
        itemStatus: statusValues.map[json["itemStatus"]],
        category: categoryValues.map[json["category"]],
        discountedPrice: json["discountedPrice"],
        hsn: json["hsn"],
        imageUrl: json["imageUrl"],
        quantity: json["quantity"],
        categoryName: categoryNameValues.map[json["categoryName"]],
        productId: json["productId"],
        weight: json["weight"],
        subCategory: json["SubCategory"],
        gst: json["gst"],
        message: json["message"],
        brandName: brandNameValues.map[json["brandName"]],
      );

  Map<String, dynamic> toMap() => {
        "comment": comment,
        "originalPrice": originalPrice,
        "name": name,
        "itemStatus": statusValues.reverse[itemStatus],
        "category": categoryValues.reverse[category],
        "discountedPrice": discountedPrice,
        "hsn": hsn,
        "imageUrl": imageUrl,
        "quantity": quantity,
        "categoryName": categoryNameValues.reverse[categoryName],
        "productId": productId,
        "weight": weight,
        "SubCategory": subCategory,
        "gst": gst,
        "message": message,
        "brandName": brandNameValues.reverse[brandName],
      };
}

enum BrandName { EMPTY, GREENS2_GRAINS }

final brandNameValues = EnumValues(
    {"": BrandName.EMPTY, "Greens2grains": BrandName.GREENS2_GRAINS});

enum Category {
  CUX_DK_TK_Y6_D7_DF_TH_P_QC1_I,
  S_FTK7_B_VX_CPBER6_M_IR_AZX,
  OF1_VWDZ2_FOM_L_RN_XKTVOV
}

final categoryValues = EnumValues({
  "CUXDkTkY6D7dfThPQc1I": Category.CUX_DK_TK_Y6_D7_DF_TH_P_QC1_I,
  "OF1Vwdz2fomLRnXKTVOV": Category.OF1_VWDZ2_FOM_L_RN_XKTVOV,
  "SFtk7bVxCPBER6MIrAZX": Category.S_FTK7_B_VX_CPBER6_M_IR_AZX
});

enum CategoryName { FRUITS, FRESH_VEGETABLES, EXOTIC_VEGETABLES }

final categoryNameValues = EnumValues({
  " Exotic Vegetables ": CategoryName.EXOTIC_VEGETABLES,
  "Fresh Vegetables ": CategoryName.FRESH_VEGETABLES,
  "Fruits": CategoryName.FRUITS
});

enum Status { PLACED }

final statusValues = EnumValues({"placed": Status.PLACED});

class Payment {
  Payment({
    this.amount,
    this.method,
    this.data,
  });

  dynamic amount;
  String method;
  dynamic data;

  factory Payment.fromMap(Map<String, dynamic> json) => Payment(
        amount: json["amount"],
        method: json["method"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "amount": amount,
        "method": method,
        "data": data,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
