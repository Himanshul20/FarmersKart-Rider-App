import 'package:famerskart_rider_app/model/center.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/dataProvider.dart';
import '../../constants.dart';
import '../../custom_widgets/custom_bottom_navbar.dart';
import '../../model/order.dart';
import '../../orders/dashed_line_vertical.dart';
import '../../orders/pick_orders_screen.dart';

class OrderScreen extends StatefulWidget {
  String centerName;
  OrderScreen(this. centerName);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  DataProvider data;
  var now = DateTime.now();

  @override
  void initState() {
    data = Provider.of<DataProvider>(context, listen: false);
    data.getDataOrders(widget.centerName);
    initOrder(data);
    super.initState();
  }
  Future<void> initOrder(DataProvider data) async {
    data.orderList = data.getDataOrders(widget.centerName);
    data.retrievedOrderList = await data.getDataOrders(widget.centerName);
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
              future: prov.orderList,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Order>> snapshot) {
                if (snapshot.hasData && snapshot.data.isNotEmpty) {
                  print(prov.retrievedOrderList.length);
                  return ListView.separated(
                      itemCount: prov.retrievedOrderList.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemBuilder: (context, index) {
                        final order = prov.retrievedOrderList[index];
                        return ListTile(
                          title: Text(order.wing),
                        );
                      });
                } else if (snapshot.connectionState == ConnectionState.done &&
                    prov.retrievedOrderList.isEmpty) {
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
      Expanded rejectOrderBtn, Order order, DataProvider prov) {
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
            buildPickupRow(order),
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
                        order.address,
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
                      "CustomerName",
                      style: black12w400,
                    ),
                    Text(
                      "${order.customerName} min",
                      style: purple12w600,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [

                const SizedBox(
                  width: 8,
                ),
                Expanded(
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

  Row buildPickupRow(Order order) {
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
              order.wing,
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
