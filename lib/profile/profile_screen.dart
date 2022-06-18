import 'package:famerskart_rider_app/auth/login_screen_provider.dart';
import 'package:famerskart_rider_app/constants.dart';
import 'package:famerskart_rider_app/custom_widgets/custom_bottom_navbar.dart';
import 'package:famerskart_rider_app/notification/notifications_screen.dart';
import 'package:famerskart_rider_app/order_history/order_history_screen.dart';
import 'package:famerskart_rider_app/orders/recent_orders_screen.dart';
import 'package:famerskart_rider_app/profile/profile_details.dart';
import 'package:famerskart_rider_app/ratings/ratings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var divider = Container(
    height: 1.5,
    width: double.infinity,
    color: dividerGray,
  );
  var prov;
  @override
  void initState() {
    prov=Provider.of<LoginScreenProvider>(context,listen: false);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var profileRow = Container(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            5,
          ),
        ),
        border: Border.all(
          color: dividerGray,
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              "https://picsum.photos/30/30",
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Ramesh Kumar",
                style: black16w700,
              ),
              Text(
                "Model Town",
                style: gray14w600,
              )
            ],
          ),
          Expanded(
            child: Container(),
          ),
          InkWell(
            onTap: () {
              // showModalBottomSheet(
              //         backgroundColor: Colors.white.withOpacity(0.0),
              //         context: context,
              //         builder: (context) => ProductDetails());

              showModalBottomSheet(
                  backgroundColor: Colors.white.withOpacity(0),
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => ProfileDetails());
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: gray,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          )
        ],
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: const CustomBottomNavBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 58, horizontal: 22),
        child: Column(
          children: [
            profileRow,
            sizedBox30,
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    5,
                  ),
                ),
                border: Border.all(
                  color: dividerGray,
                ),
              ),
              child: Column(
                children: [
                  buildProfileItem(
                      Icons.history, "Order History", OrderHistoryScreen()),
                  divider,
                  buildProfileItem(
                      Icons.star_outline_rounded, "Rating", RatingsScreen()),
                ],
              ),
            ),
            sizedBox30,
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    5,
                  ),
                ),
                border: Border.all(
                  color: dividerGray,
                ),
              ),
              child: Column(
                children: [
                  buildProfileItem(
                    Icons.notifications_none,
                    "Notification",
                    NotificationScreen(),
                  ),
                  divider,
                  buildProfileItem(
                    Icons.person,
                    "Help Center",
                    RecentOrdersScreen(),
                  ),
                  divider,
                  buildProfileItem(
                    Icons.info_outline,
                    "About us",
                    RecentOrdersScreen(),
                  ),
                  divider,
                  Container(
                    padding: const EdgeInsets.fromLTRB(17, 20, 13, 17),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.logout_rounded,
                          color: gray,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          "Logout",
                          style: black14w600,
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        InkWell(
                          onTap: () {
                            prov.SignOutME();

                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: gray,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildProfileItem(
    IconData icon,
    String itemName,
    Widget destination,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(17, 20, 13, 17),
      child: Row(
        children: [
          Icon(
            icon,
            color: gray,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            itemName,
            style: black14w600,
          ),
          Expanded(
            child: Container(),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => destination,
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: gray,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          )
        ],
      ),
    );
  }
}
