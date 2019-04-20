import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';
import 'package:plakala_mobil/Screens/success.dart';

class AddComment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  TextEditingController controllerPlaka = new TextEditingController();
  TextEditingController controllerYorum = new TextEditingController();

  void addData() {
    var url = "http://berkekurnaz.com/api/ayorum";

    if (controllerPlaka.text.length > 1 && controllerYorum.text.length > 5) {

      var now = new DateTime.now();

      http.post(url, body: {
        "PlakaYorum": controllerYorum.text,
        "Plaka": controllerPlaka.text.toUpperCase(),
        "Resim": "bosdeger",
        "EklenmeTarihi": formatDate(now, [mm, '/', dd, '/', yyyy]).toString(),
      });

      Navigator.push(context, MaterialPageRoute(builder: (context) => Success(plaka: controllerPlaka.text.toUpperCase(),)));

    }else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yorum Ekle"),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
            child: TextField(
              controller: controllerPlaka,
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
                controller: controllerYorum,
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
                "Yorum Ekle",
                style: TextStyle(color: Colors.white),
              ),
              color: Color.fromRGBO(64, 75, 96, .9),
              onPressed: () {
                addData();
              },
            ),
            ),
          ),
        ],
      ),
    );
  }
}
