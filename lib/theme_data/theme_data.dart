import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData darkTheme(BuildContext context) =>ThemeData(

      brightness: Brightness.light,

    fontFamily: GoogleFonts.lato().fontFamily
  );
  static ThemeData lightTheme(BuildContext context)=>ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.white,

      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black,size: 29),
      textTheme: Theme.of(context).textTheme,titleTextStyle: TextStyle(color: Colors.black,
      fontWeight: FontWeight.bold,fontSize: 19),
    )
  );


}