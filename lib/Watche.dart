import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:watche_list/CustomSearchDelegate.dart';
import 'package:watche_list/telas/Biblioteca.dart';
import 'package:watche_list/telas/EmAlta.dart';
import 'package:watche_list/telas/Inicio.dart';
import 'package:watche_list/telas/Inscricoes.dart';


class Watche extends StatefulWidget {
  const Watche({super.key});

  @override
  State<Watche> createState() => _WatcheState();
}

class _WatcheState extends State<Watche> {

  int _indiceAtual = 0;
  String _resultado = "";


  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio( _resultado ),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),
    ];
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          opacity: 1
        ),
        backgroundColor: Colors.black,
       title: Text("Watche"),
        actions: <Widget>[
          IconButton(
              onPressed: () async{
               String? res = await showSearch(context: context,
                    delegate: CustomSearchDelegate()) ;
               // print("resultado: digitado "+ res!);
                setState(() {
                  _resultado = res!;
                });
              },
              icon: Icon(Icons.search)
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.black,
        fixedColor: Colors.red,
        unselectedLabelStyle: TextStyle(
          color: Colors.white,
          fontSize: 14
        ),
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            label: "Inicio",
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            label: "Em alta",
            icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              label: "Inscrições",
              icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              label: "Biblioteca",
              icon: Icon(Icons.folder)
          ),
        ],
      ),

    );
  }
}
