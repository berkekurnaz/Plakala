import 'package:flutter/material.dart';
import 'package:plakala_mobil/Screens/home.dart';
import 'package:plakala_mobil/Screens/splash.dart';


void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/" : (context) => Splash(),
      "/main" : (context) => Home(),
    },
  ));
}


