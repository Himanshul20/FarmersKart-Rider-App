import 'package:famerskart_rider_app/constants.dart';
import 'package:famerskart_rider_app/custom_widgets/custom_bottom_navbar.dart';
import 'package:famerskart_rider_app/custom_widgets/custom_chip.dart';
import 'package:famerskart_rider_app/orders/delivered_orders_screen.dart';
import 'package:famerskart_rider_app/orders/recent_orders_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashed_line_vertical.dart';

class ScheduledOrdersScreen extends StatefulWidget {
  const ScheduledOrdersScreen({Key key}) : super(key: key);

  @override
  _ScheduledOrdersScreenState createState() => _ScheduledOrdersScreenState();
}

class _ScheduledOrdersScreenState extends State<ScheduledOrdersScreen> {
  static const btnGray = Color(0xFF999999);

  @override
  Widget build(BuildContext context) {
    var searchButton = InkWell(
      onTap: () {
        print("Search Button tapped");
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: gray,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(3),
          ),
        ),
        child: const Icon(
          Icons.search,
          color: searchIconColor,
        ),
      ),
    );

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
    var btnPickOrder = Expanded(
      child: ElevatedButton(
        onPressed: () {},
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
          "Reject",
          style: TextStyle(
            color: btnGray,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(),
      body: Column(
        children: [
          buildSelectionRow(searchButton),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  sizedBox20,
                  buildOrderCard(
                    divider,
                    verticalDashes,
                    rejectOrderBtn,
                    btnPickOrder,
                  ),
                  buildOrderCard(
                    divider,
                    verticalDashes,
                    rejectOrderBtn,
                    btnPickOrder,
                  ),
                  buildOrderCard(
                    divider,
                    verticalDashes,
                    rejectOrderBtn,
                    btnPickOrder,
                  ),
                  buildOrderCard(
                    divider,
                    verticalDashes,
                    rejectOrderBtn,
                    btnPickOrder,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Card buildOrderCard(Container divider, Container verticalDashes,
      Expanded rejectOrderBtn, Expanded btnPickOrder) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(left: 23, right: 23, bottom: 17),
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

  Row buildOrderTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "SHOP",
          style: shopGreen12w400,
        ),
        Text(
          "24 Jan, 2022, Today",
          style: lightGray12w400,
        ),
      ],
    );
  }

  Container buildSelectionRow(InkWell searchButton) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        top: 60,
        bottom: 15,
      ),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomChip(
              text: "Recent Orders",
              isSelected: false,
              destination: RecentOrdersScreen(),
            ),
            const CustomChip(
              text: "Scheduled",
              isSelected: true,
              destination: ScheduledOrdersScreen(),
            ),
            const CustomChip(
              text: "Delivered",
              isSelected: false,
              destination: DeliveredOrdersScreen(),
            ),
            searchButton
          ],
        ),
      ),
    );
  }
}
