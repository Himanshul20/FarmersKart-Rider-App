import 'package:famerskart_rider_app/checkout/order_delivered.dart';
import 'package:famerskart_rider_app/constants.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  static const borderGray = Color(0xFFEAEAEA);

   bool _isPaymentPending;

  @override
  void initState() {
    _isPaymentPending = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var paymentStatusPending = Container(
      margin: const EdgeInsets.only(left: 25, right: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox18,
          const Text(
            "PAYMENT STATUS : PENDING",
            style: black14w600,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Pay Later",
                    style: white12w400,
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: gray,
                      side: const BorderSide(
                        color: gray,
                      ),
                      fixedSize: const Size(double.infinity, 36)),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isPaymentPending = false;
                    });
                  },
                  child: const Text(
                    "Complete Payment",
                    style: white12w400,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    side: const BorderSide(
                      color: primaryColor,
                    ),
                    fixedSize: const Size(double.infinity, 36),
                  ),
                ),
              ),
            ],
          ),
          sizedBox18,
        ],
      ),
    );
    var paymentStatusDone = Container(
      margin: const EdgeInsets.only(left: 25, right: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox18,
          const Text(
            "PAYMENT STATUS : PAID",
            style: black14w600,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const OrderDelivered(),
                      ),
                    );
                  },
                  child: const Text(
                    "Deliver now",
                    style: white12w400,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    side: const BorderSide(
                      color: primaryColor,
                    ),
                    fixedSize: const Size(double.infinity, 36),
                  ),
                ),
              ),
            ],
          ),
          sizedBox18,
        ],
      ),
    );

    var items = Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 25, right: 35),
      padding: const EdgeInsets.only(top: 14, left: 16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          color: borderGray,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "TOTAL ITEMS: 11",
            style: black14w600,
          ),
          sizedBox9,
          Column(
            children: [
              buildItemRow(),
              buildItemRow(),
              buildItemRow(),
              buildItemRow(),
              buildItemRow(),
              buildItemRow(),
              buildItemRow(),
              buildItemRow(),
              buildItemRow(),
              buildItemRow(),
              buildItemRow(),
              sizedBox8,
            ],
          ),
        ],
      ),
    );
    var appBar = AppBar(
      backgroundColor: Colors.grey.shade50,
      elevation: 0,
      leading: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    );

    return Scaffold(
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.call,
          size: 20,
        ),
        backgroundColor: fabCallColor,
        mini: true,
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildOrderInfo(),
            sizedBox9,
            items,
            _isPaymentPending ? paymentStatusPending : paymentStatusDone,
          ],
        ),
      ),
    );
  }

  Row buildItemRow() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(
              color: borderGray,
            ),
          ),
          child: Image.network(
            "https://source.unsplash.com/random/50x50",
            height: 25,
            width: 25,
          ),
        ),
        const SizedBox(width: 17),
        const Text(
          "Farm Fresh Kiwi",
          style: black14w400,
        ),
        const SizedBox(width: 5),
        const Text(
          "(8 pcs)",
          style: orderItemGray14w600,
        ),
      ],
    );
  }

  Container buildOrderInfo() {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 35),
      padding: const EdgeInsets.fromLTRB(20, 8, 16, 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          color: borderGray,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Order Number",
                style: black12w400,
              ),
              Text(
                "I456807",
                style: black12w700,
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                "Total",
                style: black12w400,
              ),
              Text(
                "\u20B9556.00",
                style: black12w700,
              )
            ],
          ),
        ],
      ),
    );
  }
}
