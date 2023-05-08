import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../widget/HomePage.dart';
import '../widget/reclamation.dart';

class ReclamationController {
  TextEditingController emailController = TextEditingController();
  TextEditingController sujetController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  bool log=false;
  Future reclamtionService(emailController,sujetController,descriptionController) async {
    final String url = 'http://10.0.2.2:9090/newrec';


    var response = await http.post(Uri.parse(url),
        body: jsonEncode({
          "email": emailController.text,
          "subject": sujetController.text,
          "message": descriptionController.text,

        }),

        headers:{
          HttpHeaders.contentTypeHeader:'application/json','X-Requested-With':'XMLHttpRequest'

        });

  print(response);

  }



}
