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
import 'editprofile.dart';
import 'fichedepaie.dart';
import 'forum.dart';
import 'package:http/http.dart' as http;


class Actualite {
  final int? id;
  final String? date;
  final String? description;
  final String? title;
  final String? type;
  final String? uri;

  const Actualite({
    required this.id,
    required this.date,
    required this.description,
    required this.title,
    required this.type,
    required this.uri,
  });

  factory Actualite.fromJson(Map<String, dynamic> json) {
    return Actualite(
      id: json['id'],
      date: json['date'],
      description: json['description'],
      title: json['title'],
      type: json['type'],
      uri: json['uri'],
    );
  }
}
Future<List<Actualite>> fetchActualite() async {
  final storage = FlutterSecureStorage();
  final token = await storage.read(key: 'jwt');

  final response = await http.get(Uri.parse('http://192.168.0.239:9090/actualite'),headers:{
    HttpHeaders.contentTypeHeader:'application/json','X-Requested-With':'XMLHttpRequest',"authorization":"Bearer $token"

  });
  final jsonList = jsonDecode(response.body) as List<dynamic>;
  print(jsonList);
  final searchedUsers = [
    for (final map in jsonList.cast<Map<String, dynamic>>())
      Actualite.fromJson(map)

  ];

  print(searchedUsers);

  return searchedUsers;
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Actualite>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchActualite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Actualités'),

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
      body: FutureBuilder<List<Actualite>>(
        future: futureData,
        builder: (BuildContext context, AsyncSnapshot<List<Actualite>> snapshot) {
          if (snapshot.hasData) {
            final List<Actualite> act = snapshot.data!;
            return ListView.builder(
              itemCount: act.length,
              itemBuilder: (BuildContext context, int index) {
                final Actualite actualite = act[index];
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 335,
                          height: 110,
                          child: actualite.uri != null ?  Image.network(
                            actualite.uri!,
                            fit: BoxFit.fill,
                            width: 40,
                            height: 40,
                          ) : Container(),
                        ),

                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                actualite.title.toString() ?? '',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                actualite.description.toString() ?? '',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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