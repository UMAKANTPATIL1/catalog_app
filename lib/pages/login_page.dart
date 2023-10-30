import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/navigate_pages/navigate.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedBtn = false;

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
                "Welcome " + name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                  fontFamily: GoogleFonts.lato().fontFamily,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
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
                    //Button using Animation
                    InkWell(
                      onTap: () async {
                        setState(() {
                          changedBtn = true;
                        });
                        await Future.delayed(Duration(seconds: 2));
                        Navigator.pushNamed(context, MyRoutes.homeButton);
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changedBtn ? 50 : 130,
                        height: 35,
                        alignment: Alignment.center,
                        child: changedBtn
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade600,
                          borderRadius:
                              BorderRadius.circular(changedBtn ? 50 : 8),
                        ),
                      ),
                    ),
                    /*ElevatedButton(
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
                    )*/
                  ],
                ),
              )
            ],
          ),
        ));
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
