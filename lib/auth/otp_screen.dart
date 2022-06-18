import 'package:famerskart_rider_app/constants.dart';
import 'package:famerskart_rider_app/custom_widgets/custom_bottom_navbar.dart';
import 'package:famerskart_rider_app/orders/recent_orders_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_screen_provider.dart';

class OtpScreen extends StatefulWidget {
   VoidCallback onChange;
   OtpScreen({  this.onChange}) ;

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var prov;

  @override
  void initState() {
    // TODO: implement initState
    prov=Provider.of<LoginScreenProvider>(context,listen: false);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      leading: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
        size: 24,
      ),
      title: const Text(
        "Verify phone",
        style: black19w400,
      ),
      toolbarHeight: 100,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
    );
    var verifyButton = ElevatedButton(

      onPressed: widget.onChange,
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        fixedSize: Size(
          MediaQuery.of(context).size.width - 60,
          50,
        ),
      ),
      child: const Text(
        "Verify",
        style: white15w400,
      ),
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          sizedBox50,
          buildCodeSent(prov.phoneController.text),
          sizedBox60,
          buildOtpRow(),
          sizedBox50,
          buildResendRow(),
          sizedBox50,
          verifyButton,
        ],
      ),
    );
  }

  Row buildResendRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "didn't received an OTP? ",
          style: black13w400,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Resend OTP",
            style: purple13w400,
          ),
        ),
      ],
    );
  }

  Row buildOtpRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Center(
        //   child:TextField(
        //
        //     controller: prov.otpController,
        //     keyboardType: TextInputType.number,
        //     decoration: InputDecoration(
        //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12) ),
        //         hintText: "Enter Your OTP"
        //     ),
        //   ),
        // ),
        // buildOtpText("7"),
        // buildOtpText("2"),
         buildBlankOtpText(),
        // buildBlankOtpText(),
      ],
    );
  }

  Container buildBlankOtpText() {
    return Container(
      height: 61,
      width: 57,
      decoration: BoxDecoration(
        color: otpFieldBg,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          color: otpFieldBg,
          width: 1,
        ),
      ),
      child: CupertinoTextField(
          textAlign: TextAlign.center,
          style: TextStyle(letterSpacing: 30, fontSize: 30),
          maxLength: 6,
          controller: prov.otpController,
          keyboardType: TextInputType.number)
    );
  }

  Container buildOtpText(String digit) {
    return Container(
      height: 61,
      width: 57,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(color: primaryColor, width: 1),
      ),
      child: Center(
        child: Text(
          digit,
          style: purple28w400,
        ),
      ),
    );
  }

  Center buildCodeSent(String phone) {
    return Center(
      child: Text(
        "Code is sent to $phone",
        style: black15w400,
      ),
    );
  }
}
