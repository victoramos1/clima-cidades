import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
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
  String cidadeDigitada = "";



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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text("Digite uma cidade",
                  style: TextStyle(
                    fontSize: 25
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text("32 C",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
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
                  backgroundColor: Colors.blue,
                  minimumSize: Size(400, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero
                  )
                ),
                onPressed: (){}, 
                child: Text("Buscar",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
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
