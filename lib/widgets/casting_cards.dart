import 'package:fl_peliculas/models/models.dart';
import 'package:fl_peliculas/providers/movies_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId; 
  
  const CastingCards({Key? key, required this.movieId}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesProvider>(context);
    
    return FutureBuilder(
      future: movieProvider.getActoresMovie(movieId),
          builder: (BuildContext context, AsyncSnapshot<List<Actor>> snapshot) {
            if(!snapshot.hasData){
                  return Container(
                height: 180,
                constraints: BoxConstraints(maxWidth: 100),
                child: CupertinoActivityIndicator(),
              );
            }else{
              final List<Actor> listado = snapshot.data!;

              return Container(
                    margin: const EdgeInsets.only(bottom: 150, top: 15),
                    width: double.infinity,
                    height: 180,      
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _SingleCast(actor: listado[index],) ;
                                },
                              ),
                            );
                                  }
                              },
                            );
     }
}

class _SingleCast extends StatelessWidget {
  final Actor actor;

  const _SingleCast({
    Key? key, required this.actor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(actor.fullProfilePath),
              ),
            )
            ),
            SizedBox(height: 5,),
             Text(actor.name,
             maxLines: 2,
             overflow: TextOverflow.ellipsis,
             textAlign: TextAlign.center,
             )
        ],
      ),
    );
  }
}