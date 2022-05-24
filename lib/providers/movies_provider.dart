import 'dart:convert';

import 'package:fl_peliculas/models/models.dart';
import 'package:fl_peliculas/models/search_movie_response.dart';
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

  Future<String>_getJsonDataSearch(String endpoint, String queryRecibida ) async{
    var url = Uri.https(_base_url, endpoint, {
      'api_key': '6d6d52189580fcb80212d917146ea0fa',
      'query': queryRecibida      
      });
    var response = await http.get(url);
    return response.body;
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
    
    if(this.actoresInMemory.containsKey(idMovie)) return this.actoresInMemory[idMovie]!;

    
    var dataJson = await _getJsonData('3/movie/$idMovie/credits');
    final actoresMovieResponse = ActoresMovieResponse.fromJson(dataJson);
    actoresInMemory[idMovie] = actoresMovieResponse.cast;
    return actoresMovieResponse.cast;
} 

Future<List<Movie>> getSearchMovie(query) async{
  var dataJson = await _getJsonDataSearch('3/search/movie', query);
  final searchMovieResult = SearchMovieResponse.fromJson(dataJson);
  
  return searchMovieResult.results;

 // notifyListeners();

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
    if(_popularPage <= 500){
        var dataJson = await _getJsonData('3/movie/popular', _popularPage);
        final popularMovieResponse = PopularMoviesResponse.fromJson(dataJson);
        popularMoviesList = [...popularMoviesList,...popularMovieResponse.results];

        //linea que notifica el cambio a los subscribers
        notifyListeners();
    } 
     
    
  }



}