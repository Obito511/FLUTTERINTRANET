import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intranet/widget/reclamation.dart';
import 'package:intranet/widget/tempsdetravail.dart';


import 'DrawerHeader.dart';
import 'Event.dart';
import 'Formation.dart';
import 'HomePage.dart';
import 'editprofile.dart';
import 'fichedepaie.dart';
import 'forum.dart';

class Users {
  final String? Mat_Pers;
  final String? nom_PERS;
  final String? pren_PERS;
  final String? numerodetelephone;
  final String? email;

  const Users({
    required this.Mat_Pers,
    required  this.nom_PERS,
    required  this.pren_PERS,
    required  this.numerodetelephone,
    required  this.email,
  });

  factory Users.fromJson(Map<String, dynamic> json) => new Users


    (

      Mat_Pers: json['mat_Pers'],
      nom_PERS: json['nom_PERS'],
      pren_PERS: json['pren_PERS'],
      numerodetelephone: json['numerodetelephone'],
      email: json['email'],

  );

}

Future<List<Users>> fetchData() async {
  final storage = FlutterSecureStorage();
  final token = await storage.read(key: 'jwt');

  final response = await http.get(Uri.parse('http://10.0.2.2:9090/users'),headers:{
    HttpHeaders.contentTypeHeader:'application/json','X-Requested-With':'XMLHttpRequest',"authorization":"Bearer $token"

  });
  final jsonList = jsonDecode(response.body) as List<dynamic>;
  print(jsonList);
  final searchedUsers = [
    for (final map in jsonList.cast<Map<String, dynamic>>())
      Users.fromJson(map)

  ];
  print(searchedUsers);

  return searchedUsers;
}

class Employes extends StatefulWidget {
  @override
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<Employes> {
  late Future<List<Users>> futureData;



  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Employées'),

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
      body: FutureBuilder<List<Users>>(
        future: futureData,
        builder: (BuildContext context, AsyncSnapshot<List<Users>> snapshot) {
          if (snapshot.hasData) {
            final List<Users> users = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columnSpacing: 15,
                  columns: [
                    DataColumn(
                      label: Text(
                        'Nom et Prénom',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Numéro de téléphone',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ),
                  ],
                  rows: users
                      .map((user) => DataRow(cells: [
                    DataCell(Text('${user.nom_PERS.toString()} ${user.pren_PERS.toString()}')),
                    DataCell(Text(user.numerodetelephone.toString())),
                    DataCell(Text(user.email.toString())),
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