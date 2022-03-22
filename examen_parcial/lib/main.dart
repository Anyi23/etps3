import 'package:examen_parcial/paginas/principal.dart';
import 'package:flutter/material.dart';
import 'package:examen_parcial/paginas/principal.dart';

void main() {
  runApp(MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrincipalApp(),
    );
  }
}
