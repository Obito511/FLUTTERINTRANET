import 'package:flutter/material.dart';
import 'package:intranet/widget/reclamation.dart';
import 'package:intranet/widget/tempsdetravail.dart';
import 'DrawerHeader.dart';
import 'Employées.dart';
import 'Event.dart';
import 'Formation.dart';
import 'HomePage.dart';
import 'fichedepaie.dart';
import 'forum.dart';


class Profile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Mon compte'),

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
                  child:   ElevatedButton(
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
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Nom ",
                            style: TextStyle( color: Colors.black87),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "ahmed",
                            style: TextStyle( color: Colors.black87),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "",
                            style: TextStyle( color: Colors.black87),
                          ),
                        ),
                      ),
                    ]),
                    TableRow(
                      decoration: BoxDecoration(color: Colors.white54),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('prénom'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('benhmid'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(''),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Colors.white54),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('Mat_Pers'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('0987'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(''),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Colors.white54),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('Email'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('abnekdl@gmail.com'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child:   ElevatedButton(
                              onPressed: () {},
                              child: const Text('modifier'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Colors.white54),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('Numéro de téléphone'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('12345678'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            child:   ElevatedButton(
                              onPressed: () {},
                              child: const Text('modifier'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Colors.white54),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text("date d'embauche"),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('0987'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(''),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Colors.white54),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('date de naissance'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('17/8/2998'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(''),
                          ),
                        ),
                      ],

                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Colors.white54),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('Code Retrait'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('0987'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(''),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Colors.white54),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('num_ass'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('0987'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(''),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Colors.white54),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('solde de congé'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('0987'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(''),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Colors.white54),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('Num_Retrait'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('0987'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(''),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Colors.white54),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('Régime'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text('0987'),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
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
      ),



    );
  }
}

