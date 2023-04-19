import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controller/AuthController.dart';
import 'HomePage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
TextEditingController matriculeController = TextEditingController();
TextEditingController passwordController = TextEditingController();
AuthController authController = AuthController();


class _LoginScreenState extends State<LoginScreen> {
  bool rememberpwd = false;
  bool sec = true;
  var visable = Icon(
    Icons.visibility,
    color: Color(0xff4c5166),
  );
  var visableoff = Icon(
    Icons.visibility_off,
    color: Color(0xff4c5166),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xfff3ffff),

                      Color(0xff219ee1),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 100,),
                        Image(
                          image: AssetImage('assets/Logo-removebg-preview.png'),
                          height: 200,
                        ),

                        SizedBox(height: 100,),
                        buildEmail(),
                        SizedBox(height: 50,),
                        buildPassword(),
                        SizedBox(height: 50,),

                        SizedBox(height: 30,),
                        buildLoginButton(),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(height: 60,),


                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmail() {
    matriculeController.addListener(() {
      String text = matriculeController.text;
      if (text.length > 4) {
        matriculeController.value = TextEditingValue(
            text: text.substring(0, 4),
            selection: TextSelection.fromPosition(
                TextPosition(offset: 4)));
      }
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Matricule",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10,),
        Container(

          height: 60,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(

              color: Color(0xffebefff),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
              )]
          ),
          child: TextField(
            controller: matriculeController,

            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email,color: Color(0xff4c5166),),
                hintText: 'Matricule',hintStyle: TextStyle(color: Colors.black38)
            ),

          ),
        ),
      ],
    );
  }
  Widget buildPassword() {
    passwordController.addListener(() {
      String text = passwordController.text;





      // Password is valid
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Mot de passe", style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xffebefff),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2)
              )
            ],
          ),
          height: 60,
          child: TextField(
            controller: passwordController,
            obscureText: sec,
            style: TextStyle(
                color: Colors.black
            ),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      sec = !sec;
                    });
                  },
                  icon: sec ? visableoff : visable,


                ),

                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.vpn_key,
                  color: Color(0xff4c5166),
                ),

                hintText: "Mot de passe",
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }


  Widget buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            authController.loginUser(matriculeController,passwordController);
            testl(context); // call testl() function here
          },
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void testl(BuildContext context) async {
    bool? loggedIn = await authController.loginUser(matriculeController,passwordController);
    ;
    if (loggedIn != null && loggedIn) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // handle login failure
    }
  }

}
