import 'package:famerskart_rider_app/constants.dart';
import 'package:famerskart_rider_app/custom_widgets/custom_bottom_navbar.dart';
import 'package:famerskart_rider_app/notification/notification_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
          child: Column(
            children: [
              sizedBox50,
              NotificationWidget(
                msg: "You have new order deliver to Sec-12, karnal.",
                time: "1 min ago",
                isNew: true,
              ),
              NotificationWidget(
                msg: "Ryan gave you 5 stars.",
                time: "1 min ago",
                isNew: true,
              ),
              NotificationWidget(
                msg: "Hip. Hip. Hurray!\nYou delivered today 100 orders.",
                time: "1 min ago",
                isNew: false,
              ),
              NotificationWidget(
                msg: "Please sanitized your hands before picking up the order.",
                time: "1 min ago",
                isNew: false,
              ),
              NotificationWidget(
                msg:
                    "Oder-112332455 Is trying to reaching you, contact with them soon.",
                time: "1 min ago",
                isNew: false,
              ),
              NotificationWidget(
                msg: "Hip. Hip. Hurray!\nYou delivered today 100 orders.",
                time: "1 min ago",
                isNew: false,
              ),
              NotificationWidget(
                msg: "Please sanitized your hands before picking up the order.",
                time: "1 min ago",
                isNew: false,
              ),
              NotificationWidget(
                msg:
                    "Oder-112332455 Is trying to reaching you, contact with them soon.",
                time: "1 min ago",
                isNew: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
