import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  
  List list;
  int index;

  Detail({this.index,this.list});

  @override
  State<StatefulWidget> createState() => _DetailState();

}

class _DetailState extends State<Detail> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['plaka']}"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("${widget.list[widget.index]['id']}"),
            Text("${widget.list[widget.index]['plakaYorum']}"),
            Text("${widget.list[widget.index]['plaka']}"),
            Text("${widget.list[widget.index]['resim']}"),
            Text("${widget.list[widget.index]['eklenmeTarihi']}"),
          ],
        ),
      ),
    );
  }
  
}