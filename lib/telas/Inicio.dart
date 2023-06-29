import 'package:flutter/material.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';
import 'package:watche_list/model/Video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


import '../Api.dart';

class Inicio extends StatefulWidget {

  String pesquisa;

  Inicio(this.pesquisa);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listarVideos(String pesquisa){

    Api api = Api();
    return api.pesquisar(pesquisa);

  }

  @override
  Widget build(BuildContext context) {



    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if(snapshot.hasData){
              return ListView.separated(
                  itemBuilder: (context, index){
                    List<Video>? videos = snapshot.data;
                    Video video = videos![ index ];
                    return GestureDetector(
                      onTap: (){

                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(video.imagem.toString())
                                )
                            ),
                          ),
                          ListTile(
                            title: Text(video.titulo.toString(),
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            subtitle: Text(video.canal.toString(),
                              style: TextStyle(
                                  color: Colors.grey
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index)=> Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  itemCount: snapshot.data!.length
              );

            }else{

              return Center(
                child: Text("Nenhum dado a ser exibido!"),
              );
            }
        }
      },
    );
  }
}
