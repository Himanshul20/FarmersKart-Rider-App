import 'package:famerskart_rider_app/constants.dart';
import 'package:famerskart_rider_app/home/home_screen.dart';
import 'package:famerskart_rider_app/notification/notifications_screen.dart';
import 'package:famerskart_rider_app/orders/recent_orders_screen.dart';
import 'package:famerskart_rider_app/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key key}) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(55),
          topLeft: Radius.circular(55),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Material(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.home_outlined,
                color: gray,
              ),
            ),
          ),
          Material(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RecentOrdersScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.event_note_outlined,
                color: gray,
              ),
            ),
          ),
          Material(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.notifications_none,
                color: gray,
              ),
            ),
          ),
          Material(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.person,
                color: gray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
