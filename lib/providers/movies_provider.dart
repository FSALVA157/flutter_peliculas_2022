import 'dart:convert';

import 'package:fl_peliculas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{
  final String _base_url = 'api.themoviedb.org';
  List<Movie> nowPlayingList = [];
  List<Movie> popularMoviesList = [];
  int _popularPage = 0;
  MoviesProvider(){
      this.getOnDisplayMovies();
      this.getPopularMovies();
  }

  Future<String>_getJsonData(String endpoint, [page = 1] ) async{
      var url = Uri.https(_base_url, '3/movie/now_playing', {
        'api_key': '6d6d52189580fcb80212d917146ea0fa',
        'language': 'es-ES',
        'page': '$page'
        });
      var response = await http.get(url);
      return response.body;
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
    var dataJson = await _getJsonData('3/movie/popular', _popularPage);
    final popularMovieResponse = PopularMoviesResponse.fromJson(dataJson);
    popularMoviesList = [...popularMoviesList,...popularMovieResponse.results];

    //linea que notifica el cambio a los subscribers
    notifyListeners();
  }



}