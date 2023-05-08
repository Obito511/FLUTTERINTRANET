import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intranet/widget/reclamation.dart';
import 'package:intranet/widget/tempsdetravail.dart';
import 'DrawerHeader.dart';
import 'Employées.dart';
import 'Event.dart';
import 'Formation.dart';
import 'HomePage.dart';
import 'editprofile.dart';
import 'forum.dart';
import 'package:http/http.dart' as http;



class Fiche {
  final int? id;
  final String? Date;
  final String? uri;


  const Fiche({
    required this.id,
    required  this.Date,
    required  this.uri,

  });

  factory Fiche.fromJson(Map<String, dynamic> json) => Fiche


    (

    id: json['id'],
    Date: json['date'],
    uri: json['uri'],


  );

}

Future<List<Fiche>> fetchData() async {
  final storage = FlutterSecureStorage();
  final token = await storage.read(key: 'jwt');

  final response = await http.get(Uri.parse('http://10.0.2.2:9090/fichedepaie/getficheforuser'),headers:{
    HttpHeaders.contentTypeHeader:'application/json','X-Requested-With':'XMLHttpRequest',"authorization":"Bearer $token"

  });
  final jsonList = jsonDecode(response.body) as List<dynamic>;
  print(jsonList);
  final searchedUsers = [
    for (final map in jsonList.cast<Map<String, dynamic>>())
      Fiche.fromJson(map)

  ];
  print(searchedUsers);

  return searchedUsers;
}



class FicheDePaie extends StatefulWidget {
  @override
  _MyTableState createState() => _MyTableState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _MyTableState extends State<FicheDePaie> {
  late Future<List<Fiche>> futureData;



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
          title: Text('Fiche de paie'),

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

        body:FutureBuilder<List<Fiche>>(
          future: futureData,
          builder: (BuildContext context, AsyncSnapshot<List<Fiche>> snapshot) {
            if (snapshot.hasData) {
              final List<Fiche> ficha = snapshot.data!;

              final filteredFicha = ficha.where((ficha) => ficha.uri != null).toList();

              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 40, left: 70),
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('File')),
                    ],
                    rows: filteredFicha.map((ficha) {
                      return DataRow(cells: [
                        DataCell(Text(ficha.Date ?? '')),
                        DataCell(
                          ElevatedButton(
                              onPressed: () {
                                FileDownloader.downloadFile(
                                    url: ficha.uri?.trim() ?? ''

                                  );
                              },
                              child: const Text('Download')),
                        ),
                      ]);
                    }).toList(),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )



    );
  }

}

