import 'package:flutter/material.dart';
import 'package:plakala_mobil/Widgets/myAppBar.dart';
import 'package:plakala_mobil/Widgets/myDrawer.dart';

class Use extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UseState();
}

class _UseState extends State {
  String birinciAdim = "1-) Adim";
  String ikinciAdim = "2-) Adim";
  String ucuncuAdim = "3-) Adim";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Nasıl Kullanılır",
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: <Widget>[
          printUse(birinciAdim),
          printUse(ikinciAdim),
          printUse(ucuncuAdim),
        ],
      ),
    );
  }

  Card printUse(String str) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(Icons.directions_car, color: Colors.white),
          ),
          title: Text(
            "$str",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
