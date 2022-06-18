import 'package:famerskart_rider_app/constants.dart';
import 'package:famerskart_rider_app/custom_widgets/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({Key key}) : super(key: key);

  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  bool _val = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        // color: Colors.white.withOpacity(0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF7F3F98),
              Color(0xFFAC83BC),
              Color(0xFFBD9DCA),
              Color(0xFFD7C3DF),
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
              left: 10,
              top: 20,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                    border: Border.all(
                      color: Colors.white,
                    ),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedBox40,
                      Center(
                        child: Container(
                          height: 5,
                          width: 40,
                          color: gray,
                        ),
                      ),
                      sizedBox40,
                      const Text(
                        "Profile Details",
                        style: black18w700,
                      ),
                      sizedBox30,
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Enter your name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            sizedBox14,
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Mobile No',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            sizedBox25,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Notifications",
                                  style: black18w700,
                                ),
                                CustomSwitch(
                                  isActive: false,
                                  activeColor: Colors.green,
                                  inActiveColor: Colors.red,
                                ),
                              ],
                            ),
                            sizedBox40,
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      fixedSize:
                                          const Size(double.infinity, 45),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            50,
                                          ),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      "Save changes",
                                      style: white15w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            sizedBox25
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
