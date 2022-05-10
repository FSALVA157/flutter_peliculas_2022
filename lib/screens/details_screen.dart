import 'package:fl_peliculas/themes/app_theme.dart';
import 'package:fl_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? "sin titulo";

      return  Scaffold(
        body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(              
            delegate: SliverChildListDelegate([
                  _PosterAndTitle(),
                  _Overview(), 
                  _Overview(),
                  CastingCards()
                      
            ]) 
            )
        ],
          ),
      );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text('Elit labore ipsum excepteur occaecat laboris Lorem exercitation Lorem tempor consequat pariatur. Officia culpa velit sit adipisicing anim consectetur nostrud quis dolore incididunt ad Lorem dolor elit. Nulla qui incididunt exercitation magna ut aliqua consequat nulla labore dolore esse. Eu mollit excepteur ea aute nisi et amet. Lorem culpa aliqua mollit Lorem exercitation laborum. Officia laborum id sint qui. Cillum sunt do mollit qui aute mollit anim.', 
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.justify
                   ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding:const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/150x250'),
              height: 150,
              ),
          ),
          SizedBox(width: 20,),
          Column(
            children: [
              Text('movie.title', style: textTheme.headline5, overflow: TextOverflow.ellipsis,maxLines: 2,),
              Text('movie.original.title', style: Theme.of(context).textTheme.subtitle2, overflow: TextOverflow.ellipsis,),
              Row(
                children:  [
                  const Icon(Icons.star_border_outlined),
                  const SizedBox(width: 10,),
                  Text('movie.voteAverage', style: textTheme.caption,)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key? key,
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
          child: Text('movie.title')),
        centerTitle: true,
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover, 
          ),
      ),
    );
  }
}