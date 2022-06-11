import 'package:flutter/material.dart';
import 'package:apipelisetps3/main.dart';
import 'package:apipelisetps3/Pantallas/Menu.dart';
import 'package:apipelisetps3/Pantallas/Registro.dart';






class Principal extends StatefulWidget {
  Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

TextEditingController passcontroller = TextEditingController();
TextEditingController usercontroller = TextEditingController();

final _formKey = GlobalKey<FormState>();
final _formKey2 = GlobalKey<FormState>();

FocusNode f1 = FocusNode();

bool erroLogin = false;

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondo.jpg'),
          fit: BoxFit.cover
          ),
      ),
      child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Login(),
    )
  );
  }

  Widget Login() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Usuario(),
        Password(),
        SizedBox(
          height: 10,
        ),
        botones()
      ],
    );
  }

  Widget Usuario() {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: TextFormField(
          autofocus: true,
          autocorrect: true,
          focusNode: f1,
          decoration: InputDecoration(
            hintText: "Usuario",
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            prefixIcon: const Icon(Icons.person),
          ),
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Campo vacio';
            } else {
              return null;
            }
          },
          controller: usercontroller,
        ),
      ),
    );
  }

  Widget Password() {
    return Form(
      key: _formKey2,
      child: Container(
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
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Campo vacio';
            } else {
              return null;
            }
          },
          controller: passcontroller,
        ),
      ),
    );
  }

  Widget botones() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[botonAceptar(context), botonRegistrarse()],
    );
  }

  Widget botonAceptar(contex) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {}
          if (_formKey2.currentState!.validate()) {}

          for (var i = 0; i < usuarios.length; i++) {
            if (usercontroller.text == usuarios[i]['usuario'] &&
                passcontroller.text == usuarios[i]['password']) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Menu()));
              usercontroller.text = "";
              passcontroller.text = "";
            } else {
              erroLogin = true;
            }
          }

          if (erroLogin) {
            if (usercontroller.text.isNotEmpty &&
                passcontroller.text.isNotEmpty) {
              _mostrarAlerta(context);
            }
          }
        },
        child: const Text("Ingresar"),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.blue,
          shadowColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
          side: BorderSide(color: Colors.blue, width: 1),
          shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }

  Widget botonRegistrarse() {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Registro()));
          },
          child: const Text("Registrarse"),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.green,
            shadowColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
            side: BorderSide(color: Colors.green, width: 1),
            shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          )),
    );
  }

  Future<void> _mostrarAlerta(BuildContext context) async {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) => _buildAlertDialog(context),
    );
  }

  Widget _buildAlertDialog(context) {
    return AlertDialog(
      title: const Text("Error inicio sesion"),
      content: const Text("Usuario y/o Contraseña Incorrectos"),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Aceptar"),
          style: ElevatedButton.styleFrom(primary: Colors.blue),
        )
      ],
    );
  }
}
