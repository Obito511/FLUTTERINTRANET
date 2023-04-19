import 'package:flutter/material.dart';
import 'package:intranet/widget/Employ%C3%A9es.dart';
import 'package:intranet/widget/reclamation.dart';
import 'package:intranet/widget/tempsdetravail.dart';
import 'DrawerHeader.dart';
import 'Formation.dart';
import 'HomePage.dart';
import 'editprofile.dart';
import 'fichedepaie.dart';
import 'forum.dart';


class Event extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Evénements'),

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
          child: Column(

            children: [

              Padding(
                padding: EdgeInsets.only(left: 25.0,top: 40),
                child: SizedBox(
                  width: 635,
                  height: 274,
                  child: Stack(
                    children: <Widget>[
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 335,
                              height: 110,
                              child: Image.network(
                                'https://via.placeholder.com/300?text=DITTO',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                      Positioned(
                        bottom: 80,
                        left: 50,
                        child: SizedBox(
                          height: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Title'),
                              Text('Subtitle')
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: SizedBox(
                  width: 635,
                  height: 274,
                  child: Stack(
                    children: <Widget>[
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 335,
                              height: 110,
                              child: Image.network(
                                'https://via.placeholder.com/300?text=DITTO',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                      Positioned(
                        bottom: 80,
                        left: 50,
                        child: SizedBox(
                          height: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Title'),
                              Text('Subtitle')
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: SizedBox(
                  width: 635,
                  height: 274,
                  child: Stack(
                    children: <Widget>[
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 335,
                              height: 110,
                              child: Image.network(
                                'https://via.placeholder.com/300?text=DITTO',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                      Positioned(
                        bottom: 80,
                        left: 50,
                        child: SizedBox(
                          height: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Title'),
                              Text('Subtitle')
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )





    );
  }
}
