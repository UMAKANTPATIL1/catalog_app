import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/navigate_pages/navigate.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Image.asset(
            "assets/images/login.png",

          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Welcome....",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 27,
              fontFamily: GoogleFonts.lato().fontFamily,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(

                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),

                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.black,
                    minimumSize: Size(130, 40),


                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.homeButton);
                  },
                )
              ],
            ),
          )
        ],
      ),
    )
    );
    /*return Scaffold( //Scafold use Day 1,2,3
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Text("Login",
            textScaleFactor: 3.0,style: TextStyle(
          fontWeight: FontWeight.bold,
        )),
      ),
      appBar: AppBar(
        title: Text("Login",
          style:TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,

            color: Colors.black,


          )

          ),

      ),

    );*/
  }
}
