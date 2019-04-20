import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plakala_mobil/Screens/commentList.dart';

import 'package:plakala_mobil/Widgets/myAppBar.dart';
import 'package:plakala_mobil/Widgets/myDrawer.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State {
  TextEditingController controllerSearch = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Plakala",),
      drawer: MyDrawer(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: controllerSearch,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(7),
                ],
                textCapitalization: TextCapitalization.sentences,
                decoration: new InputDecoration(
                    hintText: "Aranacak Plaka",              
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
              ),
              Divider(),
              RaisedButton(
                padding: EdgeInsets.only(
                    right: 30.0, left: 30.0, bottom: 15.0, top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.search,color: Colors.white,),
                    Text(
                      "Arama Yap",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                color: Colors.black87,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommentList(
                                txtSearch: controllerSearch.text.toUpperCase(),
                              )));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
