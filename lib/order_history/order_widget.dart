import 'package:famerskart_rider_app/constants.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  final int type;
  final String paymentStatus;
  final String address;
  final String paymentType;
  final String id;
  final int totalOrders;
  final int totalRuppes;

  const OrderWidget({
    Key key,
     this.id,
     this.type,
     this.address,
     this.totalOrders,
     this.totalRuppes,
     this.paymentStatus,
     this.paymentType,
  }) : super(key: key);

  static var divider = Container(
    height: 1.5,
    width: double.infinity,
    color: dividerGray,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 14),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              3,
            ),
          ),
        ),
        child: Column(
          children: [
            buildAddressRow(type, address),
            sizedBox11,
            divider,
            sizedBox14,
            buildTotalOrderRow(totalOrders, totalRuppes),
            sizedBox7,
            buildPaymentStatusRow(),
            sizedBox3,
            buildPaymentTypeRow(paymentType),
          ],
        ),
      ),
    );
  }

  Row buildPaymentTypeRow(String paymentType) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Payment type",
          style: black12w400,
        ),
        Text(
          paymentType,
          style: black12w700,
        )
      ],
    );
  }

  Row buildPaymentStatusRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Payment status",
          style: black12w400,
        ),
        Text(
          "Received",
          style: black12w400,
        )
      ],
    );
  }

  Row buildTotalOrderRow(int totalOrders, int totalRuppes) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total orders - $totalOrders",
          style: black12w600,
        ),
        Text(
          "\u20B9 $totalRuppes",
          style: lightGray14w600,
        )
      ],
    );
  }

  Row buildAddressRow(int type, String addr) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "ID: $id",
          style: black12w400,
        ),
        Text(
          addr,
          style: (type == 1)
              ? societyGreen12w600
              : (type == 2)
                  ? shopGreen12w600
                  : hotelYellow12w600,
        )
      ],
    );
  }
}
