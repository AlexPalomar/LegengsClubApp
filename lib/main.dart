import 'package:applegendsclub/views/detailStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:applegendsclub/util/assignIp.dart';
import 'package:applegendsclub/views/appointment.dart';
import 'package:applegendsclub/views/signin.dart';
import 'package:applegendsclub/views/signup.dart';

void main() async {
  
  runApp(
    const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      ), // use MaterialApp
  );
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  late TextEditingController controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AssignIp assignIp = AssignIp();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    
  }

  @override
  void dispose() {

    super.dispose();
  }

  Widget buildTheme(BuildContext context) {
    return MaterialApp(
      supportedLocales: const <Locale>[Locale('en', 'US')],
      theme: ThemeData(
        // Define the default brightness and colors.
        // brightness: Brightness.dark,
        brightness: Brightness.light,
        primaryColor: Colors.deepOrange,
        primarySwatch: Colors.deepOrange,
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = MediaQuery.of(context).size.width*0.40;
    // style
    const cardTextStyle = TextStyle(
      fontFamily: "Montserrat Regular",
      fontSize: 16,
      color: Colors.white, 
    );

    const textStyleWhite = TextStyle(
      fontFamily: "Montserrat Regular",
      fontSize: 16,
      color: Colors.white,
      backgroundColor: Color.fromRGBO(63, 63, 63, 0.623), 
    );

    const alertTextStyle = TextStyle(
      fontFamily: "Montserrat Regular",
      fontSize: 18,
      color: Color.fromRGBO(63, 63, 63, 1));


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 62, 66, 64),
            automaticallyImplyLeading: false,
            title: const Text(
              'Legend Club',
              style: TextStyle(
                fontFamily: "Montserrat Regular",
                fontSize: 20,
                color: Colors.white)
              ),
            actions: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
                    onPressed: () => {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                          const Signin())
                      )
                    },
                    child: const Text('signin'),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
                    onPressed: () => {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                            const signup())
                      )
                    },
                    child: const Text('signup'),
                  ),
                ],
              ),
            ],
            centerTitle: false,
            elevation: 2,
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //----- start section banner --------
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0.2,0,10),
                  child: Container(
                    child:SizedBox(
                      height: 100,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset('assets/images/bannerMain.png', 
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                            // color: Colors.black54,
                            colorBlendMode: BlendMode.darken,
                            height: 100
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/logo.png', fit: BoxFit.cover),
                              const Text('TATTOO ESTUDIO', style: textStyleWhite),
                            ],
                          ),
                        ],
                      )
                    )
                  ),
                ),
                //----- end section banner --------
                SizedBox(
                  height: size.height*0.76,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25,40,25,25),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: (){
                              Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Appointment())
                                );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(63, 63, 63, 1)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: const BorderSide(color: Color.fromRGBO(63, 63, 63, 1))
                                )
                            )),
                            child: const Text('Agendar Cita', style: textStyleWhite)
                          ),
                          Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              primary: false,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 4,
                                  child: InkWell(
                                    onTap: () => {
                                      Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            DetailStyle(tapped: {'tap':1,'name':'Neo Tradicional'})
                                            )
                                    )
                                    },
                                    splashColor: const Color.fromARGB(255, 131, 128, 128),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(
                                            'assets/images/service-1.png', 
                                            fit: BoxFit.cover, 
                                            width: MediaQuery.of(context).size.width, 
                                            color: const Color.fromRGBO(63, 63, 63, 0.623),
                                            colorBlendMode: BlendMode.darken,
                                            ),
                                        ),
                                        const Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Neo Tradicional',
                                              style: cardTextStyle,
                                            ),
                                          ],
                                        ),
                                      ]
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 4,
                                  child: InkWell(
                                    onTap: () => {
                                      Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            DetailStyle(tapped: {'tap':2,'name':'Anime'})
                                            )
                                    )
                                    },
                                    splashColor: const Color.fromARGB(255, 131, 128, 128),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(
                                            'assets/images/service-2.png', 
                                            fit: BoxFit.cover, 
                                            width: MediaQuery.of(context).size.width, 
                                            color:  const Color.fromRGBO(63, 63, 63, 0.623),
                                            colorBlendMode: BlendMode.darken,
                                          ),
                                        ),
                                        const Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Anime',
                                              style: cardTextStyle,
                                            ),
                                          ],
                                        ),
                                      ]
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 4,
                                  child: InkWell(
                                    onTap: () => {
                                      Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            DetailStyle(tapped: {'tap':3,'name':'Blackwork'})
                                            )
                                    )
                                    },
                                    splashColor: const Color.fromARGB(255, 131, 128, 128),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(
                                            'assets/images/service-3.png', 
                                            fit: BoxFit.cover, 
                                            width: MediaQuery.of(context).size.width, 
                                            color: const Color.fromRGBO(63, 63, 63, 0.623),
                                            colorBlendMode: BlendMode.darken,
                                          ),
                                        ),
                                        const Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Blackwork',
                                              style: cardTextStyle,
                                            ),
                                          ],
                                        ),
                                      ]
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 4,
                                  child: InkWell(
                                    onTap: () => {
                                      Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            DetailStyle(tapped: {'tap':4,'name':'Lettering'})
                                            )
                                    )
                                    },
                                    splashColor: const Color.fromARGB(255, 131, 128, 128),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(
                                            'assets/images/service-4.png', 
                                            fit: BoxFit.cover, 
                                            width: MediaQuery.of(context).size.width, 
                                            color: const Color.fromRGBO(63, 63, 63, 0.623),
                                            colorBlendMode: BlendMode.darken,
                                          ),
                                        ),
                                        const Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Lettering',
                                              style: cardTextStyle,
                                            ),
                                          ],
                                        ),
                                      ]
                                    ),
                                  ),
                                ),
                              
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 4,
                                  child: InkWell(
                                    onTap: () => {
                                      Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            DetailStyle(tapped: {'tap':5,'name':'Blackwork'})
                                            )
                                    )
                                    },
                                    splashColor: const Color.fromARGB(255, 131, 128, 128),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(
                                            'assets/images/service-3.png', 
                                            fit: BoxFit.cover, 
                                            width: MediaQuery.of(context).size.width, 
                                            color: const Color.fromRGBO(63, 63, 63, 0.623),
                                            colorBlendMode: BlendMode.darken,
                                          ),
                                        ),
                                        const Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Blackwork',
                                              style: cardTextStyle,
                                            ),
                                          ],
                                        ),
                                      ]
                                    ),
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  elevation: 4,
                                  child: InkWell(
                                    onTap: () => {
                                      Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            DetailStyle(tapped: {'tap':6,'name':'Lettering'})
                                            )
                                    )
                                    },
                                    splashColor: const Color.fromARGB(255, 131, 128, 128),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(
                                            'assets/images/service-4.png', 
                                            fit: BoxFit.cover, 
                                            width: MediaQuery.of(context).size.width, 
                                            color: const Color.fromRGBO(63, 63, 63, 0.623),
                                            colorBlendMode: BlendMode.darken,
                                          ),
                                        ),
                                        const Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              'Lettering',
                                              style: cardTextStyle,
                                            ),
                                          ],
                                        ),
                                      ]
                                    ),
                                  ),
                                ),
                              
                              ],
                            )
                          )
                        ]
                      )
                    ),
                  ),
                )
              
              ],
            ),
          ),
        ),
      );
  }
}
