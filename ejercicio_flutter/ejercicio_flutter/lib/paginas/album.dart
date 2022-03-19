import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ejercicio_flutter/paginas/home.dart';
import 'package:ejercicio_flutter/constante/const.dart';

class album extends StatefulWidget {
  final dynamic song;

  const album({Key? key, this.song}) : super(key: key);

  get descip => null;

  @override
  State<album> createState() => _albumState();
}

class _albumState extends State<album> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Card(),
    );
  }
   Widget Card () {
    List songAlbum = widget.song['descripcion'];
    var descip;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Container(
                width: 100,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: AssetImage(widget.song['img']),
                        fit: BoxFit.scaleDown)),
              ),
              SizedBox(
                height: 9,
              ),
              Container (
                child: Padding(padding:EdgeInsets.only(right: 15, left: 15),
                child: Container(
                  child: Text(widget.descip['description'],
                  style: TextStyle(
                    color: Color.fromARGB(255, 59, 36, 99),
                    fontSize:18,
                    fontWeight: FontWeight.w600
                  ),),
                )
                ),
              ),
          ],
          );


   }

            

