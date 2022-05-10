import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
   
  const CastingCards({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 150, top: 15),
      width: double.infinity,
      height: 180,      
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return _SingleCast() ;
        },
      ),
    );
  }
}

class _SingleCast extends StatelessWidget {
  const _SingleCast({
    Key? key,
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
              child: const FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
              ),
            )
            ),
            SizedBox(height: 5,),
            const Text('actor.name.appellido.origen.ciudad.dni.detalles',
             maxLines: 2,
             overflow: TextOverflow.ellipsis,
             textAlign: TextAlign.center,
             )
        ],
      ),
    );
  }
}