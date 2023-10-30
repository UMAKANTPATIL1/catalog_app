import 'package:flutter/material.dart';
import 'package:my_app/navigate_pages/navigate.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      themeMode: ThemeMode.light,

      darkTheme: ThemeData(brightness: Brightness.light,
          fontFamily: GoogleFonts.lato().fontFamily),//Dark and light theme
          initialRoute: "/login",
      routes: {
        MyRoutes.homeButton: (context)=>HomePage(),
        MyRoutes.loginButton:(context)=>LoginPage(),

    },
    );

  }
}
