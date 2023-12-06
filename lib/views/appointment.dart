import 'package:flutter/material.dart';

import '../model/user.dart';
import '../services/conexionApiService.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();

}

class _AppointmentState extends State<Appointment> {

  late TextEditingController controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  User user = User();
  ConexionApiService conexionApiService = ConexionApiService();

  // List<Map<String, dynamic>> _artist = [];
  List<Map<String, dynamic>> _foundUsers = [];
  Map<String, dynamic> _foundUsersAll = {};
  List _artist = [];


  @override
  void initState() {
    
    conexionApiService.getUsers().then((resp){
      // _foundUsers = resp;
      _foundUsersAll = resp;
      _artist = _foundUsersAll['user'].reversed.toList();
      debugPrint("este ${_artist.toString()}");

    });
    // TODO: implement initState

    super.initState();
  }

  void _update() {
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = MediaQuery.of(context).size.width*0.40;

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
      fontFamily: "Montserrat Regular",
      fontSize: 14,
      color: Colors.white);

    const textStyleWhiteBold = TextStyle(
      fontFamily: "Montserrat Regular",
      fontSize: 14,
      fontWeight: FontWeight.w900,
      color: Colors.white);

    const textStyleBlack = const TextStyle(
      fontFamily: "Montserrat Regular",
      fontSize: 16,
      color: Colors.black);

