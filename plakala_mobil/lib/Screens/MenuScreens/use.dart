import 'package:flutter/material.dart';
import 'package:plakala_mobil/Widgets/myAppBar.dart';
import 'package:plakala_mobil/Widgets/myDrawer.dart';

class Use extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UseState();
}

class _UseState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Nasıl Kullanılır",),
      drawer: MyDrawer(),
      body: Center(
        
      ),
    );
  }
  
}