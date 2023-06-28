import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String>{

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
    onPressed: (){
      query = "";
    },
    icon: Icon(Icons.clear)
      )
    ];

  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
          onPressed: (){
            close(context, "");
          },
          icon: Icon(Icons.arrow_back)
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<String> lista = [];
    if(query.isNotEmpty){
      lista = [
        "Android", "android navegação", "IOS", "Jogos"
      ];

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(lista[index]),
          );
        },
      );
    }else{
      return Center(
        child: Text("Nenhum resultado para a pesquisa!"),
      );
    }


  }



}