import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
   
  const MovieSlider({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text('Populares', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index){
                return _MoviePoster();
              }
              ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    Key? key,
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
              child: const FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/no-image.jpg'),
                width: double.infinity,
                height: 150,
                image: NetworkImage('https://via.placeholder.com/300x400')),
            ),
          ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Ullamco ipsum qui adipisicing est reprehenderit esse excepteur ipsum irure sit incididunt voluptate labore.',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              )            
                    ],
      ),
    );
  }
}