import 'package:flutter/material.dart';

class SideBarWidget extends StatelessWidget{  
  
   @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child:Column(
              children: [
                Image.asset('assets/images/logo.jpg')]
              ),
              
              ),
        ],
      ),
    ) ;
  }
}