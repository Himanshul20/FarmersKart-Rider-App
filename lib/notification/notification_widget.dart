import 'package:famerskart_rider_app/constants.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  String time;
  String msg;
  bool isNew;

  NotificationWidget({
    Key key,
     this.msg,
     this.time,
     this.isNew,
  }) : super(key: key);

  final notificationBadge = Container(
    decoration: const BoxDecoration(
      color: primaryColor,
      shape: BoxShape.circle,
    ),
    width: 5,
    height: 5,
  );

  final divider = Container(
    height: 1.5,
    width: double.infinity,
    color: dividerGray,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sizedBox20,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage:
                  NetworkImage("https://source.unsplash.com/random/100x100"),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          msg,
                          style: black14w400,
                        ),
                      ),
                    ],
                  ),
                  sizedBox9,
                  Row(
                    children: [
                      Text(
                        time,
                        style: lightGray12w400,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      isNew ? notificationBadge : Container()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        sizedBox20,
        divider
      ],
    );
  }
}
