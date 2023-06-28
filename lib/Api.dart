import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:watche_list/model/Video.dart';
const CHAVE_YOUTUBE_API = "AIzaSyDoUjPXx83CUKC3wKIuRbEhG1iO4fCgmgE";
const ID_CANAL = "UC13ikrGSy3E2AveqLAI9lqg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";


class Api {

  Future<List<Video>> pesquisar(String pesquisa) async {

    http.Response response = await http.get(Uri.parse(
        URL_BASE + "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
           "&channelId=$ID_CANAL"
            "&q=$pesquisa"
    ));

    if(response.statusCode == 200){

      Map<String, dynamic> dadosJson = json.decode (response.body);
      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            
            return Video.fromJson(map);
            
          }
      ).toList();

      return videos;
      
      
  }else{
      return pesquisar(pesquisa);
    }
  }
}