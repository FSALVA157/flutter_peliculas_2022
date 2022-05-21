import 'dart:convert';

import 'package:fl_peliculas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{
  final String _base_url = 'api.themoviedb.org';
  List<Movie> nowPlayingList = [];
  List<Movie> popularMoviesList = [];
  int _popularPage = 0;
  Map<int, List<Actor>> actoresInMemory ={};

  MoviesProvider(){
      this.getOnDisplayMovies();
      this.getPopularMovies();
  }

  Future<String>_getJsonData(String endpoint, [page = 1] ) async{
      var url = Uri.https(_base_url, endpoint, {
        'api_key': '6d6d52189580fcb80212d917146ea0fa',
        'language': 'es-ES',
        'page': '$page'
        });
      var response = await http.get(url);
      return response.body;
  }

  Future <List<Actor>> getActoresMovie(int idMovie) async {
  var dataJson = await _getJsonData('3/movie/$idMovie/credits');
  final actoresMovieResponse = ActoresMovieResponse.fromJson(dataJson);
  actoresInMemory[idMovie] = actoresMovieResponse.cast;
  return actoresMovieResponse.cast;
}   

  getOnDisplayMovies() async{ 
  var dataJson = await _getJsonData('3/movie/now_playing');
  final nowPlayingResponse = NowPlayingResponse.fromJson(dataJson);
  //final Map<String, dynamic> data = json.decode(response.body);
  nowPlayingList = nowPlayingResponse.results;
  //linea que notifica el cambio a los subscribers
  notifyListeners();
  }

  getPopularMovies() async{
    _popularPage++;
    print('PAGINA: $_popularPage');
    if(_popularPage <= 500){
        var dataJson = await _getJsonData('3/movie/popular', _popularPage);
        final popularMovieResponse = PopularMoviesResponse.fromJson(dataJson);
        popularMoviesList = [...popularMoviesList,...popularMovieResponse.results];

        //linea que notifica el cambio a los subscribers
        notifyListeners();
    } 
    
      
    
  }



}