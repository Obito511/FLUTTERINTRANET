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


class Formations extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Foramtion'),

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
        body: SingleChildScrollView(



            child: Padding(
                padding: EdgeInsets.only(top: 40),
                child:
                Table(
                  border: TableBorder(
                      horizontalInside:
                      BorderSide(color: Colors.black, width: 2.0)),
                  children: [
                    //This table row is for the table header which is static
                    TableRow(children: [

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Catégorie",
                            style: TextStyle(
                                fontSize: 13,
                            color: Colors.black87),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child:

                            Text(
                              "théme",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            )
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "date debut",
                            style: TextStyle(
                                fontSize: 13,
                                 color: Colors.black87),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "date fin",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black87),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "cabinet",
                            style: TextStyle(
                                fontSize: 13,
                                 color: Colors.black87),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "formateur",
                            style: TextStyle(
                                fontSize: 13,
                              color: Colors.black87),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "action",
                            style: TextStyle(
                                fontSize: 13,
                                 color: Colors.black87),
                          ),
                        ),
                      ),
                    ]),
                    // Using the spread operator to add the remaining table rows which have dynamic data
                    // Be sure to use .asMap().entries.map if you want to access their indexes and objectName.map() if you have no interest in the items index.



                    TableRow(
                        decoration: BoxDecoration(color: Colors.white54),
                        children: [

                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                ' informatique',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black87),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                '22345678',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black87),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                '22/07/02',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black87),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                '22/07/2',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black87),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                'las3ad',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black87),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(

                                'mohamed khouildi',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black87),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Icon(
                                Icons.download,
                                color: Colors.redAccent,
                                size: 25,
                              ),
                            ),
                          ),
                        ]),


                  ],
                )
            )
        )





    );
  }
}

