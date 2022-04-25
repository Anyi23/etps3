import 'dart:convert';

import 'package:parcial3/modelos/parcial.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<jsonplaceholde>> _listadojsonplaceholde;

  Future<List<jsonplaceholde>> _getjsonplaceholde() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    String cuerpo;
    List<jsonplaceholde> lista = [];

    if (response.statusCode == 200) {
      print(response.body);
      cuerpo = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(cuerpo);
      for (var item in jsonData["jsonplaceholde"]) {
        lista.add(jsonplaceholde(item["id"],item["title"],item["url"],item["thumbnailUrl"]));
      }
    } else {
      throw Exception("Fallo de conexion");
    }
    return lista;
  }

  @override
  void initState() {
    super.initState();
    _listadojsonplaceholde = _getjsonplaceholde();
  }

  @override
  Widget build(BuildContext context) {
    var futureBuilder = FutureBuilder(
      future: _listadojsonplaceholde,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: _listadojsonplaceholdes(snapshot),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Text("Error");
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parcial 3',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Empresas SA de CV'),
          ),
          body: futureBuilder),
    );
  }

  List<Widget> _listadojsonplaceholdes(data) {
    List<Widget> api = [];
    for (var itempk in data) {
      api.add(Card(
        elevation: 2.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Text(itempk.num),
            Container(
              padding: EdgeInsets.all(2.0),
              height: 500,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(itempk.url), scale: 0.05),
              ),
            ),
            Text(itempk.name),
          ],
        ),
      ));
    }
    return api;
  }
}
