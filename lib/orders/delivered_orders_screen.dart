import 'package:famerskart_rider_app/constants.dart';
import 'package:famerskart_rider_app/custom_widgets/custom_bottom_navbar.dart';
import 'package:famerskart_rider_app/custom_widgets/custom_chip.dart';
import 'package:famerskart_rider_app/orders/recent_orders_screen.dart';
import 'package:famerskart_rider_app/orders/scheduled_orders_screen.dart';
import 'package:flutter/material.dart';

class DeliveredOrdersScreen extends StatefulWidget {
  const DeliveredOrdersScreen({Key key}) : super(key: key);

  @override
  _DeliveredOrdersScreenState createState() => _DeliveredOrdersScreenState();
}

class _DeliveredOrdersScreenState extends State<DeliveredOrdersScreen> {
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

    var titleDelivered = Row(
      children: const [
        Text(
          "Delivered",
          style: purple12w600,
        )
      ],
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
                  buildOrderDetailCard(titleDelivered, divider),
                  buildOrderDetailCard(titleDelivered, divider),
                  buildOrderDetailCard(titleDelivered, divider),
                  buildOrderDetailCard(titleDelivered, divider),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Card buildOrderDetailCard(Row titleDelivered, Container divider) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(left: 23, right: 23, bottom: 17),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(14, 15, 14, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildIdAddressRow(),
            titleDelivered,
            sizedBox7,
            divider,
            sizedBox9,
            buildOrderTimeRow(
              "Order Received",
              "22 Jan 2022, 6:30 PM",
            ),
            sizedBox3,
            buildOrderTimeRow(
              "Order Delivered",
              "22 Jan 2022, 6:30 PM",
            ),
            sizedBox14,
            divider,
            sizedBox7,
            buildItemsSummaryRow(),
            sizedBox7,
            buildPaimentDetailsRow("Payment Status", "Paid"),
            sizedBox3,
            buildPaimentDetailsRow("Payment Type", "Online payment"),
          ],
        ),
      ),
    );
  }

  Row buildPaimentDetailsRow(String key, String val) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: black12w400,
        ),
        Text(
          val,
          style: black12w400,
        ),
      ],
    );
  }

  Row buildItemsSummaryRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Total items - 12",
          style: black14w600,
        ),
        Text(
          "\u20B9 400",
          style: lightGray14w600,
        ),
      ],
    );
  }

  Row buildOrderTimeRow(String title, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: black12w400,
        ),
        Text(
          time,
          style: lightGray12w400,
        )
      ],
    );
  }

  Row buildIdAddressRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "ID: 35473473737783",
          style: black12w400,
        ),
        Text(
          "SHOP XYZ,\nPune, 123442",
          style: shopYellow12w600,
          textAlign: TextAlign.end,
        )
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
              isSelected: false,
              destination: ScheduledOrdersScreen(),
            ),
            const CustomChip(
              text: "Delivered",
              isSelected: true,
              destination: DeliveredOrdersScreen(),
            ),
            searchButton
          ],
        ),
      ),
    );
  }
}
