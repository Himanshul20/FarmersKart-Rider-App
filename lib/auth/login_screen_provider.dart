
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../orders/recent_orders_screen.dart';
import 'Login.dart';
enum Logins{
  SHOW_MOBILE_ENTER_WIDGET,
  SHOW_OTP_FORM_WIDGET
}
class LoginScreenProvider extends ChangeNotifier{
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController  phoneController = TextEditingController();
  TextEditingController  otpController = TextEditingController();
  Logins currentState = Logins.SHOW_MOBILE_ENTER_WIDGET;
  String verificationID;
  String currentUserId ;
  void signInWithPhoneAuthCred(BuildContext context,AuthCredential phoneAuthCredential) async
  {

    try {
      final authCred = await auth.signInWithCredential(phoneAuthCredential);

     if(authCred.user != null)
      {
        currentUserId= auth.currentUser.uid;
        print(currentUserId);
        Navigator.push(context,MaterialPageRoute(builder: (context) => RecentOrdersScreen()));
      }
    } on FirebaseAuthException catch (e) {

      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Some Error Occured. Try Again Later')));
    }
    notifyListeners();
  }

  void SignOutME(BuildContext context) async{
    final signout=await auth.;
    print("${auth.signOut()}");
    Navigator.push(context,MaterialPageRoute(builder: (context) => Login()));

    notifyListeners();
  }

}
