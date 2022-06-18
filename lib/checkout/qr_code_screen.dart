import 'package:famerskart_rider_app/constants.dart';
import 'package:flutter/material.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      title: const Text(
        "OR Code",
        style: black19w400,
      ),
      centerTitle: true,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              const CircleAvatar(
                radius: 21,
                backgroundImage: NetworkImage(
                  "https://picsum.photos/25/25",
                ),
              ),
              sizedBox4,
              const Text(
                "FarmersKart\n9899965789@ybl",
                style: black16w400,
                textAlign: TextAlign.center,
              )
            ],
          ),
          Image.asset(
            "assets/images/qr_code.png",
            height: 158,
            width: 158,
            fit: BoxFit.cover,
          ),
          const Text(
            "Order delivered successfully",
            style: black14w400,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Payment received in Cash",
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
