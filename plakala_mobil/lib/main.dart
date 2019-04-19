import 'package:flutter/material.dart';
import 'package:plakala_mobil/Screens/home.dart';
import 'package:plakala_mobil/Screens/test.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/" : (context) => Home(),
    },
  ));
}


