import 'package:flutter/material.dart';
import '../Widgets/side_bar_widget.dart';


class Registro extends StatefulWidget {
  Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {

final controller = TextEditingController();


  // @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondo5.jpg'),
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
            "Nuevo registro",
            style: TextStyle(color: Colors.black),
          ),
          automaticallyImplyLeading: false,
          // flexibleSpace: mostrarAppBar(),
        ),
        drawer: SideBarWidget(),
        body: body(),
      ),
    );
  }

  Widget body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Usuario(),
          Correo(),
          Password(),
          Nombre(),
          Apellido(),
          botones()
        ],
      ),
    );
  }

  Widget Usuario() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        autofocus: true,
        autocorrect: true,
        decoration: InputDecoration(
          hintText: "Usuario",
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  prefixIcon: const Icon(Icons.person),
        ),
      ),
    );
  }

  Widget Password() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          prefixIcon: const Icon(Icons.lock),
        ),
      ),
    );
  }

  Widget Correo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Correo",
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          prefixIcon: const Icon(
            Icons.email,
          ),
        ),
      ),
    );
  }

  Widget Nombre() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Nombre",
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          prefixIcon: const Icon(Icons.auto_stories_outlined),
        ),
      ),
    );
  }

  Widget Apellido() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Apellido",
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          prefixIcon: const Icon(Icons.auto_stories_outlined),
        ),
      ),
    );
  }

  Widget botones() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[botonRegistrar(), botonCancerlar()],
    );
  }

  Widget botonRegistrar() {
    return Container(
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Registrar"),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.green,
          shadowColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
          side: BorderSide(color: Colors.green, width: 1),
          shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }

  Widget botonCancerlar() {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancelar"),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.red,
            shadowColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
            side: BorderSide(color: Colors.red, width: 1),
            shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          )),
    );
  }
}
