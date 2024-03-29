import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context)=>ThemeData(
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: darkBluish,
      accentColor: Colors.black,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black,size: 29),
        textTheme: Theme.of(context).textTheme,titleTextStyle: TextStyle(color: Colors.black,
          fontWeight: FontWeight.bold,fontSize: 19),
      )
  );
  static ThemeData darkTheme(BuildContext context) =>ThemeData(
    brightness: Brightness.dark,
      cardColor: Colors.black,
      canvasColor: darkColor,
      buttonColor: lightBluish,
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(

        color: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white,size: 29),
        textTheme: Theme.of(context).textTheme,titleTextStyle: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold,fontSize: 19),
      )
  );

//colurs
    static Color creamColor=Color(0xfff5f5f5);
    static Color darkColor=Vx.gray900;
    static Color darkBluish=Color(0xff403b58);
    static Color lightBluish=Vx.indigo500;

}