import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddComment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  TextEditingController controllerPlaka = new TextEditingController();
  TextEditingController controllerYorum = new TextEditingController();

  void addData() {
    var url = "http://berkekurnaz.com/api/ayorum";

    http.post(url,body: {
      "PlakaYorum": controllerYorum.text,
      "Plaka": controllerPlaka.text,
      "Resim": controllerPlaka.text,
      "EklenmeTarihi": controllerPlaka.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yorum Ekle"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: controllerPlaka,
            decoration: new InputDecoration(
                hintText: "Plaka", labelText: "Plaka"),
          ),
          TextField(
            controller: controllerYorum,
            decoration: new InputDecoration(
                hintText: "Yorum", labelText: "Yorum"),
          ),
          RaisedButton(
            child: Text("Ekle"),
            onPressed: (){
              addData();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
