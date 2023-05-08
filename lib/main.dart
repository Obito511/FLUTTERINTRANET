import 'package:flutter/material.dart';
import 'package:intranet/widget/Login.dart';
import 'package:intranet/widget/HomePage.dart';
import 'package:intranet/widget/forum.dart';


main (){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: LoginScreen() ,
    );
  }
}



