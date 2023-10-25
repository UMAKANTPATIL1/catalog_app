import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int day=20;
    String name="Learning";
    return Scaffold(
      appBar: AppBar(
        title: Text("First App"),
      ),
      drawer: Drawer(),
      body:Center(
        child: Container(
          child: Text("welcome to $day of Flutter $name "),
        ),
      ),

    );
  }
}
