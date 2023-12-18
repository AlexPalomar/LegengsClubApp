import 'package:applegendsclub/util/session.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ProfileUser extends StatefulWidget {
  final userSession;
  const ProfileUser(this.userSession, {super.key});
  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  Session session = Session();
  bool logueed = false;
  List<String> userLoguedd = [];

  @override
  void initState() {
    userLoguedd = widget.userSession;
    if (userLoguedd == null) {
      debugPrint(userLoguedd.toString());
    }
    session.isSessionActive().then((resp) => {logueed = resp});
    session.getSessionUser().then((resp) => {userLoguedd = resp});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontFamily: "Montserrat Regular", fontSize: 20, color: Colors.white);

    var allWidth = MediaQuery.of(context).size.width;
    const textStyleAppbar = TextStyle(
        fontFamily: "Montserrat Regular", fontSize: 20, color: Colors.white);

    const textStyleWhite = TextStyle(
      fontFamily: "Montserrat Regular",
      fontSize: 16,
      color: Colors.white,
    );

    const textStyleBold20 = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 26,
        fontWeight: FontWeight.w900,
        color: Colors.black);

    const textStyleBold = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        fontWeight: FontWeight.w900,
        color: Colors.black);

    const textStyle14 = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 12,
        fontWeight: FontWeight.w900,
        color: Colors.black);

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
                      // Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                    },
                    child: const Icon(Icons.arrow_back_ios_new),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                  ),
                  Text(
                    'Perfil',
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
          width: allWidth,
          height: MediaQuery.of(context).size.height * 0.90,
          child: Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(1, 0, 5, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: allWidth,
                          height: 240,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.elliptical(10, 10),
                              bottomRight: Radius.elliptical(10, 10),
                            ),
                            image: DecorationImage(
                              // image: Image.asset(
                              //   'assets/images/service-${index+1}.png',
                              //   // fit: BoxFit.cover,
                              //   ),
                              image: NetworkImage(
                                  'https://reqres.in/img/faces/1-image.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userLoguedd.isEmpty
                          ? ''
                          : userLoguedd[2] + ' ' + userLoguedd[3],
                      style: textStyleBold20,
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      const Text('Identificación: ',
                                          style: textStyleBold),
                                      Text(
                                          userLoguedd.isEmpty
                                              ? ''
                                              : userLoguedd[1].toString(),
                                          style: textStyle14),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Nombre: ',
                                          style: textStyleBold),
                                      Text(
                                          userLoguedd.isEmpty
                                              ? ''
                                              : userLoguedd[2].toString(),
                                          style: textStyle14),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Edad: ',
                                          style: textStyleBold),
                                      Text(
                                          userLoguedd.isEmpty
                                              ? ''
                                              : userLoguedd[4].toString(),
                                          style: textStyle14),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('Telefono: ',
                                        style: textStyleBold),
                                    Text(
                                        userLoguedd.isEmpty
                                            ? ''
                                            : userLoguedd[5].toString(),
                                        style: textStyle14),
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text('Correo: ', style: textStyleBold),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      userLoguedd.isEmpty
                                          ? ''
                                          : userLoguedd[6].toString(),
                                      style: textStyle14,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
                const Column(
                  children: [
                    // Otros widgets...
                    Divider(
                      thickness: 2, // Grosor del separador
                      color: Colors.grey, // Color del separador
                      indent: 20, // Espaciado a la izquierda del separador
                      endIndent: 20, // Espaciado a la derecha del separador
                    ),
                    // Otros widgets...
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).push(
                      // MaterialPageRoute(
                      //   builder: (BuildContext context) =>
                      //       Appointment())
                      //   );
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(63, 63, 63, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: const BorderSide(
                                        color:
                                            Color.fromRGBO(63, 63, 63, 1))))),
                    child: const Text('ver disponibilidad',
                        style: textStyleWhite)),
              ])
            ],
          ),
        )));
  }
}
