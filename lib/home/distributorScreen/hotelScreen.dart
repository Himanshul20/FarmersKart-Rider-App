import 'package:famerskart_rider_app/model/center.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/dataProvider.dart';
import '../../constants.dart';
import '../../custom_widgets/custom_bottom_navbar.dart';

class HotelScreen extends StatefulWidget {

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  var data;
  @override
  void initState() {
    data = Provider.of<DataProvider>(context, listen: false);
    //data.initSociety();
    super.initState();
  }
    @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, prov, _) {
      prov.getDataSociety();
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: gray,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
                onTap: () {
                  // prov.SignOutME();
                },
                child: Icon(Icons.logout))
          ],
          toolbarHeight: 70,
          leading: Switch(
            onChanged: (bool value) {},
            value: false,
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(),
        body: Container(),

      );
    });
  }
}
