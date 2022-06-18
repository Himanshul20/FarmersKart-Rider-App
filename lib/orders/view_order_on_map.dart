import 'package:famerskart_rider_app/checkout/checkout.dart';
import 'package:famerskart_rider_app/constants.dart';
import 'package:flutter/material.dart';

class ViewOrderOnMap extends StatefulWidget {
  const ViewOrderOnMap({Key key}) : super(key: key);

  @override
  _ViewOrderOnMapState createState() => _ViewOrderOnMapState();
}

class _ViewOrderOnMapState extends State<ViewOrderOnMap> {
  var divider = Container(
    height: 0.5,
    width: double.infinity,
    color: const Color(0xFFBABABA),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(14, 17, 14, 30),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "4:30pm",
                              style: white16w700,
                            ),
                            Text(
                              "Delivery time",
                              style: extraDarkGray11w700,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "K.K Hotel",
                              style: white16w700,
                            ),
                            Text(
                              "Delivery Location",
                              style: extraDarkGray11w700,
                            ),
                          ],
                        )
                      ],
                    ),
                    sizedBox8,
                    Row(
                      children: [
                        Expanded(
                          child: divider,
                        ),
                      ],
                    ),
                    sizedBox25,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Deliver now",
                          style: white16w700,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const CheckoutScreen(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0x1EC4C4C4),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  8,
                                ),
                              ),
                            ),
                            height: 38,
                            width: 38,
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
