import 'package:flutter/material.dart';

class DetailStyle extends StatefulWidget {
  const DetailStyle({super.key, tapped});

  @override
  State<DetailStyle> createState() => _DetailStyleState();
}

class _DetailStyleState extends State<DetailStyle> {

  @override
  Widget build(BuildContext context) {

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
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 384,
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
                                'https://reqres.in/img/faces/1-image.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text('Hola')
                ]
              )
            ],
          ),
        )
      )
    );
  }
}