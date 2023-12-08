import 'package:flutter/material.dart';

class DetailStyle extends StatefulWidget {
  final Map<String, dynamic> styleTapped;
  const DetailStyle(this.styleTapped, {super.key, tapped});

  @override
  State<DetailStyle> createState() => _DetailStyleState();
}

class _DetailStyleState extends State<DetailStyle> {

  @override
  Widget build(BuildContext context) {
    var allWidth = MediaQuery.of(context).size.width;
    const textStyleAppbar = TextStyle(
          fontFamily: "Montserrat Regular",
          fontSize: 20,
          color: Colors.white);

    const textStyle = TextStyle(
          fontFamily: "Montserrat Regular",
          fontSize: 16,
          color: Colors.black);

    const textStyleWhite = TextStyle(
      fontFamily: "Montserrat Regular",
      fontSize: 16,
      color: Colors.white, 
    );

    const textStyleBlackBold = TextStyle(
      fontFamily: "Montserrat Regular",
      fontSize: 30,
      fontWeight: FontWeight.w900,
      color: Colors.black);

    const textStyle14 = TextStyle(
      fontFamily: "Montserrat Regular",
      fontSize: 12,
      fontWeight: FontWeight.w900,
      color: Colors.black);


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
                Text('Estilo Tattoo',
                  style: textStyleAppbar,
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
          height: MediaQuery.of(context).size.height*0.90,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1,0,5,10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: allWidth,
                            height: 240,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(10, 10),
                                bottomRight: Radius.elliptical(10, 10),
                              ),
                            ),
                            child: Card(
                              elevation: 10,
                              child: Image.asset(
                                'assets/images/service-${widget.styleTapped['tap']}.png', 
                                fit: BoxFit.cover, 
                                width: allWidth,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(child: Text(widget.styleTapped['name'].toString(), style: textStyleBlackBold,)),
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
                                    padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      
                                      
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        )
                        ),
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
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20,10,20,10),
                    child: Text('Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis reiciendis corrupti quae soluta numquam nesciunt laborum obcaecati magnam adipisci a?', style:textStyle),
                  ),
                  // ElevatedButton(
                  //   onPressed: (){
                  //     // Navigator.of(context).push(
                  //     // MaterialPageRoute(
                  //     //   builder: (BuildContext context) =>
                  //     //       Appointment())
                  //     //   );
                  //   },
                  //   style: ButtonStyle(
                  //     backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(63, 63, 63, 1)),
                  //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //       RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(5),
                  //         side: const BorderSide(color: Color.fromRGBO(63, 63, 63, 1))
                  //       )
                  //   )),
                  //   child: const Text('ver disponibilidad', style: textStyleWhite)
                  // ),
                  
                ]
              )
            ],
          ),
        )
      )
    );
  }
}