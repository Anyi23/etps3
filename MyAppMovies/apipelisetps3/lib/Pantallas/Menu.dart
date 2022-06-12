import 'dart:convert';
import 'package:apipelisetps3/Widgets/PeliculaWidget.dart';
import 'package:apipelisetps3/Widgets/side_bar_widget.dart';
import 'package:apipelisetps3/models/Peliculas.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/base_response.dart';
import 'package:apipelisetps3/main.dart';


class Menu extends StatefulWidget {

  @override
  State<Menu> createState() => _MenuState();
}




class _MenuState extends State<Menu> {

  List<Pelicula> _pelicula =  [];

@override
void initState() {
  super.initState();
  _peliculasPopulares();
}

void _peliculasPopulares() async {  
 final peliculas = await _fetchAllMovies();
 setState(() {
   _pelicula = peliculas;
 });
}


Future<List<Pelicula>> _fetchAllMovies() async {  
final response = await 
    http.get(Uri.parse("https://omdbapi.com/?s=Batman&page=2&apikey=6fa3f035"));


  if(response.statusCode ==200){  
    final result = jsonDecode(response.body);
    Iterable list = result ["Search"];
    return list.map((pelicula) => Pelicula.fromJson(pelicula)).toList();
  }else {  
    throw Exception("Fallo al cargar las peliculas");
}
}


  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondo9.jpg'),
          fit: BoxFit.cover
          ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation:20.0,
          title: Text(
            "Peliculas",
            style: TextStyle(color: Colors.black),
            ),
          automaticallyImplyLeading: false,
         /*  leading:IconButton(
              icon:Icon(Icons.menu)
              onPressed: (){ },
              setState(((){ }))
              ),*/
          // flexibleSpace: mostrarAppBar(),
        ),
        drawer: SideBarWidget(),
        body: PeliculasWidget(pelicula: _pelicula)
      ),
    );
    
  }

  Widget mostrarAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Padding(
        padding:
            const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
        child: Container(
          padding: EdgeInsets.only(left: 300, top: 3),
          child: Icon(
            Icons.person,
            color: Colors.black,
            size: 35,
          ),
        ),
      ),
    );
  }
}

