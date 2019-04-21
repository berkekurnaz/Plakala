import 'package:flutter/material.dart';
import 'package:plakala_mobil/Widgets/myAppBar.dart';
import 'package:plakala_mobil/Widgets/myDrawer.dart';

class Information extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InformationState();
}

class _InformationState extends State {
  
  TextEditingController txtAdCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Kullanıcı Sözleşmesi",),
      drawer: MyDrawer(),
      body: ListView(
        children: <Widget>[
          Text("Kullanıcı Sözleşmesi"),
        ],
      ),
    );
  }
  
}