import 'package:fl_peliculas/models/models.dart';
import 'package:fl_peliculas/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate{

    @override
  // modifica el texto de la caja de búsqueda
  String? get searchFieldLabel => 'buscar película';
  

  @override
  List<Widget>? buildActions(BuildContext context) {
          return [
            IconButton(
              onPressed: (() {
                   query='';
              }),
              icon: const Icon(Icons.close)
              )
          ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
      return IconButton(
        onPressed: (){
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_outlined)
        );
    
  }

  @override
  Widget buildResults(BuildContext context) {
     return Text('BuildResults');
    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
      final moviesProvider = Provider.of<MoviesProvider>(context);
    if(query == ''){
      return Container(
        
        child: const Center(
          child:  Icon(Icons.movie_rounded, color: Colors.black54,size: 100),
        ),
      );
    }else{
        moviesProvider.getSearchMovie(query);
         
        
        return FutureBuilder(
          future: moviesProvider.getSearchMovie(query),
          builder: (BuildContext contex, AsyncSnapshot<List<Movie>> snapshot){
            if(!snapshot.hasData){
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }else{
              final movies = snapshot.data!;
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index) {
                        return Text(movies[index].title);
                },
              );
              
              
              
              
            }
          }
          );
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }

     
    
  }

}