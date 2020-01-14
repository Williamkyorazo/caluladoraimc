import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange)))),
    home: CalculadoraIMC(),
  ));
}

class CalculadoraIMC extends StatefulWidget {
  @override
  _CalculadoraIMCState createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  TextEditingController weightOController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String infoTexto = "Informe seus dados";

  void calculate() {
    double weight = double.parse(weightOController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weight / (height * height);
    setState(() {
      if (imc < 17) {
        infoTexto = "muito abaixo do peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 17 && imc <= 18.49) {
        infoTexto = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.5 && imc <= 24.99) {
        infoTexto = "Peso ideal ou normal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 25 && imc <= 29.99) {
        infoTexto = "Acima do peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 30 && imc <= 34.99) {
        infoTexto = "Obesida I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 35 && imc <= 39.99) {
        infoTexto = "obesidade II (severa) (${imc.toStringAsPrecision(4)})";
      } else if (imc > 40) {
        infoTexto = "Obesidade III (mórbida) (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  void clear() {
    setState(() {
      weightOController.text = "";
      heightController.text = "";
      infoTexto = "Informe seus dados";
      formKey = GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculadora de IMC",
          style: TextStyle(color: Colors.orange),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              clear();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline, size: 170.0, color: Colors.orange),
              buildTextFiel("Peso (kg)", weightOController),
              SizedBox(
                height: 15.0,
              ),
              buildTextFiel("Altura (mt)", heightController),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 50.0,
                child: RaisedButton(
                  color: Colors.orange,
                  child: Text("Verificar",
                      style: TextStyle(color: Colors.black, fontSize: 25.0)),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      calculate();
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                infoTexto,
                style: TextStyle(color: Colors.orange, fontSize: 20.0),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTextFiel(String label, TextEditingController c) {
  return TextFormField(
    controller: c,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.orange, fontSize: 25.0),
      border: OutlineInputBorder(),
    ),
    style: TextStyle(color: Colors.orange, fontSize: 25.0),
    keyboardType: TextInputType.number,
    validator: (value) {
      if (value.isEmpty) {
        return "Informe seus dados";
      }
    },
  );
}
