import 'package:fl_peliculas/models/models.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatefulWidget {
   final List<Movie> movies;
   final String? titulo;
   final Function onNextPage;

  const MovieSlider({Key? key, required this.movies, required this.onNextPage , this.titulo}) : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}



class _MovieSliderState extends State<MovieSlider> {
final ScrollController scrollController = new ScrollController();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() { 
      if(scrollController.position.pixels <= scrollController.position.maxScrollExtent - 500){
          widget.onNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.titulo != null)
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(widget.titulo!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (BuildContext context, int index){
                return _MoviePoster(movie: this.widget.movies[index],);
              }
              ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  
  
  const _MoviePoster({
    Key? key, required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 160,
      margin: EdgeInsets.symmetric(horizontal: 10),      
       child: Column(
        children: [
          GestureDetector(
            onTap: (() => Navigator.pushNamed(context, 'details', arguments: 'llamado desde movie-slider')),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/no-image.jpg'),
                width: double.infinity,
                height: 150,
                image: NetworkImage(this.movie.fullPosterPath)),
            ),
          ),
            const SizedBox(
              height: 15,
            ),
             Text(
              this.movie.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              )            
                    ],
      ),
    );
  }
}