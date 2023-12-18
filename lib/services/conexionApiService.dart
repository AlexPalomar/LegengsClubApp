// import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:applegendsclub/util/assignIp.dart';

// clase para hacer conexion remota con el bakckend
class ConexionApiService {
  AssignIp assignIp = AssignIp();

  setLogin(String email, String password) async {
    try {
      var data = {'email': email, 'password': password};
      // var response = await Dio().post('http://192.168.43.237:4000/api/user-legend', data: data); // conectado desde internet telefono
      var response = await Dio().post(
          'https://fb5e-191-156-55-46.ngrok-free.app/api/signin/',
          data: data); // red casa Jeferson

      if (response.statusCode == 200) {
        // debugPrint(response.data.toString()); // imprime datos por consola de ejecucion en debug
        return response.data;
      } else {
        debugPrint(response.statusCode
            .toString()); // imprime datos por consola de ejecucion en debug
        return 0;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getUsers() async {
    // final response  = await Dio().get('https://reqres.in/api/users/2');
    try {
      // var response = await Dio().get('http://'+assignIp.getIp()+':8000/api/users'); // conectado desde interne telefono
      var response = await Dio().get(
          'http://192.168.43.237:9000/api/artists/'); // conectado desde interne telefono

      if (response.statusCode == 200) {
        // debugPrint(response.data.toString()); // imprime datos por consola de ejecucion en debug
        return response.data;
      } else {
        debugPrint(response.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void setSignup(String firstname, String lastname, int age, int phone,
      String email, String password) async {
    // final response  = await Dio().get('https://reqres.in/api/users/2');
    // var response = await Dio().get('http://192.168.0.15:4000/api/users');
    try {
      var data = {
        'firstname': firstname,
        'lastname': lastname,
        'age': age,
        'phone': phone,
        'email': email,
        'password': password
      };
      // var response = await Dio().post('http://192.168.43.237:4000/api/user-legend', data: data); // conectado desde internet telefono
      var response = await Dio().post(
          'http://' + assignIp.getIp() + ':8000/api/users',
          data: data); // red casa Jeferson

      if (response.statusCode == 200) {
        // debugPrint(response.data.toString()); // imprime datos por consola de ejecucion en debug
      } else {
        debugPrint(response.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getArtist() async {
    try {
      // var response = await Dio().get('http://'+assignIp.getIp()+':8000/api/users'); // conectado desde interne telefono
      var response = await Dio().get(
          'https://fb5e-191-156-55-46.ngrok-free.app/api/artists/'); // conectado desde interne telefono
      // var response = await Dio().get('http://192.168.43.237:9000/api/artists'); // conectado desde interne telefono

      if (response.statusCode == 200) {
        return response.data;
        // debugPrint(response.data.toString()); // imprime datos por consola de ejecucion en debug
      } else {
        debugPrint(response.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void setArtist(String firstname, String lastname, int age, int phone,
      String email, String password) async {
    // final response  = await Dio().get('https://reqres.in/api/users/2');
    // var response = await Dio().get('http://192.168.0.15:4000/api/users');
    try {
      var data = {
        'firstname': firstname,
        'lastname': lastname,
        'age': age,
        'phone': phone,
        'email': email,
        'password': password
      };
      // var response = await Dio().post('http://192.168.43.237:4000/api/user-legend', data: data); // conectado desde internet telefono
      var response = await Dio().post(
          'http://' + assignIp.getIp() + ':8000/api/users',
          data: data); // red casa Jeferson

      if (response.statusCode == 200) {
        // debugPrint(response.data.toString()); // imprime datos por consola de ejecucion en debug
      } else {
        debugPrint(response.statusCode.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
