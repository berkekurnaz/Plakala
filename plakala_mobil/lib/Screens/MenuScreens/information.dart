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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            child: TextField(
              controller: txtAdCtrl,
              maxLength: 7,
              textCapitalization: TextCapitalization.sentences,
              decoration: new InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.directions_car),
                  hintText: "Plakayı Buraya Giriniz..."),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            child: Container(
              child: TextField(
                maxLines: 5,
                maxLength: 300,
                controller: txtAdCtrl,
                decoration: new InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.comment),
                    hintText: "Yapacağınız Yorumu Buraya Giriniz..."),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            child: Container(
              height: 50.0,
              child: RaisedButton(
              child: Text(
                "Mesaj Gönder",
                style: TextStyle(color: Colors.white),
              ),
              color: Color.fromRGBO(64, 75, 96, .9),
              onPressed: () {
                  // Mesaj Gönderme İşlemi
              },
            ),
            ),
          ),
        ],
      ),
    );
  }
  
}