import 'package:fl_peliculas/themes/app_theme.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? "sin titulo";

    return  CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
                _PosterAndTitle()    
          ]) 
          )
      ],
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/150x250'),
              height: 200,
              ),
          ),
          SizedBox(width: 20,),
          Column(
            children: [
              Text('movie.title', style: Theme.of(context).textTheme.headline5, overflow: TextOverflow.ellipsis,maxLines: 2,),
              Text('movie.original.title', style: Theme.of(context).textTheme.subtitle2, overflow: TextOverflow.ellipsis,)
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
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover, 
          ),
      ),
    );
  }
}