import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/flutter_youtube.dart';


class CustomSearchDelegate extends SearchDelegate<String>{

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){
            query= "";
          },
          icon: Icon(
            Icons.clear
          )
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return  IconButton(
        onPressed: (){
          close(context, "");

        },
        icon: Icon(
            Icons.arrow_back
        )
    );
  }

  @override
  Widget buildResults(BuildContext context) {
   //  print("resultado: pesquisa realizada");
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   // print("resultado: digitado: "+ query);
    return Container();
  }



}