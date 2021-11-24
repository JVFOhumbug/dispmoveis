import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title(),
      backgroundColor: Colors.black,
      body: body(),
    );
  }

  title() {
    return AppBar(
      title: Text(
        'Anúncios',
        style: TextStyle(fontSize: 20, color: Colors.green),
      ),
      centerTitle: true,
      backgroundColor: Colors.purple,
    );
  }

  body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          carousel(),
        ],
      ),
    );
  }

  image(link) {
    return Image.network(
      link,
      width: 200,
      height: 200,
    );
  }

  carousel() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
      height: 400,
      child: ListView(
        children: <Widget>[
          pading(
              containerAd(
                  image(
                      'https://cdn.discordapp.com/attachments/909294029613699122/912874009006321674/eva_berserk.png'),
                  container(
                      pading(
                          text('EVA 01 Berserk', 30.0, Colors.deepPurpleAccent),
                          0,
                          10,
                          0,
                          0),
                      pading(available(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
          pading(
              containerAd(
                  image(
                      'https://cdn.discordapp.com/attachments/909294029613699122/912874008528183296/nftkkkkkk.png'),
                  container(
                      pading(
                          text('NFT roubada feiakkkkkkkkkkkkkkkkkk', 30.0,
                              Colors.deepPurpleAccent),
                          0,
                          10,
                          0,
                          0),
                      pading(available(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
          pading(
              containerAd(
                  image(
                      'https://cdn.discordapp.com/attachments/909294029613699122/912874008742076446/makima_figure.png'),
                  container(
                      pading(
                          text('Makima Figure', 30.0, Colors.deepPurpleAccent),
                          0,
                          10,
                          0,
                          0),
                      pading(available(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
          pading(
              containerAd(
                  image(
                      'https://cdn.discordapp.com/attachments/909294029613699122/912874008058396702/berserk_armor.png'),
                  container(
                      pading(
                          text('Berserk Armor', 30.0, Colors.deepPurpleAccent),
                          0,
                          10,
                          0,
                          0),
                      pading(available(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
          pading(
              containerAd(
                  image(
                      'https://cdn.discordapp.com/attachments/909294029613699122/912874008301670490/swordfish.png'),
                  container(
                      pading(text('Swordfish', 30.0, Colors.deepPurpleAccent),
                          0, 10, 0, 0),
                      pading(unavailable(), 0, 10, 0, 0))),
              30,
              0,
              0,
              30),
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  containerAd(context, content) {
    return Container(
        height: 300,
        width: 300,
        color: Colors.grey,
        child: Column(children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: context),
          content
        ]));
  }

  container(content, describe) {
    return Container(
      child: Column(
        children: <Widget>[content, describe],
      ),
    );
  }

  pading(content, double L, double T, double B, double R) {
    return Padding(padding: EdgeInsets.fromLTRB(L, T, R, B), child: content);
  }

  text(content, double size, color) {
    return Text(content, style: TextStyle(fontSize: size, color: color));
  }

  available() {
    return text('Disponivel', 30.0, Colors.lightGreenAccent);
  }

  unavailable() {
    return text('Indisponivel', 30.0, Colors.red);
  }
}
