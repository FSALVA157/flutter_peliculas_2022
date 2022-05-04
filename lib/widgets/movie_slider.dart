import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
   
  const MovieSlider({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 200,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text('Populares', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
          ),
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
      margin: EdgeInsets.all(10),
      color: Colors.green,
    );
  }
}