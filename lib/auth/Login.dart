import 'package:famerskart_rider_app/auth/login_screen.dart';
import 'package:famerskart_rider_app/auth/login_screen_provider.dart';
import 'package:famerskart_rider_app/auth/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../orders/recent_orders_screen.dart';
import 'Home.dart';

enum LoginS { SHOW_MOBILE_ENTER_WIDGET, SHOW_OTP_FORM_WIDGET }

class Login extends StatefulWidget {
  static const Routename = '/LoginScreen';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var prov;

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  LoginS currentState = LoginS.SHOW_MOBILE_ENTER_WIDGET;
  String verificationID = "";

  @override
  void initState() {
    // TODO: implement initState
    prov = Provider.of<LoginScreenProvider>(context, listen: false);
    prov.auth;

    super.initState();
  }

  // void signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async
  // {
  //
  //   try {
  //     final authCred = await prov.auth.signInWithCredential(phoneAuthCredential);
  //
  //     if(authCred.user != null)
  //     {
  //
  //       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => RecentOrdersScreen()));
  //     }
  //   } on FirebaseAuthException catch (e) {
  //
  //     print(e.message);
  //     ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Some Error Occured. Try Again Later')));
  //   }
  // }

  showMobilePhoneWidget(context) {
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
    return Column(
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
        SizedBox(height: 30,),
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Center(
            child: TextField(
              controller: prov.phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  hintText: "Enter Your PhoneNumber"),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
              onPressed: () async {
                await prov.auth.verifyPhoneNumber(
                    phoneNumber: "+91${prov.phoneController.text}",
                    verificationCompleted: (phoneAuthCredential) async {},
                    verificationFailed: (verificationFailed) {
                      print(verificationFailed);
                    },
                    codeSent: (verificationID, resendingToken) async {
                      setState(() {
                        currentState = LoginS.SHOW_OTP_FORM_WIDGET;
                        this.verificationID = verificationID;
                      });
                    },
                    codeAutoRetrievalTimeout: (verificationID) async {});
              },
              child: Text("Send OTP")),
        ),

        Spacer(flex: 1),
       // buildSocialButtonsAndTitle(),
        buildFooter(),
      ],
    );
  }

  Padding buildFooter() {
    return Padding(
      padding: const EdgeInsets.only(left: 38, right: 38),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            buildFooterTextSpan("By signing up, you’re agree to our ", gray),
            buildClickableFooterTextSpan(
                "Terms & Conditions", primaryColor, Login()),
            buildFooterTextSpan(" and ", gray),
            buildClickableFooterTextSpan(
                "Privacy Policy", primaryColor, Login()),
          ],
        ),
      ),
    );
  }

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

  showOtpFormWidget(context) {
    var verifyButton = ElevatedButton(

      onPressed:() {
        AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
            verificationId: verificationID, smsCode: otpController.text);
        prov.signInWithPhoneAuthCred(context, phoneAuthCredential);
      },
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Text(
          "ENTER YOUR OTP",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 7,
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: TextField(
            controller: otpController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: "Enter Your OTP"),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
                  verificationId: verificationID, smsCode: otpController.text);
              prov.signInWithPhoneAuthCred(context, phoneAuthCredential);
            },
            child: Text("Verify")),
        SizedBox(
          height: 16,
        ),
        Spacer()
      ],
    );
  }

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
    Future<bool> showExitPopup() async {
      return await showDialog( //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit App'),
          content: Text('Do you want to exit an App?'),
          actions:[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              //return false when click on "NO"
              child:Text('No'),
            ),

            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              //return true when click on "Yes"
              child:Text('Yes'),
            ),

          ],
        ),
      )??false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup, //call function on back button press

      child: Scaffold(
        body: currentState == LoginS.SHOW_MOBILE_ENTER_WIDGET
            ? showMobilePhoneWidget(context)
            : showOtpFormWidget(context),
      ),
    );
  }
}
