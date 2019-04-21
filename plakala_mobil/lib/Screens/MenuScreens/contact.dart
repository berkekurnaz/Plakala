import 'package:flutter/material.dart';
import 'package:plakala_mobil/Screens/MenuScreens/successMessage.dart';
import 'package:plakala_mobil/Widgets/myAppBar.dart';
import 'package:plakala_mobil/Widgets/myDrawer.dart';
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';

class Contact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactState();
}

class _ContactState extends State {
  
  TextEditingController txtAdCtrl = new TextEditingController();
  TextEditingController txtMailCtrl = new TextEditingController();
  TextEditingController txtBaslikCtrl = new TextEditingController();
  TextEditingController txtIcerikCtrl = new TextEditingController();

  void addData() {
    var url = "http://berkekurnaz.com/api/amesaj";

    if (txtAdCtrl.text.length > 3 && txtMailCtrl.text.length > 5 && txtBaslikCtrl.text.length > 10 && txtIcerikCtrl.text.length > 10) {

      var now = new DateTime.now();

      http.post(url, body: {
        "AdSoyad": txtAdCtrl.text,
        "MailAdresi": txtMailCtrl.text,
        "Baslik": txtBaslikCtrl.text,
        "Icerik": txtIcerikCtrl.text,
        "EklenmeTarihi": formatDate(now, [mm, '/', dd, '/', yyyy]).toString(),
      });

      Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessMessage()));

    }else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "İletişim",),
      drawer: MyDrawer(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: TextField(
              controller: txtAdCtrl,
              maxLength: 30,
              textCapitalization: TextCapitalization.sentences,
              decoration: new InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.person),
                  hintText: "Adınız Soyadınız"),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Container(
              child: TextField(
                maxLength: 100,
                controller: txtMailCtrl,
                decoration: new InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.mail),
                    hintText: "Mail Adresiniz"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Container(
              child: TextField(
                maxLength: 100,
                controller: txtBaslikCtrl,
                decoration: new InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.tab),
                    hintText: "Başlık"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Container(
              child: TextField(
                maxLines: 5,
                maxLength: 300,
                controller: txtIcerikCtrl,
                decoration: new InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.comment),
                    hintText: "Mesajınız"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Container(
              height: 50.0,
              child: RaisedButton(
              child: Text(
                "Mesaj Gönder",
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