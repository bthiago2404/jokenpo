import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({ Key? key }) : super(key: key);
  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo!";
  var _resultado = "";

  void _opcaoSeleciaonada(String escolhaUsuario){
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    print("Escolha do app: " + escolhaApp);
    print("Escolha usuario: " + escolhaUsuario);
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          _imagemApp =AssetImage("imagens/pedra.png");
        });
        break;
        case "papel":
        setState(() {
          _imagemApp =AssetImage("imagens/papel.png");
        });
        break;
        case "tesoura":
        setState(() {
          _imagemApp =AssetImage("imagens/tesoura.png");
        });
        break;
      default:
    }

    if(
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel")
    ){
      setState(() {
        this._mensagem = "Parabéns você ganhou!";
      });
    }else if(
      (escolhaUsuario == "pedra" && escolhaApp == "papel") ||
      (escolhaUsuario == "papel" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "pedra")
    ){
      setState(() {
        this._mensagem = "Você perdeu!";
      });
    }else{
      setState(() {
        this._mensagem = "Empatamos!";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imagemApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 32),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSeleciaonada("pedra"),
                child: Image.asset("imagens/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSeleciaonada("papel"),
                child: Image.asset("imagens/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSeleciaonada("tesoura"),
                child: Image.asset("imagens/tesoura.png", height: 100),
              )
            ],
            )
        ],
      ),
    );
  }
}
