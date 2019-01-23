import 'package:flutter/material.dart';
import 'package:splash_intro/utilsconfig.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:splashscreen/splashscreen.dart';


class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: AfterSplash(),
      title: Text(
        splashScreenAppName,
        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      ),
      image: new Image.asset(splashScreenLogo),
      backgroundColor: Colors.teal,
      //styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.white,
    );
  }
}

class AfterSplash extends StatefulWidget {
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      prefs.setBool('seen', true);
      Navigator.pushReplacementNamed(context, 'intro');
    }
  }

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Offstage(child: null);
  }
}
