import 'dart:async';

import 'package:applegendsclub/views/appointment.dart';
import 'package:applegendsclub/views/profileUser.dart';
import 'package:flutter/material.dart';
import 'package:applegendsclub/views/signup.dart';
import '../model/user.dart';
import '../services/conexionApiService.dart';
import 'package:applegendsclub/util/session.dart';
import 'package:toast/toast.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  User user = User();
  ConexionApiService conexionApiService = ConexionApiService();
  Session session = Session();
  List<String> userSession = [];
  late TextEditingController controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> userLoguedd = [];
  bool logueed = false;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    var size = MediaQuery.of(context).size;
    var width = MediaQuery.of(context).size.width * 0.40;

    const textStyle = TextStyle(
        fontFamily: "Montserrat Regular", fontSize: 20, color: Colors.white);

    const alertTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 18,
        color: Color.fromRGBO(63, 63, 63, 1));

    var cardTextStyle = TextStyle(
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
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Icon(Icons.arrow_back_ios_new),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                ),
                const Text(
                  'signin',
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
            child: Column(children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(60, 30, 60, 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Container(
                        height: size.height * .2,
                        //  --------  para poner logo en el login --------
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              scale: 0.5,
                              alignment: Alignment.center,
                              image: AssetImage('assets/images/icon.png')),
                        ),
                      ),
                    ),
                    const Text('Login',
                        style: TextStyle(
                            fontFamily: "Montserrat Regular",
                            fontSize: 30,
                            color: Color.fromRGBO(63, 63, 63, 1)),
                        textAlign: TextAlign.center),
                    TextFormField(
                      style: cardTextStyle,
                      autofocus: true,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(labelText: 'Correo'),
                      maxLines: 1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Correo es Requerida';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        user.setEmail(value);
                      },
                    ),
                    TextFormField(
                      style: cardTextStyle,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Column(
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('¿Olvidó la contraseña?',
                                      style: TextStyle(
                                          fontFamily: "Montserrat Regular",
                                          fontSize: 16,
                                          color: Color.fromRGBO(63, 63, 63, 1)),
                                      textAlign: TextAlign.center),
                                )
                              ]),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: SizedBox(
                        width: size.width,
                        height: 50,
                        child: TextButton(
                          onHover: (value) {
                            if (value) {
                              const DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(63, 63, 63, 1)),
                              );
                            }
                          },
                          child: const Text('iniciar sessión',
                              style: const TextStyle(
                                  fontFamily: "Montserrat Regular",
                                  color: Colors.white,
                                  fontSize: 18)),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(63, 63, 63, 1)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color:
                                              Color.fromRGBO(63, 63, 63, 1))))),
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: Color.fromRGBO(63, 63, 63, 1),
                                    ),
                                  );
                                });
                            _formKey.currentState!.save();
                            conexionApiService
                                .setLogin(user.getEmail().toString(),
                                    user.getPassword().toString())
                                .then((resp) => {
                                      // debugPrint(resp['user'].toString()),
                                      if (resp['user'] != null)
                                        {
                                          Timer(const Duration(seconds: 2), () {
                                            Navigator.of(context).pop();
                                            userSession = [
                                              resp['user']['emailUser'],
                                              resp['user']
                                                  ['identificationUser'],
                                              resp['user']['firstnameUser'],
                                              resp['user']['lastnameUser'],
                                              resp['user']['ageUser'],
                                              resp['user']['phoneUser'],
                                              resp['user']['artistUser']
                                            ];
                                            setState(() {
                                              logueed = true;
                                              userLoguedd = userSession;
                                            });
                                            //registra los datos del usuario logueado
                                            session.saveSession(userSession);
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        ProfileUser(
                                                            userSession)));
                                          })
                                        }
                                      else
                                        {
                                          Navigator.of(context).pop(),
                                          Toast.show("credenciales incorrectas",
                                              duration: Toast.lengthShort,
                                              gravity: Toast.bottom),
                                        }
                                    });
                            _formKey.currentState?.reset();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.70,
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
                            child: Text('Nuevo usuario?',
                                style: TextStyle(
                                    fontFamily: "Montserrat Regular",
                                    fontSize: 18,
                                    color: Colors.black),
                                textAlign: TextAlign.center),
                          ),
                          TextButton(
                            onPressed: () {
                              _formKey.currentState!.save();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          signup()));
                            },
                            child: const Text('registrarse',
                                style: TextStyle(
                                    fontFamily: "Montserrat Regular",
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 62, 66, 64)),
                                textAlign: TextAlign.center),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ])),
      ),
    );
  }
}
