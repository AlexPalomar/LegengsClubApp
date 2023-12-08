import 'dart:async';

import 'package:applegendsclub/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:applegendsclub/model/user.dart';
import 'package:applegendsclub/services/conexionApiService.dart';
import 'package:applegendsclub/views/logued.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  late TextEditingController controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  User user = User();
  ConexionApiService conexionApiService = ConexionApiService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = MediaQuery.of(context).size.width*0.40;

    const textStyle = TextStyle(
          fontFamily: "Montserrat Regular",
          fontSize: 20,
          color: Colors.white);

    const alertTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 18,
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 62, 66, 64),
        automaticallyImplyLeading: false,
        // title: const Text(
        //   'Legend Club',
        //   style: textStyle
        //   ),
        actions: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  }, 
                  child: const Icon(Icons.arrow_back_ios_new),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
                  ),
                Text('signup',
                  style: textStyle,
                ),
              ],
            ),
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(60,30,60,30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: alertTextStyle,
                          autofocus: true,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(labelText: 'Nombre'),
                          maxLines: 1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nombre es Requerido';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            user.setFirstname(value);
                          },
                        ),
                        TextFormField(
                          style: alertTextStyle,
                          autofocus: true,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(labelText: 'Apellidos'),
                          maxLines: 1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Apellido es Requerido';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            user.setLastname(value);
                          },
                        ),
                        TextFormField(
                          style: alertTextStyle,
                          autofocus: true,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(labelText: 'Edad'),
                          maxLines: 1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Edad es Requerida';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            user.setAge(value);
                          },
                        ),
                        TextFormField(
                          style: alertTextStyle,
                          autofocus: true,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(labelText: 'Telefono'),
                          maxLines: 1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Telefono es Requerida';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            user.setPhone(value);
                          },
                        ),
                        TextFormField(
                          style: alertTextStyle,
                          autofocus: true,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(labelText: 'Correo'),
                          maxLines: 1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Correo es Requerido';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            user.setEmail(value);
                          },
                        ),
                        TextFormField(
                          style: alertTextStyle,
                          autofocus: true,
                          obscureText: true,
                          enableSuggestions: false,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(labelText: 'Contraseña'),
                          maxLines: 1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Contraseña es Requerida';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            user.setPassword(value);
                          },
                        ),
                        TextFormField(
                          style: alertTextStyle,
                          autofocus: true,
                          obscureText: true,
                          enableSuggestions: false,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(labelText: 'Confirmar Contraseña'),
                          maxLines: 1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Contraseña es Requerida';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            user.setConfirmPassword(value);
                          },
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0,30,0,0),
                            child: SizedBox(
                              width: size.width,
                              height: 50,
                              child: TextButton(
                                onHover: (value){
                                  if(value){
                                    DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(63, 63, 63, 1)
                                    ),
                                  );
                                  }
                                },
                                child: Text('registar',
                                  style: TextStyle(
                                    fontFamily: "Montserrat Regular", 
                                    color: Colors.white,
                                    fontSize:16)
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(63, 63, 63, 1)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Color.fromRGBO(63, 63, 63, 1))
                                    )
                                )),
                                onPressed: ()async{
                                  if (!_formKey.currentState!.validate()) {
                                    SnackBar(content: Text(
                                      style: TextStyle(color: Colors.green),
                                      'Usuario guardado exitosamente'),
                                      backgroundColor: Color.fromARGB(255, 248, 245, 245),
                                    );
                                    return;
                                  }else{
                                    _formKey.currentState!.save(); // guarda el estado del formulario
                                    conexionApiService.setSignup(
                                      user.getFirstname(),
                                      user.getLastname(),
                                      int.parse(user.getAge()),
                                      int.parse(user.getPhone()),
                                      user.getEmail(),
                                      user.getPassword()
                                    );
                                    showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: Color.fromRGBO(63, 63, 63, 1),
                                        ),
                                      );
                                    });
                                    Timer(Duration(seconds: 2), () {
                                        Navigator.of(context).pop();

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Signin()
                                            )
                                          );
                                        showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return Center(
                                            child: Text('Registrado exitosamente', style:alertTextStyle)
                                          );
                                        });
                                      });
                                    _formKey.currentState?.reset(); // resetea el formulario
                                  }    
                                }, 
                              ),
                            ),
                          ),
                      ],
                    )
                  ),
                ),
              ),                                      
            ]
          )
        ),
      ),
    );
  
  }
}