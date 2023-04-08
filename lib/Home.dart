import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _mensagem = "";

  void _calcular(){

    double? precoAlcool = double.tryParse( _controllerAlcool.text.toString() );
    double? precoGasolina = double.tryParse( _controllerGasolina.text.toString() );

    if(precoAlcool == null || precoGasolina == null){
      setState(() {
        _mensagem = "Número inválido, digite números maiores que 0 e utilizando (.) ";
      });

    }else{
      if(precoAlcool / precoGasolina >= 0.7){
        setState(() {

          _mensagem = "É melhor abastecer com Gasolina ";
        });
      }else{
        setState(() {

          _mensagem = "É melhor abastecer com Alcool ";
        });
      }
     // _limpaCampos();
    }

  }

  void _limpaCampos(){
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Alcool ou Gasolina"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiva qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                InputDecoration(label: Text("Preço Alcool, ex: 4.57")),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                InputDecoration(label: Text("Preço Gasolina, ex: 6.32")),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: _calcular,
                  child: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ButtonStyle(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _mensagem,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          ),
        )
    );
  }
}
