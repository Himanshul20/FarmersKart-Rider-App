import 'package:famerskart_rider_app/constants.dart';
import 'package:famerskart_rider_app/custom_widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';

class RatingsScreen extends StatefulWidget {
  const RatingsScreen({Key key}) : super(key: key);

  @override
  _RatingsScreenState createState() => _RatingsScreenState();
}

class _RatingsScreenState extends State<RatingsScreen> {
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.grey.shade50,
      centerTitle: true,
      toolbarHeight: 100,
      leading: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      title: const Text(
        "Ratings",
        style: black18w700,
      ),
    );

    var divider = Container(
      height: 1.5,
      width: double.infinity,
      color: dividerGray,
    );

    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: const CustomBottomNavBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
        child: Column(
          children: [
            const Center(
              child: Text(
                "4.0",
                style: black48w700,
              ),
            ),
            sizedBox9,
            buildStarRow(24.0),
            sizedBox9,
            const Text(
              "Based on 30 reviews",
              style: black12w400,
            ),
            sizedBox18,
            divider,
            sizedBox8,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildRatingContainer(),
                    buildRatingContainer(),
                    buildRatingContainer(),
                    buildRatingContainer(),
                    buildRatingContainer(),
                    buildRatingContainer(),
                    buildRatingContainer(),
                    buildRatingContainer(),
                    buildRatingContainer(),
                    buildRatingContainer(),
                    buildRatingContainer(),
                    buildRatingContainer(),
                    buildRatingContainer(),
                    buildRatingContainer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildRatingContainer() {
    return Container(
      padding: const EdgeInsets.only(top: 14, bottom: 14),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 21,
            backgroundImage:
                NetworkImage("https://source.unsplash.com/random/100x100"),
          ),
          const SizedBox(
            width: 13,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Joan Perkins",
                style: black16w600,
              ),
              buildStarRowWithRating(14.0, "4.0"),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          const Text(
            "1 day ago",
            style: lightGray12w400,
          )
        ],
      ),
    );
  }

  Row buildStarRow(double iconSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: primaryColor,
          size: iconSize,
        ),
        Icon(
          Icons.star,
          color: primaryColor,
          size: iconSize,
        ),
        Icon(
          Icons.star,
          color: primaryColor,
          size: iconSize,
        ),
        Icon(
          Icons.star,
          color: primaryColor,
          size: iconSize,
        ),
        Icon(
          Icons.star_outline_rounded,
          color: lightGray,
          size: iconSize,
        ),
      ],
    );
  }

  buildStarRowWithRating(double iconSize, String rating) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: primaryColor,
          size: iconSize,
        ),
        Icon(
          Icons.star,
          color: primaryColor,
          size: iconSize,
        ),
        Icon(
          Icons.star,
          color: primaryColor,
          size: iconSize,
        ),
        Icon(
          Icons.star,
          color: primaryColor,
          size: iconSize,
        ),
        Icon(
          Icons.star_outline_rounded,
          color: lightGray,
          size: iconSize,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          rating,
          style: black12w400,
        )
      ],
    );
  }
}
