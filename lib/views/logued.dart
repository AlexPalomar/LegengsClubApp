import 'package:flutter/material.dart';

class Logued extends StatefulWidget {
  const Logued(user,{super.key});
  @override
  State<Logued> createState() => _LoguedState();
}

class _LoguedState extends State<Logued> {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
          fontFamily: "Montserrat Regular",
          fontSize: 20,
          color: Colors.white);

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
                Text('Perfil',
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
        child: Text('Perfil de usuario logueado')
      ),
    );
  }
}