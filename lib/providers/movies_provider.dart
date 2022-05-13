import 'dart:convert';

import 'package:fl_peliculas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{
  final String _base_url = 'api.themoviedb.org';
  List<Movie> nowPlayingList = [];
  
  MoviesProvider(){
    print('movie provider llamado');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async{
    var url = Uri.https(_base_url, '3/movie/now_playing', {
  'api_key': '6d6d52189580fcb80212d917146ea0fa',
  'language': 'es-ES',
  'page': '1'
  });
  var response = await http.get(url);
  final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
  //final Map<String, dynamic> data = json.decode(response.body);
  nowPlayingList = nowPlayingResponse.results;
  //linea que notifica el cambio a los subscribers
  notifyListeners();
  }
}