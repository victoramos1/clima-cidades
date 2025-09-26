import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Clima nas cidades",
    home: App(),
  ));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  TextEditingController controllerCampoDigitado = TextEditingController();
  String cidadeDigitada = "Digite uma cidade";
  int? temperatura;
  //Coloque a sua Api Key gerada abaixo (entre as aspas)
  String apiKey = "";

  Future<Map<String, dynamic>> buscarDados() async {
    cidadeDigitada = controllerCampoDigitado.text;
    var retorno = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$cidadeDigitada&units=metric&appid=$apiKey&lang=pt_br"));
    Map<String, dynamic> dadosRetornados = {};
    dadosRetornados = jsonDecode(retorno.body);
    return dadosRetornados;
  }

  void cliqueUsuario(){
    buscarDados().then((dados){
      setState(() {
        cidadeDigitada = controllerCampoDigitado.text;
        temperatura = (dados["main"]["temp"] as num).round();
        controllerCampoDigitado.clear();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clima"),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top:50, bottom: 50),
                child: Image.asset("imagens/logo.png",
                width: 200,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(cidadeDigitada,
                  style: TextStyle(
                    fontSize: 30
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(temperatura == null ? "" : "$temperatura °C",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Container(
                  width: 400,
                  child: TextField(
                    controller: controllerCampoDigitado,
                    decoration: InputDecoration(
                      labelText: "Digite aqui"
                    ),
                  ),
                )
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize: Size(400, 60),
                ),
                onPressed: cliqueUsuario,
                child: Text("Buscar",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                )
              ),
              Padding(padding: EdgeInsets.only(top: 20),
                child: Container(
                  width: 400,
                  child: Text("Cidades pequenas não possuem suporte na API, logo não retornará resultado ao clicar no botão",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
