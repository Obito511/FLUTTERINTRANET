import 'package:flutter/material.dart';
import 'package:intranet/widget/forumreply.dart';
import 'package:intranet/widget/reclamation.dart';
import 'package:intranet/widget/tempsdetravail.dart';

import 'DrawerHeader.dart';
import 'Employées.dart';
import 'Event.dart';
import 'Formation.dart';
import 'HomePage.dart';
import 'editprofile.dart';


class Forum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Forum'),

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
    Navigator.popAndPushNamed(context, '/view-subjects');
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

      body: SafeArea(
        child: ListView(
          children: <Widget>[

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [BoxShadow(
                      color: Colors.black26.withOpacity(0.30),
                      offset: Offset(0.0,6.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.10
                  )]
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 60,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: AssetImage("widget.question.author.imageUrl"),
                                radius: 22,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        "widget.question.author.name",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: .4
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 2.0),
                                    Text(
                                     " widget.question.created_at",
                                      style: TextStyle(
                                          color: Colors.grey
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),


                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        "widget.question.question",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "widget.question.content",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 17,
                          letterSpacing: .2
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.0,horizontal: 150),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.message),
                                iconSize: 20,
                                color: Colors.grey,

                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ForumReply()),
                                  );
                                },
                              ),


                            ],
                          ),


                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}