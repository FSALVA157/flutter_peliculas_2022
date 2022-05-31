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

  Widget emptyContainer(){
    return Container(  
        child: const Center(
          child:  Icon(Icons.movie_rounded, color: Colors.black54,size: 100),
        ),
      );
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    if(query.isEmpty){
      return emptyContainer();
    }else{
        moviesProvider.getSearchMovie(query);
         
        
        return FutureBuilder(
          future: moviesProvider.getSearchMovie(query),
          builder: (BuildContext contex, AsyncSnapshot<List<Movie>> snapshot){
            if(!snapshot.hasData){
              return  Container(
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }else{
              final movies = snapshot.data!;
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index) {
                        return _movieItem(pelicula: movies[index]);
                },
              );                          
            }
          }
          );           
    }     
    
  }
 
 }

class _movieItem extends StatelessWidget {
  final Movie pelicula;
  const _movieItem({Key? key, required this.pelicula}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: FadeInImage(
        image: NetworkImage(pelicula.fullPosterPath),
        placeholder: AssetImage('assets/no-image.jpg'),
        width: 100,
        fit: BoxFit.cover,
     ),
     title: Text(pelicula.title),
     subtitle: Text(pelicula.originalTitle),
     onTap: (){
       Navigator.pushNamed(context, 'details', arguments: pelicula);
     },
     );     
  }
}