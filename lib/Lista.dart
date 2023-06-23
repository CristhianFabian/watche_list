import 'package:flutter/material.dart';
import 'package:watche_list/Cadastrar.dart';

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {

  void _cadastrar(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Cadastrar()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
       title: Text("Lista"),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
              onPressed: _cadastrar,
              child: Text("Cadastrar"))
        ],

      ),

    );
  }
}
