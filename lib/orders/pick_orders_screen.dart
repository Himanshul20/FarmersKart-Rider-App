import 'package:famerskart_rider_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Provider/dataProvider.dart';
import '../custom_widgets/custom_bottom_navbar.dart';
import '../model/order.dart';

class PickOrders extends StatefulWidget {
  String centerName;
  PickOrders(this. centerName);


  @override
  _PickOrdersState createState() => _PickOrdersState();
}

class _PickOrdersState extends State<PickOrders> {
  DataProvider data;
  var now = DateTime.now();
  List<String> paymentmode =["COD","PAID","Paid By GPay"];
  @override
  void initState() {
    data = Provider.of<DataProvider>(context, listen: false);
    data.getDataOrders(widget.centerName);
    initOrder(data);
    super.initState();
  }
  Future<void> initOrder(DataProvider data) async {
    data.orderList = data.getDataOrders(widget.centerName);
    data.retrievedOrderList = await data.getDataOrders(widget.centerName);
  }
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
    );

    var divider = Container(
      height: 1.5,
      width: double.infinity,
      color: dividerGray,
    );

    return Consumer<DataProvider>(

      builder: (context, prov, _) {
        return Scaffold(
          appBar: appBar,
            bottomNavigationBar: CustomBottomNavBar(),

            body: FutureBuilder(
            future: prov.orderList,
            builder: (BuildContext context,
                AsyncSnapshot<List<Order>> snapshot) {
              if (snapshot.hasData && snapshot.data.isNotEmpty) {
                print(prov.retrievedOrderList.length);
                return ListView.separated(
                    itemCount: prov.retrievedOrderList.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) {
                      final order = prov.retrievedOrderList[index];
                      return buildOrderContainer(divider, paymentmode,order,prov);

                    });
              } else if (snapshot.connectionState == ConnectionState.done &&
                  prov.retrievedOrderList.isEmpty) {
                return Center(
                  child: ListView(
                    children: const <Widget>[
                      Align(
                          alignment: AlignmentDirectional.center,
                          child: Text('No data available')),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        );
      }
    );
  }



  buildOrderContainer(Container divider, List<String> paymode, Order order, DataProvider prov) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 16),
      child: Card(
        child: Container(
          padding:
              const EdgeInsets.only(left: 14, top: 17, bottom: 12, right: 16),
          child: Column(
            children: [
              buildAddrAndIdRow(order),
              sizedBox18,
              divider,
              sizedBox7,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Total items - 12",
                    style: black14w600,
                  ),
                  Text(
                    "\u20B9 400",
                    style: lightGray14w600,
                  )
                ],
              ),
              sizedBox7,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Payment Status",
                    style: black12w400,
                  ),
                  Text(
                    "Pending",
                    style: black12w400,
                  )
                ],
              ),
              sizedBox3,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Payment type",
                    style: black12w400,
                  ),
                  Text(
                    "COD",
                    style: black12w400,
                  )
                ],
              ),
              sizedBox18,
              Row(
                children: [
                  PopupMenuButton<int>(
                    icon: Icon(Icons.menu_open, size: 30),
                    itemBuilder: (context) => [

                      PopupMenuItem(
                        value: 1,
                        child: Row(children: [Icon(Icons.money),Text("Payment Method"),]),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Row(children: [Icon(Icons.cancel_presentation),Text("Reject Order"),]),
                      ),

                    ],
                  ),

                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async{

                           var url = 'tel:=91${order.customerNumber}';
                          if (await canLaunch(url) != null) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.call_outlined,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Call Customer",
                            style: white12w700,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              sizedBox18,
              divider,
              sizedBox8,
              Row(
                children: const [
                  Text(
                    "Instructions- Don’t ring the bell",
                    style: instructionGray12w400,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildAddrAndIdRow(Order order) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
             Text(
              "ID: ${order.id}",
              style: black12w400,
            ),
            const SizedBox(
              width: 7,
            ),
             Container(
                    padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: primaryColor,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          2,
                        ),
                      ),
                    ),
                    child:  Text(
                      order.unpaidStatus,
                      style: purple8w600,
                    ),
                  )
                ,
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children:  [
                Text(
                  "Wing  ",
                  style: hotelYellow12w600,
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "${order.wing},",
                  style: black12w600,
                ),
              ],
            ),
             Text(
              "Pune, 123442",
              style: black12w600,
            ),
          ],
        )
      ],
    );
  }
}
