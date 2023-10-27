import 'package:flutter/material.dart';
import 'home_page.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

    );
  }
}
