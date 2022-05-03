import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(FireBaseFlutter());
}

class FireBaseFlutter extends StatelessWidget {
  const FireBaseFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

 @override
void initState() {
  //super.initState();
  
}

void getCapitanes() async {
   CollectionReference collectionReference=
   FirebaseFirestore.instance.collection('Capitanes');
  QuerySnapshot Capitanes= await collectionReference.get();
  if (Capitanes.docs.length != 0) {
    for (var doc in Capitanes.docs) {
      print(doc.data());
    }
    
  }

  
} 

class AppFlutt extends StatefulWidget {
  AppFlutt({Key? key}) : super(key: key);

  @override
  State<AppFlutt> createState() => _AppFluttState();
}

class _AppFluttState extends State<AppFlutt> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}