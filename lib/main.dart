import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:splash_intro/introview.dart';
import 'package:splash_intro/homescreen.dart';
import 'package:fluro/fluro.dart';
import 'package:splash_intro/myapp.dart';

void main() {


  Router router = new Router();

  router.define('splash', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params){
    return new SplashScreen();
  }));
  router.define('intro', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params){
    return new IntroView();
  }));
  router.define('home', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params){
    return new HomeScreen();
  }));

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
    onGenerateRoute: router.generator
  ));
}