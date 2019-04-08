import 'package:flutter/material.dart';
import 'package:plakala_mobil/Widgets/myDrawer.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plakala"),
      ),
      drawer: MyDrawer(),
      body: Container(),
    );
  }
  
}