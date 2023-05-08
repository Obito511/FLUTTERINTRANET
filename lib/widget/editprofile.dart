import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intranet/widget/reclamation.dart';
import 'package:intranet/widget/tempsdetravail.dart';
import 'DrawerHeader.dart';
import 'Employées.dart';
import 'Event.dart';
import 'Formation.dart';
import 'HomePage.dart';
import 'fichedepaie.dart';
import 'forum.dart';
import 'package:http/http.dart' as http;


class Utilisateur {
  final String? Mat_Pers;
  final String? nom_PERS;
  final String? pren_PERS;
  final String? numerodetelephone;
  final String? email;
  final String? datedembauche;
  final String? datedenaissance;
  final String? coderetrait;
  final String? num_ass;
  final String? soldedeconge;
  final String? numretrait;
  final String? regime;


  const Utilisateur({
    required this.Mat_Pers,
    required  this.nom_PERS,
    required  this.pren_PERS,
    required  this.numerodetelephone,
    required  this.email,
    required  this.datedembauche,
    required  this.datedenaissance,
    required  this.coderetrait,
    required  this.num_ass,
    required  this.soldedeconge,
    required  this.numretrait,
    required  this.regime,


  });
  factory Utilisateur.fromJson(Map<String, dynamic> json) => Utilisateur(
    Mat_Pers: json['mat_Pers'],
    nom_PERS: json['nom_PERS'],
    pren_PERS: json['pren_PERS'],
    numerodetelephone: json['numerodetelephone'],
    email: json['email'],
    datedembauche: json['datedembauche'],
    datedenaissance: json['dat_NAIS'],
    coderetrait: json['coderetrait'],
    num_ass: json['num_ASS'],
    soldedeconge: json['soldedeconge'],
    numretrait: json['NUM_RETR'],
    regime: json['regime_TRAV'],
  );

}

Future<Utilisateur> fetchData() async {
  final storage = FlutterSecureStorage();
  final token = await storage.read(key: 'jwt');
  final user =  await storage.read(key:'user');

  final response = await http.get(Uri.parse('http://10.0.2.2:9090/users/$user'),headers:{
    HttpHeaders.contentTypeHeader:'application/json','X-Requested-With':'XMLHttpRequest',"authorization":"Bearer $token"

  });
  final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
  return Utilisateur.fromJson(jsonResponse);


}


class Profile extends StatefulWidget {
  @override
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<Profile> {
  late Future<Utilisateur> futureData;


  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: FutureBuilder<Utilisateur>(
          future: futureData,
          builder: (BuildContext context, AsyncSnapshot<Utilisateur> snapshot) {
            if (snapshot.hasData) {
              final Utilisateur users = snapshot.data!;
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage('assets/icon.png'),
                        ),


                      ),
                      Container(

                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Modifier mot de passe'),
                          ),
                        ),
                      ),


                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Table(
                            children: [
                              TableRow(children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(
                                      "Nom",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(
                                      users.nom_PERS.toString(),
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(
                                      "",
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ),
                                ),
                              ]),
                              TableRow(
                                decoration: BoxDecoration(
                                    color: Colors.white54),
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text('prénom'),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(users.pren_PERS.toString()),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(''),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                    color: Colors.white54),
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text('Mat_Pers'),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(users.Mat_Pers.toString()),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(''),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                    color: Colors.white54),
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text('Email'),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(users.email.toString()),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('modifier'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                    color: Colors.white54),
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text('Numéro de téléphone'),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(users.numerodetelephone.toString()),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('modifier'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                    color: Colors.white54),
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text("date d'embauche"),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(users.datedembauche.toString()),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(''),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                    color: Colors.white54),
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text('date de naissance'),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(users.datedenaissance.toString()),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(''),
                                    ),
                                  ),
                                ],

                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                    color: Colors.white54),
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text('Code Retrait'),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(users.coderetrait.toString()),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(''),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                    color: Colors.white54),
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text('num_ass'),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(users.num_ass.toString()),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(''),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                    color: Colors.white54),
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text('solde de congé'),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(users.soldedeconge.toString()),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(''),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                    color: Colors.white54),
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text('Num_Retrait'),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(users.numretrait.toString()),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(''),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                decoration: BoxDecoration(
                                    color: Colors.white54),
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text('Régime'),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(users.regime.toString()),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(''),
                                    ),
                                  ),
                                ],
                              ),
                            ],

                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              );
            }
            else{
    return Center(child: Text('${snapshot.error}'));

            }
          }),);
  }


}