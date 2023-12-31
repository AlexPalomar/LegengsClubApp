import 'dart:async';

import 'package:applegendsclub/views/detailArtist.dart';
import 'package:applegendsclub/views/signin.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';
import '../services/conexionApiService.dart';
import '../util/session.dart';

class Appointment extends StatefulWidget {
  // final Map<String, dynamic> userlogeed;
  // const Appointment(this.userlogeed, {super.key});
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  late TextEditingController controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Session session = Session();
  User user = User();
  ConexionApiService conexionApiService = ConexionApiService();
  List<dynamic> _artist = [];

  @override
  void initState() {
    session.isSessionActive().then((resp) => {});

    // debugPrint("logeed ${this.widget.userlogeed.toString()}");
    conexionApiService.getArtist().then((resp) {
      // debugPrint(resp.toString());
      _artist = resp.reversed.toList();
    });
    // TODO: implement initState

    super.initState();
  }

  void _update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = MediaQuery.of(context).size.width * 0.40;

    // Simulación de un Stream que devuelve datos (en este caso, una lista de Strings)
    Stream<List<String>> getData() async* {
      // Supongamos que aquí estás obteniendo los datos de una fuente asíncrona
      // Por ejemplo, una llamada a una API o una operación asíncrona.

      // Simulando la espera de datos (aquí se simula una carga asíncrona)
      await Future.delayed(Duration(seconds: 2));

      // Datos de ejemplo (lista de Strings)
      yield ['Elemento 1', 'Elemento 2', 'Elemento 3', 'Elemento 4'];
    }

    // style
    const cardTextStyle = TextStyle(
      fontFamily: "Montserrat Regular",
      fontSize: 16,
      color: Colors.white,
    );

    const textStyleWhiteBlack = TextStyle(
      fontFamily: "Montserrat Regular",
      fontSize: 16,
      fontWeight: FontWeight.w900,
      color: Colors.white,
      backgroundColor: Colors.black,
      // backgroundColor: Color.fromRGBO(63, 63, 63, 0.623),
    );

    const textStyleWhite = TextStyle(
        fontFamily: "Montserrat Regular", fontSize: 14, color: Colors.white);

    const textStyleWhiteBold = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        fontWeight: FontWeight.w900,
        color: Colors.white);

    const textStyleBlack = const TextStyle(
        fontFamily: "Montserrat Regular", fontSize: 16, color: Colors.black);

    const alertTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 18,
        color: Color.fromRGBO(63, 63, 63, 1));

    const textStyle = TextStyle(
        fontFamily: "Montserrat Regular", fontSize: 20, color: Colors.white);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 62, 66, 64),
        automaticallyImplyLeading: false,
        actions: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: const Icon(Icons.arrow_back_ios_new),
                ),
                const Text(
                  'Artistas Disponibles',
                  style: textStyle,
                ),
                TextButton(
                  clipBehavior: Clip.none,
                  onPressed: () {},
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: const Icon(Icons.assignment_add),
                )
              ],
            ),
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.90,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: StreamBuilder(
              stream: getData(), // Aquí es donde obtienes tu stream de datos
              builder:
                  (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return RefreshIndicator(
                      color: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 62, 66, 64),
                      strokeWidth: 4.0,
                      onRefresh: () async {
                        conexionApiService.getArtist().then((resp) {
                          _artist = resp;
                          // debugPrint(_artist.toString());

                          setState(() {
                            _artist = resp.reversed.toList();
                          });
                        });
                      },
                      child: ListView.builder(
                        itemCount: _artist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DetailArtist(_artist[index], index)));
                              debugPrint('entra ${index}');
                            },
                            splashColor: Color.fromARGB(255, 124, 130, 133),
                            child: Column(children: [
                              Stack(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24.0)),
                                      elevation: 4,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 89, 95, 92),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: <Color>[
                                              Color.fromARGB(255, 65, 64, 62),
                                              Color.fromARGB(
                                                  255, 124, 130, 133),
                                            ],
                                          ),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      // child: Image.asset(
                                                      //   'assets/images/service-${index+1}.png',
                                                      //   // fit: BoxFit.cover,
                                                      //   ),
                                                      child: Image.network(
                                                        'https://reqres.in/img/faces/${index + 1}-image.jpg',
                                                        // fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    _artist.isEmpty
                                                        ? 'without data'
                                                        : _artist[index][
                                                                'idUser__firstnameUser'] +
                                                            ' ' +
                                                            _artist[index][
                                                                'idUser__lastnameUser'],
                                                    style: const TextStyle(
                                                        fontFamily:
                                                            "Montserrat Regular",
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Colors.white)),
                                                Row(
                                                  children: [
                                                    const Text('Estilo: ',
                                                        style:
                                                            textStyleWhiteBold),
                                                    Text(
                                                        _artist.isEmpty
                                                            ? ''
                                                            : _artist[index][
                                                                'stileTattoArtist'],
                                                        style: textStyleWhite),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Text('Experiencia: ',
                                                        style:
                                                            textStyleWhiteBold),
                                                    Text(
                                                        _artist.isEmpty
                                                            ? ''
                                                            : _artist[index][
                                                                'experienceArtist'],
                                                        style: textStyleWhite),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Text('País: ',
                                                        style:
                                                            textStyleWhiteBold),
                                                    Text(
                                                        _artist.isEmpty
                                                            ? ''
                                                            : _artist[index][
                                                                'nationalityArtist'],
                                                        style: textStyleWhite),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Text('Telefono: ',
                                                        style:
                                                            textStyleWhiteBold),
                                                    Text(
                                                        _artist.isEmpty
                                                            ? ''
                                                            : _artist[index][
                                                                'idUser__phoneUser'],
                                                        style: textStyleWhite),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ])
                            ]),
                          );
                        },
                      ));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
