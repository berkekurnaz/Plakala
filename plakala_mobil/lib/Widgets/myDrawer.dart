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
                  Icon(Icons.list,color: Colors.white,),
                  Text("Plakala Uygulaması", style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black87,
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
            leading: Icon(Icons.question_answer),
            title: Text('Nedir'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              print("Tıklama İşlemi.");
            },
          ),
          ListTile(
            leading: Icon(Icons.data_usage),
            title: Text('Nasıl Kullanılır'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              print("Tıklama İşlemi.");
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('İletişim'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              print("Tıklama İşlemi.");
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
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