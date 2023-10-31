import 'package:flutter/material.dart';
import '../drawer/drawer.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int day=20;
    String name="Learning";
    return Scaffold(
      appBar: AppBar(
        title: Text("First App"),
      ),
      drawer: MyDrawer(),


    );
  }
}
