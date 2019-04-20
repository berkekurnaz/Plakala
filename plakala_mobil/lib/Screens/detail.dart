import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  List list;
  int index;

  Detail({this.index, this.list});

  @override
  State<StatefulWidget> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['plaka']}"),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
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
                  "Plaka : ${widget.list[widget.index]['plaka']}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
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
                  child: Icon(Icons.date_range, color: Colors.white),
                ),
                title: Text(
                  "Eklenme Tarihi : ${widget.list[widget.index]['eklenmeTarihi']}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
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
                  child: Icon(Icons.comment, color: Colors.white),
                ),
                title: Text(
                  "${widget.list[widget.index]['plakaYorum']}",
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
            child: Text("Geriye Dön"),
            borderSide: BorderSide(
              color: Colors.black87,
              style: BorderStyle.solid,
              width: 1.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          ),
        ],
      ),
    );
  }
}
