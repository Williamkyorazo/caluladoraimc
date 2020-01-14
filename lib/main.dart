import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      inputDecorationTheme: InputDecorationTheme(enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orange)
      ))
    ),
    home: CalculadoraIMC(),
  ));
}

class CalculadoraIMC extends StatefulWidget {
  @override
  _CalculadoraIMCState createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC", style: TextStyle(color: Colors.orange),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 170.0, color: Colors.orange),
            buildTextFiel("Peso (kg)"),
            SizedBox(
              height: 10.0,
            ),
            buildTextFiel("Altura (mt)"),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 50.0,
              child: RaisedButton(
                color: Colors.orange,
                child: Text("Verificar", style: TextStyle(
                  color: Colors.black, fontSize: 25.0
                )),
                onPressed: (){},
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Informe seus dados", style: TextStyle(
              color: Colors.orange, fontSize: 20.0
            ),
            textAlign: TextAlign.center,)
            
          ],
        ),
      ),
    );
  }
}

Widget buildTextFiel(String label){
  return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.orange, fontSize: 25.0),
        border: OutlineInputBorder(),
      ),
      style: TextStyle(color: Colors.orange, fontSize: 25.0),
      keyboardType: TextInputType.number,
    );
}