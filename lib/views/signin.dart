import 'package:flutter/material.dart';
import 'package:applegendsclub/views/signup.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  late TextEditingController controller;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
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
                Text('signin',
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,0,10),
                            child: Container(
                              height: size.height *.1,
                              //  --------  para poner logo en el login --------
                              // decoration: BoxDecoration(
                              //   image: DecorationImage(
                              //     scale: 1.0,
                              //     alignment: Alignment.center,
                              //     image: const AssetImage('assets/images/ic_regist_login.png')
                              //   ),
                              // ),
                            ),
                          ),
                          const Text(
                              'Login',
                              style: TextStyle(fontFamily: "Montserrat Regular",
                                fontSize:30,
                                color: Color.fromRGBO(63, 63, 63, 1)),
                              textAlign: TextAlign.center
                          ),
                          TextFormField(
                            style: cardTextStyle,
                            autofocus: true,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(labelText: 'Usuario'),
                            maxLines: 1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Usuario es Requerida';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              // user.setUser(value);
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
                              // user.setPassword(value);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,10,0,0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {  },
                                      child: Text(
                                        '¿Olvidó la contraseña?',
                                        style: TextStyle(fontFamily: "Montserrat Regular",
                                          fontSize:16,
                                          color: Color.fromRGBO(63, 63, 63, 1)),
                                        textAlign: TextAlign.center
                                        ),
                                    )
                                  ]
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,10,0,0),
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
                                child: Text('iniciar sessión',
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
                                    return;
                                  }
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
                                  _formKey.currentState!.save();                  
                                }, 
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width*0.70,
                            height: 50,
                            child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10,10,0,5),
                                  child: const Text(
                                    'Nuevo usuario?',
                                    style: TextStyle(fontFamily: "Montserrat Regular",
                                      fontSize:16,
                                      color: Colors.black),
                                    textAlign: TextAlign.center
                                  ),
                                ),
                                TextButton(
                                  onPressed: () { 
                                    _formKey.currentState!.save();
                                    Navigator.push(context,
                                      new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                          signup())
                                    );
                                    // showDialog<String>(
                                    //   barrierDismissible: false,
                                    //   context: context,
                                    //   builder: (BuildContext context) => 
                                      
                                    //     AlertDialog(
                                    //       title: Center(child: const Text('Nuevo Usuario')),
                                    //       scrollable: true,
                                    //       actions: <Widget>[
                                    //         Padding(
                                    //           padding: const EdgeInsets.fromLTRB(12,0,12,0),
                                    //           child: SizedBox(
                                    //             // width: size.width*0.20,
                                    //             height: size.width*1.70,
                                    //             child: Column(
                                    //               children: [
                                    //                 Column(
                                    //                   children: [
                                    //                     Form(
                                    //                       key: _formKey,
                                    //                       child: Column(
                                    //                         children: [
                                    //                           TextFormField(
                                    //                             style: alertTextStyle,
                                    //                             autofocus: true,
                                    //                             keyboardType: TextInputType.multiline,
                                    //                             decoration: InputDecoration(labelText: 'Identificación'),
                                    //                             maxLines: 1,
                                    //                             validator: (value) {
                                    //                               if (value == null || value.isEmpty) {
                                    //                                 return 'Identificación es Requerida';
                                    //                               }
                                    //                               return null;
                                    //                             },
                                    //                             onSaved: (value) {
                                    //                               // user.setId(value);
                                    //                             },
                                    //                           ),
                                    //                           TextFormField(
                                    //                             style: alertTextStyle,
                                    //                             autofocus: true,
                                    //                             keyboardType: TextInputType.multiline,
                                    //                             decoration: InputDecoration(labelText: 'Nombre'),
                                    //                             maxLines: 1,
                                    //                             validator: (value) {
                                    //                               if (value == null || value.isEmpty) {
                                    //                                 return 'nombre es Requerida';
                                    //                               }
                                    //                               return null;
                                    //                             },
                                    //                             onSaved: (value) {
                                    //                               // user.setName(value);
                                    //                             },
                                    //                           ),
                                    //                           TextFormField(
                                    //                             style: alertTextStyle,
                                    //                             autofocus: true,
                                    //                             keyboardType: TextInputType.multiline,
                                    //                             decoration: InputDecoration(labelText: 'Apellidos'),
                                    //                             maxLines: 1,
                                    //                             validator: (value) {
                                    //                               if (value == null || value.isEmpty) {
                                    //                                 return 'nombre es Requerida';
                                    //                               }
                                    //                               return null;
                                    //                             },
                                    //                             onSaved: (value) {
                                    //                               // user.setLastname(value);
                                    //                             },
                                    //                           ),
                                    //                           TextFormField(
                                    //                             style: alertTextStyle,
                                    //                             autofocus: true,
                                    //                             keyboardType: TextInputType.multiline,
                                    //                             decoration: InputDecoration(labelText: 'Correo'),
                                    //                             maxLines: 1,
                                    //                             validator: (value) {
                                    //                               if (value == null || value.isEmpty) {
                                    //                                 return 'Correo es Requerida';
                                    //                               }
                                    //                               return null;
                                    //                             },
                                    //                             onSaved: (value) {
                                    //                               // user.setEmail(value);
                                    //                             },
                                    //                           ),
                                    //                           TextFormField(
                                    //                             style: alertTextStyle,
                                    //                             autofocus: true,
                                    //                             keyboardType: TextInputType.multiline,
                                    //                             decoration: InputDecoration(labelText: 'Usuario'),
                                    //                             maxLines: 1,
                                    //                             validator: (value) {
                                    //                               if (value == null || value.isEmpty) {
                                    //                                 return 'Usuario es Requerida';
                                    //                               }
                                    //                               return null;
                                    //                             },
                                    //                             onSaved: (value) {
                                    //                               // user.setUser(value);
                                    //                             },
                                    //                           ),
                                    //                           TextFormField(
                                    //                             style: alertTextStyle,
                                    //                             autofocus: true,
                                    //                             keyboardType: TextInputType.multiline,
                                    //                             decoration: InputDecoration(labelText: 'Contraseña'),
                                    //                             maxLines: 1,
                                    //                             validator: (value) {
                                    //                               if (value == null || value.isEmpty) {
                                    //                                 return 'Contraseña es Requerida';
                                    //                               }
                                    //                               return null;
                                    //                             },
                                    //                             onSaved: (value) {
                                    //                               // user.setPassword(value);
                                    //                             },
                                    //                           ),
                                    //                           TextFormField(
                                    //                             style: alertTextStyle,
                                    //                             autofocus: true,
                                    //                             keyboardType: TextInputType.multiline,
                                    //                             decoration: InputDecoration(labelText: 'Confirmar Contraseña'),
                                    //                             maxLines: 1,
                                    //                             validator: (value) {
                                    //                               if (value == null || value.isEmpty) {
                                    //                                 return 'Contraseña es Requerida';
                                    //                               }
                                    //                               return null;
                                    //                             },
                                    //                             onSaved: (value) {
                                    //                               // user.getUser();
                                    //                             },
                                    //                           ),
                                    //                         ],
                                    //                       )
                                    //                     ),
                                    //                     Row(
                                    //                       mainAxisAlignment: MainAxisAlignment.center,
                                    //                       mainAxisSize: MainAxisSize.max,
                                    //                       children: [
                                    //                         Padding(
                                    //                           padding: const EdgeInsets.all(12.0),
                                    //                           child: Row(
                                    //                             children: [
                                    //                               Padding(
                                    //                                 padding: const EdgeInsets.fromLTRB(05,0,05,0),
                                    //                                 child: SizedBox(
                                    //                                   width: size.width*0.25,
                                    //                                   height: size.width*0.06,
                                    //                                   child: TextButton(
                                    //                                     onPressed: () => {
                                    //                                       Navigator.of(context).pushNamed('/')
                                    //                                     },
                                    //                                     child: Text('cancelar',
                                    //                                       style: TextStyle(
                                    //                                         fontFamily: "Montserrat Regular", 
                                    //                                         color: Colors.white,
                                    //                                         fontSize:18)
                                    //                                     ),
                                    //                                     style: ButtonStyle(
                                    //                                       backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
                                    //                                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    //                                         RoundedRectangleBorder(
                                    //                                           borderRadius: BorderRadius.circular(18.0),
                                    //                                           side: BorderSide(color: Colors.red)
                                    //                                         )
                                    //                                       )),
                                    //                                   ),
                                    //                                 ),
                                    //                               ),
                                    //                               Padding(
                                    //                                 padding: const EdgeInsets.fromLTRB(05,0,05,0),
                                    //                                 child: SizedBox(
                                    //                                   width: size.width*0.25,
                                    //                                   height: size.width*0.06,
                                    //                                   child: TextButton(
                                    //                                     onPressed: (){
                                    //                                     if (!_formKey.currentState!.validate()) {
                                    //                                       return;
                                    //                                     }
                                    //                                     _formKey.currentState!.save();
                                                                        
                                    //                                     _formKey.currentState?.reset();
                                    //                                     Navigator.of(context).pushNamed('/');
                                    //                                     ScaffoldMessenger.of(context).showSnackBar(
                                    //                                       const SnackBar(content: Text(
                                    //                                         style: TextStyle(color: Colors.green),
                                    //                                         'Usuario guardado exitosamente'),
                                    //                                         backgroundColor: Color.fromARGB(255, 248, 245, 245),
                                    //                                     ));
                                    //                                     },
                                    //                                     child: Text('guardar',
                                    //                                       style: TextStyle(
                                    //                                         fontFamily: "Montserrat Regular", 
                                    //                                         color: Colors.white,
                                    //                                         fontSize:18)
                                    //                                     ),
                                    //                                     style: ButtonStyle(
                                    //                                       backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
                                    //                                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    //                                         RoundedRectangleBorder(
                                    //                                           borderRadius: BorderRadius.circular(18.0),
                                    //                                           side: BorderSide(color: Colors.red)
                                    //                                         )
                                    //                                       )),
                                    //                                   ),
                                    //                                 ),
                                    //                               ),
                                    //                             ],
                                    //                           ),
                                    //                         ),
                                    //                       ],
                                    //                     ),
                                    //                   ],
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       ],
                                    //     ),
                                      
                                    // );
                                    
                                    },
                                  child: const Text(
                                    'registrarse',
                                    style: TextStyle(fontFamily: "Montserrat Regular",
                                      fontSize:16,
                                      color: Color.fromARGB(255, 62, 66, 64)),
                                    textAlign: TextAlign.center
                                    ),
                                )
                              ],
                              ),
                          )
                              
                        ],
                      ),
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