import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plakala_mobil/Screens/addComment.dart';

import 'dart:async';
import 'dart:convert';

import 'package:plakala_mobil/Screens/detail.dart';
import 'package:plakala_mobil/Screens/home.dart';
import 'package:plakala_mobil/Widgets/myAppBar.dart';

class CommentList extends StatefulWidget {
  String txtSearch;

  CommentList({this.txtSearch});

  @override
  State<StatefulWidget> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  Future<List> getData() async {
    final response = await http
        .get("http://plakala.xyz/api/ayorum?plaka=" + widget.txtSearch);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Yorumlar Listesi",
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data,
                  count: snapshot.data.length,
                )
              : Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddComment()));
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List list;
  int count;
  ItemList({this.list, this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getMyCommentList(list, count),
    );
  }

  String printComment(String comment) {
    if (comment.length > 28) {
      return comment = comment.substring(0, 28) + "...";
    } else {
      return comment;
    }
  }

  ListView getMyCommentList(List list, int count) {
    if (count == 0 || count == null) {
      return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, i) {
          return Container(
            child: Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100.0,),
                Icon(
                  Icons.announcement,
                  color: Colors.green,
                  size: 50.0,
                ),
                Card(
                  elevation: 8.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: new BoxDecoration(
                            border: new Border(
                                right: new BorderSide(
                                    width: 1.0, color: Colors.white24))),
                        child: Icon(Icons.directions_car, color: Colors.white),
                      ),
                      title: Text(
                        "Bu Plakaya Ait Yorum Bulunamadı",
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                  child: OutlineButton(
                    child: Text("Anasayfaya Dön"),
                    borderSide: BorderSide(
                      color: Colors.black87,
                      style: BorderStyle.solid,
                      width: 2.0,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                  child: OutlineButton(
                    child: Text("Yeni Bir Yorum Ekle"),
                    borderSide: BorderSide(
                      color: Colors.black87,
                      style: BorderStyle.solid,
                      width: 2.0,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddComment()));
                    },
                  ),
                ),
              ],
            ),
            ),
          );
        },
      );
    } else {
      return ListView.builder(
        itemCount: count,
        itemBuilder: (context, i) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => new Detail(
                        list: list,
                        index: i,
                      ))),
              child: Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                  child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: new BoxDecoration(
                            border: new Border(
                                right: new BorderSide(
                                    width: 1.0, color: Colors.white24))),
                        child: Icon(Icons.directions_car, color: Colors.white),
                      ),
                      title: Text(
                        printComment(list[i]['plakaYorum'].toString()),
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          Text("Plaka : ${list[i]['plaka']}",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right,
                          color: Colors.white, size: 30.0)),
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
