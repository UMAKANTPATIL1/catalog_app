import 'package:flutter/material.dart';
import 'package:my_app/theme_data/theme_data.dart';
import 'package:velocity_x/velocity_x.dart';
class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: "Cart".text.make(),
      ),
      backgroundColor: MyTheme.creamColor,
    );
  }
}
