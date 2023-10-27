import 'package:flutter/material.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/login_page.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.light),//Dark and light theme
      initialRoute: "/login",
      routes: {
        "/": (context)=>HomePage(),
        "/login":(context)=>LoginPage(),

    },
    );

  }
}
