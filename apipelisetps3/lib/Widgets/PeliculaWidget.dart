import 'package:apipelisetps3/models/Peliculas.dart';
import 'package:flutter/material.dart';

class PeliculasWidget extends StatelessWidget {

final List<Pelicula> pelicula;

PeliculasWidget({required this.pelicula});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: pelicula.length,
      itemBuilder: (context, index){  

        final peliculas = pelicula[index];

        return ListTile(
          title: Row(children: [
            SizedBox(
              width: 100,
              child: ClipRRect (
                  child: Image.network(peliculas.poster),
                  borderRadius: BorderRadius.circular(10),
              )
            
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(peliculas.title),
                  Text(peliculas.year),
                ],),
              ),
            )
          ],)
        );
      }
    );
  }
  
}