import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:apipelisetps3/Pantallas/Principal.dart';


void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(MyAppMovies());
}

 
class MyAppMovies extends StatefulWidget {
  MyAppMovies({Key? key}) : super(key: key);

  @override
  State<MyAppMovies> createState() => _MyAppMoviesState();
}


List usuarios = [];


class _MyAppMoviesState extends State<MyAppMovies> {

 @override
 void initState() {
    super.initState();
    getUsuarios();
  }
  void getUsuarios() async {  
   CollectionReference collectionReference =
     FirebaseFirestore.instance.collection("usuarios");

    QuerySnapshot users= await collectionReference.get();

    if (users.docs.length != 0) {  
      for (var doc in users.docs){
        print(doc.data());
        usuarios.add(doc.data());
     }
    }

  }
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Principal(),
    );
  }
}


