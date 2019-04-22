import 'package:flutter/material.dart';
import 'package:plakala_mobil/Widgets/myAppBar.dart';
import 'package:plakala_mobil/Widgets/myDrawer.dart';

class Information extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InformationState();
}

class _InformationState extends State {
  TextEditingController txtAdCtrl = new TextEditingController();

  String str1 = "Plakala Uygulaması İçerisinde Yazılan Yorumlar Kullanıcılar Tarafından Yazılmış Olup Geliştirici Firma Olan BK Teknoloji Bu Yorumlardan Sorumlu Tutulamaz.";
  String str2 = "Kullanıcı Gizliliği Kapsamında Yapılan Yorumların Kimler Tarafından Eklendiği Kesinlikle Bilinmemektedir. Silinmesini İstediğiniz Yorumları İletişim Bölümü Aracılığıyla Bizlere Gönderebilirsiniz.";
  String str3 = "Yapılan Kötü Yorumlar Sistem Görevlileri Tarafından Düzenli Olarak Kontrol Edilmekte Ve Kötü Söz İçeren, Şiddet İçeren Yorumlar Silinmektedir.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Kullanıcı Sözleşmesi",
      ),
      drawer: MyDrawer(),
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
                  "Kullanıcı Sözleşmesi",
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
                  child: Icon(Icons.directions_car, color: Colors.white),
                ),
                title: Text(
                  "$str1 \n $str2 \n $str3",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
