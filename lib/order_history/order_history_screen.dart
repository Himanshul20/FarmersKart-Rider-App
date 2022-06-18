import 'package:famerskart_rider_app/constants.dart';
import 'package:famerskart_rider_app/custom_widgets/custom_bottom_navbar.dart';
import 'package:famerskart_rider_app/order_history/order_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key key}) : super(key: key);

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
   bool isOnlineOrdersActive;


  @override
  void initState() {
    isOnlineOrdersActive = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final appBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.grey.shade50,
      centerTitle: true,
      toolbarHeight: 100,
      leading: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      title: const Text(
        "Order History",
        style: black18w700,
      ),
    );

    Widget codOrders = Column(
      children: const [
        OrderWidget(
          id: "35473473737783",
          totalOrders: 12,
          totalRuppes: 400,
          type: 1,
          address: "Society Ganga",
          paymentStatus: "Received",
          paymentType: "COD",
        ),
        OrderWidget(
          id: "35473473737783",
          totalOrders: 12,
          totalRuppes: 400,
          type: 1,
          address: "Society Ganga",
          paymentStatus: "Received",
          paymentType: "COD",
        ),
        OrderWidget(
          id: "35473473737783",
          totalOrders: 12,
          totalRuppes: 400,
          type: 2,
          address: "Shop XYZ",
          paymentStatus: "Received",
          paymentType: "COD",
        ),
        OrderWidget(
          id: "35473473737783",
          totalOrders: 12,
          totalRuppes: 400,
          type: 3,
          address: "Hotel Gyaan Sagar",
          paymentStatus: "Received",
          paymentType: "COD",
        ),
        OrderWidget(
          id: "35473473737783",
          totalOrders: 12,
          totalRuppes: 400,
          type: 3,
          address: "Hotel Gyaan Sagar",
          paymentStatus: "Received",
          paymentType: "COD",
        ),
      ],
    );

    Widget onlineOrders = Column(
      children: const [
        OrderWidget(
          id: "35473473737783",
          totalOrders: 12,
          totalRuppes: 400,
          type: 1,
          address: "Society Ganga",
          paymentStatus: "Received",
          paymentType: "Online",
        ),
        OrderWidget(
          id: "35473473737783",
          totalOrders: 12,
          totalRuppes: 400,
          type: 1,
          address: "Society Ganga",
          paymentStatus: "Received",
          paymentType: "Online",
        ),
        OrderWidget(
          id: "35473473737783",
          totalOrders: 12,
          totalRuppes: 400,
          type: 2,
          address: "Shop XYZ",
          paymentStatus: "Received",
          paymentType: "UPI",
        ),
        OrderWidget(
          id: "35473473737783",
          totalOrders: 12,
          totalRuppes: 400,
          type: 3,
          address: "Hotel Gyaan Sagar",
          paymentStatus: "Received",
          paymentType: "Online",
        ),
        OrderWidget(
          id: "35473473737783",
          totalOrders: 12,
          totalRuppes: 400,
          type: 3,
          address: "Hotel Gyaan Sagar",
          paymentStatus: "Received",
          paymentType: "UPI",
        ),
      ],
    );

    Widget orders = isOnlineOrdersActive ? onlineOrders : codOrders;



    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: const CustomBottomNavBar(),
      body: Container(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      print("Online");

                      setState(() {
                        print("befor: $isOnlineOrdersActive");
                        isOnlineOrdersActive = !isOnlineOrdersActive;
                        orders = codOrders;
                        print("after: $isOnlineOrdersActive");

                      });
                    },
                    child: const Text(
                      "Online Payment",
                      style: purple12w400,
                    ),
                    style: isOnlineOrdersActive
                        ? activeButtonStyle
                        : inactiveButtonStyle,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      print("COD");

                      setState(() {
                        print("befor: $isOnlineOrdersActive");
                        isOnlineOrdersActive = !isOnlineOrdersActive;
                        orders = onlineOrders;
                        print("after: $isOnlineOrdersActive");

                      });
                    },
                    child: const Text(
                      "COD",
                      style: lightGray12w400,
                    ),
                    style: isOnlineOrdersActive
                        ? inactiveButtonStyle
                        : activeButtonStyle,
                  ),
                )
              ],
            ),
            sizedBox20,
            Expanded(
              child: SingleChildScrollView(
                child: orders,
              ),
            )
          ],
        ),
      ),
    );
  }
}
