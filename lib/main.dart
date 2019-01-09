import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'introview.dart';

void main(){
  runApp(new MaterialApp(
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
      navigateAfterSeconds: IntroView(),
      title: Text(
        "App Name", 
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold
        ),
      ),
      image: new Image.network("https://www.gown.io/templates/fsbp-evolutionstore/images/logo.png"),
      backgroundColor: Colors.teal,
      styleTextUnderTheLoader: new TextStyle(),
      loaderColor: Colors.white,
      );
  }
}

