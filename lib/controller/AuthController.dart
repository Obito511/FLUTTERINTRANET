import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../widget/HomePage.dart';


class AuthController {
  TextEditingController matriculeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool log=false;
  Future loginUser(matriculeController,passwordController) async {
   final String url = 'http://10.0.2.2:9090/auth';


    var response = await http.post(Uri.parse(url),
        body: jsonEncode({
          "Mat_Pers": matriculeController.text,
          "MDP": passwordController.text,
        }),

    headers:{
      HttpHeaders.contentTypeHeader:'application/json','X-Requested-With':'XMLHttpRequest'

    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> loginArr = json.decode(response.body);
      FlutterSecureStorage.setMockInitialValues({});

      // save this token in shared prefrences and make user logged in and navigate
// Create storage

      final storage = new FlutterSecureStorage();
// Write value
      await storage.write(key: 'jwt', value: loginArr["token"]);


      await storage.write(key: 'user', value: matriculeController.text);
      String? valuemat = await storage.read(key: 'user');
      String? value = await storage.read(key: 'jwt');
      print(valuemat);

      print(value);

log=true;
      print(log);

    } else {
 print(response.statusCode);
    }
    return log;
  }



}
