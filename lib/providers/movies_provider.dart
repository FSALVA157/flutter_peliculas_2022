
import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier{

  MoviesProvider(){
    print('movie provider llamado');
    this.getMovies();
  }

  getMovies(){
    print('getMovies llamado');
  }

}