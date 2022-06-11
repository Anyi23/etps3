class Pelicula {  
  final String imbdId;
  final String poster;
  final String title;
  final String year;


  Pelicula( {
    required this.imbdId,
    required this.poster, 
    required this.title, 
    required this.year
    }
  );


  factory Pelicula.fromJson(Map<String, dynamic> json){  
 return Pelicula(
  imbdId: json["imdbID"],
  poster: json["Poster"],
  title:  json["Title"],
  year:   json["Year"]
 );
}


}