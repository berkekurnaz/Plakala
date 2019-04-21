import 'package:flutter/material.dart';
import 'package:plakala_mobil/Widgets/myAppBar.dart';
import 'package:plakala_mobil/Widgets/myDrawer.dart';

class About extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AboutState();
}

class _AboutState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Nedir",
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: <Widget>[
          plakalaNedir(),
          anonimNedir(),
          gelistiriciler(),
          iletisim(),
        ],
      ),
    );
  }

  Card plakalaNedir() {
    return Card(
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
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(Icons.directions_car, color: Colors.white),
          ),
          title: Text(
            "Plakala Uygulaması Her Gün Trafikte Etkileşime Geçtiğimiz Araçlar Hakkında Özgürce Yorumlar Yapmamıza İmkan Veren Bir Sosyal Medyadır.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Card anonimNedir() {
    return Card(
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
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(Icons.directions_car, color: Colors.white),
          ),
          title: Text(
            "Plakala Uygulaması Aracılığıyla Yazdığınız Yorumlar Anonim Olarak Kimliğiniz Saklı Bir Şekilde Yayınlanır. Aynı Zamanda Uygulamamız Sizden Kesinlikle Herhangi Bir Bilgi İstemez Verilerinizi Takip Etmez.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Card gelistiriciler() {
    return Card(
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
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(Icons.directions_car, color: Colors.white),
          ),
          title: Text(
            "Geliştirici\n-----------\nBerke Kurnaz",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Card iletisim() {
    return Card(
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
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(Icons.directions_car, color: Colors.white),
          ),
          title: Text(
            "Mail : iletisim@plakala.xyz\nİnternet Sitesi : www.plakala.xyz",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

}
