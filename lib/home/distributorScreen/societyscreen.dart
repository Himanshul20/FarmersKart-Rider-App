import 'package:famerskart_rider_app/model/center.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/dataProvider.dart';
import '../../constants.dart';
import '../../custom_widgets/custom_bottom_navbar.dart';
import '../../orders/dashed_line_vertical.dart';
import '../../orders/pick_orders_screen.dart';
import 'orderScreen.dart';

class SocietyScreen extends StatefulWidget {
  @override
  State<SocietyScreen> createState() => _SocietyScreenState();
}

class _SocietyScreenState extends State<SocietyScreen> {
  var data;
  var now = DateTime.now();

  @override
  void initState() {
    data = Provider.of<DataProvider>(context, listen: false);
    super.initState();
  }

  static const btnGray = Color(0xFF999999);
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  Widget build(BuildContext context) {
    var divider = Container(
      height: 1.5,
      width: double.infinity,
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
          "More Option",
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
        body: RefreshIndicator(
          onRefresh: refresh,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder(
              future: prov.societyList,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Society>> snapshot) {
                if (snapshot.hasData && snapshot.data.isNotEmpty) {
                  return ListView.separated(
                      itemCount: prov.retrievedSocietyList.length==null?0:prov.retrievedSocietyList.length,
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemBuilder: (context, index) {
                        final center = prov.retrievedSocietyList[index];
                        return buildOrderCard(divider, verticalDashes,
                            rejectOrderBtn, center,prov);
                      });
                } else if (snapshot.connectionState == ConnectionState.done &&
                    prov.retrievedSocietyList.isEmpty) {
                  return Center(
                    child: ListView(
                      children: const <Widget>[
                        Align(
                            alignment: AlignmentDirectional.center,
                            child: Text('No data available')),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      );
    });
  }

  Future<void> refresh() async {}

  Card buildOrderCard(Container divider, Container verticalDashes,
      Expanded rejectOrderBtn, Society center, DataProvider prov) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 17),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(14, 15, 14, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildOrderTitleRow(),
            sizedBox8,
            divider,
            sizedBox8,
            buildPickupRow(center,prov),
            verticalDashes,
            Row(
              children: [
                const Icon(
                  Icons.storefront,
                  color: shopGreen,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        center.address,
                        style: shopGreen10w400,
                      ),
                      Text(
                        "Delivery Location",
                        style: darkGray8w400,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "ETA",
                      style: black12w400,
                    ),
                    Text(
                      "${center.deliveryTime} min",
                      style: purple12w600,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      prov.getCordinates(center.address);

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [

                        Icon(
                          Icons.location_on_outlined,
                          size: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "View on map",
                          style: white12w700,
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => PickOrders(center.id),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(0, 30),
                      primary: primaryColor,
                      side: const BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    child: const Text(
                      "Pick Order",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

 buildPickupRow(Society center, DataProvider prov)  {
    prov.getSocietyOrdersCount(center.id);
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
          children: [
            Text(
              center.centerName,
              style: purple14w400,
            ),
            Text(
              "Pick up Location",
              style: darkGray8w400,
            ),
          ],
        ),
        SizedBox(width: 40,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Orders ",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "${prov.count}",
                style: purple14w400,
              ),

            ],
          ),
        )

      ],
    );
  }

  Row buildOrderTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Society",
          style: shopGreen12w400,
        ),
        Text(
          " ${now.day} ${months[now.month]}, ${now.year}, Today",
          style: lightGray12w400,
        ),
      ],
    );
  }
}
