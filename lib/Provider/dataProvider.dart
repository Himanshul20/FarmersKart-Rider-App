import 'package:famerskart_rider_app/model/cardinfo.dart';
import 'package:famerskart_rider_app/model/center.dart';
import 'package:famerskart_rider_app/model/order.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/services/base.dart';
import 'package:url_launcher/url_launcher.dart';

class DataProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List <Society>societies =[];
  Future<List<Society>> societyList;
  List<Society> retrievedSocietyList;
   Future<List<Order>> orderList;
   List<Order> retrievedOrderList;
   int count;
 
  List <Cardinfo> cards=[ Cardinfo("SOCIETY","Society","https://thumbs.dreamstime.com/b/historic-brick-buildings-society-hill-philadelphia-pennsy-pennsylvania-85408813.jpg"),
  Cardinfo("SHOP", "Shop","https://thumbs.dreamstime.com/b/healthy-fruit-vegetables-grocery-shop-cart-supermarket-filled-food-products-as-seen-customers-point-view-127766643.jpg"),
  Cardinfo("HOTEL", "Hotel","https://thumbs.dreamstime.com/b/hotel-13341433.jpg"),
  Cardinfo("SUBSCRIPTION","Subscription","https://thumbs.dreamstime.com/b/subscribe-follow-subscription-membership-social-media-concept-people-80311282.jpg")];
  
  Future<void> initSociety() async {
    societyList = getDataSociety();
    retrievedSocietyList = await getDataSociety();
  }

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<Society>> getDataSociety() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("centers").get();
    return snapshot.docs
        .map((docSnapshot) => Society.fromDocumentSnapshot(docSnapshot))
        .toList();
    notifyListeners();
  }
  Future<int> getSocietyOrdersCount(String id) async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("orders")
        .where("centerId", isEqualTo: id)
        .get();


    count = await snapshot.docs
        .map((docSnapshot) => Order.fromDocumentSnapshot(docSnapshot))
        .toList().length;
    ("data length ${snapshot.docs.length}");
     notifyListeners();


  }

  Future<List<Order>> getDataOrders(String id) async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("orders")
        .where("centerId", isEqualTo: id)
        .get();

    //("${snapshot.docs}");
     notifyListeners();
    return snapshot.docs
        .map((docSnapshot) => Order.fromDocumentSnapshot(docSnapshot))
        .toList();
if(snapshot.docs
    .map((docSnapshot) => Order.fromDocumentSnapshot(docSnapshot))
    .toList().length!=0){

}

  }


  var firebaseUser =  FirebaseAuth.instance.currentUser;

  void onPressed() {
    _db.collection("centers").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {

        print(result.data());
      });
    });
  }
  Future<void> _refresh() async {

  }
  List<Address> results = [];
  Geocoding geocoding = Geocoder.local;

  void getCordinates(String address)async{
    var results = await geocoding.findAddressesFromQuery(address);
    this.results = results;
    var first = results.first;
    print("${first.featureName}${first.addressLine} : ${first.coordinates}");
    //openMap(latitude:first.coordinates.latitude,longitude: first.coordinates.longitude );
    open(latitude:first.coordinates.latitude,longitude: first.coordinates.longitude );
  }

  static Future<void> openMap({ double latitude,  double longitude}) async {
    String googleUrl = 'https://www.google.com';
    var uri = Uri.parse(googleUrl);
    if (await canLaunchUrl(uri)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
  static Future<bool> open({ double latitude,  double longitude}) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    try {
      await launch(
        googleUrl,
        enableJavaScript: true,
      );
      return true;
    } catch (e) {
      return false;
    }
  }
  // fetchList() {
  //
  //   RefreshIndicator(
  //     onRefresh: _refresh,
  //     child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: FutureBuilder(
  //         future:societyList ,
  //         builder:
  //             (BuildContext context, AsyncSnapshot<List<Society>> snapshot) {
  //           if (snapshot.hasData && snapshot.data!.isNotEmpty) {
  //             return ListView.separated(
  //                 itemCount: retrievedSocietyList!.length,
  //                 separatorBuilder: (context, index) => const SizedBox(
  //                   height: 10,
  //                 ),
  //                 itemBuilder: (context, index) {
  //                   return Dismissible(
  //                     onDismissed: ((direction) async{
  //
  //                     }),
  //                     background: Container(
  //                       decoration: BoxDecoration(
  //                           color: Colors.red,
  //                           borderRadius: BorderRadius.circular(16.0)),
  //                       padding: const EdgeInsets.only(right: 28.0),
  //                       alignment: AlignmentDirectional.centerEnd,
  //                       child: const Text(
  //                         "DELETE",
  //                         style: TextStyle(color: Colors.white),
  //                       ),
  //                     ),
  //                     direction: DismissDirection.endToStart,
  //                     resizeDuration: const Duration(milliseconds: 200),
  //                     key: UniqueKey(),
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                           color: const Color.fromARGB(255, 83, 80, 80),
  //                           borderRadius: BorderRadius.circular(16.0)),
  //                       child: ListTile(
  //                         onTap:() {
  //                           // Navigator.pushNamed(context, "/edit", arguments: retrievedSocietyList![index]);
  //                         },
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(8.0),
  //                         ),
  //                         title: Text(retrievedSocietyList![index].centerName),
  //                         subtitle: Text(
  //                             "${retrievedSocietyList![index].address.toString()}, ${retrievedSocietyList![index].address.toString()}"),
  //                         trailing: const Icon(Icons.arrow_right_sharp),
  //                       ),
  //                     ),
  //                   );
  //                 });
  //           } else if (snapshot.connectionState == ConnectionState.done &&
  //               retrievedSocietyList!.isEmpty) {
  //             return Center(
  //               child: ListView(
  //                 children: const <Widget>[
  //                   Align(alignment: AlignmentDirectional.center,
  //                       child: Text('No data available')),
  //                 ],
  //               ),
  //             );
  //           } else {
  //             return const Center(child: CircularProgressIndicator());
  //           }
  //         },
  //       ),
  //     ),
  //   );
  //
  //
  // }
}
