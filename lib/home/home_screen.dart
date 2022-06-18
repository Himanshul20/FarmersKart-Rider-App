import 'package:famerskart_rider_app/Provider/dataProvider.dart';
import 'package:famerskart_rider_app/auth/login_screen.dart';
import 'package:famerskart_rider_app/constants.dart';
import 'package:famerskart_rider_app/custom_widgets/custom_bottom_navbar.dart';
import 'package:famerskart_rider_app/home/distributorScreen/societyscreen.dart';
import 'package:famerskart_rider_app/main.dart';
import 'package:famerskart_rider_app/model/center.dart';
import 'package:famerskart_rider_app/orders/dashed_line_vertical.dart';
import 'package:famerskart_rider_app/orders/pick_orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/login_screen_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const btnGray = Color(0xFF999999);
  DataProvider data;

//   @override
//   void initState() {
//    prov=Provider.of<LoginScreen>(context,listen: false);
//     var data = Provider.of<DataProvider>(context,listen: false);
//     data.getData();
//     // TODO: implement initState
//     super.initState();
//   }
  @override
  void initState() {
    data = Provider.of<DataProvider>(context, listen: false);
    data.initSociety();
    super.initState();
  }

  Future<void> _refresh() async {
    // data.initSociety();
  }

  var divider = Container(
    height: 1.5,
    width: 100,
    color: dividerGray,
  );
  var verticalDashes = Container(
    margin: const EdgeInsets.only(
      left: 12,
      top: 5,
      bottom: 5,
    ),
    child: CustomPaint(
      size: const Size(1, 26),
      painter: DashedLineVerticalPainter(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var btnPickOrder = Expanded(
        child: ElevatedButton(
      onPressed: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const PickOrders(),
        //   ),
        // );
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(0, 30),
        primary: primaryColor,
        side: const BorderSide(
          color: primaryColor,
        ),
      ),
      child: const Text(
        "Pick OrdeXXr",
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    ));
    var rejectOrderBtn = Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(0, 30),
          primary: Colors.white,
          side: const BorderSide(
            color: btnGray,
          ),
        ),
        child: const Text(
          "Reject",
          style: TextStyle(
            color: btnGray,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );

    return Consumer<DataProvider>(builder: (context, prov, _) {
      prov.getDataSociety();
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: gray,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
                onTap: () {
                  // prov.SignOutME();
                },
                child: Icon(Icons.logout))
          ],
          toolbarHeight: 70,
          leading: Switch(
            onChanged: (bool value) {},
            value: false,
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(),
        body: Container(
          child: ListView.separated(separatorBuilder: (ctx,_){
            return Divider(thickness: 2,);
          },
              itemCount: prov.cards.length,
              itemBuilder: (context, i) {
                final item = prov.cards[i];
                return GestureDetector(
                  onTap: (){
                    if(item.type=="Society"){

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SocietyScreen();}));
                    }
                  },
                  child: Container(
                    height: 200,
                    width: 400,
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          opacity: 0.8,
                          image: NetworkImage(item.imageurl),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(

                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [


                        Positioned(top: 160,
                          child: SizedBox(
                            width: 450,
                            child: ElevatedButton(

                                style: ButtonStyle(

                                  backgroundColor:
                                  MaterialStateProperty.all(primaryColor.withOpacity(0.7)),
                                ),
                                onPressed: () {
                                  if(item.type=="Society"){

                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SocietyScreen();}));
                                        }
                                },
                                child: Text(item.cardName,style: TextStyle(fontSize: 25),)),
                          ),
                        )
                      ],
                    ),
                  ),
                );
                //   ListTile(
                //   iconColor: Colors.red,
                //   leading: Icon(Icons.label),
                //   title:Text(item.cardName) ,
                //   onTap: (){
                //     if(item.type=="Society"){
                //
                //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SocietyScreen();}));
                //     }
                //   },
                // );
              }),
        ),
      );
    });
  }

  Card buildOrderCard(Container divider, Container verticalDashes,
      Expanded rejectOrderBtn, Expanded btnPickOrder) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(left: 23, right: 23, bottom: 17),
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 15, 14, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox8,
            buildPickupRow(),
            verticalDashes,
            buildDeliveryRow(),
            Row(
              children: [
                rejectOrderBtn,
                const SizedBox(
                  width: 8,
                ),
                btnPickOrder
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildDeliveryRow() {
    return Row(
      children: [
        const Icon(
          Icons.storefront,
          color: shopGreen,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "K. Khurana shop no 1 Pune",
              style: shopGreen10w400,
            ),
            Text(
              "Delivery Location",
              style: darkGray8w400,
            ),
          ],
        ),
        Expanded(
          child: Container(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              "ETA",
              style: black12w400,
            ),
            Text(
              "28 min",
              style: purple12w600,
            ),
          ],
        ),
      ],
    );
  }

  Row buildPickupRow() {
    return Row(
      children: [
        const Icon(
          Icons.home_work_outlined,
          color: primaryColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "FarmersKart",
              style: purple14w400,
            ),
            Text(
              "Pick up Location",
              style: darkGray8w400,
            ),
          ],
        )
      ],
    );
  }
}
