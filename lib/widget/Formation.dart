import 'package:flutter/material.dart';
import 'package:intranet/widget/reclamation.dart';
import 'package:intranet/widget/tempsdetravail.dart';
import 'DrawerHeader.dart';
import 'Employées.dart';
import 'Event.dart';
import 'HomePage.dart';
import 'editprofile.dart';
import 'fichedepaie.dart';
import 'forum.dart';

import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Formation {
  final String? Cabinet;
  final String? categorie;
  final String? datedb;
  final String? datefn;
  final String? formateur;
  final String? theme;


  const Formation({
    required this.Cabinet,
    required  this.categorie,
    required  this.datedb,
    required  this.datefn,
    required  this.formateur,
    required  this.theme,
  });

  factory Formation.fromJson(Map<String, dynamic> json) => new Formation


    (

    Cabinet: json['cabinet'],
    categorie: json['categorie'],
    datedb: json['datedb'],
    datefn: json['datefn'],
    formateur: json['formateur'],
    theme: json['theme'],


  );

}

Future<List<Formation>> fetchFormation() async {
  final storage = FlutterSecureStorage();
  final token = await storage.read(key: 'jwt');

  final response = await http.get(Uri.parse('http://10.0.2.2:9090/getallformation'),headers:{
    HttpHeaders.contentTypeHeader:'application/json','X-Requested-With':'XMLHttpRequest',"authorization":"Bearer $token"

  });
  final jsonList = jsonDecode(response.body) as List<dynamic>;
  print(jsonList);
  final searchedUsers = [
    for (final map in jsonList.cast<Map<String, dynamic>>())
      Formation.fromJson(map)

  ];
  print(searchedUsers);

  return searchedUsers;
}

class Formations extends StatefulWidget {
  @override
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<Formations> {
  late Future<List<Formation>> futureData;



  @override
  void initState() {
    super.initState();
    futureData = fetchFormation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Formation'),

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child:
            Image(
              image: AssetImage('assets/icon.png'),
              width: 40,
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            kDrawerHeader,
            ListTile(
              title: Text('Actualités'),
              leading: Icon(
                Icons.fiber_new,
                color: Colors.redAccent,
                size: 30,
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              dense: true,
            ),
            ListTile(
              title: Text('Evénements'),
              leading: Icon(
                Icons.event_available,
                color: Colors.redAccent,
                size: 30,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Event()),
                );
              },
              dense: true,
            ),
            ListTile(
              title: Text('Formation'),
              leading: Icon(
                Icons.info,
                color: Colors.redAccent,
                size: 30,
              ),
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Formations()),
                );
              },
              dense: true,
            ),
            ListTile(
              title: Text('Fiche de paie'),
              leading: Icon(
                Icons.receipt_long,
                color: Colors.redAccent,
                size: 30,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FicheDePaie()),
                );
              },
              dense: true,
            ),
            ListTile(
              title: Text('Reclamtion'),
              leading: Icon(
                Icons.admin_panel_settings,
                color: Colors.redAccent,
                size: 30,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Reclamation()),
                );
              },
              dense: true,
            ),
            ListTile(
              title: Text('Agenda'),
              leading: Icon(
                Icons.date_range,
                color: Colors.redAccent,
                size: 30,
              ),
              onTap: () {
                Navigator.popAndPushNamed(context, '/view-subjects');
              },
              dense: true,
            ),
            ListTile(
              title: Text('Forum'),
              leading: Icon(
                Icons.forum,
                color: Colors.redAccent,
                size: 30,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Forum()),
                );
              },
              dense: true,
            ),
            ListTile(
              title: Text('Employées'),
              leading: Icon(
                Icons.supervised_user_circle,
                color: Colors.redAccent,
                size: 30,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Employes()),
                );
              },
              dense: true,
            ),
            ListTile(
              title: Text('Temps de travail'),
              leading: Icon(
                Icons.timer,
                color: Colors.redAccent,
                size: 30,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => time()),
                );
              },
              dense: true,
            ),
            ListTile(
              title: Text('Mon compte'),
              leading: Icon(
                Icons.account_circle ,
                color: Colors.redAccent,
                size: 30,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
              dense: true,
            ),
            ListTile(
              title: Text('Déconnexion'),
              leading: Icon(
                Icons.logout,
                color: Colors.redAccent,
                size: 30,
              ),
              onTap: () {
                Navigator.popAndPushNamed(context, '/view-subjects');
              },
              dense: true,
            )

          ],
        ),
      ),
      body: FutureBuilder<List<Formation>>(
        future: futureData,
        builder: (BuildContext context, AsyncSnapshot<List<Formation>> snapshot) {
          if (snapshot.hasData) {
            final List<Formation> users = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columnSpacing: 15,
                  columns: [
                    DataColumn(
                      label: Text(
                        'Categorie',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'théme',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'date debut',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'date fin',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'cabinet',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'formateur',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Actions',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ),
                  ],
                  rows: users
                      .map((formation) => DataRow(cells: [
                    DataCell(Text('${formation.categorie.toString()} ')),
                    DataCell(Text(formation.theme.toString())),
                    DataCell(Text(formation.datedb.toString())),
                    DataCell(Text(formation.datefn.toString())),
                    DataCell(Text(formation.Cabinet.toString())),
                    DataCell(Text(formation.formateur.toString())),
                    DataCell(Icon(Icons.download)),
                  ]))
                      .toList(),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),

    );
  }
}