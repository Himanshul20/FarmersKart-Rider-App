import 'package:famerskart_rider_app/auth/otp_screen.dart';
import 'package:famerskart_rider_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_screen_provider.dart';


class LoginScreen extends StatefulWidget {
    VoidCallback onTap;
    LoginScreen({ this.onTap});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var prov;

  @override
  void initState() {
    // TODO: implement initState
    prov=Provider.of<LoginScreenProvider>(context,listen: false);

    super.initState();
  }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var loginTitle = Padding(
      padding: const EdgeInsets.only(
        left: 38,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 2,
            width: 36,
            color: primaryColor,
          ),
          const SizedBox(
            height: 9,
          ),
          const Text(
            "Login",
            style: black21w400,
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
    return Consumer<LoginScreenProvider>(builder: (context, tasks, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/login/delivary_boy.png",
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            loginTitle,
            buildTextFieldAndBtn(),
            buildSocialButtonsAndTitle(),
           // buildFooter(context),
          ],
        ),
      );
    });
  }

  Column buildSocialButtonsAndTitle() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Or login with Social networks ",
              style: gray13w400,
            ),
            Text(
              "Social Network",
              style: purple13w400,
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSocialButton("assets/images/login/google_icon.png"),
            buildSocialButton("assets/images/login/apple_icon.png"),
            buildSocialButton("assets/images/login/facebook_icon.png"),
          ],
        )
      ],
    );
  }

  // Padding buildFooter(BuildContext ctx) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 38, right: 38),
  //     child: RichText(
  //       textAlign: TextAlign.center,
  //       text: TextSpan(
  //         children: [
  //           buildFooterTextSpan("By signing up, you’re agree to our ", gray),
  //           buildClickableFooterTextSpan(
  //               "Terms & Conditions", primaryColor,  LoginScreen()),
  //           buildFooterTextSpan(" and ", gray),
  //           buildClickableFooterTextSpan(
  //               "Privacy Policy", primaryColor,  LoginScreen()),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  TextSpan buildClickableFooterTextSpan(
      String txt, Color color, Widget destination) {
    return TextSpan(
      text: txt,
      style: TextStyle(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () async {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => destination),
          );
        },
    );
  }

  TextSpan buildFooterTextSpan(String txt, Color color) {
    return TextSpan(
      text: txt,
      style: TextStyle(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  InkWell buildSocialButton(String src) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(50),
      child: Card(
        elevation: 4,
        shape: const CircleBorder(side: BorderSide.none),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Image.asset(
            src,
            height: 24,
            width: 24,
          ),
        ),
      ),
    );
  }

  Container buildTextFieldAndBtn() {

    return Container(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildCustomTextField("Mobile Number"),
            buildCustomBtn(),
          ],
        ),
      ),
    );
  }

  Container buildCustomTextField(String placeholder) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
            child: TextFormField(
              controller: prov.phoneController,
              decoration: InputDecoration(
                hintText: placeholder,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(35),
                  ),
                  borderSide: BorderSide(
                    color: gray,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildCustomBtn() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.only(bottom: 25),
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(35.0),
        ),
      ),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(35),
        child: Center(
          child: Text(
            "Send OTP",
            style: white18w700,
          ),
        ),
      ),
    );
  }
}
