import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.list),
                  Text("Plakala Uygulaması"),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.amberAccent,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Anasayfa'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              print("Tıklama İşlemi.");
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Nedir'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              print("Tıklama İşlemi.");
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Nasıl Kullanılır'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              print("Tıklama İşlemi.");
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('İletişim'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              print("Tıklama İşlemi.");
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Kullanıcı Sözleşmesi'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              print("Tıklama İşlemi.");
            },
          ),
        ],
      ),
    );
  }
}
