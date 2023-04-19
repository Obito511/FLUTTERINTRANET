

import 'package:flutter/material.dart';
import 'package:intranet/widget/Employ%C3%A9es.dart';
import 'package:intranet/widget/tempsdetravail.dart';
import 'DrawerHeader.dart';
import 'Formation.dart';
import 'HomePage.dart';
import 'editprofile.dart';
import 'fichedepaie.dart';
import 'forum.dart';
import 'Event.dart';


class Reclamation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Reclamation'),

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
        body: const MyCustomForm(),









    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffF02E65)),),
              labelText: 'Ecrire ton Email',
              labelStyle: TextStyle(color: Color(0xff000000)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder( borderSide: BorderSide(color: Colors.red),),
              labelText: 'Ecrire le sujet ',
              labelStyle: TextStyle(color: Color(0xff000000)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red),),
              labelText: 'Ecrire la description',
              labelStyle: TextStyle(color: Color(0xff000000)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),

          child: DropdownButtonExample(),






        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 16),

          child:
          ElevatedButton(
            onPressed: () {},
            child: const Text('envoyer'),
          ),






        ),

      ],
    );
  }
}
const List<String> list = <String>["departemt", "departement technique", "departement informatique"];
class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Color(0xff000000)),
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },


      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );


  }
}

