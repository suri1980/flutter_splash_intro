import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:splash_intro/utilsconfig.dart';
import 'package:splash_intro/introview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_intro/homescreen.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

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
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new HomeScreen()));
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroView()));
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
