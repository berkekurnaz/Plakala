import 'package:flutter/material.dart';
import 'package:plakala_mobil/Screens/home.dart';
import 'package:plakala_mobil/Screens/test.dart';
import 'package:plakala_mobil/Widgets/myAppBar.dart';

class Success extends StatefulWidget {
  
  String plaka;

  Success({this.plaka});

  @override
  State<StatefulWidget> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Plakala"),
        backgroundColor: Colors.black87,
        centerTitle: true,
        
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Icon(Icons.announcement, color: Colors.green,size: 50.0,),

            Card(
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
                          right: new BorderSide(
                              width: 1.0, color: Colors.white24))),
                  child: Icon(Icons.directions_car, color: Colors.white),
                ),
                title: Text(
                  "Yorum Başarıyla Eklendi",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
            child: OutlineButton(
            child: Text("Yorumlara Dön"),
            borderSide: BorderSide(
              color: Colors.black87,
              style: BorderStyle.solid,
              width: 2.0,
            ),
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Test(
                                txtSearch: widget.plaka,
                              )));
            },
          ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
            child: OutlineButton(
            child: Text("Anasayfaya Dön"),
            borderSide: BorderSide(
              color: Colors.black87,
              style: BorderStyle.solid,
              width: 2.0,
            ),
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home()));
            },
          ),
          ),
          ],
        ),
      ),
    );
  }
  
}