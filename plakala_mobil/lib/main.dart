import 'package:flutter/material.dart';
import 'package:plakala_mobil/Screens/home.dart';

void main(){
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Home(),
    },
  ));
}