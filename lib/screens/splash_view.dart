import 'package:flutter/material.dart';
import 'package:plando/utilities/route_names.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {

  @override
  _Splash createState() => _Splash();
}

class _Splash extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  void dispose() {
    super.dispose();
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    // final SharedPreferences prefs = await preferences;
    // String userIn = prefs.getString(SharedPreferencesKeys.loginResponse);
    // if(userIn == null)
    // {
      Navigator.of(context).pushReplacementNamed(PathName.loginScreen);
    // }
    // else
    // {
    //   final userdet = userInfoFromMap(userIn);
    //   Navigator.of(context).pushReplacementNamed(PathName.homeScreen);
    //   // Navigator.of(context).pushReplacement(
    //   //   MaterialPageRoute(
    //   //     settings: RouteSettings(name: "/homeScreen"),
    //   //     builder: (context) => HomeView(),
    //   //   ),
    //   // );
    // }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Text('This is Your Splash Screen')
      )
    );
  }
}