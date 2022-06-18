
import 'package:famerskart_rider_app/Provider/dataProvider.dart';
import 'package:famerskart_rider_app/auth/login_screen.dart';
import 'package:famerskart_rider_app/auth/login_screen_provider.dart';
import 'package:famerskart_rider_app/auth/otp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'auth/Login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
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

    return MultiProvider(
        providers: [
        ChangeNotifierProvider.value(value: LoginScreenProvider()),
        ChangeNotifierProvider.value(value: DataProvider()),


    ],
    child: WillPopScope(
      onWillPop: showExitPopup, //call function on back button press

      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: Colors.purple,
      ),
      home: SafeArea(child: Login())),
    ));
    }

}

// class Providers {
//   static List<SingleChildWidget> getAllProviders() {
//
//     List<SingleChildWidget> _providers = [
//
//       ChangeNotifierProvider(create: (context) => LoginScreenProvider()),
//
//
//     ];
//     return _providers;
//
//
//
//   }
//
//

//}
