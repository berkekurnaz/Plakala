import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  
  String title = "Plakala";

  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      title: Text("$title"),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);

}