    const alertTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 18,
        color: Color.fromRGBO(63, 63, 63, 1));

    const textStyle = TextStyle(
          fontFamily: "Montserrat Regular",
          fontSize: 20,
          color: Colors.white);

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
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
                  child: const Icon(Icons.arrow_back_ios_new),
                ),
                const Text('Agendamiento Cita',
                  style: textStyle,
                ),
                TextButton(
                  clipBehavior: Clip.none,
                  onPressed: (){},
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
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
          height: MediaQuery.of(context).size.height*0.90,
          child: Padding(
            padding: const EdgeInsets.all(12),
              child: StreamBuilder(
                stream: getData(), // Aquí es donde obtienes tu stream de datos
                builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
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
                        conexionApiService.getUsers().then((resp){
                        // _foundUsers = resp;
                        _foundUsersAll = resp;
                        
                        setState(() {
                          _artist = _foundUsersAll['user'].reversed.toList();
                        });

                      });
                      },
                      child: ListView.builder(
                        itemCount: _artist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: (){
                              debugPrint('entra ${index}');
                            },
                            splashColor: Color.fromARGB(255, 124, 130, 133),
                            child: Column(
                              children: [
                                Stack(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24.0)),
                                      elevation: 4,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(255, 89, 95, 92),
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: <Color>[
                                              Color.fromARGB(255, 65, 64, 62),
                                              Color.fromARGB(255, 124, 130, 133),
                                            ],
                                          ),
                                        ),
                                        width: MediaQuery.of(context).size.width,
                                        height: 150,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(20))
                                                ),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      // child: Image.asset(
                                                      //   'assets/images/service-${index+1}.png',
                                                      //   // fit: BoxFit.cover,
                                                      //   ),
                                                      child: Image.network(
                                                        'https://reqres.in/img/faces/${index+1}-image.jpg',
                                                        // fit: BoxFit.cover,
                                                        ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(_artist.isEmpty ? 'without data': _artist[index]['firstnameUser']+' '+_artist[index]['lastnameUser'],
                                                  style: const TextStyle(
                                                    fontFamily: "Montserrat Regular",
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.white
                                                  )
                                                ),
                                                Row(
                                                  children: [
                                                    const Text('Estilo: ', style: textStyleWhiteBold),
                                                    Text(_artist.isEmpty ? '': _artist[index]['stileTattoArtist'], style:textStyleWhite),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Text('Experiencia: ', style: textStyleWhiteBold),
                                                    Text(_artist.isEmpty ? '': _artist[index]['experienceArtist'], style:textStyleWhite),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Text('País: ', style: textStyleWhiteBold),
                                                    Text(_artist.isEmpty ? '': _artist[index]['nationalityArtist'], style:textStyleWhite),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Text('Telefono: ', style: textStyleWhiteBold),
                                                    Text(_artist.isEmpty ? '': _artist[index]['phoneUser'], style:textStyleWhite),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      
                                    ),
                                  ]
                                )
                              ]
                            ),
                          );
                        },
                      )
                    );
                  }
                },
              ),
              
              
              // Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [

              //       // Expanded(
              //       //   child: GridView.count(
              //       //     crossAxisCount: 3,
              //       //     mainAxisSpacing: 10,
              //       //     crossAxisSpacing: 10,
              //       //     primary: false,
              //       //     children: [
              //       //       Card(
              //       //         shape: RoundedRectangleBorder(
              //       //             borderRadius: BorderRadius.circular(8)),
              //       //         elevation: 4,
              //       //         child: InkWell(
              //       //           onTap: () => {
              //       //             // countTap = 0,
              //       //             // _update()
              //       //             // Navigator.of(context).push(
              //       //             // new MaterialPageRoute(
              //       //             //   builder: (BuildContext context) =>
              //       //             //       ManagerRt()
              //       //             //       )
              //       //           // )
              //       //           },
              //       //           splashColor: const Color.fromARGB(255, 131, 128, 128),
              //       //           child: Stack(
              //       //             fit: StackFit.expand,
              //       //             children: [
              //       //               Padding(
              //       //                 padding: const EdgeInsets.all(5.0),
              //       //                 child: Image.asset(
              //       //                   'assets/images/service-1.png',
              //       //                   fit: BoxFit.cover,
              //       //                   width: MediaQuery.of(context).size.width,
              //       //                   ),
              //       //               ),
              //       //               const Column(
              //       //                 mainAxisAlignment: MainAxisAlignment.end,
              //       //                 crossAxisAlignment: CrossAxisAlignment.center,
              //       //                 children: <Widget>[
              //       //                   Padding(
              //       //                     padding: EdgeInsets.fromLTRB(0,0,0,5),
              //       //                     child: Text(
              //       //                       ' Jhon Doe ',
              //       //                       style: textStyleWhiteBlack,
              //       //                     ),
              //       //                   ),
              //       //                 ],
              //       //               ),
              //       //             ]
              //       //           ),
              //       //         ),
              //       //       ),
              //       //       Card(
              //       //         shape: RoundedRectangleBorder(
              //       //             borderRadius: BorderRadius.circular(8)),
              //       //         elevation: 4,
              //       //         child: InkWell(
              //       //           onTap: () => {
              //       //             countTap = 1,
              //       //             _update()
              //       //             // Navigator.of(context).push(
              //       //             // new MaterialPageRoute(
              //       //             //   builder: (BuildContext context) =>
              //       //             //       ManagerRt()
              //       //             //       )
              //       //           // )
              //       //           },
              //       //           splashColor: const Color.fromARGB(255, 131, 128, 128),
              //       //           child: Stack(
              //       //             fit: StackFit.expand,
              //       //             children: [
              //       //               Padding(
              //       //                 padding: const EdgeInsets.all(5.0),
              //       //                 child: Image.asset(
              //       //                   'assets/images/service-2.png',
              //       //                   fit: BoxFit.cover,
              //       //                   width: MediaQuery.of(context).size.width,
              //       //                   ),
              //       //               ),
              //       //               const Column(
              //       //                 mainAxisAlignment: MainAxisAlignment.end,
              //       //                 crossAxisAlignment: CrossAxisAlignment.center,
              //       //                 children: <Widget>[
              //       //                   Padding(
              //       //                     padding: EdgeInsets.fromLTRB(0,0,0,5),
              //       //                     child: Text(
              //       //                       ' Caroline ',
              //       //                       style: textStyleWhiteBlack,
              //       //                     ),
              //       //                   ),
              //       //                 ],
              //       //               ),
              //       //             ]
              //       //           ),
              //       //         ),
              //       //       ),
              //       //       Card(
              //       //         shape: RoundedRectangleBorder(
              //       //             borderRadius: BorderRadius.circular(8)),
              //       //         elevation: 4,
              //       //         child: InkWell(
              //       //           onTap: () => {
              //       //             countTap = 2,
              //       //             _update()
              //       //             // Navigator.of(context).push(
              //       //             // new MaterialPageRoute(
              //       //             //   builder: (BuildContext context) =>
              //       //             //       ManagerRt()
              //       //             //       )
              //       //           // )
              //       //           },
              //       //           splashColor: const Color.fromARGB(255, 131, 128, 128),
              //       //           child: Stack(
              //       //             fit: StackFit.expand,
              //       //             children: [
              //       //               Padding(
              //       //                 padding: const EdgeInsets.all(5.0),
              //       //                 child: Image.asset(
              //       //                   'assets/images/service-3.png',
              //       //                   fit: BoxFit.cover,
              //       //                   width: MediaQuery.of(context).size.width,
              //       //                   ),
              //       //               ),
              //       //               const Column(
              //       //                 mainAxisAlignment: MainAxisAlignment.end,
              //       //                 crossAxisAlignment: CrossAxisAlignment.center,
              //       //                 children: <Widget>[
              //       //                   Padding(
              //       //                     padding: EdgeInsets.fromLTRB(0,0,0,5),
              //       //                     child: Text(
              //       //                       ' Hamir ',
              //       //                       style: textStyleWhiteBlack,
              //       //                     ),
              //       //                   ),
              //       //                 ],
              //       //               ),
              //       //             ]
              //       //           ),
              //       //         ),
              //       //       ),
              //       //       Card(
              //       //         shape: RoundedRectangleBorder(
              //       //             borderRadius: BorderRadius.circular(8)),
              //       //         elevation: 4,
              //       //         child: InkWell(
              //       //           onTap: () => {
              //       //             countTap = 3,
              //       //             _update()
              //       //             // Navigator.of(context).push(
              //       //             // new MaterialPageRoute(
              //       //             //   builder: (BuildContext context) =>
              //       //             //       ManagerRt()
              //       //             //       )
              //       //           // )
              //       //           },
              //       //           splashColor: const Color.fromARGB(255, 131, 128, 128),
              //       //           child: Stack(
              //       //             fit: StackFit.expand,
              //       //             children: [
              //       //               Padding(
              //       //                 padding: const EdgeInsets.all(5.0),
              //       //                 child: Image.asset(
              //       //                   'assets/images/service-4.png',
              //       //                   fit: BoxFit.cover,
              //       //                   width: MediaQuery.of(context).size.width,
              //       //                   ),
              //       //               ),
              //       //               const Column(
              //       //                 mainAxisAlignment: MainAxisAlignment.end,
              //       //                 crossAxisAlignment: CrossAxisAlignment.center,
              //       //                 children: <Widget>[
              //       //                   Padding(
              //       //                     padding: EdgeInsets.fromLTRB(0,0,0,5),
              //       //                     child: Text(
              //       //                       ' Lara Croff ',
              //       //                       style: textStyleWhiteBlack,
              //       //                     ),
              //       //                   ),
              //       //                 ],
              //       //               ),
              //       //             ]
              //       //           ),
              //       //         ),
              //       //       ),
              //       //       Card(
              //       //         shape: RoundedRectangleBorder(
              //       //             borderRadius: BorderRadius.circular(8)),
              //       //         elevation: 4,
              //       //         child: InkWell(
              //       //           onTap: () => {
              //       //             countTap = 4,
              //       //             _update()
              //       //             // Navigator.of(context).push(
              //       //             // new MaterialPageRoute(
              //       //             //   builder: (BuildContext context) =>
              //       //             //       ManagerRt()
              //       //             //       )
              //       //           // )
              //       //           },
              //       //           splashColor: const Color.fromARGB(255, 131, 128, 128),
              //       //           child: Stack(
              //       //             fit: StackFit.expand,
              //       //             children: [
              //       //               Padding(
              //       //                 padding: const EdgeInsets.all(5.0),
              //       //                 child: Image.asset(
              //       //                   'assets/images/service-1.png',
              //       //                   fit: BoxFit.cover,
              //       //                   width: MediaQuery.of(context).size.width,
              //       //                   ),
              //       //               ),
              //       //               const Column(
              //       //                 mainAxisAlignment: MainAxisAlignment.end,
              //       //                 crossAxisAlignment: CrossAxisAlignment.center,
              //       //                 children: <Widget>[
              //       //                   Padding(
              //       //                     padding: EdgeInsets.fromLTRB(0,0,0,5),
              //       //                     child: Text(
              //       //                       ' Jason ',
              //       //                       style: textStyleWhiteBlack,
              //       //                     ),
              //       //                   ),
              //       //                 ],
              //       //               ),
              //       //             ]
              //       //           ),
              //       //         ),
              //       //       ),
              //       //       Card(
              //       //         shape: RoundedRectangleBorder(
              //       //             borderRadius: BorderRadius.circular(8)),
              //       //         elevation: 4,
              //       //         child: InkWell(
              //       //           onTap: () => {
              //       //             countTap = 5,
              //       //             _update()
              //       //             // Navigator.of(context).push(
              //       //             // new MaterialPageRoute(
              //       //             //   builder: (BuildContext context) =>
              //       //             //       ManagerRt()
              //       //             //       )
              //       //           // )
              //       //           },
              //       //           splashColor: const Color.fromARGB(255, 131, 128, 128),
              //       //           child: Stack(
              //       //             fit: StackFit.expand,
              //       //             children: [
              //       //               Padding(
              //       //                 padding: const EdgeInsets.all(5.0),
              //       //                 child: Image.asset(
              //       //                   'assets/images/service-4.png',
              //       //                   fit: BoxFit.cover,
              //       //                   width: MediaQuery.of(context).size.width,
              //       //                   ),
              //       //               ),
              //       //               const Column(
              //       //                 mainAxisAlignment: MainAxisAlignment.end,
              //       //                 crossAxisAlignment: CrossAxisAlignment.center,
              //       //                 children: <Widget>[
              //       //                   Padding(
              //       //                     padding: EdgeInsets.fromLTRB(0,0,0,5),
              //       //                     child: Text(
              //       //                       ' Jeffer Vega ',
              //       //                       style: textStyleWhiteBlack,
              //       //                     ),
              //       //                   ),
              //       //                 ],
              //       //               ),
              //       //             ]
              //       //           ),
              //       //         ),
              //       //       ),
              //       //     ],
              //       //   )
              //       // ),
                    
              //       Column(
              //         children: [
              //           Container(
              //             width: 400,
              //             height: 250,
              //             decoration: const BoxDecoration(
              //               color: Color.fromARGB(255, 89, 95, 92),
              //               borderRadius: BorderRadius.all(Radius.circular(10)),
              //               gradient: LinearGradient(
              //                 begin: Alignment.topCenter,
              //                 end: Alignment.bottomCenter,
              //                 colors: <Color>[
              //                   Color.fromARGB(255, 65, 64, 62),
              //                   Color.fromARGB(255, 124, 130, 133),
              //                 ],
              //               ),
              //             ),
              //             child: Column(
              //                 children:[
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       Padding(
              //                         padding: const EdgeInsets.fromLTRB(10,10,10,5),
              //                             child: Card(
              //                               shape: RoundedRectangleBorder(
              //                               borderRadius: BorderRadius.circular(23.0)),
              //                               elevation: 4,
              //                               child: Padding(
              //                                 padding: const EdgeInsets.all(1.0),
              //                                 child: ClipRRect(
              //                                   borderRadius: BorderRadius.circular(24.0),
              //                                     child: Image.asset(
              //                                       'assets/images/team-1.jpg',
              //                                       fit: BoxFit.cover,
              //                                       width: 150,
              //                                       height: 150,
              //                                       ),
              //                                 ),
              //                               ),
              //                             ),
              //                       ),
              //                       Column(
              //                         mainAxisAlignment: MainAxisAlignment.center,
              //                         crossAxisAlignment: CrossAxisAlignment.start,
              //                         children: [
              //                           Text(_artist.length == countTap ? 'without data': _artist[countTap]['firstname'],
              //                             style: const TextStyle(
              //                               fontFamily: "Montserrat Regular",
              //                               fontSize: 22,
              //                               fontWeight: FontWeight.w900,
              //                               color: Colors.white
              //                             )
              //                           ),
              //                           Row(
              //                             children: [
              //                               const Text('Estilo: ', style: textStyleWhiteBold),
              //                               Text(_artist.length == countTap ? '': _artist[countTap]['estyle'], style:textStyleWhite),
              //                             ],
              //                           ),
              //                           Row(
              //                             children: [
              //                               const Text('Experiencia: ', style: textStyleWhiteBold),
              //                               Text(_artist.length == countTap ? '': _artist[countTap]['experienceage'], style:textStyleWhite),
              //                             ],
              //                           ),
              //                         ],
              //                       ),
              //                     ]
              //                   ),
              //                   Padding(
              //                     padding: const EdgeInsets.all(10),
              //                     child: SizedBox(
              //                       width: 300,
              //                       height: 50,
              //                       child: Column(
              //                         children: [
              //                           // const Expanded(child:  Text('Description: ', style: textStyleWhiteBold)),
              //                           Expanded(child: Text(_artist.length == countTap ? '': _artist[countTap]['description'],maxLines: 4, style:textStyleWhite)),
                                  
              //                         ],
              //                       ),
              //                     ),
              //                   ),
              //                 ]
              //               ),

              //           ),
              //         ]
              //       ),
              //       ElevatedButton(
              //         onPressed: (){
              //           // Navigator.of(context).push(
              //           // MaterialPageRoute(
              //           //   builder: (BuildContext context) =>
              //           //       Appointment())
              //           //   );
              //         },
              //         style: ButtonStyle(
              //           backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(63, 63, 63, 1)),
              //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //             RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(5),
              //               side: const BorderSide(color: Color.fromRGBO(63, 63, 63, 1))
              //             )
              //         )),
              //         child: const Text('Agendar Cita', style: textStyleWhite)
              //       ),
                  
              //     ]
              //   ),
          ),
        ),
      ),
    );
  }
}