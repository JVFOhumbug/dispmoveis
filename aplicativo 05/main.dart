import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController peso = new TextEditingController();
  TextEditingController alt = new TextEditingController();
  String rsp = "";
  String img =
      'https://cdn.discordapp.com/attachments/909294029613699122/912814616738926662/8fd9b48500da91b385405ad5ef7dda0a5d65fe4a3f8a8d7508521af250fb4bff_1.png';

  void calculate() {
    setState(() {
      double p = double.parse(peso.text);
      double a = double.parse(alt.text);

      if (a > 100) {
        a = a / 100;
      }

      double imc = p / (a * a);

      if (imc < 18.5) {
        rsp = "Abaixo do Peso";
        img =
            'https://cdn.discordapp.com/attachments/909294029613699122/912815472783802438/55a9b8c9c45a7e029ed590712fc823d2.png';
      } else if (imc < 25) {
        rsp = "Peso Normal";
        img =
            'https://cdn.discordapp.com/attachments/909294029613699122/912841587220959273/2Q.png';
      } else if (imc < 30) {
        rsp = "Sobrepeso";
        img =
            'https://cdn.discordapp.com/attachments/909294029613699122/912816784380395540/98573ef8b58ac489663da8b24e0cf023433eb45499363f81e467432cf1e8313a_1.png';
      } else if (imc < 35) {
        rsp = "Obesidade Grau I";
        img =
            'https://cdn.discordapp.com/attachments/909294029613699122/912817900279201842/c868277db6faf045898e0d4ef5e94bb201d9a350576a80389f648f855aac6441_1.png';
      } else if (imc < 40) {
        rsp = "Obesidade Grau II";
        img =
            "https://cdn.discordapp.com/attachments/909294029613699122/912816345551347762/ac6403379d8a4a382a902cc3d8aedea3.png";
      } else {
        rsp = "Obesidade Grau III";
        img =
            'https://cdn.discordapp.com/attachments/909294029613699122/912842330086711296/look-o-its-your-mom-com-17851141.png';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: body(),
    );
  }

  header() {
    return AppBar(
        title: Text(
          'IMC',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple);
  }

  body() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Column(
        children: <Widget>[
          image(img),
          row(),
          button(),
          answer(rsp, 30),
        ],
      ),
    );
  }

  image(imag) {
    return Image.network(
      imag,
      height: 300,
      width: 300,
      fit: BoxFit.cover,
    );
  }

  container(content) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: 80,
      width: 150,
      child: content,
    );
  }

  textfield(String field, controll) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controll,
      decoration: InputDecoration(
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: field,
        hintStyle: TextStyle(fontSize: 20),
      ),
    );
  }

  row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        container(textfield("Peso", peso)),
        container(textfield("Altura", alt)),
      ],
    );
  }

  button() {
    return Container(
      height: 50,
      width: 280,
      child: ElevatedButton(
          onPressed: calculate,
          child: Text(
            'Calcular IMC',
            style: TextStyle(
              fontSize: 20,
              color: Colors.purple,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent),
          )),
    );
  }

  answer(content, double size) {
    return Text(content, style: TextStyle(fontSize: size));
  }
}
