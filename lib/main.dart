import 'package:flutter/material.dart';
import 'package:my_app/pages/add_to_cart.dart';
import 'package:my_app/pages/home_page.dart';

import 'package:my_app/pages/login_page.dart';
import 'package:my_app/theme_data/theme_data.dart';

import 'navigate_pages/navigate.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: MaterialApp(
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),//Dark and light theme

        initialRoute: MyRoutes.homeButton,
        routes: {
          MyRoutes.homeButton: (context)=>MyGallery(),
          MyRoutes.loginButton:(context)=>LoginPage(),
          MyRoutes.galleryButton:(context)=>MyGallery(),
          MyRoutes.cartPage:(context)=>MyCart(),

      },
      ),
    );

  }
}
