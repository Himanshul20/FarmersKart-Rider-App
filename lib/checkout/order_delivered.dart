import 'package:famerskart_rider_app/checkout/qr_code_screen.dart';
import 'package:famerskart_rider_app/constants.dart';
import 'package:flutter/material.dart';

class OrderDelivered extends StatelessWidget {
  const OrderDelivered({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/order_delivered.png",
                  height: 338,
                  width: 183,
                  fit: BoxFit.cover,
                ),
                const Text(
                  "Order delivered successfully",
                  style: black16w600,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const QrCodeScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Deliver more",
                      style: white12w400,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
