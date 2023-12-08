import 'package:flutter/material.dart';

class DetailArtist extends StatefulWidget {
  // final Map artistTapped;
  final Map<String, dynamic> artistTapped;
  final int imageUser;

  const DetailArtist(this.artistTapped, this.imageUser, {super.key});

  @override
  State<DetailArtist> createState() => _DetailArtistState();
}

class _DetailArtistState extends State<DetailArtist> {

  final List<String> imageUrls = [
    'URL_imagen_1',
    'URL_imagen_2',
    'URL_imagen_3',
    // Agrega aquí las URL de tus imágenes
  ];
  final List<String> imageAssets = [
    'assets/images/service-1.png',
    'assets/images/service-2.png',
    'assets/images/service-3.png',
    'assets/images/service-4.png',
    // Agrega aquí las URL de tus imágenes
  ];

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
                Text(widget.artistTapped['firstnameUser'].toString()+' '+widget.artistTapped['lastnameUser'].toString(),
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
                                image: NetworkImage('https://reqres.in/img/faces/${widget.imageUser+1}-image.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                                    padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            const Text('Estilo: ', style: textStyleBold),
                                            Text(widget.artistTapped['stileTattoArtist'].toString(), style: textStyle14),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text('Experiencia: ', style: textStyleBold),
                                            Text(widget.artistTapped['experienceArtist'].toString(), style: textStyle14),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text('País: ', style: textStyleBold),
                                            Text(widget.artistTapped['nationalityArtist'].toString(), style: textStyle14),
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
                                          const Text('Telefono: ', style: textStyleBold),
                                          Text(widget.artistTapped['phoneUser'].toString(), style: textStyle14),
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          Text('Correo: ', style: textStyleBold),
                                        ],
                                      ),
                                       Row(
                                        children: [
                                          Text(widget.artistTapped['emailUser'].toString(), style: textStyle14, maxLines: 2,),
                                        ],
                                      ),
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
                  ElevatedButton(
                    onPressed: (){
                      // Navigator.of(context).push(
                      // MaterialPageRoute(
                      //   builder: (BuildContext context) =>
                      //       Appointment())
                      //   );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(63, 63, 63, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: Color.fromRGBO(63, 63, 63, 1))
                        )
                    )),
                    child: const Text('ver disponibilidad', style: textStyleWhite)
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Trabajos Realizados', style:textStyle),
                  ),
                  Center(
                    child: SizedBox(
                      width: allWidth*.80,
                      height: 240, // Altura del slider
                      child: PageView.builder(
                        itemCount: imageUrls.length,
                        itemBuilder: (BuildContext context, int index) {
                          //----- para traer imagenes de internet
                          // return Image.network(
                          //   imageUrls[index],
                          //   fit: BoxFit.cover, // Ajustar imagen al tamaño del contenedor
                          // );
                          //----- para traer imagenes locales
                          return Image.asset(
                            imageAssets[index],
                            fit: BoxFit.cover, // Ajustar imagen al tamaño del contenedor
                          );
                        },
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('< -- Desliza la imagen -- >', style:textStyle),
                  ),
                ]
              )
            ],
          ),
        )
      )
    );
  }
}