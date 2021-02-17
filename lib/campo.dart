import 'package:flutter/material.dart';

class Campo extends StatefulWidget {
  @override
  _CampoState createState() => _CampoState();
}

class _CampoState extends State<Campo> {
  TextEditingController _alcollcontroler = TextEditingController();
  TextEditingController _gasocontroler = TextEditingController();
  String _textoResultado = '';
  void resultado(){
    double precoalcoll = double.tryParse(_alcollcontroler.text);
    double precogasolina = double.tryParse(_gasocontroler.text);

    if (precogasolina < precoalcoll || precoalcoll > precogasolina) {
      setState(() {
        _textoResultado = 'abasteça com gasolina';
        
      });
      
    }
       if (  precogasolina > precoalcoll || precoalcoll < precogasolina) {
      setState(() {
        _textoResultado = 'abasteça com alcoll';
        
      });
      
    }
    else{
      setState(() {
        _textoResultado='abasteça com qualquer um';
      });
    }
   
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('posto Brian',
        style: TextStyle(
          fontSize: 18,
          fontStyle: FontStyle.italic,
        ),),
        backgroundColor: Colors.tealAccent,
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              child: Image.asset('imagens/logo.png'),
              padding: EdgeInsets.only(bottom: 32),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10),
            child: Text('qual o melhor alcool ou gasolina'),),
            TextField(
              decoration: InputDecoration(
                labelText: 'gasolina',
                labelStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent[200]
                )
              ),
              keyboardType: TextInputType.number,
              controller: _gasocontroler,
            ),

            TextField(
               keyboardType: TextInputType.number,
               decoration: InputDecoration(
                labelText: 'alcool',
                  labelStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent[200]
                )
              ),
              controller: _alcollcontroler,
            ),

            Padding(padding: EdgeInsets.all(10),
            child: RaisedButton(onPressed: resultado,
            color: Colors.blue,
            child: Text('calcular',
            style: TextStyle(
              color: Colors.white,
            ),),),
            ),
            Padding(padding: EdgeInsets.all(10),
            child: Text(_textoResultado,
            style: TextStyle(
              fontSize: 20
            ),
            ),
            )
          ],
        ),
        )
      ),
    );
  }
}


