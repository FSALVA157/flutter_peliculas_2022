import 'package:fl_peliculas/providers/movies_provider.dart';
import 'package:fl_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Películas'),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.nowPlayingList, ),
            MovieSlider(),          
          ],
        ),
      ),
    );
  }
}