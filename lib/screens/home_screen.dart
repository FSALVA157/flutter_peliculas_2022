import 'package:fl_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Películas'),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: const [
            CardSwiper(),
            MovieSlider(),          
          ],
        ),
      ),
    );
  }
}