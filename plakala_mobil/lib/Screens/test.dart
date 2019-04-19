import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plakala_mobil/Screens/addComment.dart';
    
import 'dart:async';
import 'dart:convert';

import 'package:plakala_mobil/Screens/detail.dart';
import 'package:plakala_mobil/Screens/home.dart';


class Test extends StatefulWidget {

  String txtSearch;

  Test({this.txtSearch});

  @override
  State<StatefulWidget> createState() => _TestState();

}

class _TestState extends State<Test> {
  
  Future<List> getData() async {
    final response = await http.get("http://berkekurnaz.com/api/ayorum?plaka=" + widget.txtSearch); //http://localhost:2054/api/AYorum?plaka=10Y3570
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plakala"),
        centerTitle: true,
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data,
                )
              : Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddComment()));
        },
      ),
    );
  }
  
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: ()=>Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context)=> new Detail(list:list , index: i,)
              )
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['plakaYorum']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Plaka : ${list[i]['plaka']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}