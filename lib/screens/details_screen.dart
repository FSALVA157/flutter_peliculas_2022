import 'package:fl_peliculas/themes/app_theme.dart';
import 'package:fl_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
      final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
      
      return  Scaffold(
        body: CustomScrollView(
        slivers: [
          _CustomAppBar(
            posterMovie: movie.fullBackdropPath,
            titleMovie: movie.title,
          ),
          SliverList(              
            delegate: SliverChildListDelegate([
                  _PosterAndTitle(movie: movie),
                  _Overview(overView: movie.overview), 
                  _Overview(overView: movie.overview),
                  CastingCards(movieId: movie.id,)
                      
            ]) 
            )
        ],
          ),
      );
  }
}

class _Overview extends StatelessWidget {
  final String overView;
  
  const _Overview({
    Key? key, required this.overView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(overView, 
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.justify
                   ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;
  
  const _PosterAndTitle({
    Key? key, required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding:const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:  FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.fullPosterPath),
              height: 150,
              ),
          ),
          SizedBox(width: 20,),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 180 ),
            child: Column(
              children: [
                Text(movie.title, style: textTheme.headline5, overflow: TextOverflow.ellipsis,maxLines: 2,textAlign: TextAlign.center),
                Text(movie.originalTitle, style: Theme.of(context).textTheme.subtitle2, overflow: TextOverflow.ellipsis,textAlign: TextAlign.center),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Icon(Icons.star_border_outlined),
                    const SizedBox(width: 10,),
                    Text(movie.voteAverage.toString(), style: textTheme.caption,)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final String titleMovie;
  final String posterMovie;
  
  const _CustomAppBar({
    Key? key, required this.titleMovie, required this.posterMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      backgroundColor: AppTheme.primary,
      expandedHeight: 200,
      pinned: true,
      floating: false,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Expanded(child: Text(titleMovie, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,))),
        centerTitle: true,
        background:  FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(posterMovie),
          fit: BoxFit.cover, 
          ),
      ),
    );
  }
}